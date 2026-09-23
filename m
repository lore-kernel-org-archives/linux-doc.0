Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24249481647
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 23:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790205021; cv=pass; b=sClwTBJpu4e8qY6Iru/qkaoeoOXIhY/CXzac595IX+QzO6TDjkfSsrG42pNwW7wZ28TF8PNXxrTgUUNYmRG3i+G1Nm5Q5+PyyRUrMYUBd2SaxeHcmsvyVsyYkveYr0dh533dAFgkVMJB68lgCXA1/f5Yx7uBrI/WawVtIPaa6TY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790205021; c=relaxed/simple;
	bh=pA02lskqEBJ7xcsCEpir2dIlgRb+8WSAXZpU/r56rPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UN3H924Vry3Vy7VjpoJKhT5aUTzksqERRu3GlZ82FyuorjJGBZHvHfK/QvI20Wt4O80o5oz79HSwv/1TZchRIn+xqjLGBjTKUanjg70HI7jlfH+sdgso4Db6oJULHFehm1d/nA3DJEwaaD9yMOZY5sZqR4ySXE2fb/+xvHwNzHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QORHoqjV; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QORHoqjV"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so2189889a12.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 16:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790205017; cv=none;
        d=google.com; s=arc-20260327;
        b=KUmfqGXFbqVqAsA0tX6bZSfPUnSh8XZutfOAdhjoesPll1c4yFspLSQNv2Uzo1Ln8t
         OX8yvP8miis6eHkl3e4gcxrcYNFxQnnh9trWZ9EodtjcirC1Nze4U+m7dx1ISN5eZ1O0
         rmN4Yu99cpJK4T+JkuYC4emT51L8nNnpS7PPnY5TPvLnhSeObqnM2EK4VInW4SOpQYv5
         F9jieb4/tprRbLrDNM2O4TfDtWh6YXsgqBSjqk60eXiAT/c5mUzf/mtnuYBMzt4MRKdi
         opnZOX2by7eLOxBS+OVbylbq+sZo174+rEK3BiuCpVnS6GSOuP2Ms96E9/6gQYNR31/Z
         9fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        fh=9nD0sjkMnQkZ0EKriz3aiwqem0hrKmffTcTXZrKIgt4=;
        b=gctBREr41x/l0iJAkaGI8fvUQcITp2HXTMrBMXHygTgf/WSf7hWjegU1w+5EZ2GbgN
         NGbSv4qFmtwW63bNvqJAFSQfkAH9F1HXvEwgvmcgl4/DwOIE+0XO4MoEuSYrbXgReTmK
         rTzHIq2pRK32ni8WJlUg0i6gce1keZQqc5zLp8sWcXIffh/OnygJPK5MyTWHXfegbC/D
         iMpPY0VM0Lb14pYLRnQ5rxqFgW3eA8J+Y2cbP0C2qOke/XHSWJswxLpkNFnqqoWcxnf1
         +5bcyKjcENc0pd6oOyeaG3ejViptQmV1K3PMpo+n8kLhQz2eK9e8C7B//M8kAdOCE8h6
         vCFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790205017; x=1790809817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        b=QORHoqjVPTTcJfyGc1AeBOqQ3nh3x5JsvFUo29nuD8Kf1uqSsim/YDnrBtP0mf6/nJ
         j9A2so7EEBaDxmCZ3rTCx3yA1GMY7TkRdYBYrPHc7Gba3YRWt2aSowYqxZIDWtBa/JNz
         e7KKwG5p09dXcUTtJKoMtqDvLLEBXn2qtIhUZrB1zBfb7XcS7lv3MtZY08StClB3UyU2
         ty7BZcOEuzIP3C+R6LF1fzgpdLXqrxgMfpS5Lendu9G+oh8+e5ostj05fIbWGgzanlQW
         uBNwn9arzBfgD7cVdDLKRlvGlX4iIgu6O7rZCLZ5hqqXM7JTFBZeuHwHJYrCize1Z33R
         NMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790205017; x=1790809817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8CDt3YaPNv1qQdHjAb4WFBPEg/nrTUGnlyKUfZeYLw=;
        b=cnx0H8dYrIVUZJV9erV8zM0chY8VK7SJSoV+YdlJl9IpbNyRLrujwB2KS6XpUzm1IA
         z9hzPipQ9b6wCuXEgqIc+R9N+Z7eoIxRDzYED+zn/dqg/aE/LNedU29yjBr5YJZjT48+
         oUhH766SoFvXGylAb4vzRUtOREFf51UrPdHUzRC67vKCwq7Dz2ncdmGskA55qESfFoCJ
         RbOoqV8FFQ+VR2DSmAxhpwTqP+UbJGFrCUrTlm48xE25X8o4qPIOL2F6SZemgq5Ye8c2
         zKE6BptwcwqZvE57siYX2q9bqywlRi+zRpnhNvo4T6vwZg9KDFtoKLs8uvy3Gn6EjGS6
         U9tA==
X-Forwarded-Encrypted: i=1; AKwUvBw0ZIuhQ6aCokINVMmCMZyUPmAmv6FGw2ZrUZLZB1ZWQysu0RAI2VyywbDFbESuSBoBnXuxkU6LpNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lEI7elcOrVm1Z+SDWdBdbkrBohGPGlfp8NKifo17SkbMThM2C9
	jeM9hq7E13isUaazAYcmJWIvrRwPe1+xmqpy2M59bHbGu6DQryNGpyq0CkHsAWMCGe0st2A6eAc
	6NJROPXFo9Ve5i0wewUN6BriM+Y7A5S0=
X-Gm-Gg: AYBFou1mvAs/O4w6FkoxRqkZi/X8nz7dSPS3Uu1m2xdRWF8dHUhwE31B7N6uUAnihr+
	jxuV1LDu8RhOik5Hpj/V0UzFbzXf8o9Ek3jdVIvPSScPqMHpi4UvrGenPGpHsRUmEbdOFGQA0fL
	jIYEZfU9L+ZR9oqETmDFV62BbasqeagB7AaHxJxA4qHYiH7mvjrl0AO9zNQSPO3R04n1A0oaj+k
	GZ/TcZbIbDQRthgc62noqK52cmEvUG9DAxSHPmjlDpyXKbe7WKFb3NT75HdIl4BVzKvvm59x/8z
	qk2qdlJyeae3HrYWU9mkPTZmOZg6uEwSNwv2cqJxWtAU3H2N/fuEPlN3CM3oZcplBeel/0vUeMd
	KO7boKitAwVfpc2o/eo3+3Lo44jTyRbqVR1+1skiSd/s6hVMxNUQ=
X-Received: by 2002:a05:6402:51d0:b0:6a9:adea:42e2 with SMTP id
 4fb4d7f45d1cf-6aac90b61ecmr489913a12.39.1790205016790; Wed, 23 Sep 2026
 16:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923090429.2026529-1-stian@itx.no>
In-Reply-To: <20260923090429.2026529-1-stian@itx.no>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 24 Sep 2026 01:10:04 +0200
X-Gm-Features: AclHuK-KybeTuS6nn3jFipLShTCPHEka3TcKpFAC6yT0fDrbo9S-DWDh19_uFiI
Message-ID: <CA+=Fv5QKMaMGaLO3gKymSv7FVhHMMYxM8ux0S5dTKB26nQeAQw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] perf: sparc64 user regs and stack dump, with
 arch hooks
To: Stian Halseth <stian@itx.no>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stian,

On Wed, Sep 23, 2026 at 11:04=E2=80=AFAM Stian Halseth <stian@itx.no> wrote=
:
>
> This adds HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP to sparc64, so
> that perf record --call-graph dwarf and elfutils' eu-stackprof work
> there.
>
> Two things about the user stack dump do not fit in arch code. The
> sampled register window's %l/%i registers, which hold the frame pointer
> and return address the unwinder starts from, stay in the register file
> until a window spills. The kernel already flushes them wherever it
> exposes user stack memory (perf_callchain_user(), ptrace), but the stack
> dump has no arch entry point where that could happen. And a 64-bit
> sparc stack pointer is biased by 2047, so a dump that starts at the
> register value begins 2047 bytes below the frame, and is empty when that
> page has never been touched.
>
> Patch 1 therefore adds two hooks in the style of perf_arch_misc_flags(),
> both no-ops by default. Patch 2 is the sparc64 implementation and their
> user. Patch 3 teaches tools/perf the sparc registers and DWARF unwinding
> from the dump. The matching elfutils changes are attached to the
> tracking issue:
>
>   https://github.com/sparclinux/issues/issues/99
>
> Tested on an UltraSPARC T4-1 on 7.3-rc4: register values check out
> against known contents, --call-graph dwarf unwinds correctly for both
> cycles and cpu-clock, as does eu-stackprof, and perf stat/record/record
> -g are unchanged. Starting the dump at the stack's actual address
> matters in practice: with the dump at the biased register value, 94% of
> the user samples of xz -T4 had an empty stack dump; with this series,
> none do.
>
> Changes since v2:
> - Patch 1: add perf_arch_user_stack_pointer(), so an arch can start the
>   dump at the stack's actual address (sashiko review).
> - Patch 2: drop %g0 from the uapi, as trap entry does not save it; the
>   PC takes its slot, as on mips and loongarch (sashiko review).
> - Patch 2: start the dump at %sp + 2047 for a 64-bit stack (sashiko
>   review).
> - Patch 3: follow both, and comment the max_dwarf_reg adjustment (Ian).
>   Drop the memcpy() change to memory_read(), which the unbiased dump
>   start makes unnecessary.
>
> v2: https://lore.kernel.org/all/20260922201507.1719668-1-stian@itx.no/
> v1: https://lore.kernel.org/all/20260922135653.1622301-1-stian@itx.no/
>
> Stian Halseth (3):
>   perf/core: Let an arch prepare and locate the user stack dump
>   sparc64: Support PERF_SAMPLE_REGS_USER and PERF_SAMPLE_STACK_USER
>   perf tools: Support sparc user register samples and dwarf unwinding
>
>  .../features/perf/perf-regs/arch-support.txt  |  2 +-
>  .../perf/perf-stackdump/arch-support.txt      |  2 +-
>  arch/sparc/Kconfig                            |  2 +
>  arch/sparc/include/asm/perf_event.h           |  5 ++
>  arch/sparc/include/uapi/asm/perf_regs.h       | 34 +++++++++
>  arch/sparc/kernel/Makefile                    |  2 +-
>  arch/sparc/kernel/perf_regs.c                 | 74 +++++++++++++++++++
>  include/linux/perf_event.h                    | 11 +++
>  kernel/events/core.c                          |  2 +
>  kernel/events/internal.h                      |  2 +-
>  tools/arch/sparc/include/uapi/asm/perf_regs.h | 34 +++++++++
>  tools/perf/arch/sparc/include/perf_regs.h     | 18 +++++
>  tools/perf/check-headers.sh                   |  1 +
>  tools/perf/util/dwarf-regs-arch/Build         |  1 +
>  .../util/dwarf-regs-arch/dwarf-regs-sparc.c   | 12 +++
>  tools/perf/util/dwarf-regs.c                  |  4 +
>  tools/perf/util/include/dwarf-regs.h          |  1 +
>  tools/perf/util/perf-regs-arch/Build          |  1 +
>  .../util/perf-regs-arch/perf_regs_sparc.c     | 67 +++++++++++++++++
>  tools/perf/util/perf_regs.c                   | 18 +++++
>  tools/perf/util/perf_regs.h                   |  5 ++
>  tools/perf/util/unwind-libdw.c                | 37 ++++++++++
>  22 files changed, 331 insertions(+), 4 deletions(-)
>  create mode 100644 arch/sparc/include/uapi/asm/perf_regs.h
>  create mode 100644 arch/sparc/kernel/perf_regs.c
>  create mode 100644 tools/arch/sparc/include/uapi/asm/perf_regs.h
>  create mode 100644 tools/perf/arch/sparc/include/perf_regs.h
>  create mode 100644 tools/perf/util/dwarf-regs-arch/dwarf-regs-sparc.c
>  create mode 100644 tools/perf/util/perf-regs-arch/perf_regs_sparc.c
>
> --
> 2.55.0
>

Hi Stian,

I tested v3 on real hardware. I haven't noticed any regressions.
I built tools/perf from this series and tested the new functionality
with software cpu-clock events.

Basic perf stat/record and the existing frame-pointer callchain mode
worked normally.

PERF_SAMPLE_REGS_USER also worked, with perf successfully recording
and decoding the SPARC register set.

I then tested:

  perf record -e '1:0:u' -F 99 --call-graph dwarf,8192 ...

This recorded 443 samples with PERF_SAMPLE_REGS_USER and
PERF_SAMPLE_STACK_USER, using the full 0x7ffff register mask and an
8192-byte stack dump. perf script and perf report were both able to
unwind the resulting callchains, and no samples were reported lost.

I haven't tested 32-bit compat tasks or hardware-cycle sampling.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
