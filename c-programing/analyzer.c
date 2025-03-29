#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "json_c.c"

#define SAFE_STRING(s) ((s) ? (s) : "(null)")
#define STRING_MATCH(s, expected) (strncmp((s), (expected), strlen(expected)) == 0)
const char *UNKNOWN = "(unknown)";

char* copy_string(const char* src) {
    if (!src) return NULL;
    size_t len = strlen(src) + 1;
    char* dest = (char*)malloc(len);
    if (dest) memcpy(dest, src, len);
    return dest;
}

char* get_function_name(json_object *decl_obj) {
    json_value name_val = json_get_from_object(decl_obj, "name");
    if(name_val.type != JSON_STRING) return copy_string(UNKNOWN);
    return copy_string(json_to_string(name_val));
}

// 반환 타입: Decl(type)->FuncDecl(type)->TypeDecl(type)->Identifier(names)
char* get_function_return_type(json_object *decl_obj) {
    json_value type_val = json_get_from_object(decl_obj, "type");
    if(type_val.type != JSON_OBJECT) return copy_string(UNKNOWN);
    
    json_object *func_decl_obj = (json_object *)type_val.value;
    json_value ret_type_val = json_get_from_object(func_decl_obj, "type");
    if(ret_type_val.type != JSON_OBJECT) return copy_string(UNKNOWN);
    
    json_object *ret_type_obj = (json_object *)ret_type_val.value;
    json_value id_type_val = json_get_from_object(ret_type_obj, "type");
    if(id_type_val.type != JSON_OBJECT) return copy_string(UNKNOWN);
    
    json_object *id_obj = (json_object *)id_type_val.value;
    json_value names_val = json_get_from_object(id_obj, "names");
    if(names_val.type != JSON_ARRAY) return copy_string(UNKNOWN);
    
    json_array *names_arr = (json_array *)names_val.value;
    if(names_arr->last_index < 0) return copy_string(UNKNOWN);
    
    json_value first = names_arr->values[0];
    if(first.type != JSON_STRING) return copy_string(UNKNOWN);
    
    return copy_string(json_to_string(first));
}

// PtrDecl을 재귀적으로 풀면서 포인터 레벨을 반환하는 함수
json_object* get_effective_type_and_level(json_object *type_obj, int *pointer_level) {
    *pointer_level = 0;
    while (1) {
        json_value nodetype_val = json_get_from_object(type_obj, "_nodetype");
        if(nodetype_val.type == JSON_STRING && STRING_MATCH(json_to_string(nodetype_val), "PtrDecl")) {
            (*pointer_level)++;
            json_value inner_val = json_get_from_object(type_obj, "type");
            if(inner_val.type == JSON_OBJECT) {
                type_obj = (json_object *)inner_val.value;
                continue;
            } else {
                break;
            }
        } else {
            break;
        }
    }
    return type_obj;
}

// 파라미터 정보 출력
void print_function_parameters(json_object *decl_obj) {
    json_value type_val = json_get_from_object(decl_obj, "type");
    if(type_val.type != JSON_OBJECT) return;
    
    json_object *func_decl_obj = (json_object *)type_val.value;
    json_value args_val = json_get_from_object(func_decl_obj, "args");
    if(args_val.type != JSON_OBJECT) return;
    
    json_object *args_obj = (json_object *)args_val.value;
    json_value params_val = json_get_from_object(args_obj, "params");
    if(params_val.type != JSON_ARRAY) return;
    
    json_array *params_arr = (json_array *)params_val.value;
    
    for (int i = 0; i <= params_arr->last_index; i++) {
        char *param_name = (char*)UNKNOWN;
        char param_type[256];
        param_type[0] = '\0';
        int pointer_level = 0;
        
        json_value param_val = params_arr->values[i];
        if(param_val.type != JSON_OBJECT) continue;
        
        json_object *param_obj = (json_object *)param_val.value;
        json_value type_field_val = json_get_from_object(param_obj, "type");
        if(type_field_val.type == JSON_OBJECT) {
            json_object *original_type_obj = (json_object *)type_field_val.value;
            json_object *effective_type_obj = get_effective_type_and_level(original_type_obj, &pointer_level);
            json_value declname_val = json_get_from_object(effective_type_obj, "declname");
            if(declname_val.type == JSON_STRING)
                param_name = json_to_string(declname_val);
            json_value inner_type_val = json_get_from_object(effective_type_obj, "type");
            if(inner_type_val.type == JSON_OBJECT) {
                json_object *id_obj = (json_object *)inner_type_val.value;
                json_value names_val = json_get_from_object(id_obj, "names");
                if(names_val.type == JSON_ARRAY) {
                    json_array *names_arr = (json_array *)names_val.value;
                    for (int j = 0; j <= names_arr->last_index; j++) {
                        if(names_arr->values[j].type == JSON_STRING) {
                            strcat(param_type, json_to_string(names_arr->values[j]));
                            if(j < names_arr->last_index)
                                strcat(param_type, " ");
                        }
                    }
                }
            }
            if(pointer_level > 0) {
                strcat(param_type, " ");
                for (int k = 0; k < pointer_level; k++) {
                    strcat(param_type, "*");
                }
            }
        }
        if (strcmp(param_type, "") == 0 && strcmp(param_name, UNKNOWN) == 0) {
            printf("    - 파라미터: void\n");
        } else {
            printf("    - 파라미터: %s %s\n", SAFE_STRING(param_type), SAFE_STRING(param_name));
        }
    }
}

int total_functions = 0;

// if 문의 개수를 재귀적으로 계산   
int count_if_conditions(json_value v) {
    if (v.type == JSON_OBJECT) {
        int count = 0;
        json_object *obj = (json_object *)v.value;
        json_value nodetype_val = json_get_from_object(obj, "_nodetype");
        if (nodetype_val.type == JSON_STRING && STRING_MATCH(json_to_string(nodetype_val), "If"))
            count++;
        for (int i = 0; i <= obj->last_index; i++) {
            count += count_if_conditions(obj->values[i]);
        }
        return count;
    } else if (v.type == JSON_ARRAY) {
        int count = 0;
        json_array *arr = (json_array *)v.value;
        for (int i = 0; i <= arr->last_index; i++) {
            count += count_if_conditions(arr->values[i]);
        }
        return count;
    }
    return 0;
}

// FuncDef 노드를 처리하여 함수 정보를 출력
void process_function(json_value func_node) {
    if (func_node.type != JSON_OBJECT) return;
    json_object *obj = (json_object *)func_node.value;

    json_value decl_val = json_get_from_object(obj, "decl");
    if (decl_val.type != JSON_OBJECT) return;
    json_object *decl_obj = (json_object *)decl_val.value;
    
    char* fname = get_function_name(decl_obj);
    char* ret_type = get_function_return_type(decl_obj);
    
    printf("함수 이름: %s\n", SAFE_STRING(fname));
    printf("  반환 타입: %s\n", SAFE_STRING(ret_type));
    
    printf("  파라미터:\n");
    print_function_parameters(decl_obj);
    
    json_value body_val = json_get_from_object(obj, "body");
    int if_count = 0;
    if (body_val.type != JSON_UNDEFINED) {
        if_count = count_if_conditions(body_val);
    }
    printf("  if 개수: %d\n", if_count);
    printf("\n");
    
    total_functions++;
    
    free(fname);
    free(ret_type);
}

// 재귀 순회하여 FuncDef 노드를 찾아서 처리
void traverse_ast(json_value v) {
    if (v.type == JSON_OBJECT) {
        json_object *obj = (json_object *)v.value;
        json_value nodetype_val = json_get_from_object(obj, "_nodetype");
        if (nodetype_val.type == JSON_STRING) {
            const char* nodetype = json_to_string(nodetype_val);
            if (STRING_MATCH(nodetype, "FuncDef")) {
                process_function(v);
            }
        }
        for (int i = 0; i <= obj->last_index; i++) {
            traverse_ast(obj->values[i]);
        }
    } else if (v.type == JSON_ARRAY) {
        json_array *arr = (json_array *)v.value;
        for (int i = 0; i <= arr->last_index; i++) {
            traverse_ast(arr->values[i]);
        }
    }
}

int main(int argc, char *argv[]) {
    json_value root = json_read("ast.json");
    if (root.type == JSON_UNDEFINED) {
        fprintf(stderr, "JSON 파일을 읽을 수 없습니다.\n");
        return EXIT_FAILURE;
    }
    
    traverse_ast(root);
    printf("총 함수 개수: %d\n", total_functions);
    
    json_free(root);
    return EXIT_SUCCESS;
}

