#ifndef INCLUDE_RUBY_CONFIG_H
#define INCLUDE_RUBY_CONFIG_H 1
/* confdefs.h */
#define STDC_HEADERS 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRING_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STRINGS_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDINT_H 1
#define HAVE_UNISTD_H 1
#define __EXTENSIONS__ 1
#define _ALL_SOURCE 1
#define _GNU_SOURCE 1
#define _POSIX_PTHREAD_SEMANTICS 1
#define _TANDEM_SOURCE 1
#define RUBY_SYMBOL_EXPORT_BEGIN _Pragma("GCC visibility push(default)")
#define RUBY_SYMBOL_EXPORT_END _Pragma("GCC visibility pop")
#define HAVE_STMT_AND_DECL_IN_EXPR 1
#define THREAD_IMPL_H "thread_none.h"
#define THREAD_IMPL_SRC "thread_none.c"
#define HAVE_LIBCRYPT 1
#define HAVE_DIRENT_H 1
#define HAVE__BOOL 1
#define HAVE_STDBOOL_H 1
#define HAVE_FCNTL_H 1
#define HAVE_FLOAT_H 1
#define HAVE_LANGINFO_H 1
#define HAVE_LIMITS_H 1
#define HAVE_LOCALE_H 1
#define HAVE_MALLOC_H 1
#define HAVE_STDALIGN_H 1
#define HAVE_STDIO_H 1
#define HAVE_SYS_EVENTFD_H 1
#define HAVE_SYS_FCNTL_H 1
#define HAVE_SYS_FILE_H 1
#define HAVE_SYS_IOCTL_H 1
#define HAVE_SYS_PARAM_H 1
#define HAVE_SYS_RANDOM_H 1
#define HAVE_SYS_RESOURCE_H 1
#define HAVE_SYS_SELECT_H 1
#define HAVE_SYS_SOCKET_H 1
#define HAVE_SYS_SYSCALL_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TIMES_H 1
#define HAVE_SYS_UIO_H 1
#define HAVE_SYSCALL_H 1
#define HAVE_TIME_H 1
#define HAVE_UTIME_H 1
#define HAVE_TYPEOF 1
#define restrict __restrict
#define HAVE_LONG_LONG 1
#define HAVE_OFF_T 1
#define SIZEOF_INT 4
#define SIZEOF_SHORT 2
#define SIZEOF_LONG 4
#define SIZEOF_LONG_LONG 8
#define SIZEOF___INT64 0
#define SIZEOF___INT128 16
#define SIZEOF_OFF_T 8
#define SIZEOF_VOIDP 4
#define SIZEOF_FLOAT 4
#define SIZEOF_DOUBLE 8
#define SIZEOF_TIME_T 8
#define SIZEOF_CLOCK_T 8
#define PACKED_STRUCT(x) x __attribute__((packed))
#define USE_UNALIGNED_MEMBER_ACCESS 1
#define PRI_LL_PREFIX "ll"
#define HAVE_PID_T 1
#define rb_pid_t pid_t
#define SIGNEDNESS_OF_PID_T -1
#define PIDT2NUM(v) INT2NUM(v)
#define NUM2PIDT(v) NUM2INT(v)
#define PRI_PIDT_PREFIX PRI_INT_PREFIX
#define HAVE_UID_T 1
#define rb_uid_t uid_t
#define SIGNEDNESS_OF_UID_T +1
#define UIDT2NUM(v) UINT2NUM(v)
#define NUM2UIDT(v) NUM2UINT(v)
#define PRI_UIDT_PREFIX PRI_INT_PREFIX
#define HAVE_GID_T 1
#define rb_gid_t gid_t
#define SIGNEDNESS_OF_GID_T +1
#define GIDT2NUM(v) UINT2NUM(v)
#define NUM2GIDT(v) NUM2UINT(v)
#define PRI_GIDT_PREFIX PRI_INT_PREFIX
#define HAVE_TIME_T 1
#define rb_time_t time_t
#define SIGNEDNESS_OF_TIME_T -1
#define TIMET2NUM(v) LL2NUM(v)
#define NUM2TIMET(v) NUM2LL(v)
#define PRI_TIMET_PREFIX PRI_LL_PREFIX
#define HAVE_DEV_T 1
#define rb_dev_t dev_t
#define SIGNEDNESS_OF_DEV_T +1
#define DEVT2NUM(v) ULL2NUM(v)
#define NUM2DEVT(v) NUM2ULL(v)
#define PRI_DEVT_PREFIX PRI_LL_PREFIX
#define HAVE_MODE_T 1
#define rb_mode_t mode_t
#define SIGNEDNESS_OF_MODE_T +1
#define MODET2NUM(v) UINT2NUM(v)
#define NUM2MODET(v) NUM2UINT(v)
#define PRI_MODET_PREFIX PRI_INT_PREFIX
#define rb_rlim_t long
#define SIGNEDNESS_OF_RLIM_T -1
#define RLIM2NUM(v) LONG2NUM(v)
#define NUM2RLIM(v) NUM2LONG(v)
#define PRI_RLIM_PREFIX PRI_LONG_PREFIX
#define HAVE_OFF_T 1
#define rb_off_t off_t
#define SIGNEDNESS_OF_OFF_T -1
#define OFFT2NUM(v) LL2NUM(v)
#define NUM2OFFT(v) NUM2LL(v)
#define PRI_OFFT_PREFIX PRI_LL_PREFIX
#define HAVE_CLOCKID_T 1
#define rb_clockid_t clockid_t
#define HAVE_VA_ARGS_MACRO 1
#define HAVE__ALIGNOF 1
#define CONSTFUNC(x) __attribute__ ((__const__)) x
#define PUREFUNC(x) __attribute__ ((__pure__)) x
#define NORETURN(x) __attribute__ ((__noreturn__)) x
#define DEPRECATED(x) __attribute__ ((__deprecated__)) x
#define DEPRECATED_BY(n,x) __attribute__ ((__deprecated__("by "#n))) x
#define NOINLINE(x) __attribute__ ((__noinline__)) x
#define ALWAYS_INLINE(x) __attribute__ ((__always_inline__)) x
#define NO_SANITIZE(san, x) __attribute__ ((__no_sanitize__(san))) x
#define NO_SANITIZE_ADDRESS(x) __attribute__ ((__no_sanitize_address__)) x
#define NO_ADDRESS_SAFETY_ANALYSIS(x) __attribute__ ((__no_address_safety_analysis__)) x
#define WARN_UNUSED_RESULT(x) __attribute__ ((__warn_unused_result__)) x
#define MAYBE_UNUSED(x) __attribute__ ((__unused__)) x
#define WEAK(x) __attribute__ ((__weak__)) x
#define HAVE_FUNC_WEAK 1
#define RUBY_CXX_DEPRECATED(msg) __attribute__((__deprecated__(msg)))
#define HAVE_NULLPTR 1
#define FUNC_CDECL(x) __attribute__ ((__cdecl__)) x
#define HAVE_ATTRIBUTE_FUNCTION_ALIAS 1
#define RUBY_ALIAS_FUNCTION_TYPE(type, prot, name, args) type prot __attribute__((alias(#name)));
#define RUBY_ALIAS_FUNCTION_VOID(prot, name, args) RUBY_ALIAS_FUNCTION_TYPE(void, prot, name, args)
#define HAVE_GCC_ATOMIC_BUILTINS 1
#define HAVE_GCC_SYNC_BUILTINS 1
#define HAVE___BUILTIN_UNREACHABLE 1
#define RUBY_FUNC_EXPORTED __attribute__ ((__visibility__("default"))) extern
#define RUBY_FUNC_NONNULL(n,x) __attribute__ ((__nonnull__(n))) x
#define RUBY_FUNCTION_NAME_STRING __func__
#define ENUM_OVER_INT 1
#define HAVE_DECL_SYS_NERR 0
#define HAVE_DECL_GETENV 1
#define SIZEOF_SIZE_T 4
#define SIZEOF_PTRDIFF_T 4
#define SIZEOF_DEV_T 8
#define PRI_SIZE_PREFIX "z"
#define PRI_PTRDIFF_PREFIX "t"
#define HAVE_STRUCT_STAT_ST_BLKSIZE 1
#define HAVE_STRUCT_STAT_ST_BLOCKS 1
#define HAVE_STRUCT_STAT_ST_RDEV 1
#define SIZEOF_STRUCT_STAT_ST_SIZE SIZEOF_OFF_T
#define SIZEOF_STRUCT_STAT_ST_BLOCKS SIZEOF_OFF_T
#define SIZEOF_STRUCT_STAT_ST_INO SIZEOF_LONG_LONG
#define SIZEOF_STRUCT_STAT_ST_DEV SIZEOF_DEV_T
#define SIZEOF_STRUCT_STAT_ST_RDEV SIZEOF_DEV_T
#define HAVE_STRUCT_STAT_ST_ATIM 1
#define HAVE_STRUCT_STAT_ST_MTIM 1
#define HAVE_STRUCT_STAT_ST_CTIM 1
#define HAVE_STRUCT_TIMEVAL 1
#define SIZEOF_STRUCT_TIMEVAL_TV_SEC SIZEOF_TIME_T
#define HAVE_STRUCT_TIMESPEC 1
#define HAVE_STRUCT_TIMEZONE 1
#define HAVE_INT8_T 1
#define SIZEOF_INT8_T 1
#define HAVE_UINT8_T 1
#define SIZEOF_UINT8_T 1
#define HAVE_INT16_T 1
#define SIZEOF_INT16_T 2
#define HAVE_UINT16_T 1
#define SIZEOF_UINT16_T 2
#define HAVE_INT32_T 1
#define SIZEOF_INT32_T 4
#define HAVE_UINT32_T 1
#define SIZEOF_UINT32_T 4
#define HAVE_INT64_T 1
#define SIZEOF_INT64_T 8
#define HAVE_UINT64_T 1
#define SIZEOF_UINT64_T 8
#define HAVE_INT128_T 1
#define int128_t __int128
#define SIZEOF_INT128_T SIZEOF___INT128
#define HAVE_UINT128_T 1
#define uint128_t unsigned __int128
#define SIZEOF_UINT128_T SIZEOF___INT128
#define HAVE_INTPTR_T 1
#define SIZEOF_INTPTR_T 4
#define HAVE_UINTPTR_T 1
#define SIZEOF_UINTPTR_T 4
#define PRI_PTR_PREFIX "l"
#define HAVE_SSIZE_T 1
#define SIZEOF_SSIZE_T 4
#define PRI_64_PREFIX "ll"
#define GETGROUPS_T int
#define HAVE_ALLOCA_H 1
#define HAVE_ALLOCA 1
#define HAVE_ACOSH 1
#define HAVE_CBRT 1
#define HAVE_CRYPT 1
#define HAVE_ERF 1
#define HAVE_EXPLICIT_BZERO 1
#define HAVE_FFS 1
#define HAVE_HYPOT 1
#define HAVE_LGAMMA_R 1
#define HAVE_MEMMOVE 1
#define HAVE_NAN 1
#define HAVE_NEXTAFTER 1
#define HAVE_STRCHR 1
#define HAVE_STRERROR 1
#define HAVE_STRLCAT 1
#define HAVE_STRLCPY 1
#define HAVE_STRSTR 1
#define HAVE_TGAMMA 1
#define HAVE_ISFINITE 1
#define HAVE_SIGNBIT 1
#define vfork fork
#define HAVE_ARC4RANDOM_BUF 1
#define HAVE_ATAN2L 1
#define HAVE_ATAN2F 1
#define HAVE_CLOCK_GETTIME 1
#define HAVE_COSH 1
#define HAVE_CRYPT_R 1
#define HAVE_DIRFD 1
#define HAVE_FCNTL 1
#define HAVE_FDATASYNC 1
#define HAVE_FDOPENDIR 1
#define HAVE_FMOD 1
#define HAVE_FSTATAT 1
#define HAVE_FSYNC 1
#define HAVE_FTRUNCATE 1
#define HAVE_GETCWD 1
#define HAVE_GETENTROPY 1
#define HAVE_GETTIMEOFDAY 1
#define HAVE_GMTIME_R 1
#define HAVE_IOCTL 1
#define HAVE_LINK 1
#define HAVE_LLABS 1
#define HAVE_LOG2 1
#define HAVE_LSTAT 1
#define HAVE_MALLOC_USABLE_SIZE 1
#define HAVE_MBLEN 1
#define HAVE_WRITEV 1
#define HAVE_MEMRCHR 1
#define HAVE_MEMMEM 1
#define HAVE_MKTIME 1
#define HAVE_MMAP 1
#define HAVE_OPENAT 1
#define HAVE_POLL 1
#define HAVE_POSIX_FADVISE 1
#define HAVE_POSIX_MEMALIGN 1
#define HAVE_PREAD 1
#define HAVE_PWRITE 1
#define HAVE_READLINK 1
#define HAVE_ROUND 1
#define HAVE_SEEKDIR 1
#define HAVE_SETENV 1
#define HAVE_SINH 1
#define HAVE_SYMLINK 1
#define HAVE_SYSCONF 1
#define HAVE_TANH 1
#define HAVE_TELLDIR 1
#define HAVE_TIMEGM 1
#define HAVE_TIMES 1
#define HAVE_TRUNCATE 1
#define HAVE_UNSETENV 1
#define HAVE_UTIMENSAT 1
#define NO_GETCWD_MALLOC 1
#define HAVE_CRYPT_H 1
#define HAVE_STRUCT_CRYPT_DATA_INITIALIZED 1
#define HAVE_BUILTIN___BUILTIN_ALLOCA_WITH_ALIGN 1
#define HAVE_BUILTIN___BUILTIN_ASSUME_ALIGNED 1
#define HAVE_BUILTIN___BUILTIN_BSWAP16 1
#define HAVE_BUILTIN___BUILTIN_BSWAP32 1
#define HAVE_BUILTIN___BUILTIN_BSWAP64 1
#define HAVE_BUILTIN___BUILTIN_POPCOUNT 1
#define HAVE_BUILTIN___BUILTIN_POPCOUNTLL 1
#define HAVE_BUILTIN___BUILTIN_CLZ 1
#define HAVE_BUILTIN___BUILTIN_CLZL 1
#define HAVE_BUILTIN___BUILTIN_CLZLL 1
#define HAVE_BUILTIN___BUILTIN_CTZ 1
#define HAVE_BUILTIN___BUILTIN_CTZLL 1
#define HAVE_BUILTIN___BUILTIN_ADD_OVERFLOW 1
#define HAVE_BUILTIN___BUILTIN_SUB_OVERFLOW 1
#define HAVE_BUILTIN___BUILTIN_MUL_OVERFLOW 1
#define HAVE_BUILTIN___BUILTIN_CONSTANT_P 1
#define HAVE_BUILTIN___BUILTIN_CHOOSE_EXPR 1
#define HAVE_BUILTIN___BUILTIN_CHOOSE_EXPR_CONSTANT_P 1
#define HAVE_BUILTIN___BUILTIN_TYPES_COMPATIBLE_P 1
#define HAVE_BUILTIN___BUILTIN_TRAP 1
#define HAVE_BUILTIN___BUILTIN_EXPECT 1
#define ATAN2_INF_C99 1
#define HAVE_CLOCK_GETRES 1
#define HAVE_STRUCT_TM_TM_ZONE 1
#define HAVE_TM_ZONE 1
#define HAVE_STRUCT_TM_TM_GMTOFF 1
#define NEGATIVE_TIME_T 1
#define LOCALTIME_OVERFLOW_PROBLEM 1
#define HAVE_SIG_T 1
#define RSHIFT(x,y) ((x)>>(int)(y))
#define HAVE__SC_CLK_TCK 1
#define STACK_GROW_DIRECTION 0
#define COROUTINE_H "coroutine/asyncify/Context.h"
#define HAVE_CONST_PAGE_SIZE 0
#define IOCTL_REQ_TYPE unsigned long
#define NUM2IOCTLREQ(num) NUM2ULONG(num)
#define EXTSTATIC 1
#define DLEXT_MAXLEN 3
#define DLEXT ".so"
#define CROSS_COMPILING 1
#define RUBY_SETJMP(env) setjmp((env))
#define RUBY_LONGJMP(env,val) longjmp((env),val)
#define RUBY_JMP_BUF jmp_buf
#define USE_MJIT 0
#define USE_YJIT 0
#define RUBY_PLATFORM "wasm32-wasi"
#endif /* INCLUDE_RUBY_CONFIG_H */
