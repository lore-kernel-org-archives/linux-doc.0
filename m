Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD16333F8A1;
	Wed,  8 Jul 2026 00:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470889; cv=none; b=SFRCPJC/O6KAu7hZGK8R0ABxULu1W0r2d20iNvGIF59gHq7qIEioG2xx3re3Y4zdReOzvXh8JWankFnGTzyAe55gMEKLriHPg/k2hWzOmRsTkDJN5hvnWyYGvnwfK4PaXzJee9swqIeiuwoQIwRsvNbh9HlXT7t8JphJH2Q1M5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470889; c=relaxed/simple;
	bh=MT6oKRjjRw9ut3seO0L4lWJOJKeopg2XLYQgZHmFdgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWlpOBkAXyv94GKFTmKpX9TCvmKW3P/gRTMTlSYkYT3XfoCyurV7kczq/1LYrsdUYJ+O2Ih+Db4ySL9cXGNlIjaJaV0Ihtp1I5LgECD4QU3Nw3cA/5OTabjCjuF0zSTS3n001pzl0q4rkO5GHOoRPmBtLppfGtYxOgJm3L/M8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NHEuG8ga; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NHEuG8ga"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nOCe1RkZQGdds6rX0Ktv9EBnlFwrenpduIe6qjo8qrI=; b=NHEuG8gaL/trZHi22FSgudtF2W
	4OKy42TYMB3Kn5ODtp65/itMx5HPxlahunzf6AlldSdE3Ijfs41xTDsKp4/K68ikRnqiksWzHoSsA
	YaJBFfnWajWgbvkWXZ8vBJdTiuT/wtvbObWs7U5w/zREIcXOpSeE9MwlhpjCppGL0oXQL0rwnRT2/
	NuTAu3kg1mi+VMGC+uXxyGk8xkYOVKOTu5AfmKpjDUCEPU/4/juIxmjc8fW354OiQ08QtEuQrs3fo
	Em4n3NEiDqf4mwxUiV5IrgtjqHPmp2sjr9egMl6KoxTGsvrjAkUkySCUdNHI2+3bDvL8jc32w1NIw
	H7WoX6Ww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whGFM-0000000G3nc-3y2u;
	Wed, 08 Jul 2026 00:34:41 +0000
Message-ID: <80183624-01bf-4481-a881-bda2eba41c0e@infradead.org>
Date: Tue, 7 Jul 2026 17:34:39 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
To: Gregory Price <gourry@gourry.net>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 tglx@kernel.org, peterz@infradead.org, luto@kernel.org,
 akpm@linux-foundation.org, feng.tang@linux.alibaba.com, pmladek@suse.com,
 lance.yang@linux.dev, marc.herbert@linux.intel.com, kees@kernel.org,
 leitao@debian.org, joel.granados@kernel.org, lirongqing@baidu.com,
 nathan@kernel.org, xur@google.com, lukas.bulwahn@redhat.com,
 ryan.roberts@arm.com
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260704015859.536580-2-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/26 6:58 PM, Gregory Price wrote:
> Syscall User Dispatch is presently built under CONFIG_GENERIC_SYSCALL
> and cannot be disabled independently.
> 
> Add CONFIG_SYSCALL_USER_DISPATCH to make it an optional feature.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>  arch/Kconfig                                | 11 ++++++++
>  include/linux/entry-common.h                |  6 ++---
>  include/linux/syscall_user_dispatch.h       | 28 +++++++++++++++++++--
>  include/linux/syscall_user_dispatch_types.h |  2 +-
>  kernel/entry/Makefile                       |  3 ++-
>  5 files changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index fa7507ac8e13..192b9d8abb5f 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -114,6 +114,17 @@ config GENERIC_ENTRY
>  	select GENERIC_IRQ_ENTRY
>  	select GENERIC_SYSCALL
>  
> +config SYSCALL_USER_DISPATCH
> +	bool "Syscall User Dispatch"
> +	depends on GENERIC_ENTRY
> +	default y
> +	help
> +	  Syscall User Dispatch lets a thread have its own system calls outside
> +          an allowed IP address range to be intercepted and redirected to a
> +          userspace signal handler.

If it hasn't already been mentioned and repaired, the help text lines should
all be indented with one tab + 2 spaces.

> +
> +	  If unsure, say Y.
> +
>  config KPROBES
>  	bool "Kprobes"
>  	depends on HAVE_KPROBES
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index 416a3352261f..9336516430a1 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -9,6 +9,7 @@
>  #include <linux/resume_user_mode.h>
>  #include <linux/seccomp.h>
>  #include <linux/sched.h>
> +#include <linux/syscall_user_dispatch.h>
>  
>  #include <asm/entry-common.h>
>  #include <asm/syscall.h>
> @@ -55,7 +56,6 @@ static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs
>  }
>  #endif
>  
> -bool syscall_user_dispatch(struct pt_regs *regs);
>  long trace_syscall_enter(struct pt_regs *regs, long syscall);
>  void trace_syscall_exit(struct pt_regs *regs, long ret);
>  
> @@ -232,10 +232,8 @@ static __always_inline void syscall_exit_work(struct pt_regs *regs, unsigned lon
>  	 * of these syscalls is unknown.
>  	 */
>  	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
> -		if (unlikely(current->syscall_dispatch.on_dispatch)) {
> -			current->syscall_dispatch.on_dispatch = false;
> +		if (syscall_user_dispatch_clear_on_dispatch())
>  			return;
> -		}
>  	}
>  
>  	audit_syscall_exit(regs);
> diff --git a/include/linux/syscall_user_dispatch.h b/include/linux/syscall_user_dispatch.h
> index 3858a6ffdd5c..c466af02da36 100644
> --- a/include/linux/syscall_user_dispatch.h
> +++ b/include/linux/syscall_user_dispatch.h
> @@ -7,8 +7,22 @@
>  
>  #include <linux/thread_info.h>
>  #include <linux/syscall_user_dispatch_types.h>
> +#include <linux/sched.h>
>  
> -#ifdef CONFIG_GENERIC_ENTRY
> +struct pt_regs;
> +
> +#ifdef CONFIG_SYSCALL_USER_DISPATCH
> +
> +bool syscall_user_dispatch(struct pt_regs *regs);
> +
> +static __always_inline bool syscall_user_dispatch_clear_on_dispatch(void)
> +{
> +	if (likely(!current->syscall_dispatch.on_dispatch))
> +		return false;
> +
> +	current->syscall_dispatch.on_dispatch = false;
> +	return true;
> +}
>  
>  int set_syscall_user_dispatch(unsigned long mode, unsigned long offset,
>  			      unsigned long len, char __user *selector);
> @@ -24,6 +38,16 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
>  
>  #else
>  
> +static inline bool syscall_user_dispatch(struct pt_regs *regs)
> +{
> +	return false;
> +}
> +
> +static inline bool syscall_user_dispatch_clear_on_dispatch(void)
> +{
> +	return false;
> +}
> +
>  static inline int set_syscall_user_dispatch(unsigned long mode, unsigned long offset,
>  					    unsigned long len, char __user *selector)
>  {
> @@ -46,6 +70,6 @@ static inline int syscall_user_dispatch_set_config(struct task_struct *task,
>  	return -EINVAL;
>  }
>  
> -#endif /* CONFIG_GENERIC_ENTRY */
> +#endif /* CONFIG_SYSCALL_USER_DISPATCH */
>  
>  #endif /* _SYSCALL_USER_DISPATCH_H */
> diff --git a/include/linux/syscall_user_dispatch_types.h b/include/linux/syscall_user_dispatch_types.h
> index 3be36b06c7d7..c0bdd4f760d3 100644
> --- a/include/linux/syscall_user_dispatch_types.h
> +++ b/include/linux/syscall_user_dispatch_types.h
> @@ -4,7 +4,7 @@
>  
>  #include <linux/types.h>
>  
> -#ifdef CONFIG_GENERIC_ENTRY
> +#ifdef CONFIG_SYSCALL_USER_DISPATCH
>  
>  struct syscall_user_dispatch {
>  	char __user	*selector;
> diff --git a/kernel/entry/Makefile b/kernel/entry/Makefile
> index 2333d70802e4..f220bae86b12 100644
> --- a/kernel/entry/Makefile
> +++ b/kernel/entry/Makefile
> @@ -13,5 +13,6 @@ CFLAGS_REMOVE_common.o	 = -fstack-protector -fstack-protector-strong
>  CFLAGS_common.o		+= -fno-stack-protector
>  
>  obj-$(CONFIG_GENERIC_IRQ_ENTRY) 	+= common.o
> -obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o syscall_user_dispatch.o
> +obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o
> +obj-$(CONFIG_SYSCALL_USER_DISPATCH)	+= syscall_user_dispatch.o
>  obj-$(CONFIG_VIRT_XFER_TO_GUEST_WORK)	+= virt.o

-- 
~Randy

