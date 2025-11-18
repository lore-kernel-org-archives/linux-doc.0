Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37F3148DD
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480291; cv=none; b=oDppld7DByTmi9BM9plbciSpCYz7MOkElU6wiqB3bdrL6Qu9zSB3DjHLqnmH8GO3D86gGZaXY9oxBmMgUJZihERg8zjzXgYMlrlfPdXsaiN2x7qUKRAKPrJE+kRcgpafvjnAbO/IIS1O/vA0Ur/QSeeT9yX/YLyVrYMPYMlZheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480291; c=relaxed/simple;
	bh=B6uekXVR+jn/Plqa3NW/kjSUDt55yanBt9ufFPxdFs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcNicf+FXSQ0FiQm6rPCexe/XMUldNgnOD7dCSik1Guj6+5WAIaVJ4n7zXf2esBQnl5JU4fOKkK5Qvd2LTZph8/DXo47FtuFSS361B7wz9Zdvow6DIQDnSvPxlltnvyX/AJ4uRQGRbjQ2dZQhpOJq9N8yx64y73Ziml3wWEub4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ATjLX8UZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ATjLX8UZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64166a57f3bso8808661a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 07:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763480288; x=1764085088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6uekXVR+jn/Plqa3NW/kjSUDt55yanBt9ufFPxdFs0=;
        b=ATjLX8UZtWxHrtg5aJUXJkDwbx3GXE3jiyzFXB5PM6vXc+Q2JEWz5kEtrHB/BkQi0B
         vDp+xu5TaBP5K33rI3r2NtDI8h9JW77buIRtCONzRO6P7uCSbMsRCQPt3yTu7THpgGTj
         6IZx2QxgjkJWrn3hfyxWQNxp7I94xi9z7nFLnRqDxW7dHJVStPWZiwVMwiVjIQvd6Fbf
         OLhMLLFps9tS5pJxkJmEyFSKIuxcs4WTZA8LUiwjrpPfuIfsVUbgvow7VmvrKUfcG+9z
         m6mxe11b57pmEEq8FM5CmlPK7eESRS+31R6A+fU9CIcepoUabLjK/Jo4MRk2YKwR7ANj
         LJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480288; x=1764085088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B6uekXVR+jn/Plqa3NW/kjSUDt55yanBt9ufFPxdFs0=;
        b=sq/cHiwMxgrRqrv8Kd1Q9guuuinJacmQ0ejS0RcSETjDoSPwDZFwEfDJVuOcC5bfWG
         /+i86E9QhuWAJVlnsjXpTZAekiSv3NZgy+qKJz7NeL6PFn4d9t2boHYctmCpBYZk+rsT
         mzU9MvUFyuExUjohRGH6TuvmjCCOoobfg4TF5i5/vHLZDRCpNPAmWH7OpziYNAI/n1pO
         94U2olbIMQYU65a/jbXqtGqxgAnKgaZ6m2KamGAgjkMxRzSbUjx7LleBhLVVvty5xtqv
         Y/+56ZPchP0af+FmJN69A0ao5eR4a/sm/Ew4xdTd/hTQSVi/nEBqDNihfWugPO9rdQHF
         BVew==
X-Forwarded-Encrypted: i=1; AJvYcCXiKqyoOqAt8bWzo0otmaDeX93rRctC0HcMiS7E9AXuqDI0p9kzeEKpyGXfDW790oy+Iaivo2xzaCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrQeRf1BxyZB4GAMOHRDe7oP99m45aP3XhbSZWji1RZB6LWEB3
	bhW/1mfsYi8eZczip0EJNRWGIChKExqw66rlKR9M1aYNy89I3utmkXWaZNmpgFwoV15hVfyns1g
	rba2lr/SbUVr0k/BKrDfHkt2EP/lcBluMYGq5tjhw6A==
X-Gm-Gg: ASbGncvKwBpX4tA3jwmlj2hpm3XGF8a0L6AW7iCYqATgMzjEetkO+sEcC5OgZa5HADA
	wR3+0+sUi6Yry1jnKADPFzkr90oic0VG8sD7hzM1TjC2HIclFa++TM2vRUxEnssvXd3PoCISVor
	Sfcc7C9x83Gj8Wgk3eTdEISZFauw7sKY2JtNyGOS2VWJPHMe19r3lm8deG+GxHzT90isSACs07c
	zoe82FNFklBzuDBdI81wvjAB2oL9MzQFdQX5OkhemDdYK9UAAYnEDfzjE6QJ3ceOHY2JWvntJsa
	row=
X-Google-Smtp-Source: AGHT+IGrjPyW93BjIwBqBDRqzXa58mN2pSY6sOqPun6CMHKlu12QPm0Wx9wn3sNAxL6K2ljWwKgu92DgB9iBQq14qms=
X-Received: by 2002:a05:6402:2112:b0:641:1d64:8dce with SMTP id
 4fb4d7f45d1cf-64350e8e0fdmr16538410a12.17.1763480287895; Tue, 18 Nov 2025
 07:38:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-9-pasha.tatashin@soleen.com> <aRrtRfJaaIHw5DZN@kernel.org>
 <CA+CK2bBxVNRkJ-8Qv1AzfHEwpxnc4fSxdzKCL_7ku0TMd6Rjow@mail.gmail.com> <aRxYQKrQeP8BzR_2@kernel.org>
In-Reply-To: <aRxYQKrQeP8BzR_2@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 10:37:30 -0500
X-Gm-Features: AWmQ_bmD9p5Nn1RKDLqeZ98HzkdyZzvLR0FYSVXPyrJripjLvaLejIY3K1PEUqg
Message-ID: <CA+CK2bASYtBndN24HZhkndDpsrU1rwjCokE=9eLZUq2Jhj6bag@mail.gmail.com>
Subject: Re: [PATCH v6 08/20] liveupdate: luo_flb: Introduce
 File-Lifecycle-Bound global state
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

On Tue, Nov 18, 2025 at 6:28=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, Nov 17, 2025 at 10:54:29PM -0500, Pasha Tatashin wrote:
> > >
> > > The concept makes sense to me, but it's hard to review the implementa=
tion
> > > without an actual user.
> >
> > There are three users: we will have HugeTLB support that is going to
> > be posted as RFC in a few weeks. Also, in two weeks we are going to
> > have an updated VFIO and IOMMU series posted both using FLBs. In the
> > mean time, this series provides an FLB in-kernel test that verifies
> > that multiple FLBs can be attached to File-Handlers, and the basic
> > interfaces are working.
>
> Which means that essentially there won't be a real kernel user for FLB fo=
r
> a while.
> We usually don't merge dead code because some future patchset depends on
> it.

I understand the concern. I would prefer to merge FLB with the rest of
the LUO series; I don't view it as completely dead code since I have
added the in-kernel test that specifically exercises and validates
this API.

> I think it should stay in mm-nonmm-unstable if Andrew does not mind keepi=
ng
> it there until the first user is going to land and then FLB will move
> upstream along with that user.

My reasoning for pushing for inclusion now is that there are many
developers who currently depend on the FLB functionality. Having it in
a public tree, preferably upstream, or at least linux-next, would be
highly beneficial for their development and testing.

However, to avoid blocking the entire series, I am going to move the
FLB patch and the in-kernel test patch to be the last two patches in
LUOv7.

This way, the rest of the LUO series can be merged without them if
they are blocked, however, in this case it would be best if the two
FLB patches stayed in mm tree to allow VFIO/IOMMU/PCI/HugeTLB
preservation developers to use them, as they all depend on functional
FLB.

Pasha
