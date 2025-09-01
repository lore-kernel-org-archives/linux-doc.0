Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC233306488
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745695; cv=none; b=qF6eDI+Vi9uSdOYPrJxBJ20cvxndhMeUJCHawQYXp77OlAbffNLyZbhnFstGMQCQGpzqVIFTotdvD5UtKGf3GcWIlfsRmvVngRnHQBXkz+v39AV9Ks3kkiCVWU4W07BEBnNbIIdfNODNk+0g7y0Iy+WWmY3GCVph6vE2IepParg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745695; c=relaxed/simple;
	bh=HijY4XYukusWiwshNGfbl7p3/o1oGR3hpG6hQS1YUNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkuRaSnFgYllk3gulYxo1ZbyAyPgHgnSQLvweaASoi7LsYrXNWf6RulvsN1rfuSfjB56yYGgIvGIHk18MPATlmaHOjDxlP2NYIvTVB9FEtd20a7WwE3COmRnZQt+RPm4GWkmENzj6WefsautpHApSIpdRwp555hYtt9B9pXcwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PjBpvKIt; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PjBpvKIt"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b320c1353dso25835631cf.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1756745693; x=1757350493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o279Shh53JnSEmHzGwRb/h+6P8VUc/oKT/oRF8TU58I=;
        b=PjBpvKItShNTKB927NfUKJGdz8/+g2qO/c9GIqkW5IgOCfgBL9HIR1ehJtyYdefu5l
         ld6j7QR6clFfMQ1tPnCMl8keylvmdaZ6E+N4pmDqP7YNI/TfM6D1+nbrJuPqyjSdMV4y
         90uk6MBrs85u/hQ7XX+oflxvpHyYgZy5wcIOXX3ZiQCPY4sLSTP2DTPsgnFkhVypnz+p
         e6d8KfYBZVvgGgfzzdv08YseeLWWJ5PZQQ5vskJcmGoWphg5qI5Bz4rVBMKWk+kFC0e1
         HxfCAERVb/q58eeXoc23nuH8sdiBwGD8aFUnDB+h/rE9tIEwLYqAld65Is7x2DL6fw2s
         Fy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756745693; x=1757350493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o279Shh53JnSEmHzGwRb/h+6P8VUc/oKT/oRF8TU58I=;
        b=d7ih6EjIdxtLhf+s1g8W3xWeFWEdYTR+az0NbuYIkhVrruRprFmClKQ1jJMsobKmku
         gRdksbFbQzAfqZ93yZ1NnaRCvWWZjVnCJxK2RAn8FaNSKd69//oiUgktYh9WaHhlodle
         h2nSvGu3O3QNqxQmZWf60+uvMMq1aenRPsDRL1+xFS6QL5SmDcqYTuLN9VwYcNK9MYjR
         d8RKlmdJxFBByCrXUCszkQm2KTKUaO7SdIkijCoECwJ9LNswuOKBJGenlu1beLSZeIy/
         xM6qBhGxqwsw1zcsieFcXE5D5bacZvlBNAyT9Z1I1XGdYYe90w+zndn1Qonrc5Nri0v/
         Xg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXu80U4drbntxPO5S7RwU1ZVYJ0fQvE152WzrDSejNsC5YiPbmD5+Vl9cTlA/K07pXfEdh5LyiZE8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZukcJGzIAf10Bq89DetGnIj9IOob0JaE79Tfc3HUdDxqPK61
	wjPE8Mqhkhz4SyX64qj1yyqEQKgklHgCLF+2sbMF5cQrJULshM8QoxwEdT77PbZ6UBop3g2bBWa
	WF1jGEcQVsqPncBOcvrWyzdn+26+zUqHBYq2qxyygtg==
X-Gm-Gg: ASbGncvaOmtAT5P548DdbOwBcWSqTwl1V0ceWf7sPWszFQaMeRh/NyJxFtoykCJgiAD
	vb1dWMsTNzvoA8fa2eWnUgxK1a5deewDTGmeEAklJvuEryvbiGyCjOrKoijrWsANECf6r4u+4Sg
	mgx5kBTWuhIiCXB+N3nNHV8U6OfgChmW+AJhejza3SK4qFVvjhj3lYHU9reNcQV6hu1tY29USUX
	kbX
X-Google-Smtp-Source: AGHT+IHY/eg6lEzMqM6Ga55zC7XFq05s8YP913RvP8Vq9OFKOx955V1owXgBZfCIMqTYLUmetiFwFefB0L5EXnJijhY=
X-Received: by 2002:a05:622a:99a:b0:4b2:9620:33b3 with SMTP id
 d75a77b69052e-4b31da1d546mr115573791cf.34.1756745692646; Mon, 01 Sep 2025
 09:54:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-30-pasha.tatashin@soleen.com> <20250826162019.GD2130239@nvidia.com>
 <aLXIcUwt0HVzRpYW@kernel.org>
In-Reply-To: <aLXIcUwt0HVzRpYW@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 1 Sep 2025 16:54:15 +0000
X-Gm-Features: Ac12FXwjvuuXLl4TYrvSYicUEdLVOyp0TZPBIDlFXyKegWX4ZiFbjlDKbUPVZr0
Message-ID: <CA+CK2bC96fxHBb78DvNhyfdjsDfPCLY5J5cN8W0hUDt9KAPBJQ@mail.gmail.com>
Subject: Re: [PATCH v3 29/30] luo: allow preserving memfd
To: Mike Rapoport <rppt@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
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
	leonro@nvidia.com, witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 4:23=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> On Tue, Aug 26, 2025 at 01:20:19PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 07, 2025 at 01:44:35AM +0000, Pasha Tatashin wrote:
> >
> > > +   /*
> > > +    * Most of the space should be taken by preserved folios. So take=
 its
> > > +    * size, plus a page for other properties.
> > > +    */
> > > +   fdt =3D memfd_luo_create_fdt(PAGE_ALIGN(preserved_size) + PAGE_SI=
ZE);
> > > +   if (!fdt) {
> > > +           err =3D -ENOMEM;
> > > +           goto err_unpin;
> > > +   }
> >
> > This doesn't seem to have any versioning scheme, it really should..
> >
> > > +   err =3D fdt_property_placeholder(fdt, "folios", preserved_size,
> > > +                                  (void **)&preserved_folios);
> > > +   if (err) {
> > > +           pr_err("Failed to reserve folios property in FDT: %s\n",
> > > +                  fdt_strerror(err));
> > > +           err =3D -ENOMEM;
> > > +           goto err_free_fdt;
> > > +   }
> >
> > Yuk.
> >
> > This really wants some luo helper
> >
> > 'luo alloc array'
> > 'luo restore array'
> > 'luo free array'
>
> We can just add kho_{preserve,restore}_vmalloc(). I've drafted it here:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=3Dk=
ho/vmalloc/v1

The patch looks okay to me, but it doesn't support holes in vmap
areas. While that is likely acceptable for vmalloc, it could be a
problem if we want to preserve memfd with holes and using vmap
preservation as a method, which would require a different approach.
Still, this would help with preserving memfd.

However, I wonder if we should add a separate preservation library on
top of the kho and not as part of kho (or at least keep them in a
separate file from core logic). This would allow us to preserve more
advanced data structures such as this and define preservation version
control, similar to Jason's store_object/restore_object proposal.

>
> Will wait for kbuild and then send proper patches.
>
>
> --
> Sincerely yours,
> Mike.
