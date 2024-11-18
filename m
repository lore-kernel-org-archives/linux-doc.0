Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7455313DBBE
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731973791; cv=none; b=MVz/BQi7TcnnBKp76qCNemMrBX6nzgPIHHePXsn2CJ1HCMAvpBUlNaR4SRxiAYe5E3TeG3meBq8NsFGe+LShEq5qh9ED6Prw9P5EYy5gmf53BO/e95aMD0rKextMYh9EeVVya9zGnJbYdAgiRNDMzY6i9l7sIRVaROe/bTKgnNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731973791; c=relaxed/simple;
	bh=5KhDUPPzU93GbFnSsCpuzV6Iz+SPNky6RTbpDz23aII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNzonBrnO4DyoPmC0JuJypAbq4J9FP+B2rz4A+72JUiwESeov0UTb6zlLHceXTzBh51fOx+CoF+Y1N/g8kuUYshW2aPACIQdGg4iqDCbE7UvGW4firltuxis6FUmqrEKemSuqOFVzj8quKtkyMk4GwoVYmxxdsN5SVJQjSMjsQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOfPtLdL; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOfPtLdL"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4608dddaa35so128251cf.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731973787; x=1732578587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK6bzE8aI/V2pC6nlWjgg4fvEcS2VY0hiKfSVmi168k=;
        b=NOfPtLdL/BaN6W7Z3TmBfuuHoIgeEsK1ByyQWo1odZjjk+vESJarwAWezxkNua8xlZ
         5YRZyYF7eKGMUCh0/6pAIbpEIIBs4uEgii460SAxYkm7t505SIJN1VXhTydrSBZT2D3i
         le7O+yV/kF5GPzYgesA8/Jq++nKcZQnkVXlq5UjSTF5rn/m6fWz/IH0hnz+AGcm0yFzO
         smFSRPhd26MxpE8DVSq8pyqPAgSIG6CpGCFhlzkpLz9QHhv/lo79l0KCydTHm/NRg3F9
         mtCXTvQmqTqSPAQtIIsMuAvwJQrqLJ9zOkcUQY8xG2BwN0axAp4EGzZxZFCGvAG6oGwA
         deuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731973787; x=1732578587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lK6bzE8aI/V2pC6nlWjgg4fvEcS2VY0hiKfSVmi168k=;
        b=iYHmiUXaKOPxecN++IuoNX7fOXmtCDb6e07du0EzcRj5XyHrxuMIbw3jOnDxatnOvl
         rG4/90YxqnBSqVR5nFzbPfk3z1mpqnRd5T6wICkVBifyS+DAvnk7IoFrJWH+fILkSn6Q
         WWxky5diU+j5mLcPVDMBGvRIbZoeS2an0Bddbxe11XP6S/8gl5c+E8PZdnqmwrA3Vt5U
         W8KDCb4kVNR9iFoqAg1y8u4wpFz1Zu2A+tcKE/9TOnBg3KtCA8jImQVLANlohj1yAkzo
         v605XgdqxuE0rFGZhsmmOqJcNIM9ryhUoNJce5U3nP3gwiOSo4G+UUf8xBh/Lf3r4PFb
         4cVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrbNZWq7MP0/Nev/y7TmKbRGtAyXItfTh0UNqVwacy3jBUmKi4PvAVo9WIxQePes1UQRWo1CkA3iE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJbSBODxTeFo9AVhyi3kbv9cJ7hxGc+HpNSxVfHFxTCbhKeeG
	Cyz0sjtplOVLstBrphSuYfGTiE0UvigNuRS9v6sVLXEEK/p/KqtQT/zCTnvlmBuvWfDzyraQwxM
	JPqupDTcXB7F2cUXYHUD5tsmoZDcwhkpFnOUr
X-Gm-Gg: ASbGncsLczfyvg8GzFaL3eoHGNUus7GfBFEXTRjZpFvXiVljuhY5drRBsiPN47FBHq/
	IVEIhfMOf/rIyNTN5yW8J27TZFLGpe8c1WFxuAzswbnoDw30nmay7gicssD7jxg==
X-Google-Smtp-Source: AGHT+IFZwt76OGyj44JQnW6JI/5s2J93C6DIK6J7wzakmW8yqQSea3vMGSHEwAzZUnUOrt5xqan1wN37RWPJqIC6h2Q=
X-Received: by 2002:ac8:59d0:0:b0:460:463d:78dd with SMTP id
 d75a77b69052e-463937a8f55mr1170181cf.4.1731973787136; Mon, 18 Nov 2024
 15:49:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com>
In-Reply-To: <20241118222540.27495-1-yabinc@google.com>
From: Rong Xu <xur@google.com>
Date: Mon, 18 Nov 2024 15:49:35 -0800
Message-ID: <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Yabin Cui <yabinc@google.com>
Cc: Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch looks good to me.

I assume the profile format change in the Android doc will be submitted soo=
n.
Since "extbinary" is a superset of "binary", using the "extbinary"
format profile
in Android shouldn't cause any compatibility issues.

Reviewed-by: Rong Xu <xur.google.com>

-Rong

On Mon, Nov 18, 2024 at 2:25=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> selected.
>
> On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> Experiments on Android show 4% improvement in cold app startup time
> and 13% improvement in binder benchmarks.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>
> Change-Logs in V2:
>
> 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> 2. Create an issue and a change to use extbinary format in instructions:
>    https://github.com/Linaro/OpenCSD/issues/65
>    https://android-review.googlesource.com/c/platform/system/extras/+/336=
2107
>
>  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
>  arch/arm64/Kconfig                  |  1 +
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tool=
s/autofdo.rst
> index 1f0a451e9ccd..a890e84a2fdd 100644
> --- a/Documentation/dev-tools/autofdo.rst
> +++ b/Documentation/dev-tools/autofdo.rst
> @@ -55,7 +55,7 @@ process consists of the following steps:
>     workload to gather execution frequency data. This data is
>     collected using hardware sampling, via perf. AutoFDO is most
>     effective on platforms supporting advanced PMU features like
> -   LBR on Intel machines.
> +   LBR on Intel machines, ETM traces on ARM machines.
>
>  #. AutoFDO profile generation: Perf output file is converted to
>     the AutoFDO profile via offline tools.
> @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
>
>        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a =
-N -b -c <count> -o <perf_file> -- <loadtest>
>
> +   - For ARM platforms with ETM trace:
> +
> +     Follow the instructions in the `Linaro OpenCSD document
> +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fd=
o/autofdo.md`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <load=
test>
> +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di500009=
il
> +
> +     For ARM platforms running Android, follow the instructions in the
> +     `Android simpleperf document
> +     <https://android.googlesource.com/platform/system/extras/+/main/sim=
pleperf/doc/collect_etm_data_for_autofdo.md>`_
> +     to record ETM traces for AutoFDO::
> +
> +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> +
>  4) (Optional) Download the raw perf file to the host machine.
>
>  5) To generate an AutoFDO profile, two offline tools are available:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fd9df6dcc593..c3814df5e391 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -103,6 +103,7 @@ config ARM64
>         select ARCH_SUPPORTS_PER_VMA_LOCK
>         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>         select ARCH_SUPPORTS_RT
> +       select ARCH_SUPPORTS_AUTOFDO_CLANG
>         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>         select ARCH_WANT_DEFAULT_BPF_JIT
> --
> 2.47.0.338.g60cca15819-goog
>
