Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0482FBDFD
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011302; cv=pass; b=BfbDTMqagpGRT5YHu/VmmTbC/kRpzClKs1h/CAhrafnq9KKnzDDrja7RCMrT8Z9KNLnCkCi9DdRwzxzgSMmebhnxoAiBdif/WMviLew6n995L7DucJeWczZvvZbBBl8o/1tdv2CtNDEuFtv00WajEjXlwsQVMrYaMr8Fbu28C+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011302; c=relaxed/simple;
	bh=fk0uhQwp4prrEBPZo/QiveKATOKm2IGlddgiGbufK3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfx7pHzbdOYI78pda9EG/09gsYwh2qiFTaON4m+ABMUmErZILq9kA8GIRDzgGjs03t96lZe0pwtltxbCJ80fqxo8K30LLXY3glKkNOrKjHbbo8NffxSQAolxod0CWU9BaqnYUZ68vxf5HQiFkExokmpvoODo/H+F/XmAXKaBO7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCfhkVbd; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCfhkVbd"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-130a1776581so72344c88.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011300; cv=none;
        d=google.com; s=arc-20240605;
        b=L985gCrdPDOxBUGvewqP1mZYKjP2/vBv1J3LfQJVFuQgPxurTKits7EnHM0AY4++yP
         S0ElyHzcGpZ9V0ye4L3UF5Bp2h2deNZktvKiQj7QHgWQG7wYFv2f1PDVE2Fd3o+29LR0
         JfRn+p6snU9vWfb4eJ3M8hZIj88WN1q/zWGSiwSZhrui24vuKFZnulQFUhIrk29Vxiry
         /yGWKmeVkE8egS6yuM4XGpww/Pc4qCB/iObgULrrJV4/rjsbEnDW1/94Y6tAtvWUG24Z
         RzJfjNMlbonbd1ZwH92feTnUzV5X+IAezYYvEXkoZW3KUmK9tkivPryvqAW5lq6Jde7E
         SP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        fh=qA1u/gwP6ldkKhSDNFb4+7OFrPEtnJ/tFp8jEWFtoAQ=;
        b=ZSB/wVMCmQ49Z984ZDDfpb8CTcUXK8q4qiETzkYHEECgHXv8qxmx+RYA/vhOUmHPHD
         fKwmH90gcMSKk4QoJ8yEP+VF3/iAwYmuUTBpxk6runinjSW4PAheTrBi14DlDKsAY11x
         N91533XZM20rSeD0gfvqZ5EqphOUVm0168JpIjGNsEJ0oagCUUtwkNqXU6PouA+aZQdh
         Fe6CxeyqxbYz6EAqBt4qfpnbOGuvYSHQ4vPqx+FkhfcG7YF4MbMSCS1twccCDCje+iYM
         t0nvy+oJSp2Q3zUavRFjUwpWlVM0KPP7cFzRgnyoN/FGUjJZtSwE9x8Aye1VsheMRXbA
         0hiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011300; x=1779616100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=GCfhkVbdOCQN8/igHWR8gZVhwCFhk4HQztU4nNEwUtkRUFgb49b11z6YQPohHl3OX3
         WxyAr3A7XAqkB5i+XyOpcQ28F/Wx9pnc7+B7hHpWCcfuCe1aSl6XaDf/CuKuDRE2fsdw
         VAXz4MbsZtgrKiH5jRywsoeD8mhFZXpauULhtDE/MY5A+yD6vorEZ0vM+Ocms1j762im
         X4jYdmF47TB8PgA3x6A+Z9o3gNpkD7v2DBFzZ6mOEZ7hr1NHNtTftmVELNomnHr6+yE9
         X9pS1Fu2cmyKKPSx25Jd0UvJA8BvuOqoZHwSRxZuRz8Q3WOdpc41dqUYeqgNqdjLwFgK
         9GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011300; x=1779616100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=NFXSFK3LJLsUFXkqUEtN1yU1FSgJT3ZO/eknSMTxtR2cNz7RjUe3jaGf3bdlYgGVJl
         ucoMPdZjWB+GFTMXMeGT7sH2tUQvhUp7lERPVsVT3nVEgH2xJCVN71k1UxoTCZwtEKOI
         IZ9ufol/tGY0zKWoN/IkP8+7BCHwPD1ArCIVpKbjJ6u7KLStIFcVvHwTc9XG+ZcTZ1g3
         UErbsQje9n/jO1mNf4IVM2HbINM2NANxWqKxBAh58mSg/pJ3PQoDZTcdREsPjnn4dsim
         S2Ythg+m529nLROLY0R1FxoBFm6SDCn7prS3QemWOK5MiSiNL8X3KUqsH4Xema5gJjOc
         cWRA==
X-Forwarded-Encrypted: i=1; AFNElJ/Nvi6VWnB/2eyKTvKHOidU2iN2yVgIO1gksQ/oFZ6gg0MR3QgBGOxj72vv6bNhvLGCS0zB6AYFKHg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6k4TmzthskuL7YztSFeSe1DErR3qsHA28LaLT+p4y3bcMVHM
	qEG2VnITpM3nsWS/PCP1mNcNRrM6xyS7oQVal/3z1UKyJtij06SOXkFeioxSGVyHiNghHHNDBiR
	PMGozsEyFQoaujsRl7skNLbvZTcVyNnI=
X-Gm-Gg: Acq92OHEVqSCARIa4rPc73daSyb63i9BexR2MJm4WTvWuE6mXvBCbwCzDPGikJEghCL
	81vaDIRcW0jT0B0hP4UoDqlz8yOoQ5jA9nwSotAkAuW1XEpcpNMqsypdK/m9hogXhtMhjnRP6K8
	ePtV6vjF8r3nLQvdRfA4nPp/39Yr03K/5xjCaM+gnOB9vmzIl/Xto3QFghOVMbn/QIeVdOG12vh
	xJwRKl6oXiYKy6N0q74/+HVzWYrpdr7pHYFzqKkYjIIz+Zd+HuGtJCE8PEiJy/zerDIZBgsDYlx
	6oq3sCPajhwj7VbOMbd8P/MQ2vw8uAm0s82ALyMyIYQzOrRR9LSuxDVhRSsQw0A7YbcgpSGNkeB
	muXslKhVuvKEq94YmYfKrn8Y=
X-Received: by 2002:a05:7301:6448:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-3039868bb9emr2318584eec.5.1779011300185; Sun, 17 May 2026
 02:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com> <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
 <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
In-Reply-To: <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:48:07 +0200
X-Gm-Features: AVHnY4IqZjwtBaQ4bjp2dDDFDM7IN9UCZH5fs8MV0fMtXZ3wLSajt2Od6R0WmJM
Message-ID: <CANiq72=2CFJGPcO_zP1wbgXiDAL=gOUcHRMMP_bEUa1U0rZB_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:33=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> That's true.  Some distros (Fedora, Debian) don't like that either,
> but that's a bigger ecosystem-wide concern.

Do you mean that distributions would like to package this tool on
their own? If so, I don't see why packagers would be blocked.

Cheers,
Miguel
