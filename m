Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626B51D9A6F
	for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939632; cv=none; b=mpmac3fhaESs1DkSJxWGbw9zqikHEV3g7LAD6ztoJ0dkxpFUTnk1fH1yeVFiDzAqWlP3mDxLfhaJc/uHYBcpot8fjVBInR7n9L33uLiuDF7JWiwTIar31QL0cxfyp6ReJGVxa53NXdNC+NxRvAPgsyp1eYsjaTq29yioO5VEaiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939632; c=relaxed/simple;
	bh=C8j9naSGtmANXLxB6gTQA/l/WydQAfl5PDcPUGnaCfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHwQwNbCaNaXJJ9NYE9RcKffvRFeSAvTfDJedmKybDs0ladM42rUEq+gnRN5NdCQ71H2QQ6Fu/jcY8vliKNIVOgmonEhdVCUGtleN9mC+gNf2m2pC1sPmirvBvG9oeG4nTfHGUM46kTZ5cVZ9Uc6uUimifrnlHRcKb6tF1UAl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YggdufoW; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YggdufoW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4674c22c4afso3011cf.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Dec 2024 09:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733939630; x=1734544430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A63aMunO9nsMaAYz7w2GO3I55GNNyAuGNNFIOi4q+as=;
        b=YggdufoWx3nmKDo849Xjgr088T+2j50F00EMTYmeju6l2giDErdLiXmCG61M2gmFyK
         PP3xawPmxYCzOxTYhKILZs77v2pM2K0H/aT1KPYF7BY2e/J8PmrY9EZxBiWEY0VQwQAJ
         5oLkQ8CJ40X2GxPYPtNFP3FYwuH8LDNmSoA4xBnop9gxNP+JUTdwPrhMnPEX+b49E+7c
         YtgmdxVMpntUSsh42nOvEhGeKvvAFtK/iusPlQS7+Bt8NeuCYVxAerhYQ2eC6PXPkApO
         IfDtOjo/kad1rxmGsgkDG3WLKaPxQ7ztzMk1NdYko4/4JejfF3pCQp6AHIOVaQUj+pkM
         171g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733939630; x=1734544430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A63aMunO9nsMaAYz7w2GO3I55GNNyAuGNNFIOi4q+as=;
        b=AYIG3PqqcmRuMTNg/Iui8i6nQnstDhgQvZopQvUDwHnYBWtgMK6MqQsHgNHazAjOhr
         zAoyCzrhQ5xh1SVmavCfZQZY4PzN0lntT138o1Cq3LhanSGxYOxPi83SsjTZfWGtI6jo
         rMVztvrsos27e6fet04pkISlRpTBPwhG2r48/x6VPY6fMynoOYGF+w/xYfUU2e/+1xKq
         006iLURNb9vJGNGIg6YNBjivYlAJaPZC/1ST4UV0nQgevjrrb4jKqUs1II20d2wqZScc
         scAAOvM02NLL4LlymdbtyL/boK1lWSLNUcUOpwbFwi11AxXI6wJDUMNXbcQBT2AB10sy
         g7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCU3o99e+Gbi8XMzQyuCKBuqQgNQFU8DKIfYfLI2ffstFwPoNuszFefMEuPX6icQclm7Y2ha5KjFqRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN9MAJZpCGQ5Dh2j7iaIpV5wpxUcaHHpge7EDKEY/UqOBo9kPC
	rKmVHQk2clIkPBWFGSNPtx2+JKjXjP3v9bqLopB6YVUFGq4B4sM76LYXIcoMUAni0NSbHR2J384
	CLYBcC9udPgD4AQZ7QFs7mW6eLkD1MDN+ep5M
X-Gm-Gg: ASbGncvLN91EToljqqlr3pvcG6I7gG9yCKNZZ6MhEDs1tVGoBtFJ6cUI61SpRKpRAtv
	ds7tHRqQVKMqpDt0TmMV2E2yADIIntM1TetI=
X-Google-Smtp-Source: AGHT+IGBmAiSVzIqqNUuw+Enc5v64pgEhWaYhT/F/17Ts5J82I57JPNQTfvnFZoXyG+FMm9QZemzOrYEl15oPcAFmio=
X-Received: by 2002:a05:622a:4acd:b0:466:8a29:9de7 with SMTP id
 d75a77b69052e-46795cc07a5mr547161cf.12.1733939628703; Wed, 11 Dec 2024
 09:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209172308.1212819-1-almasrymina@google.com>
 <20241209172308.1212819-6-almasrymina@google.com> <20241210195513.116337b9@kernel.org>
In-Reply-To: <20241210195513.116337b9@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Dec 2024 09:53:36 -0800
Message-ID: <CAHS8izOHfWPGaAF0Ri6sN5SVbvD9k_u2-_WmHJHcwu4HDEXj-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] net: Document memory provider driver support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 7:55=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  9 Dec 2024 17:23:08 +0000 Mina Almasry wrote:
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Memory providers
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +
> > +Intro
> > +=3D=3D=3D=3D=3D
> > +
> > +Device memory TCP, and likely more upcoming features, are reliant in m=
emory
> > +provider support in the driver.
>
> Are "memory providers" something driver authors care about?
> I'd go with netmem naming in all driver facing APIs.
> Or perhaps say placing data into unreable buffers?
>

Sure, I can center the docs around netmem rather than 'memory providers'.

> > +Driver support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. The driver must support page_pool. The driver must not do its own r=
ecycling
> > +   on top of page_pool.
>
> I like the rule, but is there a specific reason driver can't do its own
> recycling?
>

Drivers doing their own recycling is not currently supported, AFAICT.
Adding support for it in the future and maintaining it is doable, but
a headache. I also noticed with IDPF you're nacking drivers doing
their own recycling anyway, so I thought why not just declare all such
use cases as not supported to make the whole thing much simpler.
Drivers can deprecate their recycling while adding support for netmem
which brings them in line with what you're enforcing for new drivers
anyway.

The specific reason: currently drivers will get_page pp pages to hold
on to them to do their own recycling, right? We don't even have a
get_netmem equivalent. We could add one (and for the TX path, which is
coming along, I do add one), but even then, the pp needs to detect
elevated references on net_iovs to exclude them from pp recycling. The
mp also needs to understand/keep track of elevated refcounts and make
sure the page is returned to it when the elevated refcounts from the
driver are dropped.

--=20
Thanks,
Mina
