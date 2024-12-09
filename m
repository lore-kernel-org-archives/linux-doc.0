Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CE6156F39
	for <linux-doc@vger.kernel.org>; Mon,  9 Dec 2024 17:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733765466; cv=none; b=l8J4318kXFsMMQiN6YpG9YrZN7aP25IKkgJdE7XRTmnxSy0MxIv3HWqSfr4WM93kVzZrsbiAE1HQrN8HUvER2FzeY2XKlkVN9+Zu9GbSbmiddl1W1RIMV9HvS6rIvfOKZCr+0+W2o0eM5S4Ky+8as4O+W3Fj3+VmyxInBfdzQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733765466; c=relaxed/simple;
	bh=1N03fZo15QnE9uhRk0TSeGGXQ8CxQhWF/jiW+CHAgf8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxu8glbp04oVfjlIXPRMqEfHxwT7mmvjrlqYhMzXKEs2aVSkEIFEXpigv0dwSlHw+e8NlER+OIXUMGGrlM2f8oBIRO3UBjK6uKwvz54idEZER78TeUnEvx/WvUjmz2ScWvSoAalgACmrkVUAgt+Ec2kNpuh78iORXhLeGiYmROw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IW84NrgF; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IW84NrgF"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4674a47b7e4so652571cf.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733765462; x=1734370262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdIPjvnlF3Mwo/6XEjqWYb6FpbfvUDeAQpVQ0puOXiE=;
        b=IW84NrgFlZjLoSJuhPwt6hwcExCTy8+vhPaVDfL5tgqou/1S9cTWT2WWvFb28xB6IJ
         /8YG+NCU1XsV42IyNJwesgPunjkoLn5lCftvj6+Of4v0kpHo5GxLF+lNVg3GObf4/cqf
         6eQ6GFtIDy7pv285PoNmrECqDVaCGq/ID2Y/Z6SafJ1awTAMZiDHeGfJhoEj+2JK4tzw
         VCpQ4/qcLIatiEcQT0uReqRs6F4GQs68kAqZ3BRbYKGU8JRXcbM1g20tgAyEluK/C1a+
         WYQE8KK44ZpY9DMABNDTlYenZIhaBXXa3CJEdwpAeWbQmzwgNeKeTeRgL5BVHdgfaZ10
         EbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733765462; x=1734370262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdIPjvnlF3Mwo/6XEjqWYb6FpbfvUDeAQpVQ0puOXiE=;
        b=YXwgqK3XAjCq7InN0aa/Ap8GZhwtMCws3Aie6DP/7bvMTethT816/8UXN1JRWoTR0/
         l2U5AD0UYlfLgumRHS6oGtZrJ8huVjJqUpYd+lZCBEqH6Iqo0qtjeTvUMY6cJu0FU2Nz
         7FDxYn0eR8l/BKm6aUtR1cRPUjzKL9qZQDXBcL1QEal9lPWIeGAFQYURI3qtscYDnTqf
         hkMAmqqJ27JwtOWhV2IqLtUliYexTNsu1N552GF4ZdYXkNr3AuD6TSIY8REEllqFFOjI
         xxVmGSxNPVW4M8Vl5pk0yknVxUeojfSFGSo9dcF56eD5Hvq00JjKUnDrGS8LXbxsbayU
         GS7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwGGDsATLCtS/ZGlLxuuEll4Qa5SSwkcAonyfsCEib2yjgVRK1vEE+PWjVjqPVay70zyUl5F+DHkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYxEcm8YmecoLErkOc89P9iVQEQdxCRHflMBYdjslJ2cAyV37
	SS4Iw3E4wISP0LP7mvG7D7fp8HAaOj9NEg8/wvgCoDEN8STF9fZjvqI/jspaxT6/kUHdhfO38Os
	wSpnsOd3J4y95gzGLH65xAzhiUStGvaRlt+Ar
X-Gm-Gg: ASbGnctPAJUd1xPLXQdOmbjW5djZsp7t40FEXBM6AqytHJCcOGjiY5WznjZ2+kIS/D7
	+K27UBsv6DO6ZPQRLKvyu6J66nvPJnUmpf0wTJwJGlu+ErQ30YwxPBu1yYMby
X-Google-Smtp-Source: AGHT+IF5ueLy5f8bNH9OGIJWA3/VyL6MS9Y/vEuMpZ/PyvK3bYq6fAc9vv+YnYvtEhUGWeXouk6ewOJKmK8R1HNS3J0=
X-Received: by 2002:a05:622a:2594:b0:462:b2f5:b24c with SMTP id
 d75a77b69052e-4674c9dbadamr7726181cf.29.1733765461817; Mon, 09 Dec 2024
 09:31:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <20241209162028.GD12428@willie-the-truck>
In-Reply-To: <20241209162028.GD12428@willie-the-truck>
From: Rong Xu <xur@google.com>
Date: Mon, 9 Dec 2024 09:30:50 -0800
Message-ID: <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Will Deacon <will@kernel.org>
Cc: Yabin Cui <yabinc@google.com>, Han Shen <shenhan@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOFDO_C=
LANG.
The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
support for Clang build).

The CONFIG_AUTOFDO_CLANG config, even if selected by the user, will
not be enabled
unless ARCH_SUPPORTS_AUTOFDO_CLANG is present.

We are not enabling this for all architectures because AutoFDO's optimized =
build
relies on Last Branch Records (LBR) which aren't available on all architect=
ures.

-Rong


On Mon, Dec 9, 2024 at 8:20=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> > selected.
> >
> > On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
> > Experiments on Android show 4% improvement in cold app startup time
> > and 13% improvement in binder benchmarks.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >
> > Change-Logs in V2:
> >
> > 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> > 2. Create an issue and a change to use extbinary format in instructions=
:
> >    https://github.com/Linaro/OpenCSD/issues/65
> >    https://android-review.googlesource.com/c/platform/system/extras/+/3=
362107
> >
> >  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
> >  arch/arm64/Kconfig                  |  1 +
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-to=
ols/autofdo.rst
> > index 1f0a451e9ccd..a890e84a2fdd 100644
> > --- a/Documentation/dev-tools/autofdo.rst
> > +++ b/Documentation/dev-tools/autofdo.rst
> > @@ -55,7 +55,7 @@ process consists of the following steps:
> >     workload to gather execution frequency data. This data is
> >     collected using hardware sampling, via perf. AutoFDO is most
> >     effective on platforms supporting advanced PMU features like
> > -   LBR on Intel machines.
> > +   LBR on Intel machines, ETM traces on ARM machines.
> >
> >  #. AutoFDO profile generation: Perf output file is converted to
> >     the AutoFDO profile via offline tools.
> > @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
> >
> >        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -=
a -N -b -c <count> -o <perf_file> -- <loadtest>
> >
> > +   - For ARM platforms with ETM trace:
> > +
> > +     Follow the instructions in the `Linaro OpenCSD document
> > +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-=
fdo/autofdo.md`_
> > +     to record ETM traces for AutoFDO::
> > +
> > +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <lo=
adtest>
> > +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di5000=
09il
> > +
> > +     For ARM platforms running Android, follow the instructions in the
> > +     `Android simpleperf document
> > +     <https://android.googlesource.com/platform/system/extras/+/main/s=
impleperf/doc/collect_etm_data_for_autofdo.md>`_
> > +     to record ETM traces for AutoFDO::
> > +
> > +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
> > +
> >  4) (Optional) Download the raw perf file to the host machine.
> >
> >  5) To generate an AutoFDO profile, two offline tools are available:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index fd9df6dcc593..c3814df5e391 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -103,6 +103,7 @@ config ARM64
> >       select ARCH_SUPPORTS_PER_VMA_LOCK
> >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> >       select ARCH_SUPPORTS_RT
> > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >       select ARCH_WANT_DEFAULT_BPF_JIT
>
> After this change, both arm64 and x86 select this option unconditionally
> and with no apparent support code being added. So what is actually
> required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> it just available for all architectures instead?
>
> Will
