Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C302306B0D
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129431; cv=none; b=gAS4erFXQYtw1kE7osN2gem9rQuql8d4gkJB3pIoYWC12pdn2JjMhqRqnslXIfja5Qt+8ZGrYbEgvCpYkIk4axcnB5oOmRH1vfedhGruTOxqxsdmYR+Fxf5dNxUOnvxaO67OCQOglPjd0h96o06CA2ZeU1GSsyO9k2VFxFzijyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129431; c=relaxed/simple;
	bh=KE+QPebTvEqbnMKEXMooGer5jwtRyU8fzyKcLQ4mw/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u207lcXHmCEe2mNKnczfZqOR4PM/tgKbDyvlM839xT/dbapzGaNh/NN15FdCZQNVTe5277B1I7LUfqjwqlX1VR3UDgh/wx25w0tng0yFcMnjEReWl7zz8XwR9a0xHkNfm3tFU0gfYxdRgx29kobwnYHuCcCaUs+2Ag67lRnw5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Lesn+N1+; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Lesn+N1+"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b736d883ac4so115403766b.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 06:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763129424; x=1763734224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUyLyvVVKlFsH483G8ekZl8QKBp07gDZblbUWMC1jGk=;
        b=Lesn+N1+up0vOeI4VPrJ65CHM+HZS4l9BYFpy+ZAGPoMWIoEfa6AplEKNUMCfh3Y37
         WmFW/0RoPrO3YvGhKscMCFM2KozG+YG7ahcyjRq6gmfBazKAab0s1k+UwTubXS0Qqszm
         j42DCKbj75VSzhxFQGSY7KgO6sbnhjggb2eHqbgQ4oMQu4SrtK+qMRgqSWroQVYN6ulQ
         Vk2CqF6Z30kY9x+9KFwmhCo2yyDlV1+p/SmFy8PeQ7Je6AqaF2B/cJvPBsDK+46u25W4
         BpgwKUeZoUNilxvaR+miAbWjM4PVemAFtVhk31u1W4/aI6gw1890X4xbh9vyCYA6J+9V
         SEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129424; x=1763734224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wUyLyvVVKlFsH483G8ekZl8QKBp07gDZblbUWMC1jGk=;
        b=dICfDCMJ/U+px2k7jPB/fvBWe1KpbJKv8/+CbF0SwnwVUjgQ2mrYpBu7CpfrsV/Oyi
         qiEOoUUXZVxekIsZplPI65kGDAA8UMPckjLxXaxp3mtuoHEzxJC/eOeyeF7O1Eo2on0w
         BXTfAurl1UqJ80Tdga6CplOo3jSIDIID0qi0+DQyrHwLUayy4EqcvPiOLkaYp2Z0T36z
         Ac9fX3neuKnYEJz6jevy297QctUwTn5IfIn1ZQdkWD7d1Rq9o9gtrmxEntTMrdk1MG5l
         nMwQR9soIIMqBO0dySMTxF5QJs8kwWLsrtzMmsoZCH0jN+w6qwop7q7i7MeOiYOSiv4C
         OR5w==
X-Forwarded-Encrypted: i=1; AJvYcCWnnpkqIqvm8qxPmLxHD7qQCgHQLYsX82ktUnlDe3bYlbWg8kOaItJhKk7OoiTk3MGkjUg3oGLPuLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJqUU3lLtlqb22AB5EOKSNEsCERrPZTqnvGxwYxpwoKypDj9A
	d+dM4nS8vUfAif1yeuDZylBMqRlHzzZ/IWWHb9EqCCw/m8GuZfQ9FvUx5iKCHxIcpVTWtgJAbw+
	MSEZd7sFHEV2D1iSqC7e7TVTdFYOTcoKIkzpNOUuj6g==
X-Gm-Gg: ASbGncuNDwgMqcYAivQh/WaUU8pjGslitunB7baF86kAjzg4rg2iYyyLH5NLTLdFW5g
	wQbI+uFoPOznZ1/tIgDIAF4NUA4nN7caeLlFdraSQ46B8zsXj2oAvJzjnQoGRGQRWrpdob25uYn
	e6NAVpLddMme+INkbXyc/fy4TpUEE8/mE93f4WrsnSXKv9PVGpJLGvOmBhZqRVLoVJPgx+OfKQY
	eop40y23QYMe/CHfGyGqPBOQBMyTa2j1WSDs0wzJacAgJggPvS8jHk3fuoQLmOSCCl3
X-Google-Smtp-Source: AGHT+IHfDqjVq2HQlgOvTYSXDolFUyeHkC2njHwkXXlWNiYY2vI3dgM9DBu5caW7N/gKzWP7vOw7EXXGJJQDhW4sn3w=
X-Received: by 2002:a17:906:6601:b0:b73:6998:7bcd with SMTP id
 a640c23a62f3a-b7369987d82mr195682366b.23.1763129424454; Fri, 14 Nov 2025
 06:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
 <20251107210526.257742-8-pasha.tatashin@soleen.com> <aRcnRFnqhm3jkqd3@kernel.org>
In-Reply-To: <aRcnRFnqhm3jkqd3@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 14 Nov 2025 09:09:48 -0500
X-Gm-Features: AWmQ_bkHcsPKYBwcaJBkDElGfbsE2VmqDOwwNe9Hzx_22lS14GpcHvhkYld0Zm8
Message-ID: <CA+CK2bCO=Hu0a4P5-_a4QrOSdKLR7OXEk=Nsz-p6TvjEHV9rwQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/22] liveupdate: luo_ioctl: add user interface
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 7:58=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Fri, Nov 07, 2025 at 04:03:05PM -0500, Pasha Tatashin wrote:
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
> > ---
> >  include/uapi/linux/liveupdate.h  |  64 ++++++++++++
> >  kernel/liveupdate/luo_internal.h |  21 ++++
> >  kernel/liveupdate/luo_ioctl.c    | 173 +++++++++++++++++++++++++++++++
> >  3 files changed, 258 insertions(+)
>
> ...
>
> > +static int luo_ioctl_create_session(struct luo_ucmd *ucmd)
> > +{
> > +     struct liveupdate_ioctl_create_session *argp =3D ucmd->cmd;
> > +     struct file *file;
> > +     int ret;
> > +
> > +     argp->fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (argp->fd < 0)
> > +             return argp->fd;
> > +
> > +     ret =3D luo_session_create(argp->name, &file);
> > +     if (ret)
>
>                 put_unused_fd(fd) ?

Yes, thank you.

>
> > +             return ret;
> > +
> > +     ret =3D luo_ucmd_respond(ucmd, sizeof(*argp));
> > +     if (ret) {
> > +             fput(file);
> > +             put_unused_fd(argp->fd);
> > +             return ret;
> > +     }
>
> I think that using gotos for error handling is more appropriate here.

Sure, I will do that

>
> > +
> > +     fd_install(argp->fd, file);
> > +
> > +     return 0;
> > +}
> > +
> > +static int luo_ioctl_retrieve_session(struct luo_ucmd *ucmd)
> > +{
> > +     struct liveupdate_ioctl_retrieve_session *argp =3D ucmd->cmd;
> > +     struct file *file;
> > +     int ret;
> > +
> > +     argp->fd =3D get_unused_fd_flags(O_CLOEXEC);
> > +     if (argp->fd < 0)
> > +             return argp->fd;
> > +
> > +     ret =3D luo_session_retrieve(argp->name, &file);
> > +     if (ret < 0) {
> > +             put_unused_fd(argp->fd);
> > +
> > +             return ret;
> > +     }
> > +
> > +     ret =3D luo_ucmd_respond(ucmd, sizeof(*argp));
> > +     if (ret) {
> > +             fput(file);
> > +             put_unused_fd(argp->fd);
> > +             return ret;
> > +     }
>
> and here.

Sure

>
> > +
> > +     fd_install(argp->fd, file);
> > +
> > +     return 0;
> > +}
> > +
>
> --
> Sincerely yours,
> Mike.
