Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D2258ED9
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404228; cv=none; b=m9NeFCh+fjNUdLP5/VotduyOkJ+A/ciiMDQl+j+t+0ewDy4OMdeuXvGVewtz8+1TGCjp11iXaLRVdG3hd0FDDu4ecF0NhokrMIaORt4PVeZUkgX4ar//yh3bEvMX7PuOyU4q8KSKtqUG5yrUYa9pU4VSIV+2luIjFBeZ/dEg8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404228; c=relaxed/simple;
	bh=XmGPnc3Nhnm1pE/IxNN2voQ/65Pq6bmkez9grZd7nic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gfHxARf1+BMWfGDjZJao6JMf1Nz4NcD8hBK97CX8Sp/lbmGiXIt02a7GoY4rhStzOmFo5Xo+DTh+6obK3Kb+qSvugyzYisPvWfNerDzYj9BK2uV4539tymaapeVh4A1e/wjIUItl0Z2YpCgaJ/cDJlU5lxtjCUPlAkaupHQNUH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=XQBhjdNm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XQBhjdNm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso7599391a12.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 10:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763404225; x=1764009025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo7Fpew4SCWgreWKkBa60zvQOZX9oGrQ6m1RkCiDUC0=;
        b=XQBhjdNm8mbkVN0tkxf1aaX9kmALdiA2V4APUS7DHQrvHclx6lcc8m7Et9wUGYcoKI
         7xvcriNTjyK4SOHajOKl9I+rQFutvt3f38qj9jcxe9wkcxmh1MwH6usB4A8ZCu9FaXFf
         /+Zu+vfKRIww2iioDFPLi8AlNVJ0JWKunRiUYUC8+EI4kS+jDsIoWeWs2MX8lo2sNlju
         c1GdqeCARWjYXtfoYmd+OkrBGdr30CcmwSSwKjbznkJnnG3d6FRRDvQuS6zh9z2Cpx0G
         o3hpo9e0hmPQK3Ah1hqPEbeFbLzfNPv1WxfNmD/E2lksTn31QuycufYZ/rhB7Cu1qzg+
         Sggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763404225; x=1764009025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mo7Fpew4SCWgreWKkBa60zvQOZX9oGrQ6m1RkCiDUC0=;
        b=dZW5tC0iYv92aMlW5k6zUy8G42ZHqVZeISX4tzZNfzyPBOj++7jvEGFAvgWkMisLdx
         ND+iIXO9kugJ6I1gwgWKwLzcDhO/zOHUL63quhXJFVwFNyxF1IjIN1zkf0lJ7wC8LmDQ
         JFcDwy1AiGFiZMDXD4ayoOr8WSyJhuTSr6tWEGD/F/YKm22w88DBmm/tevdlB6IRkWjs
         PzmhbE2f9nX43w3DebP4NB9Gkh2H7atymDoA5ls/25Ma8TMAHyi2/qdI41HnqicBkosW
         peODpr5772fti34HyeQAAlXoC8EOHoBvorN/g21K0vbpz4Hqr7HzaQ/1Yda+G73ky9CF
         a7fA==
X-Forwarded-Encrypted: i=1; AJvYcCUEFlpNwuGHABgLbFo1uXJqJ2FoSu61WNE15CoAZeLf88VpTk1efmjNOK0xEQAortUq8asQu1EVLwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0dZ0ezwjPP7SohDw/KapTHBkWBKzhsb2/lQQq31MX0vNzjUl8
	ZM3pSbXZ+6g6g2K9RruD7K/tLU8abIeo5HIN/CzhM5E1wrUVnmu0ekY/pkJDV3hTJ6CdJPHqeOF
	VfXl1Zp3SEAceiQJZpMldBTegtNMLIUwVcT7HYa/2lg==
X-Gm-Gg: ASbGnctL1djTT6yprI8zIHbxgihhJIyJAAK8QlULWufcjNfNaFG0k5oaslPSfrYJvVG
	YHmzMTKITHC7HeyRja9PrH21ntf5WN3G8dZ4f/iE8cQ89X5MnM+sZJvmUEgPKNe5LyvN0ujDUp0
	Jx6M8iF3kx9uTxw0hHiSspwNT0rV0nLeNE42OTMMiMy6GjwASiaNaU3EMaJs6EyhZhLZhMCAvLg
	b3IexRid13R3hUXF7O7IsP14ftJskIJBE+s4HCwEnroK1fQjSUa17LmkrmkompLyy6M
X-Google-Smtp-Source: AGHT+IGbft8Z+rAKPet8Z4NE8LDyUX4MgwKnPbmIzDODsbkkevdfT0+fNvskHAAOPS9NtBXhUCGNpo/Yz/tzbQHQBNw=
X-Received: by 2002:a05:6402:27c8:b0:641:8b4d:cc6f with SMTP id
 4fb4d7f45d1cf-64350e899b0mr11672843a12.23.1763404225103; Mon, 17 Nov 2025
 10:30:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-3-pasha.tatashin@soleen.com> <aRnG8wDSSAtkEI_z@kernel.org>
 <CA+CK2bDu2FdzyotSwBpGwQtiisv=3f6gC7DzOpebPCxmmpwMYw@mail.gmail.com> <aRoi-Pb8jnjaZp0X@kernel.org>
In-Reply-To: <aRoi-Pb8jnjaZp0X@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 13:29:47 -0500
X-Gm-Features: AWmQ_bmhhbDUMBKFxNnFMOPCeOApSAwekkwuL9HuN6ynW1cSRitKeGbWllXoez0
Message-ID: <CA+CK2bBEs2nr0TmsaV18S-xJTULkobYgv0sU9=RCdReiS0CbPQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/20] liveupdate: luo_core: integrate with KHO
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

On Sun, Nov 16, 2025 at 2:16=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Sun, Nov 16, 2025 at 09:55:30AM -0500, Pasha Tatashin wrote:
> > On Sun, Nov 16, 2025 at 7:43=E2=80=AFAM Mike Rapoport <rppt@kernel.org>=
 wrote:
> > >
> > > > +static int __init liveupdate_early_init(void)
> > > > +{
> > > > +     int err;
> > > > +
> > > > +     err =3D luo_early_startup();
> > > > +     if (err) {
> > > > +             pr_err("The incoming tree failed to initialize proper=
ly [%pe], disabling live update\n",
> > > > +                    ERR_PTR(err));
> > >
> > > How do we report this to the userspace?
> > > I think the decision what to do in this case belongs there. Even if i=
t's
> > > down to choosing between plain kexec and full reboot, it's still a po=
licy
> > > that should be implemented in userspace.
> >
> > I agree that policy belongs in userspace, and that is how we designed
> > it. In this specific failure case (ABI mismatch or corrupt FDT), the
> > preserved state is unrecoverable by the kernel. We cannot parse the
> > incoming data, so we cannot offer it to userspace.
> >
> > We report this state by not registering the /dev/liveupdate device.
> > When the userspace agent attempts to initialize, it receives ENOENT.
> > At that point, the agent exercises its policy:
> >
> > - Check dmesg for the specific error and report the failure to the
> > fleet control plane.
>
> Hmm, this is not nice. I think we still should register /dev/liveupdate a=
nd
> let userspace discover this error via /dev/liveupdate ABIs.

Not registering the device is the correct approach here for two reasons:

1. This follows the standard Linux driver pattern. If a driver fails
to initialize its underlying resources (hardware, firmware, or in this
case, the incoming FDT), it does not register a character device.
2. Registering a "zombie" device that exists solely to return errors
adds significant complexity. We would need to introduce a specific
"broken" state to the state machine and add checks to IOCTLs to reject
commands with a specific error code.

Pasha
