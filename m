Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508621ACEAF
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925953; cv=none; b=A6/LPaQfR2mRismlQEzo9WAavUBMtXokwbLFqa8AhwUsM8/+2k4B2ju84PBkrae6MKyfQI5blr7L44tAO1tkqTyDK9Frm6Gs+cIX6VVXiBCAk++pE/sxrr5XZ1EhOtpFzHS+0f+GArZyAzC1dA4orIPSjjOyLbXMK/dQVGiTXg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925953; c=relaxed/simple;
	bh=DBsSkC+lKX7hhkdlAG71wPGPypyRvViV8UzuZHlhXTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO2VjuWsVI9STQCkLObgeq1UGJM5i0EMsMHK0/65E2OzEBM4V5+M3GoXfrrbqb2f2kNclc6n+s7cWKX1eNhsSL10DdxsMyXHVpU21u9X0Ct22PE5oX2hA4NlRU2NRtNzP8X38/8IJaUSJfOsWc8hksjVCcNkVNOs5ZHOSKf1xSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=fJxQgnH2; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="fJxQgnH2"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso5476041a12.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763925950; x=1764530750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkF1W+HmVNp/SmXP72a3xWNyOn0/uzHxCyV8VfqPJ10=;
        b=fJxQgnH2i6eveDUEOj7v74SN07aSr9+7RRQhocUM09Ih1rHv5j0FhdaUhZzpojULw/
         C7Y+BgpORceAvoV/M46gYDxqqEIj6UpJ90v94Bh30Ne4KYJ0Xs5A9dA0AntTYNn5X+ob
         QDW2+gJ/m6KIW9mYZd1p7TH1i1OmeWbjg0Smpg/Yg9A39nK8PmIk+I4i19A6tyxtHwjG
         x+lhAbmqHkZLyme0Mg6QayIs9EsOl2+8KqJVlJ4T7IVl/ih469Gb98zcPqJ6kudNjMAP
         xDFWveHKjOfFNyP8VfbMH5L4DXhIL52Cjc3w8X4X23tGxiFuZk/HVK1jMEPx5MzTUQCG
         F0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925950; x=1764530750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dkF1W+HmVNp/SmXP72a3xWNyOn0/uzHxCyV8VfqPJ10=;
        b=T1zEWtzHN2nzTcKy/nfgmiUYzdJgizHSVQgrofW4zay8uCcdq+ADVgd9VRLzuKWpqL
         UsunX6iTYg9qj0smJNeMRo9+chs48LW11dbF9r+nKG5vBZu1MULKOVvagu2Bx2e5eTE6
         Q5LjLtTjFvdiVw92WFvxaKZfRcQB9p0aUmHlAVEKCZsY2DAn5MeU2fw9o1SNfkIFacqP
         AGKTYHWqG7jhL3Tn6rIIkaUEpYTTnO2dE9Dhs+AlLIsu75lUEntWP99a2eBr3SloNDXf
         s2meG38wMNb1xZxozqw7b4ZlxIVDyyAQDesO61WAzcs18XwF8sGpC0I6D1WP/A/YENTJ
         yntw==
X-Forwarded-Encrypted: i=1; AJvYcCWt82AhluBhMAwhJPuAA2yHeQ9QBq+4J3kZw5gnUwjtLgVuy9DYJlRWqaKaxVspGGrToP8ZI2cbW9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDglrWantdDye3lVAydCTXCEGiq/jvJhx/wSZ9fmQR7Peg9YKJ
	qTV1ONPWH4sL0Qr9/JIfXaqhqWrFhvlBX5kcM5XJvaESeCaNis54Rk3oEZkmzAUZwlE8vx3vp/3
	y/UyD7ecJdg7PDtt14LMFfCEY8b6pBO1sjp2Zqz/ruA==
X-Gm-Gg: ASbGncuceLEQApIhcwt+xHWfebJfL66jLBElgcOd9LgjQdDpiYZf6asQutYFPi7RSXt
	xgukySdFVhcfs9xBP3sg49xchvlDn2sYWWn04Y0265qav1MY/rLpH9qIDZ5LQ6HNxZ1F56sWgip
	s1Opb5uCjj9EIaamgBJqQ8jBSLdkR5qFhCMS6L//v6kOj3VyAkxa0b+cGMyP7ZqbPgXoTbL2Q9B
	NIKGxhkA/3p8g6Spgj2mY8XCARyjODWcE0czL2tIL5AAgLzRw4iDFH8IJccg5ENRIse
X-Google-Smtp-Source: AGHT+IEAMY0pvJyme6T1x/GXi+zAz7fUHPUOcouP4DWp2W4b/iQCr9XdKr/m0KnneLDceMLTWxGdGs7cWzgaueOTCwA=
X-Received: by 2002:a05:6402:2750:b0:640:f1ea:8d1b with SMTP id
 4fb4d7f45d1cf-64554665a54mr9031837a12.16.1763925949554; Sun, 23 Nov 2025
 11:25:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-6-pasha.tatashin@soleen.com> <aSMX_pnUShilO_sj@kernel.org>
In-Reply-To: <aSMX_pnUShilO_sj@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 14:25:13 -0500
X-Gm-Features: AWmQ_bkm6GWLaDGmSYxA_sDe-BfkSNdLO3VJvb3Ilu_NQl85-GJkxSTO8YXhl0w
Message-ID: <CA+CK2bANLwj+nqDy8_dXgCBym_VFSFW26naqC3x7XED9tC-TYA@mail.gmail.com>
Subject: Re: [PATCH v7 05/22] liveupdate: luo_core: add user interface
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
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
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 9:20=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sat, Nov 22, 2025 at 05:23:32PM -0500, Pasha Tatashin wrote:
> > Introduce the user-space interface for the Live Update Orchestrator
> > via ioctl commands, enabling external control over the live update
> > process and management of preserved resources.
> >
> > The idea is that there is going to be a single userspace agent driving
> > the live update, therefore, only a single process can ever hold this
> > device opened at a time.
> >
> > The following ioctl commands are introduced:
> >
> > LIVEUPDATE_IOCTL_CREATE_SESSION
> > Provides a way for userspace to create a named session for grouping fil=
e
> > descriptors that need to be preserved. It returns a new file descriptor
> > representing the session.
> >
> > LIVEUPDATE_IOCTL_RETRIEVE_SESSION
> > Allows the userspace agent in the new kernel to reclaim a preserved
> > session by its name, receiving a new file descriptor to manage the
> > restored resources.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks

>
> > ---
> >  include/uapi/linux/liveupdate.h  |  64 +++++++++++
> >  kernel/liveupdate/luo_core.c     | 179 ++++++++++++++++++++++++++++++-
> >  kernel/liveupdate/luo_internal.h |  21 ++++
> >  3 files changed, 263 insertions(+), 1 deletion(-)
>
> --
> Sincerely yours,
> Mike.
