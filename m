Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6A15532A
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732118135; cv=none; b=ICJtQDmz3NF4x6E0cUFzbopOXNQJeMd2ofdQIeWpvMfwt2qCtc0YnXYUjEnjV44ug6pppxR9oWxuPLpkiHpT49sww8exW+NwgvwS42G6mIXw8YDbP0hUVucdcewBhlBF0tzTF3KRADWY0qxsLUgCvrvNs/sLxZ6F7vnj88EOCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732118135; c=relaxed/simple;
	bh=o12naNEEgy+7IeIJiiwpJEVYD7aXgR8I+A6HiRFr+0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vkn3VtsDC8wk2PNSXXuBHMGQdiTr4GehdxUl+Vc6QodZ34o3LuJqjCZJAVZoiMZvJRzFDTWY2j1puBtb96Bd1S/XlytSMy4m5G2KJ4DmS89yTwxlmacruXsb+HSzNoSoEk7TsOFvzQqvPUeIMfAeghwNi1FOYGUHQ2boS/m5Ha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWG+flv0; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWG+flv0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e617ef81so17268e87.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 07:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732118132; x=1732722932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZ/7okpvF8kJm+od0U53QPJgTd3pjujVw1MRvI0jek=;
        b=FWG+flv0a8GQq1flHE6xC/dqGl6J8f/axEDWZT+W9/JsqjmA/1tBsfP5DRIHYiWJT1
         LzmE46wI2+V5I9OxkABttta2OFdJdlLSjJ20bfrFojzXgrjvrDLBxwcdqbOPkCOSJsGL
         SqzSaQCdAlRWXvWP+zEn3BH/GkFQC8BJ78wg4LIcGiukO9DOPzMtWpn2HDjmvYChbBte
         Y7E2n6TX8c5HfrvdClHe3LkGyphWDP0rJuV+FEAb9mUwglNrX/p84PJoYoGqbGtLR2tV
         ncmzeJwTKraXVVF2UUZT8NlC9BQCC2IwwyFfu9xeI/o76SqFwulGNzYPLoQIqCUKKLZW
         D+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732118132; x=1732722932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HZ/7okpvF8kJm+od0U53QPJgTd3pjujVw1MRvI0jek=;
        b=NuQ69Yp2GbzgNfFghLGATdF5siRMREKtPKM3UZjuts19KKMlxaCYm8xyxxyO/7vC0G
         JdUbKEIKZhNrpf/txORWk0DTM/BLbqJCt4KVNrAJ1jdYDGNsbpz1v6OkBcpDO0vZUh7z
         19MKnbuys6/U/sLf+Gwp3PB1yp/6qU6pC5+MCoXh6/qfwvpYMisk35ils5BwVvjh2kxD
         znVu/yYaIBgBW8H7FCF/oWQuzXreIKmj2snRsqzHBG1s2Xfl5sdErAQi4lEBI6lQ55Io
         4c5KimuJ4jTAqjJOXCZm1n1Q1TQtKbDJHvTrHufa5SDKDBiZ6UtjOxtjGH1wwZcdtniN
         fYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzEV+MqQC1ZwJ7yBCzfaC2GWSSXJU0pIkJD5fPWgZZ4jhgIy6jUME2RpwWM+fMhtmVSMEQXf01HHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9e9N9yKzsndvyGWPPEkBC7RIu6y3fqhCCjbNmEh7zuJhFCiDw
	wL8H+PTgoh8XOyK/qazQ8lRRyK8+bp1mX/KIX8jqR+UxFo/4AIJbyn/yTO7B0w1LZwlBfS07Kll
	ROL6aPSzjgIAH1l7Lj4iJtJT5MEvv8uUUUxOw
X-Gm-Gg: ASbGncu3NMGRKDgdOk1i1hPQ0uSxqV1mKu26qtrpwoXKmiEE/8Bx+pH825ov4ejV1N+
	WIrcH1/BOQh/LcuH+nCdOBJwM8IRKbHEx34z/mNm17e/7dg9p4UkldymVKgop4g==
X-Google-Smtp-Source: AGHT+IEc30uHJ15peKbExAOlopJi9zOAJvjK/e1IPVFyzeYPJXr6/KY0udRIEGSXxmCwxAdPwiPJWLAerB5KhSDy6PU=
X-Received: by 2002:a05:6512:2089:b0:52e:934c:1cc0 with SMTP id
 2adb3069b0e04-53dc2766aeemr158817e87.7.1732118131804; Wed, 20 Nov 2024
 07:55:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <CAF1bQ=SwtGDpOJeQwhbnO6Md=kFbcmkM4iVgXUgjzNXu+d8cEA@mail.gmail.com>
 <CALJ9ZPMNrZW0TYxEVRMJo2FkvOfmGxSODwsV9cA1jUZUz-Q2aw@mail.gmail.com>
In-Reply-To: <CALJ9ZPMNrZW0TYxEVRMJo2FkvOfmGxSODwsV9cA1jUZUz-Q2aw@mail.gmail.com>
From: George Burgess <gbiv@google.com>
Date: Wed, 20 Nov 2024 08:54:54 -0700
Message-ID: <CA+rzOE=r-kCMPytBVFzU9f5FUdA7BRn35fTL6SZXbo6p9cBLGA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Yabin Cui <yabinc@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We've used ETM in ChromeOS for a while now. Hardware
requirements make it unfortunately less ubiquitous than LBR, but:
- we first launched it on 5.15,
- it's still humming along nicely today on 6.6, so:

Tested-by: George Burgess IV <gbiv@google.com>

IIRC, with a baseline of "using x86_64 AFDO profiles on ARM kernels,"
we saw a perf win on the order of a few (3? 4?) percentage points when
we made the switch.

On Tue, Nov 19, 2024 at 5:04=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> Add George from ChromeOS.
>
> On Mon, Nov 18, 2024 at 3:49=E2=80=AFPM Rong Xu <xur@google.com> wrote:
> >
> > This patch looks good to me.
> >
> > I assume the profile format change in the Android doc will be submitted=
 soon.
> > Since "extbinary" is a superset of "binary", using the "extbinary"
> > format profile
> > in Android shouldn't cause any compatibility issues.
> >
> > Reviewed-by: Rong Xu <xur.google.com>
> >
> > -Rong
> >
> > On Mon, Nov 18, 2024 at 2:25=E2=80=AFPM Yabin Cui <yabinc@google.com> w=
rote:
> > >
> > > Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
> > > selected.
> > >
> > > On ARM64, ETM traces can be recorded and converted to AutoFDO profile=
s.
> > > Experiments on Android show 4% improvement in cold app startup time
> > > and 13% improvement in binder benchmarks.
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > ---
> > >
> > > Change-Logs in V2:
> > >
> > > 1. Use "For ARM platforms with ETM trace" in autofdo.rst.
> > > 2. Create an issue and a change to use extbinary format in instructio=
ns:
> > >    https://github.com/Linaro/OpenCSD/issues/65
> > >    https://android-review.googlesource.com/c/platform/system/extras/+=
/3362107
> > >
> > >  Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
> > >  arch/arm64/Kconfig                  |  1 +
> > >  2 files changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-=
tools/autofdo.rst
> > > index 1f0a451e9ccd..a890e84a2fdd 100644
> > > --- a/Documentation/dev-tools/autofdo.rst
> > > +++ b/Documentation/dev-tools/autofdo.rst
> > > @@ -55,7 +55,7 @@ process consists of the following steps:
> > >     workload to gather execution frequency data. This data is
> > >     collected using hardware sampling, via perf. AutoFDO is most
> > >     effective on platforms supporting advanced PMU features like
> > > -   LBR on Intel machines.
> > > +   LBR on Intel machines, ETM traces on ARM machines.
> > >
> > >  #. AutoFDO profile generation: Perf output file is converted to
> > >     the AutoFDO profile via offline tools.
> > > @@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
> > >
> > >        $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k=
 -a -N -b -c <count> -o <perf_file> -- <loadtest>
> > >
> > > +   - For ARM platforms with ETM trace:
> > > +
> > > +     Follow the instructions in the `Linaro OpenCSD document
> > > +     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/aut=
o-fdo/autofdo.md`_
> > > +     to record ETM traces for AutoFDO::
> > > +
> > > +      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <=
loadtest>

FWIW, CrOS spells the event 'cs_etm/autofdo/u'.

I'm not familiar enough with perf event syntax (or downstream patches
that CrOS has to its kernel) to say whether that should motivate a
change here. Happy to find out more if there's interest.









> > > +      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=3Di50=
0009il
> > > +
> > > +     For ARM platforms running Android, follow the instructions in t=
he
> > > +     `Android simpleperf document
> > > +     <https://android.googlesource.com/platform/system/extras/+/main=
/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
> > > +     to record ETM traces for AutoFDO::
> > > +
> > > +      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest=
>
> > > +
> > >  4) (Optional) Download the raw perf file to the host machine.
> > >
> > >  5) To generate an AutoFDO profile, two offline tools are available:
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index fd9df6dcc593..c3814df5e391 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -103,6 +103,7 @@ config ARM64
> > >         select ARCH_SUPPORTS_PER_VMA_LOCK
> > >         select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > >         select ARCH_SUPPORTS_RT
> > > +       select ARCH_SUPPORTS_AUTOFDO_CLANG
> > >         select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > >         select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > >         select ARCH_WANT_DEFAULT_BPF_JIT
> > > --
> > > 2.47.0.338.g60cca15819-goog
> > >
