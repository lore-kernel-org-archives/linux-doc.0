Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B138FB9
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 00:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749082959; cv=none; b=k+8KmAk+Q37OWv0fFPKk/zDrghZrkPkjvhfkI2xagsBBq0yb9jcFgeDE0s09rPHeiwgNaC6LdCASXkEKF9K9/aoREBcqQLrbNpAOWYId2DK6vELtJHYLgzRxdCHhUFqULi68xgiEJ1Baw0ERkbf/XMQmK50/GszYfJN/SIVMKMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749082959; c=relaxed/simple;
	bh=EHGIjtXSnhVWuj8W3if9/kBeCWZOJPIXUzlkSSJrcv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZJ335HOGr0+zxT48ra9uVXcJ6ePrCiQ+0rOXbD3c804sCHQka8SVdx4qiuhJ7oCY+sB5IOVT10M+2CvTAiafj8CtQi+ClmwI6uNLkg/hw8RueffjOxIsT32Cb2b/v9cNhSUKoyfFGu8q8w6VRBGZDlonptnwg9gfq+yJTC+6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=angRW34m; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="angRW34m"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e75668006b9so474916276.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 17:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749082955; x=1749687755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvU2lNKxDYw6fCnyd5ZPbHAvFewoQW9WJ+3ogFjIWtk=;
        b=angRW34maqZe/QKfbCk3Do7iigii3Ko8VT9ZnKngh3DmBp1RdHjlMrzxNCpYx3btPo
         Us9B1J81+WK6n793fiBskFHl6csFL3B2D+FU6qVCrWDSPmcfTBcIXKTUZtum69yjh+nY
         Of3v7bbpU2xQTRIS2jmtZo5GKMOFhLS3sKkmJkIrn+tk6ug+TJGjKkR2hvNt3jqO2Wxp
         9EI5nJeG6HJ83fRKt9vZWvuttM+6/TOz7fjIuTC+a649gHOXQSLjlSnLRyvoqr7XeCdF
         7QTD5B7zL0/T+8/4ZTjTDMoYH7kScoFDxfMub74VFDkBmW11iox8P8tkCHYsaULR6KFm
         ZgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749082955; x=1749687755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvU2lNKxDYw6fCnyd5ZPbHAvFewoQW9WJ+3ogFjIWtk=;
        b=QP3pN2aE3F/y1Y+8C1ELfBrnRUuY64Q2fDO/3c0C3IDbCQrsZEJPvDQGElSeV2SitZ
         oR2vHTN/+zfjnW8lzm1vOu8fBYeutTvfgk6aK8+M+EcPgMCJQv5GJ5SU3x605RWzHj7M
         6J0loO/X9b7fBFBNBh8CvPqMPhWoealB8uLFDCxPsHru1fTu5dpIoG1nskKdn9IgYXjY
         oC3naGU7nVjCD5bIOiXRclt6L3YT0jCTdwC6scnJEXNiQmRb5MyJhdcB5PU3sbXD7nPU
         W4EF9Tgom5nD9FZyu2K+QI7VT0OH1WJEuxEB07BgSTWg/041ljOsOzKzFTlBFDVLXhbf
         RMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaUoV965T4G8gNvu9jaIzZEBSxAM8P6OpwXwAe6/F+E74Jm1n7/blmnXJPraSEM8Fksu4IIb9cEtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjlW+SBArSJY9kMmrFphswGRfWz0CuKoIapV71ztA6xV2Ip+ge
	ZDXdASueob9KWB834om4mm9138+XQrKWaOl8TcHrbzr3dIa8ozqolI9n6EDbVoZNo/XwQMCYykf
	HwqCDjvQyVmffbKb1Zbj6hz6vxOMWcye7wQoBDE4t
X-Gm-Gg: ASbGncuLjt74r58dlZTitggkNTX6ZCz28MOAj5bRmGd5Y4gdd+XIlHrA+WeE6w7GfgO
	Y2HmQm0bSZzRxrrUG6zftN4xPQUJcr1ysbpd3vZ5lJV+u9S26NR+kw7C0ik+fx2Jf1QOyXJuFUl
	DP+UwNspd/bPcTMASme2IXrMXb3Dj7sgG+lfil2A3wVXI=
X-Google-Smtp-Source: AGHT+IHyeD9vA1nF1N0CsN+xv6bObN3Il3RSVuQijJN0bEgczCU08xaJqqCrRvDKJkd53t1PwCS+M9kMdUmEej7JZRY=
X-Received: by 2002:a05:6902:18d0:b0:e7d:c87a:6249 with SMTP id
 3f1490d57ef6-e8179dbababmr7022769276.36.1749082955136; Wed, 04 Jun 2025
 17:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <SCYP152MB62612944AD5E282EE26871DDB063A@SCYP152MB6261.LAMP152.PROD.OUTLOOK.COM>
In-Reply-To: <SCYP152MB62612944AD5E282EE26871DDB063A@SCYP152MB6261.LAMP152.PROD.OUTLOOK.COM>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 Jun 2025 20:22:24 -0400
X-Gm-Features: AX0GCFvU4j5x9GEYGbLXyBKZlD9q6nwLVRHA0q2PfeW81xhSUMGxDfooZeZ462o
Message-ID: <CAHC9VhTcRP=7b3YAU+16twKX8jktDRAUyuzkn92O4ZVyPaTBxA@mail.gmail.com>
Subject: Re: PATCH 2/3] security: add Lilium - Linux Integrity Lock-In User
 Module - Documentation
To: =?UTF-8?B?4oSw8J2Tg/Cdk4/ihLQg4oSx8J2TivCdk4DihK8=?= <milesonerd@outlook.com>
Cc: "serge@hallyn.com" <serge@hallyn.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 9:07=E2=80=AFPM =E2=84=B0=F0=9D=93=83=F0=9D=93=8F=
=E2=84=B4 =E2=84=B1=F0=9D=93=8A=F0=9D=93=80=E2=84=AF <milesonerd@outlook.co=
m> wrote:
>
> From 23d323f793b888bb2ad0d2a7a1ca095d5d64d0b8 Mon Sep 17 00:00:00 2001
> From: Enzo Fuke <milesonerd@outlook.com>
> Date: Sun, 1 Jun 2025 00:11:36 +0000
> Subject: [PATCH] Lilium Documentation
>
> ---
>  Documentation/security/lilium.rst | 402 ++++++++++++++++++++++++++++++
>  1 file changed, 402 insertions(+)
>  create mode 100644 Documentation/security/lilium.rst
>
> diff --git a/Documentation/security/lilium.rst b/Documentation/security/l=
ilium.rst
> new file mode 100644
> index 0000000..bd25ff6
> --- /dev/null
> +++ b/Documentation/security/lilium.rst
> @@ -0,0 +1,402 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lilium (Linux Integrity Lock-In User Module)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Enzo Fuke
> +:Date: May 2025
> +:Version: 1.0
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Lilium (Linux Integrity Lock-In User Module) is a Linux Security Module =
(LSM)
> +designed to enhance system security by providing fine-grained control ov=
er
> +critical system operations. It implements a modular approach to security=
,
> +allowing administrators to selectively enable specific security mechanis=
ms
> +based on their requirements.
> +
> +The name "Lilium" is an acronym for "Linux Integrity Lock-In User Module=
",
> +reflecting its purpose of locking down various system operations to main=
tain
> +system integrity and security.
> +
> +Security Philosophy
> +------------------
> +
> +Lilium follows the principle of "secure by default but configurable". Al=
l
> +security mechanisms are disabled by default to ensure compatibility with
> +existing systems, but can be easily enabled individually through the sys=
fs
> +interface. This approach allows administrators to gradually implement se=
curity
> +measures without disrupting system functionality.
> +
> +The module is designed with the following principles in mind:
> +
> +1. **Modularity**: Each security mechanism can be enabled independently.
> +2. **Contextual Logic**: Security decisions consider the context of oper=
ations.
> +3. **Least Privilege**: Restrictions follow the principle of least privi=
lege.
> +4. **Compatibility**: Works alongside other LSMs in the Linux security s=
tack.
> +
> +Features
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Lilium provides the following security mechanisms, each addressing speci=
fic
> +security concerns:
> +
> +1. **ptrace restrictions**
> +
> +   Controls which processes can trace other processes using the ptrace s=
ystem
> +   call. This helps prevent unauthorized debugging and memory inspection=
 of
> +   running processes, which could be used to extract sensitive informati=
on or
> +   modify process behavior.
> +
> +   When enabled, only processes with CAP_SYS_PTRACE capability can attac=
h to
> +   other processes using ptrace, preventing unprivileged users from debu=
gging
> +   or inspecting other users' processes.

I agree with all of the other feedback you've received, but I'm also
concerned that there isn't a common security concept tying all of
these access controls together; they are all standalone controls that
can be toggled on/off either at build or runtime.  While we don't
necessarily require a full, formal security model for new LSMs, if you
have some reasoning as to why this collection of capability-based
access controls belong together in a LSM it would be good to share
that.

Even with a better explanation, and some agreement that it is
reasonable, it seems like these checks might be better suited as Yama
enhancements rather than a new LSM.

--=20
paul-moore.com
