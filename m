Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975753A9DA9
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 21:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946178; cv=pass; b=Mf5qS+JUFE8SD1mRu/zyYbhP4zkVKzOFqZthmV7lcJO3ZONyT/yj3ZsbFCNr9AYBtcpabSRDRTMebC11+HoXW/wfFNZADoqhWOupi+ZV/kKhKbBPamaJYaoMORz9AaI95p7OBSNbtHdh/tBkyUEnQBqkLPhsHyt5s3uJeY7WvWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946178; c=relaxed/simple;
	bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEJL/S3tnZktyLRlpDAT9i7Jxy+a+I4EYAp/U26ApA0K2xFqDPPcNkdVcAfZjicy9PKt9bCuPvm23PJ0QSbj/z08WkwV0yv2srsWQBuMuAvcZJFj6FtYK4W8RtVNKa5Z4vxMqC21lhbG5hgyyWOAR6G9xkICspUeypbrfoKCfO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYxxVMoj; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYxxVMoj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47a95a96d42so6395e9.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 13:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768946175; cv=none;
        d=google.com; s=arc-20240605;
        b=ceNj+SMx1rz7wHIqFQKFwvgEV83J1/Pw4crI5n2LS3a5kkVtI9EXahUIwwQPtmpnFC
         fA2QdFgBn441MmlZ369luIqYWfcJWWddgGeOHkaifXyu/85eVze+TM1VZOqIDUATDAit
         PUcG/wOm/fX3dLPMOPfLHPvlzx6/U9EOD+xtrm5+2IQ4Rauh1OP530wZHBv8XFK5SioY
         6zCubIpgeGZLf34cqVqrrsk7PLnicADjdaCiajADrZy1UzZsrtd8VE5WZjL1eDWAbKz5
         IaQHtodPwl8InT4UHZZX7Pnts94d1rBINyP6F4N0TuuXiOhjNi5qGCBSl+aucEfYwLGv
         Ll1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        fh=5LlvLE8BBLwsBoXFZPrYSYiLmdynYiaYidYZ6TIa7xg=;
        b=dNhL2Cbn0pZRUrsppdMGHgL1FDWuVNqMgKkheMmiYxOqPncxylks5jr45mB99BzNiJ
         v37tOiPerno47Kun4uYD6jq5T4ww0JzoGSOLNzHpsv5bINmTeKvDo5i0iqx61Uo0/hxR
         I3AzCNrTnXkgmH/KjnVs8tLmnzfwkRqBHLKUoWPuYkpegA7+qkc8ypaHHw0E5NICPc70
         XoAYpDlishGIbKy3+yf7IpxkmVlvlHzonXNfE2I+VElOBnnhNVdauvarCl73Nf7Vx4Xu
         pGVJWSdP6NQw8InF3WOQF6WXk2nWKfCSjdyYiihIFpm+qxcook0xgGPilGDHq7VZKvf8
         tvrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768946175; x=1769550975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        b=dYxxVMojgtS23OsGhKbjZH/obB+6y6DHFe2rb+iW7Lekr/f9Um5/qNq2Qglfila5Hl
         iY2030N2Y754XZxAJ2tqXYmMO54D5zrn/QH3xMtO2FDAZyvvJRpY1fJBIVc5s205HGb3
         uKTDiLqbksZfamQPNDX8cOsr60KMCmTgpB8xOv0uNIUuvlHUSOCffsGt10lk7mDhd2dU
         Kl+lB/bs4ycCo+IM74oxKc/U0/uxKYmJUwwI8f77vJ4MAOuZC1W0TF1F/rTnyHnG/2KA
         pvdYcIvPuxrsWnn9J/7ff6Qeot30sFxdsIRT7LH/mUbvjEdkp1cqoTsIGD76YbRsPpmh
         h3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768946175; x=1769550975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVZL0RZkg04ocz6rLt32bQ6sRNMP0a56Dl2GzXli5GE=;
        b=T+YOR2Dm4r5SeGh0B3mU+RJlcBxm2W1FQ6LutOep5miBCaVE+pchNaMxxGztc0fkGy
         x6TUR69thJTldbditD0F3WV4f7e3E5ZJ/qjC1kzbXZ/9SF9GUt0LNOxSK3QAV/NTOKcK
         zzU3b5JoBqkMwEm8nOhe4Kl509kxgfu69Sfl1tuB6+qdUudBIbsPcybvbhWMHgLhXkb7
         vICD4peXFZaH/uNcJo/GburkGyi9LCkwIjEqRXnMEmykKiHJhyubmBzdrCVyrgobi9zj
         WwolZvEER8kjXEbXjoma9CftvMT5xAPivCobk58FeCsKXnbwpWJd0+mgGJaXdc00B3t7
         +g6g==
X-Forwarded-Encrypted: i=1; AJvYcCXziTfAgsyJSHhm8pRQ4amLajUAzFI/AfYqzF2eVdeUzDQ1MFONAyvb9QB4E5IX1k18mRn5yEc+iZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybS+FESCpJjInMLznzZHYeBeTtrBbM6tyFugLHIxQ4ux9S4YSa
	0VO//bI6w4n3eSYwr3n9g0XHup+jtszN5RMT83AKjYFMqB21q8WsI78eRngpTxEzjLwFIiaTf1S
	6+CKcf3aDeQDZA+OG9DaRdBoIu1jyE3iHbabZsjXg
X-Gm-Gg: AY/fxX5Y7OOfLlRjGWJoHqsj7qZu+8w1Wpf+3zYdzipKrT095BmlPBSdNR0mK/yelB5
	76ZOr7q5QzduAB0cGrvQ+Th7y/8mMmlUfZunnPuQX/e5vNgGXqQhYGtwbo4kGuB6xrkfOqBI6Az
	mLBAhi/yK/Z1ABP5eTdiHh71eVsWHvUo+IKCdZIMk2N1P04JPjuF+BFAg+XoOaoMyYgb8XVdUNF
	Hg+heIIQFts9e3Ep+KEkOIuuZT3e1wrcnfBVKH9xeip6sj/Ve5d1GAYZctVOkCJgbkzAEtD56xi
	rLoYr2gD/9aDKR3ppKL/9/Nwn5H7mZQI2uYp6rzIaiS2cbUobRCuBQsNMsVCSyM/ZWfK
X-Received: by 2002:a05:600c:2294:b0:477:b358:d7aa with SMTP id
 5b1f17b1804b1-4804269ded7mr182155e9.18.1768946174451; Tue, 20 Jan 2026
 13:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116190517.3268458-1-tjmercier@google.com>
 <4cd1ed61-0b19-45ef-a77c-7fccde818ae9@amd.com> <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
In-Reply-To: <CAO_48GENCZrXNCgXnW4rujNMHk8d9QrXoACT1zpJhWR0r0jACw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 20 Jan 2026 13:56:02 -0800
X-Gm-Features: AZwV_QhAkwIRZ_-oc6BWWemkNMCWB__3YgDNYfNqrl_eFujJJHCLVOgaVNe7XtY
Message-ID: <CABdmKX3LGWueY91k+i7_WFTC8b8LJdR8nj6Y9KeJMRk7fSrsww@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Remove DMA-BUF sysfs stats
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 5:08=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hi T J,
>
> On Mon, 19 Jan 2026 at 15:15, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> >
> > On 1/16/26 20:05, T.J. Mercier wrote:
> > > Commit bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF st=
ats
> > > in sysfs") added dmabuf statistics to sysfs in 2021 under
> > > CONFIG_DMABUF_SYSFS_STATS. After being used in production, performanc=
e
> > > problems were discovered leading to its deprecation in 2022 in commit
> > > e0a9f1fe206a ("dma-buf: deprecate DMABUF_SYSFS_STATS"). Some of the
> > > problems with this interface were discussed in my LPC 2025 talk. [1][=
2]
> > >
> > > Android was probably the last user of the interface, which has since
> > > been migrated to use the dmabuf BPF iterator [3] to obtain the same
> > > information more cheaply. As promised in that series, now that the
> > > longterm stable 6.18 kernel has been released let's remove the sysfs
> > > dmabuf statistics from the kernel.
> > >
> > > [1] https://www.youtube.com/watch?v=3DD83qygudq9c
> > > [2] https://lpc.events/event/19/contributions/2118/
> > > [3] https://lore.kernel.org/all/20250522230429.941193-1-tjmercier@goo=
gle.com/
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> >
> > Oh yes please :)
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Thank you for your patch, LGTM :)
>
> If its not pushed yet, I'll push it tonight.
>
> Best,
> Sumit

Thanks Sumit and Christian!
