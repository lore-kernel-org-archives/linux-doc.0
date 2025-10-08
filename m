Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4A29DB6C
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759893520; cv=none; b=u2LbQzNbtOylWG0S4f+FgpXL2W9iLiytyheHXm0R4s0GapYmJpgAp20ivyp5lY68LVJO6ZUOchwqb5DlPJiaX5s1URnrRJ0kkxDYN4sNCBTBAFKEzWNbXrGLQ2SYQ+mWprxLdlRg9IV+TsR7hTUo7/NFiEJZJ0G/5uy4HhkEmFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759893520; c=relaxed/simple;
	bh=+hXmjhJrc1AsQDJZpmLt5t2ooX8ihStyJCzyeD0j9RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3EsrG/bbYAwcKI0+70nXduWpVpftFLunWp3N6O1MsGKkovquKVqZkQ0zjxE3UMaE8+5ubx17vgGnoAiBGoNdPu8MAbDwBDhdb5+6QZpLPMGyDVrfXE3h+MwN2IgXecH9WmqOQT4cwKX3eLGcaLkQdec41EOPEb2n17aEk/jaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Kjk2kRln; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Kjk2kRln"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4de659d5a06so40140531cf.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 20:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759893517; x=1760498317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lY0lHDo+ZMYjiI3WrpH7eJfFGmGqKDcMD4+kuNAqXa4=;
        b=Kjk2kRlnqv+0OnTCFTrOLGULG4/A4UN/ORNPVqnbLKMBR+iTAg4mCoW3XBItBLXs2o
         wQBpn+3lcMIv8E5PB4oIzvoHjVIyNre5yv5BbQuf4GN6jhL9VE+PcJNoBANAJdMbbgRb
         ZVpdYZZRJBCov2o5Aw/iYGfHSyHd2EIOT6RtKvwkY0OeDHYkVxFrPkJ/s4WVZoyMY4Ir
         aRzQPAxOip/x465PUt3MopBPhKHk162XTovvIrEdoBYpxWBh/q4KzoS8dCtfStlcFAk3
         NiIsyl2zd4u8VMB1y+XfT9bHCIHURuduX+VRX/ij0t5HvP0g7J7N1AePHnZgWFB9cQsw
         G2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759893517; x=1760498317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lY0lHDo+ZMYjiI3WrpH7eJfFGmGqKDcMD4+kuNAqXa4=;
        b=Kqg+5TeyB8R6C6Tagul3UlHiMATKM/60Z9uFAf3rB4HNOUZfBWdg92B4PzKTSsBZhM
         5B8tQJqHKts6N1IWiEoBfKj1d3RLI3a0UerKgoA2kElyslXkTX8CNzHP1fo23KPp9WXr
         +8Cjq3m7LQR999ciri5mbBBrlu91JsFreLi083st8nOkK2paWWypsFk2Sl8x//ublan/
         k/lsbWQGEZohikqEgBPlUFXmIdAY5omg0N57AG0XnKUrM1Y2QxJkcN17VTOoFFD3OoSW
         XOlwyIriKv9//917U7wzG8ReBkv48jMVKnaIqSbNJ3LNsyf04LHA7R/K3zlJGCFKRo3d
         5Sig==
X-Forwarded-Encrypted: i=1; AJvYcCUiOM5ClQ4Z1MI7229Kwa0EWMVdr+7h8cwY5U8vekciWrnSQ6nnI8pB/6sEFSCMqCgMvd2PfZqFM0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuW9tbTfXdDuX9fMqJTP5h7tVDoYX5Db0OvAaQGEGldubVsYa
	LAl3CdF3Eq85WkLj4295JW42udyvyKcWgpyV9+iMPcxM57NEX2BLrczSNmT84S61UNFEoMuhpgm
	D9bUrQjhZihOUVNyNRjrtApbmMd2IDRyZJpiqHy2h1w==
X-Gm-Gg: ASbGnctpidQIhSrA7ql3J9cTmOKGN37DMlRRYZw4A3cX+hToQ8tRws5qVepjkvwtg4x
	oLwXkC6XG8ZIqP/AQOs3K7hmL+XjIgg66/fNPakt1G8AkllWQ0TCNuIoT2S6dTm3teBciaW86kl
	R68Yz4IABBkX2h9SUF0P6AZLEv/EeI7ZIRHVxN6tgTmdE6mO3e6zVpJ+6q3ChJt+dL7S+gNc1b0
	lY0+ZA9rLMorR7fiFHdMrIoFPyX
X-Google-Smtp-Source: AGHT+IHi4LrH7xm0oX6hym8jBnuijo8ZiVZrjt2jN+GojnDTB9cmqow/7uayxXgJT25O+sPIp9pbSmcuL9HcK/iT90o=
X-Received: by 2002:ac8:5885:0:b0:4b7:9581:a211 with SMTP id
 d75a77b69052e-4e6eace7e6cmr26859261cf.24.1759893516637; Tue, 07 Oct 2025
 20:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <CA+CK2bB+RdapsozPHe84MP4NVSPLo6vje5hji5MKSg8L6ViAbw@mail.gmail.com> <20251007175038.GB3474167@nvidia.com>
In-Reply-To: <20251007175038.GB3474167@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 7 Oct 2025 23:18:00 -0400
X-Gm-Features: AS18NWDS3Ynl4RAV12cPYQQtkZzPk1WVwFfWilu_AD9DNETBUGP8gManlWckAdM
Message-ID: <CA+CK2bAS5ZSV8xE4OpP+fWUvmmv1TcW57YB5Stk1dDZ28DiuNA@mail.gmail.com>
Subject: Re: [PATCH v4 00/30] Live Update Orchestrator
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
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
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org, steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 1:50=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Tue, Oct 07, 2025 at 01:10:30PM -0400, Pasha Tatashin wrote:
> >
> > 1. Add three more callbacks to liveupdate_file_ops:
> > /*
> >  * Optional. Called by LUO during first get global state call.
> >  * The handler should allocate/KHO preserve its global state object and=
 return a
> >  * pointer to it via 'obj'. It must also provide a u64 handle (e.g., a =
physical
> >  * address of preserved memory) via 'data_handle' that LUO will save.
> >  * Return: 0 on success.
> >  */
> > int (*global_state_create)(struct liveupdate_file_handler *h,
> >                            void **obj, u64 *data_handle);
> >
> > /*
> >  * Optional. Called by LUO in the new kernel
> >  * before the first access to the global state. The handler receives
> >  * the preserved u64 data_handle and should use it to reconstruct its
> >  * global state object, returning a pointer to it via 'obj'.
> >  * Return: 0 on success.
> >  */
> > int (*global_state_restore)(struct liveupdate_file_handler *h,
> >                             u64 data_handle, void **obj);
>
> It shouldn't be a "push" like this. Everything has a certain logical poin=
t
> when it will need the luo data, it should be coded to 'pull' the data
> right at that point.

It is not pushed, this callback is done automatically on the first
call liveupdate_fh_global_state_lock() in the new kernel, so exactly,
when a user tries to access the global data, it is restored from KHO
for the user to be able to access it via a normal pointer.

> > /*
> >  * Optional. Called by LUO after the last
> >  * file for this handler is unpreserved or finished. The handler
> >  * must free its global state object and any associated resources.
> >  */
> > void (*global_state_destroy)(struct liveupdate_file_handler *h, void *o=
bj);
>
> I'm not sure a callback here is a good idea, the users are synchronous
> at early boot, they should get their data and immediately process it
> within the context of the caller. A 'unpack' callback does not seem so
> useful to me.

This callback is also automatic, it is called only once the last FD is
finished, and LUO has no FDs for this file handler, so the global
state can be properly freed. There is no unpack here.

>
> > The get/put global state data:
> >
> > /* Get and lock the data with file_handler scoped lock */
> > int liveupdate_fh_global_state_get(struct liveupdate_file_handler *h,
> >                                    void **obj);
> >
> > /* Unlock the data */
> > void liveupdate_fh_global_state_put(struct liveupdate_file_handler *h);
>
> Maybe lock/unlock if it is locking.

Sure, will name them:
liveupdate_fh_global_state_lock()
liveupdate_fh_global_state_unlock()

>
> It seems like a good direction overall. Really need to see how it
> works with some examples
>
> Jason
