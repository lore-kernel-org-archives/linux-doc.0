Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426243;
	b=u3mCvu04th+taQNPOh2R/ELdw4h5SbClkd3QOKsp+DT0BxP91yZsZeuYkdE02pRXAreN
	 Lc8CZg3mGplvibWRm2LjxtGrvmebiDqtAxg8R/ccLmex9kQnkSIe4HuGitehwGZWJ7kiC
	 DAYBdJwlUNRH7Bk6a0qcCrIH9wazbjxVBtKeg/vtdgh0Bnxdh5seu44qSCBdrL8UD8/pz
	 2cZY/dUojwukOwqDyC1tgh3nk6SUkBD8JlO7ZlFEGvHg8SIxMqgL9K1BwrI/eceaGlD+H
	 CuWLiGyecEL21YrSJWRDK/iQoLN/+SaMKAgFVaP7FsUcg1+BIlC922Xq7xRhzuUV5fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
	b=vhi3qODnAhMTqBr3pJv33m41M8KYKvi7Ze69Kjt8FM80Oym91/Qbg3lNNhStiEhl6707
	 L7RZo1TBuFeDkgKMc8FWK1wMEQMEdvi3kWOIJTz4S6HvdZJ+AHxzhMuUcCRA6WuVx0Z7O
	 OpD9I1kGUZDLaWpy4RVGCAjLc1T0rXxuQ0qfIi7iDjyIzWCxETNKqcJcKt1Ok2NVtJZF/
	 c0qNCrGdOtqpyduGdHcoUBDLXsFC2bt089wTUKBF0KMVsYbZUM5fxZaiCTA/Eui54f5ZS
	 fDOCWpcXL3UyO/8K69rXHPSit9C7PDg/poaRUydw/n7U7x80CpLN09Qrj2H43kPH3Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="nwce7S/v";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C548606A32D
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 16:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C548606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nwce7S/v
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1579900a91.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426242; cv=none;
        d=google.com; s=arc-20260327;
        b=Gca1qlqErTKTZVvC+johxZwHb0FaxLBURK/bLrydnH1uKsIswxRq/0w7z+uUU/RS/X
         vaA3HCgVvFp22VQ/em6580r9Z8c+5k5EZqcV54r1S71qrQVCw2hUvZnuNfGG552peyxT
         tzQe33t+Jhb7WOau5MbbuPRCti2cUuhM1QRbb78Ifmo4wlQrT84RTe1KMvbm6XGHk2+R
         YbFN2PdnzjiNeVYLoVz1SNbV19N+Cc769MuDMdLsol0TaSUyiPg32gYi8mlUjWCTksbq
         6wq6KT403L9sr1wQv8EvCDurWwPwLzlNkNtwsdDYVYHiTZmXy+Y5S27n9HZYWaouhkYM
         Twkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        fh=P3/55coqiAGubigrIZCInKf5jOnQElkKPAarA+iHQKw=;
        b=a+a9/2nG3WB68UnUXdou6ZApQ2ZrxmKUXh2g0vF7B7+C+OzEoByd8sv33rPbyMsx4t
         ffexrj81B51djfK/zL/q85GHZZSFRiEU04BTzrwvMZ/mNHxfvVtt+Farzh/CI2BlHcPZ
         FUFulAjel/lC4GCiwoZZVK+weS5dP43x1hSkywphlC1DatWC6locVfnanv6YaxMIVDtY
         48w/ShzOYAN4G2UeXX6LTLtZTNnE5D+dy+b3Ly1SGlx+cabHGOh9VhJiZI562WW92FFb
         eSIcxJQCiKNANaDMiykVqsKXnA4hBM4RokPnzMimTwDroTLl3Z+46y7pY25c1wMGqGBu
         P2rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426242; x=1793031042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=nwce7S/vTMoqAwf5xtwZ968yrj96v05xwkxb+d9Y46U3mzPEw4km19kPH0dhCTAgYa
         mvEBSm7ZT1Qd73u0W/R/lgY4ohvJK2kJmlP2pDVYZ1dWnjRYo4odiEdm8yIQ9xd1zS2p
         ZQfy4TMY/8l35JpqV3IpDrguh/ZNLDbwOv+FocYxVqScWejzksmBbR6Vln2Bx9mOHGgy
         FO+h9DRY2ZZxAUcYA4MtTPYNl+LjRjZp1gcs91wHRgWSwy8y/D1nIUpP7Rnnx24UiiP2
         SXnWod24OTqySi12VIlVziSl/692SO1pN289VM9uZT95tHHcTwXQ8sv/YWgYqK/9LEKI
         RTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426242; x=1793031042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf+lbs9v+6E2jWFkaeqWJS3Ibz3SI0AKrIKdFU2DKIc=;
        b=nKqEUD6n6ZmHthN6z0qdN/bL7buM2T2faeppISfzwVCAVdiG3eCEKRzyidekEZB57X
         Ha3gFRWg5IOdbWCTGP4QEGtl/vNY0jlG7b4c/1bpcaYCrBig/by/w+NHRlEs9NzW+YYr
         /tvLA2qIh/M2kU/OuXm1kgmOYGoo1Umnahpr60WkzV+mjeBYCGrmUW1vmwgCjcyEobPA
         +lMdcVWzAmipWeqilakVnRULO186brEJUkVsgTwvXrdEEpwu2lep3kjiLKNQqjJbpGSo
         z3hNnkMms+mMiWoeAvhftNuW5IaJMQXqShLjYud5NvhyAUPGc49q0jbpoa/dtoP4a+wd
         Ty2g==
X-Forwarded-Encrypted: i=1; AKwUvBzp3qV1j/4qEDx/GwKTHoqqd8Nl4/SqXen7Pj7sUCRoG3yx0vH4072tSdJAQpoEvMzao6ykdw0cM/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLabuqdnsiFlmzeDvBO2R3YVzux2H8jRxqvuYZIdZggaG4bNmVi
	KF+EHa/yMVP++0ZmnA8eG2/OJstJNDjNajrhmMY2EIgWsiu4hEapA1PkGxNE5Fbm3fHqq1tXE+7
	yVjdIA+oS+22jsrXJQ1htxeeqzerf+XI=
X-Gm-Gg: AYBFou2Y1yObUC06oA8sb1/Mj1cLnAmJnzm4zkCBLBQthIRCT5H1mKtnwe7icPQ3PYb
	rGM0um0MkZg3K0gzZ6WYmrImkMmGWqvQ7QqugbK7FoRrr7353CsU2c4k3nA891pXIMBSpU1Pfyd
	XFnbqOZVEWtbQ00f5bVnHRzu/x3nENbCsu5HvjQ41CnChOkNrVBZkRKg7FQPdi6U9F6Lw1jjj/h
	xm4d9IIRyH5ho3VaVbc3r+d0TP4SV+GWhsGwZa2TSMrFYBfkGbEJvrfFzpZf41by9K82zD02AuL
	IhAI0f31eBWH5NbPjTEPrg8BXuQpAMGe9iqYK4APGbbB5hH1/oux1Qr46Y3I2sVxoGC+QiWyO7l
	yudo3CTq7tZE+0L8Kcw==
X-Received: by 2002:a17:90b:5623:b0:3ac:9a54:e3ce with SMTP id
 98e67ed59e1d1-3acef6391ecmr7235023a91.63.1792426242489; Mon, 19 Oct 2026
 09:10:42 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com> <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com> <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
In-Reply-To: <atX9fugGUsI0hGcA@FV6GYCPJ69>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Mon, 19 Oct 2026 09:10:31 -0700
X-Gm-Features: AclHuK-94VeGPXxFeBfuxcNfO58AYvUbUlLP8AwazUPyHejofcyDyE2ymf8gT_k
Message-ID: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	roberto.sassu@huawei.com, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:08=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> Yeah, I was thinking about this and went back and forth. In the end, the
> only reason for leaving it unbounded is to allow multiple independent
> users of the same register. For example, IMA and systemd could share a
> TDX RTMR. The systemd side would read the journal through the
> attestation device and the IMA side through securityfs, but both are
> views of the same journal. If one side truncated it, the other could no
> longer replay the RTMR. Isn't this the valid usecase? Do you see how to
> resolve this?
>

Bright minds have spent a significant amount of time working on this.

+Roberto Sassu, +Mimi Zohar
IMA logs and systemd logs are both system level concerns that are
relevant to the OS construction, not individual users,
so I would just say to reroute IMA to use ctlv using a kernel config
setting, then make systemd the new system manager of the holistic log.
The securityfs log contents can simply say, "log managed by ctlv" in
this setting, in the form of the template identifier.
For policy violations, only the 0... extend needs to go to ctlv.
IMA can still keep its violation log as a ring buffer when it's not a
1-to-1 violation to extension
https://www.youtube.com/watch?v=3DgyYUYbdiN_4
