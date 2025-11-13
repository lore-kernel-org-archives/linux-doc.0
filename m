Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9AE2F3C07
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763000209; cv=none; b=rU4dCSnvH301DFoE0XORvT7uRkZNHPbXLXG3pPNGVCWW4udn4uRZ682NTZG+mApc0ZbJTv4UzQL6FesJV7pnaAe1ApHaOiofrYkW6VLZ/JNCYN96qShPj+DQflAI38P/trrlAitd2gJk9/xmTtcG61TNIgFWwbK26DCe+ATvcKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763000209; c=relaxed/simple;
	bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFc6e5jN/vp0p+44nK+XTHhk6TsAJQ1RWj4a+ueryXUoEo7bRth+Va+1wVmkKtp6sg5nCuG/yHSrV3OpNLOSjJQ7ij6pFmp7wSTmBpdDU9hfGCCtUCglLp2ReKK6BsR7e+UuYf5gUuBKl0fWm6fO/CwTjbZUO1UvdBE08DZxaYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUjVfOvl; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUjVfOvl"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-787df0d729dso3032987b3.3
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 18:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763000206; x=1763605006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
        b=dUjVfOvl5mUO87tZtRc81Twq5ZvwfdO7PA8zJenEtNbv22JWMiROpkY6iNKzPwwdWo
         kk/IFPOFdyrZhuXogOBTqNaf4xn8U9Pwa6iSt1k6uAgTmVPiP7f/f8zHFcwlz2J4FqRS
         v9DXpPki6a82nS1TDFR/LnDnGGMowihGxAsY3CvdWXIkTYNtIkoOtGJJbVzCr1DyCE6L
         tJVxdKSkeHDAg1WCH5amh3BfQsdnx+0qWpelocUvNV5JDkJhizghjORUkWWhJtnC9c/P
         zCzzHP31HyEU/SKDzxPQNlE2lfaxKaPMYhMmA3XbkCVYI5anA7Pm77NrIxDV4k/nYEyN
         H3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763000206; x=1763605006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZRaD/fmerrjCeoqkuiGO/IO5MiZ5XDL7oIGJfPfg9Ao=;
        b=SC82byoh7CnWzSkSAJsv4LaJ+Tfh8duvXkX065ot+Dv08g6S4t5Pf9lorIu9NocR1v
         MTqF0N+fY9Knt8DhG+tLsdUtZ/fLvp58llFXrg+N66feWcOkRTYYyUkqT6ybbcn4hA8o
         TMmhqEkL6k9hHeiYhadfWaelT/RqjYC5Sj3OU5si8Q7CATE1IBSBTF0B0EyRN3IIihUX
         ybJsys7JA/KTQ/wzcEwLVPoCFrg08vLPQlPX6jb0tLBk5xlu/xnIBncAb01jfx7np3q0
         taf5IQx8yKxNyIaL2ajgP5L405T2aIbGZk4TNxgVePYswcPTJXfPFx2EDj4X66TL2v9d
         LWJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKNnkRuJtRInSFJIC3qCOmpYCxJ/n9RlW39nL3DhaECgejSkzgr36VySKz/Jv6qOysvDciCdnbTxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FFVTg12XcDoCDoyp6M545buZXXKddGvw1+HKMXRp2XXeKPeO
	DbvypyvwsBhI7AXJ1Zcf0732E4t6QnUNEO1TLVZ+id/+SNCcX0Yo4O9HNCVq3mpsbmvPTZRRqfs
	/agN8nLXNvAQxQ9K5CoWM24QcEsVnmKw=
X-Gm-Gg: ASbGncsRo9alx+cS82hhW5sk6LIwIb3IHyZDxsvdqZjPCymiMJnwN+5eosnVjMj0X8B
	zyNkguZL8W2kDrwRrsL7T+uZOGapd3sthqvgTro6tp7I4ZgZQrgLVj2nmNsMWRcYmNEG7OG/1Tl
	NLofGBesV4OYdRmmuRFa2+KBA6oqTS+sro0pXopUG9upgvc2meUpYgcbjY/5TFr8zhEI1HUt2ce
	ejkn/I30xQaMSytw1gjswvl44ccj7sTDft1PB3e24FRV8Le4MK4WQ+UK9pd5nIn6c1WUYM25Jy9
	KrDYqaiSxX8s9b6sQo/TfiiQxg==
X-Google-Smtp-Source: AGHT+IEoQGXbDOXpCMV0uLppel/d5OJBdh/BTOE0WrwFdCg3bNRboPUEkEHpLZDtG4hlmvXsyGaHqhvMoipnvR4oKDg=
X-Received: by 2002:a05:690c:5301:b0:787:f72d:2a57 with SMTP id
 00721157ae682-78813626ef9mr34068247b3.15.1763000205991; Wed, 12 Nov 2025
 18:16:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112042720.3695972-1-alistair.francis@wdc.com>
 <20251112042720.3695972-5-alistair.francis@wdc.com> <3438a873-bda2-4a1c-af8c-76e31a200c79@oracle.com>
In-Reply-To: <3438a873-bda2-4a1c-af8c-76e31a200c79@oracle.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Nov 2025 12:16:18 +1000
X-Gm-Features: AWmQ_bmGVjeLJyvzqCH0oIhjJJEC9KDxsd28wVqF9yRjrr2nfAiVpGZrrJdTjQw
Message-ID: <CAKmqyKOj_vB3dwy2CO2JacL-w6WSm-2HYHuikndsLfYCQvwZNA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] net/handshake: Support KeyUpdate message types
To: Chuck Lever <chuck.lever@oracle.com>
Cc: hare@kernel.org, kernel-tls-handshake@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-nfs@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, 
	sagi@grimberg.me, kch@nvidia.com, hare@suse.de, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 1:49=E2=80=AFAM Chuck Lever <chuck.lever@oracle.com=
> wrote:
>
> On 11/11/25 11:27 PM, alistair23@gmail.com wrote:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > When reporting the msg-type to userspace let's also support reporting
> > KeyUpdate events. This supports reporting a client/server event and if
> > the other side requested a KeyUpdateRequest.
> >
> > Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> I was not able to apply this to either v6.18-rc5, nfsd-testing, or
> netdev-next, so I can't adequately review or test it. Is this series
> available on a public git branch?

You might have missed Hanne's "nvme-tcp: Implement recvmsg() receive
flow" patch that is required, it's mentioned in the cover letter.

You can find this series, Hanne's patch, a few other patches that
are all on list and some extra patches I'm using for testing and debugging =
here:
https://github.com/alistair23/linux/tree/alistair/tls-keyupdate

Just remove the top commits from that branch to get just this series

Alistair

>

>
> --
> Chuck Lever
