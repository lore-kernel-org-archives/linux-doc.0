Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1D72F6931
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249720; cv=pass; b=Olrb1OuZLhd9RuMr4EI/2RGQ68CN0alhBRNIPBHj+dXiReDKjj7lFb6qVNvRrah+J0Uw6PF7CcQbpJSLe9dQfKt86/i+qCkWcUoMy2lft02mcvJj5/GUUWSyRt/+VWDTN1fmY5K1cUaIcUI+dF8z+LIBGYZdM/b7++KJRtWulGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249720; c=relaxed/simple;
	bh=p6q8LWPMVa2osOVn3baZs5YxnHGVEKp86xJ2gk1+YxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qITSVht0Ltgciu9wkeklfqVgbx7IX18zhs/3xiFO0fFb0Cby0UUXCaNc9O5CqJBCfTPjIN0BlqOe8nLOrtB8jdWx2/O7023mvDsfwqzRTi/R7YveiCvECEOdxKvsmEq1/wKe5rIHYG5VDahdzjsD+2+VYmSK8mHlpuTycyeWrF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4dXThBe; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4dXThBe"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7e0b3db3499so5158027b3.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 00:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249717; cv=none;
        d=google.com; s=arc-20240605;
        b=YSKea5pL7QfNd9/cFODZepxGErRIau+0DKyh6uraeXXDKGpB5hr9cD7l5Uu11WXqNR
         PTx14+UKWxzpxsDgHvYxeLTKAhRfKz6klt4meLKcEWlAoGTkVzA4nkpBGbDlJVC2UNKC
         Qfvot8Iwb4X+eveRvqJTBuH4holToO36bY7yIhR3+Rv9tN1/gRbbJ5tTd+OdKAu+aFwu
         9Iz1A1cs7AXUHIXwhglshCZoGLVd9rXSjpA8SpFBSI27U5S0Lp0FQue/tRamN4iaublh
         43q9HxpHqEB3CH0iKA7Dpt80rqmDvU8rELn0al99qnR0K/il1DwKXWxBHqs9tt3pkN13
         h3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        fh=ujUlo7GH5Mr6709KixhfrufLT5eqDl4mbvAuQrcUTWk=;
        b=H7c2ndC33w18r5boXweKXmCxGqCLSNqS5PSDLjucS/L0RdC1JxUgqtqkYoWYdO32NY
         Ks1wm6j2GMT3vrnF+HNJ2f1jaGtQFsd7dZLoXJLGrMKYFMVhQq6oZP96fmnRXLqEe9Uz
         2o29mPEZPfoT2VBXzkR5dbN+sY6N0U5DRdhR90rWifR7atslUY3QM8+urwCERY5MnlwC
         nOMwEQjXSvinvghbYye0+mVjsb0SDC3ezKJQ8HN53kV0E+W9qNqp6xyqNwR+HHI90duL
         vQjQVbc2tzBPUTrsFQJMDfFz6zUS57mHBmDpuvAxR4EazXRomL12cTfg6hyM1Pdm6BLg
         IPkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249717; x=1781854517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=J4dXThBefC/uv2x81IA7NSuEoWoexazimn8V8DKAXljYkmsI7laNV1zY/Dy0fUxMwi
         EpMDSRwzhCk7HuyVirTGkvjYmqkTO6VhWfVz8ybPjAPhIwsY0PW9VlcBxZzBg17hiUzT
         LJrOnRk++eHkpd+cqkT90bqerl9yX8cc5AYhu69Rcb0sKW7ALA2zafe8fyarShtqsnHE
         jeiQQ/AKg5tPx8+Km/itxnPkgyx6eiKY+AM40UYt/At1csgeOJ78QPt+sXWsWuhFP8sv
         dIUGuFqLLWUFGQ/HavxSmB7IPH0Up19eje2bFm4nUgecG2bO/dhrdAMobt6x5HYpecuZ
         uF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249717; x=1781854517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=s4vQ4NRAMOMKwoFYBYI2HphbqP2cxBF2rEZRrrh6+xYUW4wl0vrr2FXoqlqr7S9MW/
         iLiBhGdcefoRVsmrj1NzmJwx+8BArmgNcF8aX2/SCEN138mYZZCXqVE6cZWoiqApxoKy
         WyKbWYcVaqMYaoU1lDqIl6qsy4WcImOtBcQ8PjGPSlfQke5eYkPjREz4pYgAuY6cFpoM
         5m7ew4mB7NPL9eMRUQXhJl8t2i7j1r6IZ67rMLPR4XIg6XhLYKAbIfextKHpCjdkXcp1
         9d345kqSO6t7aLceju4cl8hpUI6J54Z0pssZyRFN1e2SFUdpcGDqejTveNB8FJMUOpNA
         5V7g==
X-Forwarded-Encrypted: i=1; AFNElJ/4Lr3Csw7Xm6DR/l0d4wKOIwPDilTyJlQf6g9b+zhaaSajJugh1zTN0B+KeP+3H32PgIbLIb9z4wM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya+l9nCuTV+JVu0Wymv2cyotv0RtEIKsqmFQ58UMtg/DbaUmuX
	/KcQojXtccXHkqt8jnStqQLZkWEMNHn/tuFYCHSA2pAAexaf0o5h9womSCpRY5/VE/wHmnlgvK9
	UJaNGczuWTspwqmWCVxlVz/+FlHVG0R44Dats1cy9
X-Gm-Gg: Acq92OEOE88r17L5vMowPDmoUFPn9S+iVKg4G5RhL56tV4LSlOFGdQbmzlp8kYaICR9
	h2zloh2GpFprfBsnKAyT6wd9bZTDg1dbVRGWCwotZW5fq5idY/Xj2HvuK4rwDJliiBz+sxpVT4J
	OTXdmEXOR2zMl2ukExQHwZzLfyS97qEp7OJIx2QqIet2+IL/as4wd5SnmHEIqIF9M/V/AZgKBRb
	QP4QVfD9EG2st1hy5Up24duTrEBnK9BQvhZcvLnS+kJRWDs8JjPnA7Ryc7yaH1vyqJ2SsFXrw54
	WbrWUla6eeq7LXILTSNArNqTlzLeBRcxGio09g==
X-Received: by 2002:a05:690c:4b0f:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7f7b9020616mr15009847b3.40.1781249716383; Fri, 12 Jun 2026
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:34:31 +0200
X-Gm-Features: AVVi8Cfm4phss8ao3422B1w1tp_vYDP5PJUsvm_ZDGjV7MhrtYD94WvUDwrEe3M
Message-ID: <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Add a new tracking mechanism that captures function arguments/return
> values at instrumented function boundaries via submitted as an LLVM
> RFC SanitizerCoverage callbacks:
>
>   __sanitizer_cov_trace_args
>   __sanitizer_cov_trace_ret
>
> This requires a custom LLVM/Clang build with the trace-args/ret passes:
>
> LLVM RFC:
>
>   https://discourse.llvm.org/t/rfc-sanitizercoverage-add-fsanitize-covera=
ge-trace-args-trace-ret/91026
>
> LLVM PR:
>
>   https://github.com/llvm/llvm-project/pull/201410
>
> Clone and build toolchain:
>
>   git clone --recursive --depth 1 --shallow-submodules \
>     --jobs `nproc` https://github.com/yskzalloc/kcov-dataflow.git
>   cd kcov-dataflow
>
>   cd llvm-project
>   cmake -S llvm -B build -G Ninja \
>     -DCMAKE_BUILD_TYPE=3DRelease \
>     -DCMAKE_C_COMPILER=3Dclang \
>     -DCMAKE_CXX_COMPILER=3Dclang++ \
>     -DLLVM_ENABLE_LLD=3DON \
>     -DLLVM_ENABLE_PROJECTS=3D"clang;lld" \
>     -DLLVM_TARGETS_TO_BUILD=3D"X86;AArch64"
>   ninja -C build
>   cd ..
>
> Build and boot kernel (using virtme-ng):
>
>   export PATH=3D$PWD/llvm-project/build/bin:$PATH
>   cd linux
>   vng --build \
>     --configitem CONFIG_KCOV=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_ARGS=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_RET=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=3Dy \
>     --configitem CONFIG_DEBUG_INFO=3Dy \
>     --configitem CONFIG_RUST=3Dy # for rust module kselftest
>     LLVM=3D1 CC=3Dclang
>
> Core implementation in kernel/kcov_dataflow.c (separating from kcov.c
> as Alexander's request):
>   - Per-task lock-free ring buffer via debugfs kcov_dataflow device
>   - READ_ONCE/WRITE_ONCE atomic pattern (tested on arm64)
>   - copy_from_kernel_nofault() for safe struct field reads
>   - in_task() guard rejects interrupt context
>   - Bit-31 recursion guard prevents INSTRUMENT_ALL re-entry
>
> Build system (scripts/Makefile.kcov, scripts/Makefile.lib):
>   - CFLAGS_KCOV_DATAFLOW: -fsanitize-coverage=3Dtrace-args,trace-ret
>   - RUSTFLAGS_KCOV_DATAFLOW: -Cllvm-args=3D-sanitizer-coverage-trace-args=
/ret
>   - Per-file opt-in: KCOV_DATAFLOW_file.o :=3D y
>   - Respects KCOV_INSTRUMENT :=3D n for noinstr exclusion
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for whole-kernel
>
> Kconfig (lib/Kconfig.debug):
>   - CONFIG_KCOV_DATAFLOW_ARGS / CONFIG_KCOV_DATAFLOW_RET
>   - Depends on CONFIG_KCOV and CONFIG_DEBUG_INFO
>   - CONFIG_KCOV_DATAFLOW_NO_INLINE (default n)
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
>
> Also fix rust/kernel/str.rs unused import (flags::* -> flags::GFP_KERNEL)
> which newer rustc (1.98-nightly) rejects as a hard error.
>
> Rust support requires rustc built against the custom LLVM with
> trace-args/ret passes compiled in:
>
>   https://github.com/yskzalloc/rust
>
> Link: https://github.com/yskzalloc/kcov-dataflow/
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h  |  10 ++
>  kernel/Makefile        |   3 +
>  kernel/kcov.c          |   2 +
>  kernel/kcov_dataflow.c | 324 +++++++++++++++++++++++++++++++++++++++++++=
++++++

I think the total size of kcov_dataflow.c doesn't justify splitting it
in multiple patches.
