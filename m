Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D620428727C
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440149; cv=none; b=JRLQ5Z/zj0SWeZx4wnfjsDUikbuz34dVrLbJ7B9YxH/k1JZeC7lQIHV2zbU0C/FfoKbEkqDxEBjve7sm7s6rKICIFT3ai3pJnXq6jD0LUNqES10cEBxH6ZNB4HLwDw2CLU9sYsGqT6jwpwqbTkL2Wreao2zs7wCG7oDVHFiObes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440149; c=relaxed/simple;
	bh=X6KnXlrlW3t/I9mrc0okamZX2WiqE0y9NcPRZWpOOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwdYIR8yTiDlB3trAiNWDT2GvvmxnwGanDFdf6IJV3c/dOlhDl0vE49cxZtlENbDh7/CbeHAXqxRGTmBneri3h2RDe1aYludLhxX7T6ch++41lnRgmltF4r6tC5Rvqyt29BuzRvisPpL/AN/9mSuaqmS8oa8wsLJ+QycbHTHujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PCVedF94; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PCVedF94"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so8010486a12.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 20:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763440146; x=1764044946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVK4IdpOEfypRyCSONdTJzqLYJ2T4mhuvQFJg1heiHk=;
        b=PCVedF94X8LrJryuCcqF5hEsK2SqZcqiple3XkA3ILr5WOj6MYvnVM8RMKxL4c6T0k
         n6v0dQyNapdOomwNAMRT897eA9VGSrQ20Ho7UkoqLzB5ms1QD37IWqi3u8+uCr1REGxx
         vOESGmVIwIe8oPnnsNHRJKoGaHs7StUx+ckNZUsJFLmXyorIMV5HJ2eZ74XWY+IS/ZrT
         NO60eSOuNF3+KM6P5XJ37Jhb9ZB8IZxJ+VAwtkOz25D12NW5AnXSRv14CTDDoLlLQPeo
         UeZnPivTNCYoFOMNrzaB2D+KM4FuneVYFGisvGLNZGfH/eiOoyGz3E0xC11WOi/wM4ok
         enOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763440146; x=1764044946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVK4IdpOEfypRyCSONdTJzqLYJ2T4mhuvQFJg1heiHk=;
        b=h7RiGECnuPSickx7/zVToU/YP+uZXZA6sWT0hk9xDjX/9fzdsDtYh80kZw4UoTLorH
         psdfpgqW/NqMesFXPgK5TfWLH+btpJjIOnmLYc4xOyjH6qlBRRgRAaMIgIMEa2DyS0b6
         NleL6L35i6GE5nM4cwAiFnIbnYAjWLklUXyrO9hZs/x+IZDVCD4aM18by4fY/uiPYDUV
         FidcvEV8E0XC4xxOxjfOAUVC0lINlz52SOjaeX9UwZOQvIZzULYhY0IBWo7UDEhykz/S
         bIMNkn9Bt8shyPOyXNd2/eTZxE1xXhOrLlp70UW0FiFS+HIy/LrsX4tE8gfyyhnvYPpC
         XPvw==
X-Forwarded-Encrypted: i=1; AJvYcCWkxiluiFY36BjNDvWaHHuleHOPjNcntluTwyyqSOdsTdUXWMKETCf0t5bvfOAk++7fTQSqYwidUUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRXGMa/m/mjYrFEipDO54gE8kowLM1eCwqdbV3pHR6OZ3IRSc
	UVEMz1PGuSg5SidPvwIDwXuxdEVKS+KE4IysXGFgBx+vXUA53N2JyK/j9cQ3t/ZnatEj8fXYMGn
	CT0m/KPWo9T5XORHVlcYIGLoJi2vAPTVCebZem+exbw==
X-Gm-Gg: ASbGncs2Bxa+drD8GKylv629eoCdvaU8Sx1mzfdCJTMgetuLbrW8I/vgDFndhaog8Ep
	1cpT29qNQClvFcTC+kkUlbqfdbxYuIsMuFzow+iyiXI2n7wZ7OSE0fo6i1vC2PuXpoH8wrT3qu2
	2p4nChqIDJCqgjgHXxASkNRT9P+85/lFOVNpyHAB/10mYKcfMl2dvqC0qMhEe6kkbqjXDcgFJQD
	729idK1vdHuAbZ5SutWMka4D+kV5poSIhjKWEGkRpNSD/2sMgHpT/UH3a+/IBzKBjlku1OdjsQ6
	JfE=
X-Google-Smtp-Source: AGHT+IF6ySItcOMgaBoEyxRCTrysqlaU4//aieWHoBgnptA91clHqaU2ww5S0PiyBiCx/e+NYj7wY0E/YvrpgMWF5v4=
X-Received: by 2002:a05:6402:35d6:b0:640:9993:3cb8 with SMTP id
 4fb4d7f45d1cf-64350e039ffmr13236688a12.5.1763440146078; Mon, 17 Nov 2025
 20:29:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-5-pasha.tatashin@soleen.com> <aRoEduya5EO8Xc1b@kernel.org>
 <CA+CK2bC_z_6hgYu_qB7cBK2LrBSs8grjw7HCC+QrtUSrFuN5ZQ@mail.gmail.com> <aRuPcjyNBZqlZuEm@kernel.org>
In-Reply-To: <aRuPcjyNBZqlZuEm@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 23:28:28 -0500
X-Gm-Features: AWmQ_bnXjUULcNqlTihBFO8sKCACG8mKavb9e7Sf8PiMX_A8JxJdQG4B0RQX_fk
Message-ID: <CA+CK2bC1HviYczgs8=sh8Rt6rxgPgWuda4DGYpg+oLfHn5b2ow@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] liveupdate: luo_session: add sessions support
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

On Mon, Nov 17, 2025 at 4:11=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Mon, Nov 17, 2025 at 10:09:28AM -0500, Pasha Tatashin wrote:
> >
> > > > +     }
> > > > +
> > > > +     for (int i =3D 0; i < sh->header_ser->count; i++) {
> > > > +             struct luo_session *session;
> > > > +
> > > > +             session =3D luo_session_alloc(sh->ser[i].name);
> > > > +             if (IS_ERR(session)) {
> > > > +                     pr_warn("Failed to allocate session [%s] duri=
ng deserialization %pe\n",
> > > > +                             sh->ser[i].name, session);
> > > > +                     return PTR_ERR(session);
> > > > +             }
> > >
> > > The allocated sessions still need to be freed if an insert fails ;-)
> >
> > No. We have failed to deserialize, so anyways the machine will need to
> > be rebooted by the user in order to release the preserved resources.
> >
> > This is something that Jason Gunthrope also mentioned regarding IOMMU:
> > if something is not correct (i.e., if a session cannot finish for some
> > reason), don't add complicated "undo" code that cleans up all
> > resources. Instead, treat them as a memory leak and allow a reboot to
> > perform the cleanup.
> >
> > While in this particular patch the clean-up looks simple, later in the
> > series we are adding file deserialization to each session to this
> > function. So, the clean-up will look like this: we would have to free
> > the resources for each session we deserialized, and also free the
> > resources for files that were deserialized for those sessions, only to
> > still boot into a "maintenance" mode where bunch of resources are not
> > accessible from which the machine would have to be rebooted to get
> > back to a normal state. This code will never be tested, and never be
> > used, so let's use reboot to solve this problem, where devices are
> > going to be properly reset, and memory is going to be properly freed.
>
> A part of this explanation should be a comment in the code.

Done.

>
> --
> Sincerely yours,
> Mike.
