Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B325F99F
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 23:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764027932; cv=none; b=Z8w8esYVE7n1tXNmMEq40gN7ecFwsZAQDX5frCyvxcdQQ7gM1vrwYPsMseaFD/sw6LdBCjc1Cyb/Q9ElBHm/iF1/Vln8m9LW32EkdwAOvEME64OLWVSxVx4QoBROqMuZhem1kb0I9C8br/TN5QRX4iquLm0rgd17K256ffcnXOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764027932; c=relaxed/simple;
	bh=1YT7lz9VAjzJFR6KJdWMrofH24QSVAwiNd/A0dtf4zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIYf31nSrpEz3glYaVDl5D2874zESIwOFra9F0Q2+8SpuflCyF87a2sQuJ1yS24ZtJrD5rmLNMcy9YCnpg/GxDnMwCFb84glS5wRb1mXzTjgbjsNpemiaYECGM/hRgTEEcrExwLXpjhAznPFUTLSq2Z8mAk62n4AK5XnjSsfpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i2lkP09Q; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i2lkP09Q"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957753e0efso5086037e87.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 15:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764027928; x=1764632728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05wP4M5m8hN24FSCktfwvvhdg9eAu0qN4WDwWhg5IsU=;
        b=i2lkP09QFZfmvM5LE5tWH3MrpB88FwrsAYBGUFlYDXVWWnE0FViOplvOsEJShw6UOc
         wGd5jbXrzsatKkAxno2xDJFUPnWIrscvD53KwKfrmjSasUO3y2/r3IDxeV0nPey1cYTR
         eykQQZ3NOmRTZrCAKBA0dYNHXRxkxTvV5f95HOsU/2/m/Wtc45SaHf6E8ayrKo5A7pXQ
         /UU5dWhj8lKF1KI3HeMXKPY8ccdRrHrVamjHD6h3GWqzVgCT4GKfo4dMFMHrXnvHoeFL
         /1POdbOzqrp6FEROgcJUaD401j6p6FYB7RLsMmvvvLJJD/81TSrEAGW0EliDs2ykSSsF
         Gcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764027928; x=1764632728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05wP4M5m8hN24FSCktfwvvhdg9eAu0qN4WDwWhg5IsU=;
        b=bs4Yz+KqU0EaT2E8Ixugpf9Su4rlqN6oGYsTd8Uu9kMtElj7oGcLSp33IayQ1RlHE6
         HIGaSqwhZuzZeLKJFIoqCiJNmRpTYL1ZvzXyrkZumHhUHtLM8FwIaPM096zNga5JcqIv
         3/eUJVG1HOBUeGnfnZYs0UWOW+QjeAhk3MA4XgahI/tXRBn7QvdPUCdK49nKtaPXgBeW
         dDaeElwPWhRW6qtDfEcA62NcsntxcZ4lhdBLc+X1B8t0CzpYQ2PbiUCnyy9OceckdAX6
         vQjuiyDjiMpw4OpHVf1lYTNCVioCB0tDJ4EPNabdQbk/g4aHOaeUWLLUFrJT9ZnM6l5j
         bmWA==
X-Forwarded-Encrypted: i=1; AJvYcCXjvvuB1HjeT5u0vw7ifUNlGX/lpsVFGXll7VKyuXBnBxx4UXfmKdyoAYV/135fJM3xEALOeITkaEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmbLxbLmOgTNNAxUW89TNhBB8lbN3h2VRnftxKfHBI5qFzAbif
	W6Z95m7N4YoA/4H13xsTV+WL242/iJ8OOgiV8fTmJcxlC9f62wguEys0h108HTw38ckmvBdiFUe
	ufbEnO2+ubBXXgi/MmcH743Io6nRrxDI/37jBs5OC
X-Gm-Gg: ASbGncvA3SXxvlKlwMTViEHgOORKmlpyz1n7/COxp1UHOsASN8D3psk72WOUHaCo+xR
	quTKYgmVnKGjA9XurKBVBlXivNSIhULY88acT0wAwtQJeLCt9WpLVPEfHkJVlXjm5quoULIqCJj
	Ed6C8DagAA84odyCsHY4Ogn312+vyP2HsbRIO7PkVRyab/EvYIlNtW8FnNtiBYZmWcOEgf5K4WX
	bdq2ZI+ypQX6/WdCkpgMHtW4J7cdSAqsFMN1diB5d9OHD3/42zaObg5Tp/pgyva814MKFFoQNsL
	hKO3Pg==
X-Google-Smtp-Source: AGHT+IFG3B3wjJ5hUmdHvUSiONpPpEjo/smMGL+Sq7VqjhpIWo7YbanBRf0jnx+HWEMfNF7y44/hOJQ08ua0/lRI7nY=
X-Received: by 2002:a05:6512:3c89:b0:595:e35d:6b80 with SMTP id
 2adb3069b0e04-596a3ea6658mr4439445e87.5.1764027927918; Mon, 24 Nov 2025
 15:45:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com> <20251122222351.1059049-22-pasha.tatashin@soleen.com>
In-Reply-To: <20251122222351.1059049-22-pasha.tatashin@soleen.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 24 Nov 2025 15:45:00 -0800
X-Gm-Features: AWmQ_bnJaOF-T9FnnUyFXJgRaTp9b-dM-s_K88NADK1Pd4LiL71E0T19a9fmhbE
Message-ID: <CALzav=f+=c5XH7Uw9EGVb2P6VxsnpF76e0DXAAXhM0gsWPxw2w@mail.gmail.com>
Subject: Re: [PATCH v7 21/22] liveupdate: luo_flb: Introduce
 File-Lifecycle-Bound global state
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 2:24=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:

> +int liveupdate_flb_incoming_locked(struct liveupdate_flb *flb, void **ob=
jp);
> +void liveupdate_flb_incoming_unlock(struct liveupdate_flb *flb, void *ob=
j);
> +int liveupdate_flb_outgoing_locked(struct liveupdate_flb *flb, void **ob=
jp);
> +void liveupdate_flb_outgoing_unlock(struct liveupdate_flb *flb, void *ob=
j);

nit: "locked" should be "lock". "locked" is used for situations where
the lock must already be held by the caller.

> @@ -633,6 +639,7 @@ static void luo_file_finish_one(struct luo_file_set *=
file_set,
>         args.file =3D luo_file->file;
>         args.serialized_data =3D luo_file->serialized_data;
>         args.retrieved =3D luo_file->retrieved;
> +       luo_flb_file_finish(luo_file->fh);
>
>         luo_file->fh->ops->finish(&args);

I think luo_flb_file_finish() should be called after the file's
finish() callback. Otherwise the FLB data will be cleaned just before
the last file's finish() callback.

i.e. The order should be

  file1->finish()
  file2->finish()
  file3->finish() // last file
  flb->finish()

rather than

  file1->finish()
  file2->finish()
  flb->finish()
  file3->finish() // last file

> +static void luo_flb_unlock(struct liveupdate_flb *flb, bool incoming,
> +                          void *obj)
> +{
> +       struct luo_flb_private *private =3D luo_flb_get_private(flb);
> +       struct luo_flb_private_state *state;
> +
> +       state =3D incoming ? &private->incoming : &private->outgoing;
> +
> +       lockdep_assert_held(&state->lock);
> +       state->obj =3D obj;

I tripped over this when developing the PCI FLB state. The following
compiles fine and looks innocent enough:

  liveupdate_flb_incoming_locked(&pci_liveupdate_flb, &ser);
  ...
  liveupdate_flb_incoming_unlock(&pci_liveupdate_flb, &ser);

But this ends up corrupting state->obj.

Do we have a use-case for replacing obj on unlock? If not I'd suggest
dropping it.
