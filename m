Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CFE3845D9
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379811; cv=pass; b=FF0W8pyvalXnc8Vr+aqm3lCWJxuSuXBvKuwySW277UR2a2GCTvFdoWMjNOZR+CWBquTe7PnrN8LDfZhr23medKP4kLjOB3+qqAN8fl8IBTV2amj445nUeqnMQ4C71QgqF/u15BWHl/aI87h7+cqV4jg/zGvKytVGmKsApq1aDIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379811; c=relaxed/simple;
	bh=WU9qgw2wyQ4Db0YV1GPH6pGz3qYi1wBkaN9pDyH60hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDHcpNiB1mkx0bqcYvBVhwK9RxlkzQpvLBcTx5T4CFm9X2ONmXI2QtFG92B2zMnXVqTZf8amgy3O4KigDFfVGFNlhQ98L3uXIpC5zXE9/BPVa50R9aAxJdCBNK9qLFmVg3ik7A0KnB69yJm/4Ocj/HQlGfBFnrjp3k+Lmp5zeas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tvxH3G/7; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tvxH3G/7"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765531803so197561cf.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 02:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782379809; cv=none;
        d=google.com; s=arc-20260327;
        b=mSHHlsk3dOGf0LhvEYwMmaY6790njDZ3KomByDXM9/Uq8JHBg31cfOZ+dnktVGEp4i
         wLbJTN6vO00I8zwvNjEAiD0aCmBMTwreJLSlV2cotfWFSafTqYT99dlncsgM1J5aHsad
         0w4gBbBVlEri5wep7ezngIxXQzr05jQVb6cDjfgfZw4IZxQJEGaxGpfhTljwkfhd20wh
         DI6BZrVqN2/VaKg4mh7HiXKAA5L28OXtVRzGgUA4dHNgkbEQp2JVnYR/MN9HA/u5Cfxs
         pjrDNju4gYvXe89j7yAj1/pYtA8fnyudHuqirRK6c/Qsor4+2T3GWQ/nY2b1hRVmLvoc
         6/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        fh=h+cLO4yxAezxuh8iHcBaja+nKUf3t3TQaqujKO9PcxY=;
        b=IwxErmSlSabnC50ZpduNu3meSCIVx6lqK4xAxILJAcBGVWYsI/4z5Zu6A9lVg+vAjf
         T7DfKEQWSdA8I3vtOcVrSnGc2NR73COqEnKlMNbeXhoPtGTuvs+Bob19KahURqFrUXbJ
         DiEGNIOi7DMcs8WA7RXKFGqx7XiH4Bt73p0id3D1r0E5Z1J/NKmLuucWhiu4SRubrdtZ
         gDmtYiRD41LIrG0I8qyJIk76CLiMefo4hxrceFqRsJ6nbOmm+S63N7dq8+JBeCsG4sPc
         5s0xLvPt7+StdCkMUgPgzTc3P98/EgZDFhKlBD3cnLquTEDcj0gYp5lOFjUyupCrdtNn
         tJbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782379809; x=1782984609; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        b=tvxH3G/7kMZP2d/9snzm3SgKHl9OAzqD+weDqyVWYS00gsgpwyJ7Hji23QdF7Brrj7
         peUU2Jl9OkvEmVl0NG9UDrJWNiGEkRxPKT6H2zLYpZJ74RZonF0jMqqOl2TyrhWpSeXr
         v93i1JfqeCuxCiGLk+xOgphCVTBAVLlFFfW4MjPlR2S2m6luwDPTbI98ygKXveD/PQad
         EWfbKN5xtVh+vN1xDeHj0CqgkWeG5O/559GKWOqGtfycaqducC7g4UKsoZ7YL2nCWTMJ
         jPqovba7zwd4E9tc1Y9mcVOQUD2o65odiYBEGs1xDotvhhA+CUbMez2a3AGmi5YVPT0u
         /qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379809; x=1782984609;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HWFN45t67ilSUVNbHIGobHGAf81p04HluCZmKDev2qM=;
        b=TN3/Hzvgu8DvDzR2YB196hwOWmpLLiPYtZ8uY5hX54hBkPStYhK5Rz6LeZ6k51RHWx
         l43F25/lRZ+enO6xpAO+6z4KKxEya+Bzqfbmrt3abnG6346YT1aqjBjv7RNg2njPpgSf
         BCXBc4xTOkc5ts5fRIYZJaiD/cyeATZ901Z6/dzxFaNXbR9he/+KqhcIraGRsUrLCd3s
         9SC64d7vXRVsHexO11EzfRjL0JYeE5sj43a5fcS1AMcYhBFMoInJn0ToxCRxU8JdFsXk
         uuWJaVhr6relzknJjoDvbukHbLpcBHHKg5D8b1CRnmWoG0t/Hx5hvIUNgAwIocBen5Da
         2ESw==
X-Forwarded-Encrypted: i=1; AFNElJ/9VkwILo1/GEJlxHDwctrMiE98s59VphZdrZiaw+snC+xGP746xQLYR2LxNnGv0zZ4DKsV5CKnzrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7k7aS4vXzlPEUFGv8VjWsVCi9zZj/eIJdKy79F9rSAROe9PM
	Stm+tzlHmt8FrnzV3TorPXyFtYPEvm1QJM5/kz/gFXV+v0SZBKY15zLSLoaBOBk1WwsPfGFCAAm
	96gErEbq4X8SLxveHCdj/EoRc25m7ATTF5DrxECON
X-Gm-Gg: AfdE7cmf90eDM9yMJe40CZtCizqPdVkNwLUyrGplXWbBMX0f5U4AUJQjyLNxpRsVCQg
	ygTstCci9ZKsG6BvS7bLU6gJAFNxxGl8kwEFmfJR5ZYA4Z4GI7Chhrr5WUaoq5aPoxxi35CD8RT
	xpAMynZr9zgwdCCx9MljmF3SPC713M7g6/R3F06wV6YP0NEPU2KtFEcDgq2z84xhs09clpQp0pi
	abx6uMQ2nj4Qj+CwxWMa41f+Oo1FsMC9mZgBxjZLcgA+UUOlCLR+LIc/21jeiqvtox6227wPg==
X-Received: by 2002:a05:622a:228a:b0:517:5e32:2d14 with SMTP id
 d75a77b69052e-51a6e9a113bmr7270171cf.10.1782379807934; Thu, 25 Jun 2026
 02:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-44-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-44-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 25 Jun 2026 10:30:00 +0100
X-Gm-Features: AVVi8CepKPjvM3Enq6RbicrK2LVKri7rowcdAQD9hRsLWhakG_kPU-ncpztrsII
Message-ID: <CA+EHjTzL4yfp2mUqE+_FdoDLVGdpdh8Gy+gAwe3FvLWXwkOFog@mail.gmail.com>
Subject: Re: [PATCH v8 44/46] KVM: selftests: Make TEST_EXPECT_SIGBUS thread-safe
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:32, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
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
> As part of TEST_EXPECT_SIGBUS(), assert the prerequisite for this setup,
> that the current signal handler is the catchall_signal_handler.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  tools/testing/selftests/kvm/include/test_util.h | 32 +++++++++++++------------
>  tools/testing/selftests/kvm/lib/kvm_util.c      | 18 ++++++++++----
>  tools/testing/selftests/kvm/lib/test_util.c     |  7 ------
>  3 files changed, 30 insertions(+), 27 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/test_util.h b/tools/testing/selftests/kvm/include/test_util.h
> index 51287fac8138a..bd75162ec868d 100644
> --- a/tools/testing/selftests/kvm/include/test_util.h
> +++ b/tools/testing/selftests/kvm/include/test_util.h
> @@ -82,21 +82,23 @@ do {                                                                        \
>         __builtin_unreachable(); \
>  } while (0)
>
> -extern sigjmp_buf expect_sigbus_jmpbuf;
> -void expect_sigbus_handler(int signum);
> -
> -#define TEST_EXPECT_SIGBUS(action)                                             \
> -do {                                                                           \
> -       struct sigaction sa_old, sa_new = {                                     \
> -               .sa_handler = expect_sigbus_handler,                            \
> -       };                                                                      \
> -                                                                               \
> -       sigaction(SIGBUS, &sa_new, &sa_old);                                    \
> -       if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {                          \
> -               action;                                                         \
> -               TEST_FAIL("'%s' should have triggered SIGBUS", #action);        \
> -       }                                                                       \
> -       sigaction(SIGBUS, &sa_old, NULL);                                       \
> +extern __thread sigjmp_buf expect_sigbus_jmpbuf;
> +extern __thread volatile sig_atomic_t expecting_sigbus;
> +extern void catchall_signal_handler(int signum);
> +
> +#define TEST_EXPECT_SIGBUS(action)                                     \
> +do {                                                                   \
> +       struct sigaction __sa = {};                                     \
> +                                                                       \
> +       TEST_ASSERT_EQ(sigaction(SIGBUS, NULL, &__sa), 0);              \
> +       TEST_ASSERT_EQ(__sa.sa_handler, &catchall_signal_handler);      \
> +                                                                       \
> +       expecting_sigbus = true;                                        \
> +       if (sigsetjmp(expect_sigbus_jmpbuf, 1) == 0) {                  \
> +               action;                                                 \
> +               TEST_FAIL("'%s' should have triggered SIGBUS", #action);\
> +       }                                                               \
> +       expecting_sigbus = false;                                       \
>  } while (0)
>
>  size_t parse_size(const char *size);
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 6b304e8a0e0d5..b4f104436875b 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2292,13 +2292,20 @@ __weak void kvm_selftest_arch_init(void)
>  {
>  }
>
> -static void report_unexpected_signal(int signum)
> +__thread sigjmp_buf expect_sigbus_jmpbuf;
> +__thread volatile sig_atomic_t expecting_sigbus;
> +
> +void catchall_signal_handler(int signum)
>  {
> +       switch (signum) {
> +       case SIGBUS: {
> +               if (expecting_sigbus)
> +                       siglongjmp(expect_sigbus_jmpbuf, 1);
> +
> +               TEST_FAIL("Unexpected SIGBUS (%d)\n", signum);
> +       }
>  #define KVM_CASE_SIGNUM(sig)                                   \
>         case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
> -
> -       switch (signum) {
> -       KVM_CASE_SIGNUM(SIGBUS);
>         KVM_CASE_SIGNUM(SIGSEGV);
>         KVM_CASE_SIGNUM(SIGILL);
>         KVM_CASE_SIGNUM(SIGFPE);
> @@ -2310,12 +2317,13 @@ static void report_unexpected_signal(int signum)
>  void __attribute((constructor)) kvm_selftest_init(void)
>  {
>         struct sigaction sig_sa = {
> -               .sa_handler = report_unexpected_signal,
> +               .sa_handler = catchall_signal_handler,
>         };
>
>         /* Tell stdout not to buffer its content. */
>         setbuf(stdout, NULL);
>
> +       expecting_sigbus = false;
>         sigaction(SIGBUS, &sig_sa, NULL);
>         sigaction(SIGSEGV, &sig_sa, NULL);
>         sigaction(SIGILL, &sig_sa, NULL);
> diff --git a/tools/testing/selftests/kvm/lib/test_util.c b/tools/testing/selftests/kvm/lib/test_util.c
> index bab1bd2b775b6..30eb701e4becd 100644
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
> -       siglongjmp(expect_sigbus_jmpbuf, 1);
> -}
> -
>  /*
>   * Random number generator that is usable from guest code. This is the
>   * Park-Miller LCG using standard constants.
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
