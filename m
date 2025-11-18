Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2402E645
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 01:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427746; cv=none; b=s738ptCGUia4rEm/gJYLVsZL90GOty+7eK0SrYNGphzLfE14fZCKA61fCfWGX1JNKDgnUA4QY5MDq4OaX1m/+TQ0GS19IVvE+UQEEC4VH2OvRz7AanF7cPe+K6ihEUyIPn9rKz+3x/PTQzb1XiUykCADJ3Yd6om1HM1TcDoDKeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427746; c=relaxed/simple;
	bh=dOG/uOFHdQG486MEyE24WfsyUUt88SEMEnTKTvO2jpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFTjdQOB4XvzSu6FEpV1n4q4LBALEsMl+jcqXlmnVUvrKNRvOAVxbCfgro9dOwQpIRMHTz051DlnEqz/6E2/Vb6KSK0XBVHsNd5ZUjdvL32vhxa8cMdDHtK4r17DSFvzJlPNKWD7cy9wQVoun8NiymYCQYcGTJiAOPTFrhtEL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aHMkKCFb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aHMkKCFb"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73b24f1784so155862566b.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 17:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763427743; x=1764032543; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cw+/Wg2GGP58Te+av5x0rFdkRrTQIR2igB2FJ9iW7w=;
        b=aHMkKCFbIjjMsglH4tftvOd1iPI3PetYnhL1SuAd8sysWfon1HYhR4KI1zw4O9y3Lc
         AnN4DmIxV6h3b6B7OocuD4K0PT/T8U8EvrmGE1jqLrdi8NYc+n8yFaCsQ1iwVhK9TOdT
         /tkkcq6uCfE4ygEZG2OTpztsz9G6nywJoNXhmm8h7hGhm5hAFO2xKmfr8SMtpw2UEFDt
         mFYTMsi6qJ/jiCpNnkwpZQAgQIwbg/SR9pwAyLsjgJnoQwjrr9VgLZHBDIKa93vh6oDi
         UnctA1z2ckPDRirbDIJfoJ5Sl2a8Q9oVgH5nE7ssNko1pKDsdciv5P7v7lkhvzDjum9K
         OU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427743; x=1764032543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cw+/Wg2GGP58Te+av5x0rFdkRrTQIR2igB2FJ9iW7w=;
        b=oCw/WuRYbN5cPOmawBZdVHoZ/Pzv6sAAHCTIemsIb+MlDf5gtnrvgChSvl46AdX+Ch
         NR1R2G0YtZFKyQle4EqimWyqegdYNViDWDK6gopZW1zEakJDpBN3NYlszrmVaUqu3asi
         UiYfquFzVK2FmeeJm0/Rqx6Uc1kSC11jCoLkWv24ddXS6oYrGregCguzlW7z4Kfw3EdF
         O8breybASP6LipXJS+Y84ktoYRfEnGTaapdEBbdvPTfwKbfOJAJfZtI86BLI2MPxgzlR
         e1llAAl5F+RnsWaKlQIP+aLXi/g8yvopr5dhLXL0oj8qXfszsPx4fZgTl+3gfjNgAlqh
         t0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVmSSYrsCYMyBidZMlMqhXl0uo6JBxqU1MX1WmZh6OvKJAi+09BtKnKGZlv2O/b65ostQ4W1vyiv4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwqmi9hyTuentPG2wpZSL081QfdSKeSTFQ2XBGsanKTu6v98xH
	FT0HQ/S3V0tEQjE93/X+QgOxb6eEiUvMGST7Je18KebvlfrZ/RFybM5gYo+Lg2CKWIM4W2cCUEq
	eKOoStM/98Q4rAbnRkj0lDBr3dropQIwKSTYaVV65cQ==
X-Gm-Gg: ASbGnctCZsPlABTjXQF5/J0CXap8hTfBdsVSGm6+r8jSizgM5RgzE/D+X6mmn3cUMXw
	1ufUDr7f25ChVREA2w9L5dUxg0E8rbsI9Rp1Wnhn+g/GgRhD/1vCIFS9Qet4bgGyU4/xoBwswuF
	Ccex+WGNND3/lW4Ufl3NVXeJDi8GqF3dFh4suDXZFrxYoAK938kyAAUceQ21Ux0rMKZjSTEpwTY
	jnOk4wbfuIF1Mlr6ZNXMeNgs47HCIGdso0gBQ21LD+WftiH6URtn/9vS/eYPQzkvpJM
X-Google-Smtp-Source: AGHT+IEFucR6Z0lEuhSbJuwGX3vRvxY860i7bZcpqu5KZQIcl4X/kvFT9wlEbXjqZjCXA8pyp+lFBWxPEEnLN4BIodw=
X-Received: by 2002:a17:906:7953:b0:b70:d1ea:2748 with SMTP id
 a640c23a62f3a-b758bb55399mr152503266b.11.1763427743312; Mon, 17 Nov 2025
 17:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-19-pasha.tatashin@soleen.com> <CALzav=edxTsa7uO7XxiUSx+DZiX169T4WL39vYsn3_WcUuVKrg@mail.gmail.com>
 <CALzav=f+6hQ-UYBpwmAyKHPmtvEq-Q=mOL20_rZmAcTyd87+Vg@mail.gmail.com> <CALzav=ekHM8a3yYHHUJNgtYVwLYf1hFhEmrXJjHUXRt=xrSy4A@mail.gmail.com>
In-Reply-To: <CALzav=ekHM8a3yYHHUJNgtYVwLYf1hFhEmrXJjHUXRt=xrSy4A@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 20:01:45 -0500
X-Gm-Features: AWmQ_blONNqJhD4RUEUKi4TjsBuu-Py_fKb6YYrA1AzgX3PH5Kzk_E-GtwNe-iI
Message-ID: <CA+CK2bCfuewEA858nG7WTkBG-hSPpAHP6JRgCRSGmyRTL24oNQ@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] selftests/liveupdate: Add kexec-based selftest
 for session lifecycle
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > TEST_PROGS_O := $(patsubst %, %.o, $(TEST_PROGS))
> >
> > TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBLIVEUPDATE_O))
> > TEST_DEP_FILES += $(patsubst %.o, %.d, $(TEST_PROGS_O))
> > -include $(TEST_DEP_FILES)
> >
> > $(LIBLIVEUPDATE_O): $(OUTPUT)/%.o: %.c
> >         $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
> >
> > $(TEST_PROGS): %: %.o $(LIBLIVEUPDATE_O)
> >         $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $<
> > $(LIBLIVEUPDATE_O) $(LDLIBS) -o $@
> >
> > EXTRA_CLEAN += $(LIBLIVEUPDATE_O)
> > EXTRA_CLEAN += $(TEST_PROGS_O)
> > EXTRA_CLEAN += $(TEST_DEP_FILES)

Took your suggestion, thank you!
