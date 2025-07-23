Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F072EE97A
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 13:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753278996; cv=none; b=ZHJO6efdw+RXuLPh9B9gqe1M6dawxNvTE3k/YcDpbnHSiIyNgNdd1dh7RTppEq0cLkypm8V+LIHpKcnCE2FbXpgKLzl+3gr10xrQsflj9ND8loiMW59/OhaC71PGnyWFD8UzZGU+abkbvnm69Mx7rEb5VaJnwxrmcKoDB726BBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753278996; c=relaxed/simple;
	bh=fU/APBcfC/XfQLmB1N+H1jx5bb6LCvVVTvhPnEoXAWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnvtJaH/q0MxpLwZ1porPDpSUmHwJtWyk0aNDp/dop8bKMmqp7MDkJpzKVt3091kmxe5LBVp1bMH7agh2/f5F4zLdy7hb+dVLjQe61TzbEEX0D5jY+dachDxNEO+qnzS2iJaxYFyqdzbINFTqJ13bhazCxmwE/E9ZQg0we5IJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0GRqWnHh; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0GRqWnHh"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ab644b8dc1so72485171cf.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 06:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753278993; x=1753883793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Neb4DMdHL9YN2qZdu5HnMhnwFlw4q4ExiBgUXTApsC8=;
        b=0GRqWnHhO3ay88oPAUoxJl8XZDjHPi8BzJvlkjTgq5HQJ3x4LiqP8ACuWAYQ9UpwTn
         +AitDW5EJImW5H5KsQVufvpuj8nzfKLDbUR+2fGbUrRHGclFYKue/+fC6PXYf5q5yWh9
         DlKcUZGBbmVknvLBUqpqVM7/8qMvDMWhIXT5CNBY1D4WvR8HvbG45OApWOKJSgOzGW4f
         BAw5tmCRNzoWfb0ulY/HqwOZahDbLR++1wTFu/gaSLOYG9xeRlUNTiB/30igi/HjyIbp
         Ewmx/T7k/kW90uCv5RXoTVOvD4jZLr2XqszPZ6XxaUzfseyeeQGrJ1kynh8E+rI5S7tr
         iZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753278993; x=1753883793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Neb4DMdHL9YN2qZdu5HnMhnwFlw4q4ExiBgUXTApsC8=;
        b=tnEaH4ymiPEujkSqPhgSaif+bxcDjrNlUq5u0KDOAuGhpsVcMFMLKTd9Y4vyCzXFRh
         EdLWj56kHuWY3yTMCobdOQxgTjB9Rka/3QFUS4NmIvOZWORsa7gWd0RwDRDkJ47EYXP0
         WnvpycKQzTi5cXl4R/nETwGlJ39QZiqPV+oPVJ4SWQDF8NfWXbWLMpLxYm0BeaGSCkkv
         0C4t9f6jKbSx+Zjd6rJubvfjTV21cIWjWpN1A0rkSj5wJfA9lMweREPaM9axnwOxdM41
         u1EYMbZh539sDb4HSls+l8oeGsJkQFDnJ5Ln4VFo7IR1aypyVSMh/ypHNEDz8ysbFfa5
         A1CA==
X-Forwarded-Encrypted: i=1; AJvYcCWwd5f8/bTmBdMwZvS9YMd6g+Us7rITiWcYehJnUgnFIlY4ym+ebadNwFSvSYyi4R4uaPuzow2dOpg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtTlPKQlM4CBmFj6wjuCaVVY5sTECLEmjlp0nj6f4eKnItBst
	XDIzyjUYMDX0mmNOAn91R/EInojSGlK9XRQ2jUUdldRts7W1mYHObIGwU99GYS3SFlHjLy8uSLD
	3yn29n9vkkcwr+NT6ignWS/2bfNC6oll77SNjRji5rg==
X-Gm-Gg: ASbGncup5ucX5poNHarlIRS/0B+8cMMXdSDMNKb9efxj0vA6aEgKgEh+woferTRcNU1
	CFWeT4icWi3jLPvxitLMU1BztpzfwdVcjmlrtA6ktfXC4TQ10k9qCV/24OThL0NOIUgNFL+pofQ
	OwZFZMc99Tc8Vrphm79/G1if/An1OsGu2+pWc6CAh2cIr6oee8NLOiAKrJk3wH9gu6dHsAQowBZ
	6mY
X-Google-Smtp-Source: AGHT+IGrYMZ5lZ4waeYztYzZWeus2W5lvUIGBJomoilBWhgY/xZwdg1u51Z0y6Byizn2RRUk43nSuTfOAFLec5SGqvE=
X-Received: by 2002:ac8:7fd3:0:b0:4ab:6c5a:1fe7 with SMTP id
 d75a77b69052e-4ae6dfc4f62mr48555621cf.52.1753278993220; Wed, 23 Jul 2025
 06:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
 <20250625231838.1897085-22-pasha.tatashin@soleen.com> <829fa3b2-58be-493f-b26c-8d68063b96ed@infradead.org>
In-Reply-To: <829fa3b2-58be-493f-b26c-8d68063b96ed@infradead.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Jul 2025 13:55:56 +0000
X-Gm-Features: Ac12FXwxkGX-ZyVenfoKJwxXGBSrng0apcRfW2jRFbfKFQccJBpZH-g5RuQibpg
Message-ID: <CA+CK2bDi+urd9FRftrDn3bwp2VCvb1f3rFsD+dhegLrMRPC4Zw@mail.gmail.com>
Subject: Re: [PATCH v1 21/32] liveupdate: add selftests for subsystems un/registration
To: Randy Dunlap <rdunlap@infradead.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 12:06=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 6/25/25 4:18 PM, Pasha Tatashin wrote:
> > diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
> > index 75a17ca8a592..db7bbff3edec 100644
> > --- a/kernel/liveupdate/Kconfig
> > +++ b/kernel/liveupdate/Kconfig
> > @@ -47,6 +47,21 @@ config LIVEUPDATE_SYSFS_API
> >
> >         If unsure, say N.
> >
> > +config LIVEUPDATE_SELFTESTS
> > +     bool "Live Update Orchestrator - self tests"
>
>                                          self-tests"
>
> as below...

Done.
