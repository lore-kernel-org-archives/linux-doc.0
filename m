Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6215239086
	for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 19:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771098555; cv=pass; b=nuzyjJq3nmc0VZ7DI+JLUyR3Px/+3eitFuIiOpyPC8IONaqzQYgViu9tC0y0mRpmfebxNfYJSzuugKuWp6p63NdWDRFoHpQtqFQriefgYVRO9bW+6qwnYhEvDvUQdioFPWr/G5QP54QrJ08rsRK/Yd/7N+T6XwTqlpjOY+f2Fr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771098555; c=relaxed/simple;
	bh=GC+jahyn08TEzaCyFw4EljLb34TFRdxXPLg0f+cKCG0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwIFaPqUZsjb13Tw03r2/6NYmjug0mRbBEX+lbcpELbrotyggZHQR+Tse9OaWRELScqRTMYxgCjC2DTli2XL21nV/PZi/FJNrK9gbCyS02CaXSNYVSqwI80OaQTM5Fo0h8CHdpHgQ2AParqtKGbAui9mffYOXQ7VROyEK+up6eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v+nF1ENU; arc=pass smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v+nF1ENU"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56753dc51baso790266e0c.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 11:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771098553; cv=none;
        d=google.com; s=arc-20240605;
        b=gllDzCP/ZlfUGMaZBS3v0SZvtEDIlT4RYku+O4TUl+HCQ7jiSlJM0oB7GYXSmkzAGt
         iVPOT363UAGZdwtQYUUWJD07pwzoyV6YADOCBIKcP+7gQDua0sX8rVmEG2iXZFGg51cf
         hEhpDbp5aba6cVyaTgs0ZD3GUcaQlRHCiFO+GZudu8NeEKFu4QoKI2Fz+BqBg7vcVVWp
         Y42Yw9o9U6IbamGbHPxHZEeJkxAYiYgd1DO6QVo10zyExA7qWn38ByWW1Po1pPoJWPVi
         EZ4xfMvqNxwthbwIvBKWhnnRS4THESA2dyFN1GN/sH0A7p3nCNqoAASuMVkSEiZwnQjO
         AN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        fh=XVapVwhHRMb8F6thYcDhSVQ+YBuakNcZFHDLzUkHqRQ=;
        b=TG0xNt+u32d7gSAfIUleQYN4nLH5tIOoh4/uRFEJzyVa/Z91YcZTv3j8LelKbYzvCl
         np/wgwn/JvcLsmw+OtQdSbFYSC1rowcYz62y1FVU3sfLInn9HrtoBcREdY0Dl6WgPwRr
         2JcYDi9GzrETS8bci1WdVKHnIV6koo7N+o2UiPtCfio+VjwK6XkaygIp6xjznVCSvU7X
         Fp7oOmJeu/bCeQYdfqgfuE5vWsxCZgR+wmSrSNMQ+1i1Y9eqom+G+S7GsHmd0LXtfxT1
         rXhgY1njmXlVBBqff5RbjzlbCM0Tj2IfBDGcX/4ZTlgzyj6QzAC2fDOdIQFmoccNsKT/
         d9Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771098553; x=1771703353; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        b=v+nF1ENUr21oPwBbnMwcXIhFYefKeTMhJR5EjCm1w3ircYOhwF3dMGDWR9JqHc1sAg
         YSSLd1Vh59Mcl5syECgCb8eJtD3k4h5qx+z65ix07/+ciARNcqOvAswEKGVAP31HoUSY
         vhyaG8DAGDWDE3PrKdHcQ6jm4AXEe23Vixzuv3eBxCOU0y0jOX1LmLTZb3c8yEU+9tkg
         yew9JK7XTeFJ65CpkoPt92hPal7tgfprKTCP7vN8VcVMJj2y0UfwBtQqGjTwnVF1bCli
         l3qyEE4Byo2zm8QYwJ10pCHEHT7OTcI0jia9IpcNJzrKlC79HNBpat1PgTLTrnS8n9iq
         CBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771098553; x=1771703353;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtvRpN/RyTbUwVvDF0717LJmDHhTx67+ZJt2k7G+yEQ=;
        b=NMPo4KuHWAHGYPVmF0STR3sFxeHTOWLCJWUtX3T1cpJsFg/MyXQmnTUK4SaGfDxgns
         DtTnFBBt+jCEHh9HFQ0AajJvFnYGPcL+Of4cDYsSDl3oYY2RKeQ0TFz/6iyUaINx5feI
         eVh2JL7a7CGY6F+2l6Uxku0gJZ8IXlRwWuRCRh/Xkt8YaYgFHYV5RHxP52BjmQCvhGFT
         RUUWxg0PrfvjUz/O7B+yFzXVxxj3fAANikbNtHK6qp5C4Cf52QWoD5reuhO0YgyT2Imi
         Ybk+CepdTr5JibjqJqDnSiQUFg8QrF43oyJQ/kQ0aG85xUtfIsg5VCZzkfddg0qsZaFg
         WEQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdvehCVDppY1RIr8n0qZqvzdVGlbGz6SbIySbZXrXQZQdZ3EaYPaCiB7n5s9mRR34Nw31ttf4SQpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjOo/ipISceWoNZ1QSYp2C9yJfFJNvn/DSP4b7AU35DxPgLeA
	92N8YLp/NSTBsvg4p888Eq8n+Otxx3IrMjzJyE3CWLFfVtuDfRbwp50PhuQK/gz4rcjJtyCD4Qm
	UVB8WEnW7IlKEf8/T6hc2fhYm3Y0RpcIaWcAWu/UL
X-Gm-Gg: AZuq6aIG6++wiqJ1Xr8NuCehnnzsXBtgM42ALxvv5W5oQb9YA7Qn13h38dith8d2Zy0
	ozpY4kpOkxXdPRpqOlXWORCYCLSjhCth3uwwMA0LvhB9SuEpLtPZj3R38M6JbJORyGdcpra6kbe
	sRJGIHXA9PH6WBjhSa1UjfRA0Jp10k80o6iTfps1mFEC9nWCnLL2dmlKq/vmN9MzQpz0xYJiXKO
	SGMeR3YE/blSBZ/DDtZcLJAdG3bbW8hYgRdKpxeatxQA5LAZwoNajAQz9mZn8f67cujISRgS5cA
	fYx5BxtwpKoDZcDWoM/D9XbIMT5rJTRhJh3IHLcC6K+ycw29p1oA
X-Received: by 2002:a67:e997:0:b0:5f1:72a7:f879 with SMTP id
 ada2fe7eead31-5fe16ee32cbmr1706405137.28.1771098552104; Sat, 14 Feb 2026
 11:49:12 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 11:49:10 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 14 Feb 2026 11:49:10 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <995398ca18fcb192444799a520cab5ea8e43df7b.1770071243.git.ackerleytng@google.com>
References: <cover.1770071243.git.ackerleytng@google.com> <995398ca18fcb192444799a520cab5ea8e43df7b.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 11:49:10 -0800
X-Gm-Features: AaiRm51Rsn2OYZ_XKS4QmK9tZorCQvqfnTm3HcOw4Q6pQqac2ibQJ7lRc1m0N7c
Message-ID: <CAEvNRgHcxjkE8OPVxYqdCs+HvbaYqhNPW1mnocoKOoy5d6FoZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 33/37] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> The TEST_EXPECT_SIGBUS macro is not thread-safe as it uses a global
> sigjmp_buf and installs a global SIGBUS signal handler. If multiple threads
> execute the macro concurrently, they will race on installing the signal
> handler and stomp on other threads' jump buffers, leading to incorrect test
> behavior.
>
> Make TEST_EXPECT_SIGBUS thread-safe with the following changes:
>
> Share the KVM tests' global signal handler. sigaction() applies to all
> threads; without sharing a global signal handler, one thread may have
> removed the signal handler that another thread added, hence leading to
> unexpected signals.
>
> The alternative of layering signal handlers was considered, but calling
> sigaction() within TEST_EXPECT_SIGBUS() necessarily creates a race. To
> avoid adding new setup and teardown routines to do sigaction() and keep
> usage of TEST_EXPECT_SIGBUS() simple, share the KVM tests' global signal
> handler.
>
> Opportunistically rename report_unexpected_signal to
> catchall_signal_handler.
>
> To continue to only expect SIGBUS within specific regions of code, use a
> thread-specific variable, expecting_sigbus, to replace installing and
> removing signal handlers.
>
> Make the execution environment for the thread, sigjmp_buf, a
> thread-specific variable.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  .../testing/selftests/kvm/include/test_util.h | 29 +++++++++----------
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 18 ++++++++----
>  tools/testing/selftests/kvm/lib/test_util.c   |  7 -----
>  3 files changed, 26 insertions(+), 28 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index 2871a4292847..0e4e6f7dab8f 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -80,22 +80,19 @@ do {									\
>  	__builtin_unreachable(); \
>  } while (0)
>
> -extern sigjmp_buf expect_sigbus_jmpbuf;
> -void expect_sigbus_handler(int signum);
> -
> -#define TEST_EXPECT_SIGBUS(action)						\
> -do {										\
> -	struct sigaction sa_old, sa_new = {					\
> -		.sa_handler = expect_sigbus_handler,				\
> -	};									\
> -										\
> -	sigaction(SIGBUS, &sa_new, &sa_old);					\
> -	if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {				\
> -		action;								\
> -		TEST_FAIL("'%s' should have triggered SIGBUS", #action);	\
> -	}									\
> -	sigaction(SIGBUS, &sa_old, NULL);					\
> -} while (0)
> +extern __thread sigjmp_buf expect_sigbus_jmpbuf;
> +extern __thread bool expecting_sigbus;
> +
> +#define TEST_EXPECT_SIGBUS(action)                                     \
> +	do {                                                           \
> +		expecting_sigbus = true;			       \
> +		if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {         \
> +			action;                                        \
> +			TEST_FAIL("'%s' should have triggered SIGBUS", \
> +				  #action);                            \
> +		}                                                      \
> +		expecting_sigbus = false;			       \
> +	} while (0)
>
>  size_t parse_size(const char *size);
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index aec7b24418ab..18ced8bdde36 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2314,13 +2314,20 @@ __weak void kvm_selftest_arch_init(void)
>  {
>  }
>
> -static void report_unexpected_signal(int signum)
> +__thread sigjmp_buf expect_sigbus_jmpbuf;
> +__thread bool expecting_sigbus;
> +
> +static void catchall_signal_handler(int signum)
>  {
> +	switch (signum) {
> +	case SIGBUS: {
> +		if (expecting_sigbus)


Transferring/summarizing an internal comment from Sean upstream:

This assumes that tests are indeed using the catchall_signal_handler as
the global signal handler.

In the next revision, I will make TEST_EXPECT_SIGBUS() assert that the
default signal handler is installed, so that developers get a clear,
explicit failure if/when something goes wrong.

> +			siglongjmp(expect_sigbus_jmpbuf, 1);
> +
> +		TEST_FAIL("Unexpected SIGBUS (%d)\n", signum);
> +	}
>  #define KVM_CASE_SIGNUM(sig)					\
>  	case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
> -
> -	switch (signum) {
> -	KVM_CASE_SIGNUM(SIGBUS);
>  	KVM_CASE_SIGNUM(SIGSEGV);
>  	KVM_CASE_SIGNUM(SIGILL);
>  	KVM_CASE_SIGNUM(SIGFPE);
> @@ -2332,12 +2339,13 @@ static void report_unexpected_signal(int signum)
>  void __attribute((constructor)) kvm_selftest_init(void)
>  {
>  	struct sigaction sig_sa = {
> -		.sa_handler = report_unexpected_signal,
> +		.sa_handler = catchall_signal_handler,
>  	};
>
>  	/* Tell stdout not to buffer its content. */
>  	setbuf(stdout, NULL);
>
> +	expecting_sigbus = false;
>  	sigaction(SIGBUS, &sig_sa, NULL);
>  	sigaction(SIGSEGV, &sig_sa, NULL);
>  	sigaction(SIGILL, &sig_sa, NULL);
> diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> index 8a1848586a85..03eb99af9b8d 100644
> --- a/tools/testing/selftests/kvm/lib/test_util.c
> +++ b/tools/testing/selftests/kvm/lib/test_util.c
> @@ -18,13 +18,6 @@
>
>  #include "test_util.h"
>
> -sigjmp_buf expect_sigbus_jmpbuf;
> -
> -void __attribute__((used)) expect_sigbus_handler(int signum)
> -{
> -	siglongjmp(expect_sigbus_jmpbuf, 1);
> -}
> -
>  /*
>   * Random number generator that is usable from guest code. This is the
>   * Park-Miller LCG using standard constants.
> --
> 2.53.0.rc1.225.gd81095ad13-goog
