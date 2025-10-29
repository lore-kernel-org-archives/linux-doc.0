Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2B31985C
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761772696; cv=none; b=a8zbfYvZTOfRsjN4Z5HA7I3ouV8/C2f5bX4fTHnv2GGJ6ETIQj4/Y1dpySN84QPeJrZ68Ea1Ksfma1d23A4Nws07rva9rwK1lxxYydRLuVJihKpbGP5jaO28oosOOloIMQeu6MOmRjPb4i/6zTiNltoj7qAhL+qHuJxwOQy5UJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761772696; c=relaxed/simple;
	bh=Yx7YCqrIwLLNoev+bUFlTb0b8ZV7lL4i+OuQquokGLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByHxztHTRb+iKX9xwlfVS+QntF7mFMJjVm62hOqDCkYgJmEusRzwPxoe7J5gxcabU56p5L+gxpj52/1i2Ll8++4P8BpsnZAKuJxOiSLCHFHUwPqciJnnUm8Qz7MzwR+XBzcBbecOZCF/2JLVM3tF+x7HaBUlcBjDBuHEUMJ2zLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=OrXIMLKk; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="OrXIMLKk"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d402422c2so68823966b.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761772693; x=1762377493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx7YCqrIwLLNoev+bUFlTb0b8ZV7lL4i+OuQquokGLc=;
        b=OrXIMLKkrp7DfkKf8u5C371FaFZkrQnQpAtJ1FNMIk1D4mU4QcnKvL7dcxblcbfQnS
         UMXdkavb/z2j9k9Ut7V0md2e+izDzctO7rasupE/dMr3NFmxXlxHPFv7XGElk30pyf+n
         /CnkKAOldLUP9HfUHGiC7OK+FYVWIodeoqTTZDu514FANVQ3kv7HLKGRbKf68egNqmNu
         cd+RWoHY6rh5fUoUT51ht2UvIiimO19Jb1psh1ftMrb7zNeSxGVrulB9+fAQAnEngObK
         80bRf16Nze9ejWTWOsjsAFiSsAahUzmcX43wAnMli6sXPCsMuNn0V4g+G8ljys477+Cy
         ZguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761772693; x=1762377493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx7YCqrIwLLNoev+bUFlTb0b8ZV7lL4i+OuQquokGLc=;
        b=KvZXQ15JX8E2BgmEyu4XxBbByanpPjUvYYOTP1Bd5fhIVAPvbeYU6QXLUpLHZsKURq
         h8KYSj81jrn1+xSixkXd+BgGyjXErwMjXPDWAM4WzQkLcSRqW8mRPSw6sk5xpQOS8GPL
         3zWjy6kXF1REJQ6BB2wzILwuLDceE0QmLojJUeIde/UxJ/SuMZrntJHlhWrR9J4c1ZJ1
         XrTROIutYdWNeCSNnMf9fGP2WY8oaIFXuj7JAYZlVW91tiTzGfcQfQdljMNIHSPP3OKk
         ZqNxZ2q7VymacjH8taIeFidiEnwsk0llvx/jsSJ0YF/EClBEBtn2YK6yKB2k9Ni1Gw76
         1aZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe4DvvVeydrfivKqzB8hraEBPiv9F1vMjrt6yI5vtjdduaN8ozQ/HeirL/UHsgjv+XVu00+u+WaNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UaZhv7eNCylLnmAb8GURIUsdxNON8N9VUKvRp9d20+fmEe16
	9R0z9BQS1k+as3OSx9SnlHrzwZbOpF6YhXy3sJwNjO2OKchXPZXIx1BcPTrmDc+a61+wR5YhDwQ
	wbw6WDLFCP5klPRu3SvGMKJWlc7EnFdatFiPMSebxwQ==
X-Gm-Gg: ASbGncspNunKYHi3PvyxT/3CjPWRuOGPAp7F8OY2eLpiLmNS06VhuLvNaMWTc3Yqiim
	5xhjJkvDfLnO8HIcas/5iK1gPqo+8IB7A2hA2f8FfTQSJC0v1cf+50x8UTH2l5SLB2dq1A65Pap
	ijHItiinzfjiBPqeWqbYLZEe458IfWI+Sd2wH9LH+IEqH2vLuBU5W5X6PCZ657AsxAx1wk+pxmZ
	6HwujF7ojG3DHaxY+FlDhO0tbfUoxRWBWJ2iHym2NDNpnZuiesNUso3cA==
X-Google-Smtp-Source: AGHT+IFiSSmBV0jU0Ss8+B5QBA6lJtv5vF8blJP/ha+JWFJmpNgyZxdpZA+HlfE38+Jb0bhjX5O65LmIxIHlrRfKiu4=
X-Received: by 2002:a17:907:9721:b0:b3f:f207:b755 with SMTP id
 a640c23a62f3a-b7053b2a721mr51136966b.6.1761772692799; Wed, 29 Oct 2025
 14:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-15-pasha.tatashin@soleen.com> <mafs0tszhcyrw.fsf@kernel.org>
 <CA+CK2bBVSX26TKwgLkXCDop5u3e9McH3sQMascT47ZwwrwraOw@mail.gmail.com> <CALzav=frK48c1=nsbVJ4EvqqOqr33pUArP4G17su0hxOYveALw@mail.gmail.com>
In-Reply-To: <CALzav=frK48c1=nsbVJ4EvqqOqr33pUArP4G17su0hxOYveALw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 29 Oct 2025 17:17:35 -0400
X-Gm-Features: AWmQ_bn6VS1Xxu1QPUMyT4niSsaGvQIJZtr8QMKM1ksd66d84DVSx7b_KujGEQk
Message-ID: <CA+CK2bDUDryK6xZt5u-cMv+eR8ZWC82Phu9F2fS8DMnac5ritg@mail.gmail.com>
Subject: Re: [PATCH v4 14/30] liveupdate: luo_session: Add ioctls for file
 preservation and state management
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
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
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org, 
	steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 5:13=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Oct 29, 2025 at 1:13=E2=80=AFPM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
>
> > Simplified uAPI Proposal
> > The simplest uAPI would look like this:
> > IOCTLs on /dev/liveupdate (to create and retrieve session FDs):
> > LIVEUPDATE_IOCTL_CREATE_SESSION
> > LIVEUPDATE_IOCTL_RETRIEVE_SESSION
>
> > - If everything succeeds, the session becomes an empty "outgoing"
> > session. It can then be closed and discarded or reused for the next
> > live update by preserving new FDs into it.
>
> I think it would be useful to cleanly separate incoming and outgoing
> sessions. The only way to get an outgoing session is with
> LIVEUPDATE_IOCTL_CREATE_SESSION. Incoming sessions can be retrieved
> with LIVEUPDATE_IOCTL_RETRIEVE_SESSION.
>
> It is fine and expected for incoming and outgoing sessions to have the
> same name. But they are different sessions. This way, the kernel can
> easily keep track of incoming and outgoing sessions separately, and
> there is not need to "transition" and session from incoming to
> outgoing.

Yes, good idea, I was thinking of recycling finished and empty
sessions, but it will only add complications.

Pasha
