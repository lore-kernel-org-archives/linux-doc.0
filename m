Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68585368262
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480837; cv=none; b=m4kw/nNJDA8e6Y1w6i6SEPW4uzFi6oejH1lj03cFYH0MiZ2SadAQ1uGrRaT4xgUmEnEFlR0F5Hkw5ISZsIfbsbUDhI8tFf5jLeGuaWHY1M7mBKtw1Nqc5rtGw5uN/7xhPvehn9ZnfXgrxE1XriPzEKG7r2+ey/2Kl6gRcdO06+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480837; c=relaxed/simple;
	bh=ZSit9q9L9b/5E+Zs8jJoiIuLjTbwdZ6FtiEGsvw8Sos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+PLorr+xASDrsnVPsOV1MipU72mlsMSzZR7rbJCsfDuHCTFAlnTMFh6KP+OImzFTguvwnQETrX+zOaNfuIu02ebXNfYYetVxEWpF6SYbSeDNPhc73YEfJV87HtHWFHSY+qR7482KXtFlvwY+ZM1eTh97bK3q33yBXU0rYRas60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eun+AmGv; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eun+AmGv"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so9886149a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763480834; x=1764085634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSit9q9L9b/5E+Zs8jJoiIuLjTbwdZ6FtiEGsvw8Sos=;
        b=eun+AmGvOpw0aPHJ92dR3mvU7aBmEP1wL43TgLu/vJ1c91YXgrGUwQNhAbTxMGYrIU
         BQfDaJ6Qfgiku7q2IvVqY1SzzcDfxX/ctIJxQCh5bCpM3PSTS29VUH1g3FxBbY6XHY5L
         vp4IaLmVXMcY6l21VxJAElhStIM6L7BDdn3AeKOHODp7BqIsmsXalgNr5NK9A+gt0HKa
         33PdHuCoje+K7nEd+z6SVFQp6uAWdLPsD2Ev713tUZ0SxWVYRRjNufOFW/IlgvvYfWZe
         Dre3ljKZ4RlxizZRkxjDoeYPeO/IgVwLGHqcpFBnbOzNWO325A0GC/x9z701cr+O9RGT
         ULgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480834; x=1764085634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSit9q9L9b/5E+Zs8jJoiIuLjTbwdZ6FtiEGsvw8Sos=;
        b=TTTvAN+jCtlhQStw0MAQE8yLlrOfBjpPJI4V1ZDVEHF8quv6BnoMBEJzN2YlXmPLtp
         A7tLvSDwm7SlPB5rOFXra5mVp87O3IoBT9KBoZGHkH6ndOyZ/vvPcdM/AWJ2N99iPw2s
         QwNVKmpBYDWWvmTfvzSRKib31BQ9nSCPCuqCvI2EQqQK4fcPgvNhh5bEO4hMerPs9a7u
         lZT2f22Dxiqz4DPlpyy4cvMRChZebOpRR8a96qNMQjcOwPDRNdUjHhP4LjwQ3QPqWAAS
         cvDVBnX+hvqwK/2QKCz+AIm2IhUxCviHVeRV33d2Wf7MPk51AExOPL3geO2/qoX7ogvT
         7M0g==
X-Forwarded-Encrypted: i=1; AJvYcCWZrHcLrxo8dwlszsTAbpiiWvMH29FePYwOmme1RIuaSDc+GLHwBhNesl26wOx/SQoRBpNlhSLKxNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwksVHkCZZM/ey4SYmPGmFwP5deamBD1Wt2k6VjgJr0OPtnzrRG
	vvhj7i83OFoPRfMWEAcugXVxcJxeatZDIhcbIo7aYctBzJls/6x6g16MiFo7SKhAkYwRoH5pYYq
	s044agnpQ3owPLZpeyQmOOrJsx9G2UMUgUTBn7K/QLQ==
X-Gm-Gg: ASbGncuN/itw033js3Hh5yLW+s8P3dO2r/cBWDVBs+SRIPL5kN2mATGu0G46UieKLpS
	nhOyYFO+xfpD9hK3EXIFF/pUQv6Wz8WAe8GE9kQIqoJap2dcbOXwIXIFLuzrko31c0rNJhgSxOc
	utf+kS5v4dcrVCziUC64zocjKLTmO6w9Af/iA4vj6TYItCoxXwFbHBjG8pxgKLi4tooRftEoDll
	ZTzYB+va5loXlfu+VtzhxVjoK3zLf4VjPhZY5qnThnL66vLO3jGFwMT9iOXNIqalE2EtTqxL+rb
	OQI=
X-Google-Smtp-Source: AGHT+IFl4FaDFqzlx6bWBXZq0K6NpC2OdnYDHICZqNqSZXVeIXY6NixyhYod+1/BeWpybcUus0n1F+KTrSDNCoyB1KE=
X-Received: by 2002:a05:6402:5c8:b0:641:5bb9:fdfb with SMTP id
 4fb4d7f45d1cf-64350e9d8acmr13722597a12.33.1763480833517; Tue, 18 Nov 2025
 07:47:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRnG8wDSSAtkEI_z@kernel.org> <CA+CK2bDu2FdzyotSwBpGwQtiisv=3f6gC7DzOpebPCxmmpwMYw@mail.gmail.com>
 <aRoi-Pb8jnjaZp0X@kernel.org> <CA+CK2bBEs2nr0TmsaV18S-xJTULkobYgv0sU9=RCdReiS0CbPQ@mail.gmail.com>
 <aRuODFfqP-qsxa-j@kernel.org> <CA+CK2bAEdNE0Rs1i7GdHz8Q3DK9Npozm8sRL8Epa+o50NOMY7A@mail.gmail.com>
 <aRxWvsdv1dQz8oZ4@kernel.org> <20251118140300.GK10864@nvidia.com>
 <aRyLbB8yoQwUJ3dh@kernel.org> <CA+CK2bBFtG3LWmCtLs-5vfS8FYm_r24v=jJra9gOGPKKcs=55g@mail.gmail.com>
 <20251118153631.GB90703@nvidia.com>
In-Reply-To: <20251118153631.GB90703@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 10:46:35 -0500
X-Gm-Features: AWmQ_blpsIaa7po7XSkrfRCPIMZ4WBj-h08xugNazGwsDJ_E9pCQg-N3cDPVz28
Message-ID: <CA+CK2bC6sZe1qYd4=KjqDY-eUb95RBPK-Us+-PZbvkrVsvS5Cw@mail.gmail.com>
Subject: Re: [PATCH v6 02/20] liveupdate: luo_core: integrate with KHO
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > This won't leak data, as /dev/liveupdate is completely disabled, so
> > nothing preserved in memory will be recoverable.
>
> This seems reasonable, but it is still dangerous.
>
> At the minimum the KHO startup either needs to succeed, panic, or fail
> to online most of the memory (ie run from the safe region only)

Allowing degrade booting using only scratch memory sounds like a very
good compromise. This allows the live-update boot to stay alive as a
sort of "crash kernel," particularly since kdump functionality is not
available here. However, it would require some work in KHO to enable
such a feature.

> The above approach works better for things like VFIO or memfd where
> you can boot significantly safely. Not sure about iommu though, if
> iommu doesn't deserialize properly then it probably corrupts all
> memory too.

Yes, DMA may corrupt memory if KHO is broken, *but* we are discussing
broken LUO recovering, the KHO preserved memory should still stay as
preserved but unretriable, so DMA activity should only happen to those
regions...

Pasha

>
> Jason
