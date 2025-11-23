Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD02594BD
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763927032; cv=none; b=JClg4YJxin3NfCmOidTNQlYrXupVYgH/DwFpXrytuoQ/bM5rH9+Xb75lRvk3vRySwavLE5mLfJUqsNLiosy50iQ5Q7e5riVisFbNh/v03H1KA3BtoEm6kPku+EDIy/3f0u2Se7zs+OmhO8jDtSwTkUUIPWLeLmjpoRHbbc7NxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763927032; c=relaxed/simple;
	bh=rEXUF3WcLXgrqK9Z0mp+DKx3xAVF9PI7UZEW40+RQjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/aIF2k9+Nyo3oUJmLC7WytGh2eFuhx2T4Bk3BQ+BvTKel0qLD9s6F6A2IyvoeBXjcYSsPrA0mJheOy2dYgGl5MIJT+3fnLbJgR4eIrx6FMLmz4lzimv7PPwiDhf8t3KUImQyQC60hnR5mU8fRLWUr87SgnVjMnHfOVtqPNROxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=NPsAbqcu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NPsAbqcu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso5491392a12.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763927027; x=1764531827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t1Ki+s+9/qWluhdQjI8hbyhcgBh9iaju0gMHkm8x5A=;
        b=NPsAbqcuvhy20tG+n/y/Vzs8SIQ1k3m9Mt6v4vBOTQQxB30LiIS8n9kj+Sc3aC0HsB
         hqTBe8pm0nRS38sl7PUhi4DcgvTUwWrNPVCWo21hwaLAVtepLxbkB10/ghiG3i5JLYPL
         R1ZyFN6Tu5XRy9bdtWaFE3NJK1ob3NNnpuYHcBN/qVmbNfeVTkB4RESZWwzJsm5pTgVO
         JXl/ZWBPQ0cBIgdCnmL94p3lysV0wn86JNl02WUR+7SDS+5vcUmsXMHN6MPdCZrWZRzY
         I+wV/UtLoxosF817ZgRuIq1h+nXoc+fOJ8m0Xm0ewlMQnezLZMo1TH1pFKewWBUSfVNf
         3eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763927027; x=1764531827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4t1Ki+s+9/qWluhdQjI8hbyhcgBh9iaju0gMHkm8x5A=;
        b=T9I8prwfAn0Mh2qNfbISujONI6AoKzUKYHYWj5eXho6yao6fD9LMc1YXUdXR505RNK
         w57BciUSNtQ0qs74ebEw1xcwIcvW0EHn9OQWALtc9SPwvqI9Y8Ur9BaGy/yY4kfJOHm1
         vUB6ZO4aSOIpW2klh3uWgttgsKbezqjZTaInwb8GQCFRkkSDFnBdA76PJv6r3pQd6gto
         TSA9yRFsha5Onf+MwlQs/dFJQIJsUz6Ox/+cldZggMm9KbS157MqTkOtgmYS6CDEdXb2
         /7aR62BsLvxzXc23ntpA+rri+7sJUs06InDLC/1wJU5Y4U6ENwVfYrTn+C2+4QfIC7MJ
         Tjtg==
X-Forwarded-Encrypted: i=1; AJvYcCVleg2zZevvcGLZ3Jby37oQtTUJlofP2K8kXpyEKlXCkNSbg9lBprZkI2sVZWi2FKWaboy0ka3ZsgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/vtHLDemw86R4qfHZtNWiqZjd1+OOrlEBeLzjqRbj8Ku1Ut5
	rWD/RT5kyB+Mgsmyk1dNC7HXLS7oKrx0ln6NknDgOzFexTaRgy6wcAr4G1hHJKLjAumv6FJgHDv
	HUQiqPCM93nXARFGHmcNDDrK6IKTH10MCWEuyNp2QyQ==
X-Gm-Gg: ASbGncufKrS8rIVJixljl1oQ7EbrUB+9phWmanZFAlM6yTAjUULWT1xrjrSBKPeOw9R
	qdvdp9PajBUnlQgkrgYcn4C6BBIKgsyMnoNAMmG1aFQ5Lidn36ucPW0VGTRrHFfcEVNCy9Dov8H
	jb4mRtKEw2vvvpS9kO75FCb77k8IamVwdYjqvCdnTifM1O4VYfZUV+eB6AUf/MHQSF2JSiHgl1/
	iXcW6ZLKOhbsfB/d2lgUDBqnOA2TfYddtEPLftqN9FobaUI8d+0VhNSgHkaNRpM0JkI
X-Google-Smtp-Source: AGHT+IGshkG9OIG1LcK7+ITFx82jXeFu0RCBTWszC/GeEm+iNWkEZCqMd0w54WVkq/Ok7uWsEjBmuRSK5/xDmSViJXs=
X-Received: by 2002:a05:6402:5414:b0:63e:405d:579c with SMTP id
 4fb4d7f45d1cf-645546946edmr8066481a12.29.1763927027448; Sun, 23 Nov 2025
 11:43:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-12-pasha.tatashin@soleen.com> <aSMoRRtanMkHo9Tr@kernel.org>
In-Reply-To: <aSMoRRtanMkHo9Tr@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 14:43:11 -0500
X-Gm-Features: AWmQ_bk6KdHNR7OHR5DSXBcEBpbGAclOQVNeD6WPZt65m_AQR-D_Xk2E-EHVSsU
Message-ID: <CA+CK2bAVNed-biqAnyMySPuDkQQZPFnWp96vdm0ewVS20H2-Zw@mail.gmail.com>
Subject: Re: [PATCH v7 11/22] mm: shmem: allow freezing inode mapping
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

On Sun, Nov 23, 2025 at 10:29=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Sat, Nov 22, 2025 at 05:23:38PM -0500, Pasha Tatashin wrote:
> > From: Pratyush Yadav <ptyadav@amazon.de>
> >
> > To prepare a shmem inode for live update, its index -> folio mappings
> > must be serialized. Once the mappings are serialized, they cannot chang=
e
> > since it would cause the serialized data to become inconsistent. This
> > can be done by pinning the folios to avoid migration, and by making sur=
e
> > no folios can be added to or removed from the inode.
> >
> > While mechanisms to pin folios already exist, the only way to stop
> > folios being added or removed are the grow and shrink file seals. But
> > file seals come with their own semantics, one of which is that they
> > can't be removed. This doesn't work with liveupdate since it can be
> > cancelled or error out, which would need the seals to be removed and th=
e
> > file's normal functionality to be restored.
> >
> > Introduce SHMEM_F_MAPPING_FROZEN to indicate this instead. It is
> > internal to shmem and is not directly exposed to userspace. It function=
s
> > similar to F_SEAL_GROW | F_SEAL_SHRINK, but additionally disallows hole
> > punching, and can be removed.
> >
> > Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  include/linux/shmem_fs.h | 17 +++++++++++++++++
> >  mm/shmem.c               | 19 ++++++++++++++++---
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> > index 650874b400b5..d34a64eafe60 100644
> > --- a/include/linux/shmem_fs.h
> > +++ b/include/linux/shmem_fs.h
> > @@ -24,6 +24,14 @@ struct swap_iocb;
> >  #define SHMEM_F_NORESERVE    BIT(0)
> >  /* Disallow swapping. */
> >  #define SHMEM_F_LOCKED               BIT(1)
> > +/*
> > + * Disallow growing, shrinking, or hole punching in the inode. Combine=
d with
> > + * folio pinning, makes sure the inode's mapping stays fixed.
> > + *
> > + * In some ways similar to F_SEAL_GROW | F_SEAL_SHRINK, but can be rem=
oved and
> > + * isn't directly visible to userspace.
> > + */
> > +#define SHMEM_F_MAPPING_FROZEN       BIT(2)
> >
> >  struct shmem_inode_info {
> >       spinlock_t              lock;
> > @@ -186,6 +194,15 @@ static inline bool shmem_file(struct file *file)
> >       return shmem_mapping(file->f_mapping);
> >  }
> >
> > +/* Must be called with inode lock taken exclusive. */
> > +static inline void shmem_freeze(struct inode *inode, bool freeze)
> > +{
> > +     if (freeze)
> > +             SHMEM_I(inode)->flags |=3D SHMEM_F_MAPPING_FROZEN;
> > +     else
> > +             SHMEM_I(inode)->flags &=3D ~SHMEM_F_MAPPING_FROZEN;
> > +}
> > +
> >  /*
> >   * If fallocate(FALLOC_FL_KEEP_SIZE) has been used, there may be pages
> >   * beyond i_size's notion of EOF, which fallocate has committed to res=
erving:
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index 1d5036dec08a..cb74a5d202ac 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -1292,9 +1292,13 @@ static int shmem_setattr(struct mnt_idmap *idmap=
,
> >               loff_t newsize =3D attr->ia_size;
> >
> >               /* protected by i_rwsem */
> > -             if ((newsize < oldsize && (info->seals & F_SEAL_SHRINK)) =
||
> > -                 (newsize > oldsize && (info->seals & F_SEAL_GROW)))
> > -                     return -EPERM;
> > +             if (newsize !=3D oldsize) {
> > +                     if (info->flags & SHMEM_F_MAPPING_FROZEN)
> > +                             return -EPERM;
> > +                     if ((newsize < oldsize && (info->seals & F_SEAL_S=
HRINK)) ||
> > +                         (newsize > oldsize && (info->seals & F_SEAL_G=
ROW)))
> > +                             return -EPERM;
> > +             }
> >
> >               if (newsize !=3D oldsize) {
>
> I'd stick
>
>                         if (info->flags & SHMEM_F_MAPPING_FROZEN)
>                                 return -EPERM;
>
> here and leave the seals check alone.

Done.

>
> Other than than
>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks.

>
> --
> Sincerely yours,
> Mike.
