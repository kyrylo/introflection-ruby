module Introflection
  class ModuleSpace
    CORE_MODULES = [
      ARGF.class,
      ArgumentError,
      Array,
      BasicObject,
      Bignum,
      Binding,
      Class,
      Comparable,
      Complex,
      Data,
    #  Date,
      Dir,
      EOFError,
      Encoding,
      Encoding::CompatibilityError,
      Encoding::Converter,
      Encoding::ConverterNotFoundError,
      Encoding::InvalidByteSequenceError,
      Encoding::UndefinedConversionError,
      EncodingError,
      Enumerable,
      Enumerator,
      Enumerator::Generator,
      Enumerator::Lazy,
      Enumerator::Yielder,
      Errno,
      Errno::E2BIG,
      Errno::EACCES,
      Errno::EADDRINUSE,
      Errno::EADDRNOTAVAIL,
      Errno::EADV,
      Errno::EAFNOSUPPORT,
      Errno::EAGAIN,
      Errno::EALREADY,
      Errno::EBADE,
      Errno::EBADF,
      Errno::EBADFD,
      Errno::EBADMSG,
      Errno::EBADR,
      Errno::EBADRQC,
      Errno::EBADSLT,
      Errno::EBFONT,
      Errno::EBUSY,
      Errno::ECANCELED,
      Errno::ECHILD,
      Errno::ECHRNG,
      Errno::ECOMM,
      Errno::ECONNABORTED,
      Errno::ECONNREFUSED,
      Errno::ECONNRESET,
      Errno::EDEADLK,
      Errno::EDESTADDRREQ,
      Errno::EDOM,
      Errno::EDOTDOT,
      Errno::EDQUOT,
      Errno::EEXIST,
      Errno::EFAULT,
      Errno::EFBIG,
      Errno::EHOSTDOWN,
      Errno::EHOSTUNREACH,
      Errno::EIDRM,
      Errno::EILSEQ,
      Errno::EINPROGRESS,
      Errno::EINTR,
      Errno::EINVAL,
      Errno::EIO,
      Errno::EISCONN,
      Errno::EISDIR,
      Errno::EISNAM,
      Errno::EKEYEXPIRED,
      Errno::EKEYREJECTED,
      Errno::EKEYREVOKED,
      Errno::EL2HLT,
      Errno::EL2NSYNC,
      Errno::EL3HLT,
      Errno::EL3RST,
      Errno::ELIBACC,
      Errno::ELIBBAD,
      Errno::ELIBEXEC,
      Errno::ELIBMAX,
      Errno::ELIBSCN,
      Errno::ELNRNG,
      Errno::ELOOP,
      Errno::EMEDIUMTYPE,
      Errno::EMFILE,
      Errno::EMLINK,
      Errno::EMSGSIZE,
      Errno::EMULTIHOP,
      Errno::ENAMETOOLONG,
      Errno::ENAVAIL,
      Errno::ENETDOWN,
      Errno::ENETRESET,
      Errno::ENETUNREACH,
      Errno::ENFILE,
      Errno::ENOANO,
      Errno::ENOBUFS,
      Errno::ENOCSI,
      Errno::ENODATA,
      Errno::ENODEV,
      Errno::ENOENT,
      Errno::ENOEXEC,
      Errno::ENOKEY,
      Errno::ENOLCK,
      Errno::ENOLINK,
      Errno::ENOMEDIUM,
      Errno::ENOMEM,
      Errno::ENOMSG,
      Errno::ENONET,
      Errno::ENOPKG,
      Errno::ENOPROTOOPT,
      Errno::ENOSPC,
      Errno::ENOSR,
      Errno::ENOSTR,
      Errno::ENOSYS,
      Errno::ENOTBLK,
      Errno::ENOTCONN,
      Errno::ENOTDIR,
      Errno::ENOTEMPTY,
      Errno::ENOTNAM,
      Errno::ENOTRECOVERABLE,
      Errno::ENOTSOCK,
      Errno::ENOTTY,
      Errno::ENOTUNIQ,
      Errno::ENXIO,
      Errno::EOPNOTSUPP,
      Errno::EOVERFLOW,
      Errno::EOWNERDEAD,
      Errno::EPERM,
      Errno::EPFNOSUPPORT,
      Errno::EPIPE,
      Errno::EPROTO,
      Errno::EPROTONOSUPPORT,
      Errno::EPROTOTYPE,
      Errno::ERANGE,
      Errno::EREMCHG,
      Errno::EREMOTE,
      Errno::EREMOTEIO,
      Errno::ERESTART,
      Errno::ERFKILL,
      Errno::EROFS,
      Errno::ESHUTDOWN,
      Errno::ESOCKTNOSUPPORT,
      Errno::ESPIPE,
      Errno::ESRCH,
      Errno::ESRMNT,
      Errno::ESTALE,
      Errno::ESTRPIPE,
      Errno::ETIME,
      Errno::ETIMEDOUT,
      Errno::ETOOMANYREFS,
      Errno::ETXTBSY,
      Errno::EUCLEAN,
      Errno::EUNATCH,
      Errno::EUSERS,
      Errno::EXDEV,
      Errno::EXFULL,
      Errno::NOERROR,
      Exception,
      FalseClass,
      Fiber,
      FiberError,
      File,
      File::Constants,
      File::Stat,
      FileTest,
      Fixnum,
      Float,
      FloatDomainError,
      GC,
      GC::Profiler,
      Gem,
      Gem::BasicSpecification,
      Gem::CommandLineError,
      Gem::DependencyError,
      Gem::DependencyRemovalException,
      Gem::DependencyResolutionError,
      Gem::Deprecate,
      Gem::DocumentError,
      Gem::EndOfYAMLException,
      Gem::ErrorReason,
      Gem::Exception,
      Gem::FilePermissionError,
      Gem::FormatException,
      Gem::GemNotFoundException,
      Gem::GemNotInHomeException,
      Gem::ImpossibleDependenciesError,
      Gem::InstallError,
      Gem::InvalidSpecificationException,
      Gem::LoadError,
      Gem::OperationNotSupportedError,
      Gem::Platform,
      Gem::PlatformMismatch,
      Gem::RemoteError,
      Gem::RemoteInstallationCancelled,
      Gem::RemoteInstallationSkipped,
      Gem::RemoteSourceException,
      Gem::Requirement,
      Gem::Requirement::BadRequirementError,
      Gem::RubyVersionMismatch,
      Gem::SourceFetchProblem,
      Gem::SpecificGemNotFoundException,
      Gem::Specification,
      Gem::StringSink,
      Gem::StringSource,
      Gem::StubSpecification,
      Gem::StubSpecification::StubLine,
      Gem::SystemExitException,
      Gem::UnsatisfiableDependencyError,
      Gem::VerificationError,
      Gem::Version,
      Hash,
      IO,
      IO::EAGAINWaitReadable,
      IO::EAGAINWaitWritable,
      IO::EINPROGRESSWaitReadable,
      IO::EINPROGRESSWaitWritable,
      IO::WaitReadable,
      IO::WaitWritable,
      IOError,
      IndexError,
      Integer,
      Interrupt,
      Kernel,
      KeyError,
      LoadError,
      LocalJumpError,
      Marshal,
      MatchData,
      Math,
      Math::DomainError,
      Method,
      Module,
      Monitor,
      MonitorMixin,
      MonitorMixin::ConditionVariable,
      MonitorMixin::ConditionVariable::Timeout,
      Mutex,
      NameError,
      NilClass,
      NoMemoryError,
      NoMethodError,
      NotImplementedError,
      Numeric,
      Object,
      ObjectSpace,
      ObjectSpace::WeakMap,
      Proc,
      Process,
      Process::GID,
      Process::Status,
      Process::Sys,
      Process::Tms,
      Process::UID,
      Random,
      Range,
      RangeError,
      Rational,
      RbConfig,
      Regexp,
      RegexpError,
      RubyVM,
      RubyVM::Env,
      RubyVM::InstructionSequence,
      RuntimeError,
      ScriptError,
      SecurityError,
      Signal,
      SignalException,
      StandardError,
      StopIteration,
      String,
      Struct,
      Symbol,
      SyntaxError,
      SystemCallError,
      SystemExit,
      SystemStackError,
      Thread,
      Thread::Backtrace,
      Thread::Backtrace::Location,
      Thread::ConditionVariable,
      Thread::Queue,
      Thread::SizedQueue,
      ThreadError,
      ThreadGroup,
      Time,
      TracePoint,
      TrueClass,
      TypeError,
      UnboundMethod,
      ZeroDivisionError
    ]
  end
end
