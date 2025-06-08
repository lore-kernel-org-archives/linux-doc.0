Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91A171D2
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 13:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749390596; cv=none; b=TeQXVPA98/CnH4LRYkFnd47kf2a2gjvglzwUBfTFnjyGpU0NxyK2B37wBkoDa0lOG7P7kV++bz4ki6TVWLZoRs1YdPXZ6UqzfM4F8S1SM25oh020ap328PaP0MNLLYCYDPaJSqVJkDPS9yA+d4wK31PCojc59PYBvExfcXiCfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749390596; c=relaxed/simple;
	bh=y6JmwckEqgiW/QsqsF9yxQ8WonK0AHTU03NDtwyJasA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqUQmN20fE3+IzXmwwNIHkt3+rsI+hx8DQRKOTf3ZZXOC1gBlAI6Z17cSq9Wak0ZmsrnaEt/8lNGDqWKTM9PqUpPSIYH/dN7ZQnktVQ4INrpEAs0XPtdDvcyLplu2a/YXy205fIuXaj/20LyDeCE4YdEhslrhvgO3/TCAOG4aD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=S2Zf8Avt; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="S2Zf8Avt"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a58c2430edso38946911cf.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749390592; x=1749995392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hF+6UtRohKpdwZ1oZTfYRlxr9mBlwqZ6G0URvhQTB4=;
        b=S2Zf8Avta8J2h4PUBPVM2zBAyQnAqqselXBu39w5p5n9oVOL1Avumoiw28D8POh+4u
         asZ7vKL30bjWyzg5gVjSfSBHEP8dpymY+VW2r24XZTzLqi7L9aNwvUSxV8xCAxxQpA4f
         Cvmfo0IsvDuGZ37Z2+5YH6nvvPwMqmezbabsO04HI/yPOE2bC8qji4wG2vSFUS5uTVTY
         un8r3XtLZjPpR0TCvxR4c8TJIlPOOPpAKFhKEFwWUd4zzh2iCsged/rBATx5RreRtLvr
         czu5wg+BZEav/Lh8QHX6D0MmKyAWbUkpaks2Myl5I/D6aMxdbGrlV8Shb6cz9+7pG8xZ
         FHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749390592; x=1749995392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hF+6UtRohKpdwZ1oZTfYRlxr9mBlwqZ6G0URvhQTB4=;
        b=GSVmyJtLIEFXBGmw3ly2Qgl/LMduAUWsNQRE7Kmq17yS6vsGBu1rZMZII9C+IN+7ga
         kYw2dw2D/Zvyro9szvkksfefMwMetroOsxpgkvxacH4eFgtVtMLbJqYKaDL1Dr3wB3nA
         Zlvylufs2WGRg4PtrydWkv3JuoL0OycSJF3rzcy9MvKkQs33npEn+a2Z/uUqzvvuv1j0
         fHwEvhOYi+ziDc5d7661++Sji3FWpHUTKkV+/AABQsiSGT/YV9KhD7hvuRwkLLqhgLUz
         82kQWzl/O9j72Z4QpN4YBCZqPwM+VzBUBU19jLdKgY+saU00220Hfm3/gwZT+MNYqRVE
         5ZDw==
X-Forwarded-Encrypted: i=1; AJvYcCVQxSnM5v058viaEfYF+XM2LuyRs0Dm99z1JKY1ahrKgNqmuw6M57P6tzdXRSnA2BJ3cVF64qe50U0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2kDfqfdYwb6SCV5GfslE9AWD3S9elVD8J4cWE/9yWn60isPPs
	NvbaDoQN4jhLHrtfS/sx3RQYCBpaGk/WYQiXJUxg5R53zv6nBtKnab76DLfnFy2z6EDz+c+nEcP
	dF1oPqH2faPuqjy5a1Mb2YllbsmyppJT66euatYTIeA==
X-Gm-Gg: ASbGnct5wWSBVtIM5Iua22t7TdWLhUWJY+rqLDFg+VSiRS9cG0V3YPEAe1O6r1ZdVzZ
	g7WCsJBcOzF/BeABJXb+KlgOqQJXUn3Ef7o6gCUYg6BLhNva0U/s+ddbfUDIa03R95kDow8iZkk
	Y3ooVBNtNp0NQd5yJskE6IQhFWeJqmQA==
X-Google-Smtp-Source: AGHT+IGaVOqjIzAB561vdH5Hbbg07f5eH4frJqvp4egHE/9NCFYNrscEPGV/Tobtkh4P8BLSDloZ7s9mOifSf/ln61U=
X-Received: by 2002:a05:622a:5a0f:b0:4a5:a598:bd8d with SMTP id
 d75a77b69052e-4a5ba9952c4mr182042171cf.0.1749390592477; Sun, 08 Jun 2025
 06:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-10-pasha.tatashin@soleen.com> <mafs0y0u6rx8y.fsf@kernel.org>
In-Reply-To: <mafs0y0u6rx8y.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 09:49:15 -0400
X-Gm-Features: AX0GCFsi4mFrjkMNphkUTbPiCT0VoL7ft4Nnhm6lamBfB757JhUYg6mKdNCbvJk
Message-ID: <CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Implements the core logic within luo_files.c to invoke the prepare,
> > reboot, finish, and cancel callbacks for preserved file instances,
> > replacing the previous stub implementations. It also handles
> > the persistence and retrieval of the u64 data payload associated with
> > each file via the LUO FDT.
> >
> > This completes the core mechanism enabling registered filesystem
> > handlers to actively manage file state across the live update
> > transition using the LUO framework.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++++-
> >  1 file changed, 103 insertions(+), 2 deletions(-)
> >
> [...]
> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
> >   */
> >  int luo_do_files_freeze_calls(void)
> >  {
> > -     return 0;
> > +     unsigned long token;
> > +     struct luo_file *h;
> > +     int ret;
> > +
> > +     xa_for_each(&luo_files_xa_out, token, h) {
>
> Should we also ensure at this point that there are no open handles to
> this file? How else would a file system ensure the file is in quiescent
> state to do its final serialization?

Do you mean check refcnt here? If so, this is a good idea, but first
we need to implement the lifecycle of liveupdate agent correctectly,
where owner of FD must survive through entering into reboot() with
/dev/liveupdate still open.

> This conflicts with my suggestion to have freeze callbacks never fail,
> but now that I think of it, this is also important, so maybe we have to
> live with freeze that can fail.
>
> > +             if (h->fs->freeze) {
> > +                     ret =3D h->fs->freeze(h->file, h->fs->arg,
> > +                                         &h->private_data);
> > +                     if (ret < 0) {
> > +                             pr_err("Freeze callback failed for file t=
oken %#0llx handler '%s' [%d]\n",
> > +                                    (u64)token, h->fs->compatible, ret=
);
> > +                             __luo_do_files_cancel_calls(h);
> > +
> > +                             return ret;
> > +                     }
> > +             }
> > +     }
> > +
> > +     ret =3D luo_files_commit_data_to_fdt();
> > +     if (ret)
> > +             __luo_do_files_cancel_calls(NULL);
> > +
> > +     return ret;
> >  }
> >
> >  /**
> > @@ -316,7 +402,20 @@ int luo_do_files_freeze_calls(void)
> >   */
> >  void luo_do_files_finish_calls(void)
> >  {
> > +     unsigned long token;
> > +     struct luo_file *h;
> > +
> >       luo_files_recreate_luo_files_xa_in();
> > +     xa_for_each(&luo_files_xa_in, token, h) {
> > +             mutex_lock(&h->mutex);
> > +             if (h->state =3D=3D LIVEUPDATE_STATE_UPDATED && h->fs->fi=
nish) {
> > +                     h->fs->finish(h->file, h->fs->arg,
> > +                                   h->private_data,
> > +                                   h->reclaimed);
> > +                     h->state =3D LIVEUPDATE_STATE_NORMAL;
> > +             }
> > +             mutex_unlock(&h->mutex);
> > +     }
>
> We can also clean up luo_files_xa_in at this point, right?

Yes, we can.

Thank you,
Pasha

>
> >  }
> >
> >  /**
> > @@ -330,6 +429,8 @@ void luo_do_files_finish_calls(void)
> >   */
> >  void luo_do_files_cancel_calls(void)
> >  {
> > +     __luo_do_files_cancel_calls(NULL);
> > +     luo_files_commit_data_to_fdt();
> >  }
> >
> >  /**
>
> --
> Regards,
> Pratyush Yadav
