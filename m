Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E021DA10E
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176451; cv=none; b=IIdP+i9JDCCl2VFTVgs0z1bv8ootRUScd/E+e1eD5/VqK27YzgIaTuQqb4CIopBBzWkHNyDSTLOjjzoMUaBeVEgbCLvYkWpLEHi07p0Q9fq+0BBmpDEXANmp9njLiUzAR2pCjzOU4a33ShOzo+lHHhmKsVyJuo1iq4eIh2MV+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176451; c=relaxed/simple;
	bh=0leTP5OXAUaKPJCy+G4/PrHXTjS88HZH/ihoHn42EWA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sVA5dnMTIVjGNk6gx4Y0pn7xI+vUEFHuoNUTd+XmMQZMfXKKFfjUuDLd2P4LDAst33OGT23slw35o4jqcxoT7Rlh0X6+p8L9FiEteba98FIbRTKks7nzSL1PY/iGp2jaHSMU7qNDOkXgA/oC2wgS60FOiQgeYxv4OO7sEjYrzTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RyBrpdNG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RyBrpdNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729176444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6lboUGx7ijrgViMjC0XLNeJKa/Wh0MpL+jwO9wWqSXs=;
	b=RyBrpdNGzykbLTewDc5fbbfiFnaL8cEiBz7LenED8Z5lllNmfVXZAGoz9CL/XVTrYycRsD
	GKH4aTA2mwiEmlyYQ0LZx7s3xGWxtbX8dB3uJUqOhGZFDVkA3/BVREnbyppdrdPGaCGbWz
	c35/2JwA9RHUf+hxYOGmSP/jG4/mjnE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-shGiqYheOU2Z13ElyyL6sQ-1; Thu, 17 Oct 2024 10:47:23 -0400
X-MC-Unique: shGiqYheOU2Z13ElyyL6sQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99ea3e1448so63638466b.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 07:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729176442; x=1729781242;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lboUGx7ijrgViMjC0XLNeJKa/Wh0MpL+jwO9wWqSXs=;
        b=HnVLeLcGBr1xXzV5294U6UsmElAGZOF0dysXzW49avzP2FgKyVM5XWdrppj45vkb0z
         WC7DoRcEinqj+bJpc/n4/1DcDVJlWvfi2zzrXiLz062xMc40H/lx/ST6O5NbFMDE4fqT
         GTmg4Czf4lCgeXlzyFEoFihbPPEV0BROPLwlDMH2q7lvX8odfkrfI1u6iNfz6oBmhbNQ
         +973FVsWwkGI+MbojTb8ZO9IPMO70dGxxrIhhGey3qNeoLJtqiZPl9UpFX6bHtUXENjX
         6BoKIL3y0k+ZvG9wZCQoTKmmJMTD4hdmbWMQlM5jyIXV9W7OTKAPttEJRFhNFxAuDff7
         8CDA==
X-Forwarded-Encrypted: i=1; AJvYcCWFtj+a7PmMiwSMgHMAIiTEMQAzKl+1ZJAeD6XqschgaHVkBD+Fr/puNxnQGz8XKuqcIxNiiBtPJzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcyhPHW6YumSdhMYlNE3BzWrTvHbBx/2zVrFf93rC2MI/boxD+
	ezNn+sWrAJh03VWzfYVYa0D2CnPwprixBQA9j4lqs2SA+qbMBS5PidfAstB53msi/TNegMgVS9/
	JiyVYyJlg4HTzvsg3kU4fy5xoEC6UuBTzXyEMiS9sy1LWsE59NdBA6yR+ww==
X-Received: by 2002:a17:907:c8a8:b0:a99:4b56:cf76 with SMTP id a640c23a62f3a-a9a34dfea2dmr616933766b.47.1729176441878;
        Thu, 17 Oct 2024 07:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8DECNp/sdfcg5mOuDiFFJpXOew2nxBeb2a4vk2UQksCP7zCheHttds1hjqhqehXa9AZoKZQ==
X-Received: by 2002:a17:907:c8a8:b0:a99:4b56:cf76 with SMTP id a640c23a62f3a-a9a34dfea2dmr616930466b.47.1729176441473;
        Thu, 17 Oct 2024 07:47:21 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2988c5c0sm303480666b.202.2024.10.17.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 07:47:21 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id DC19F160AB52; Thu, 17 Oct 2024 16:47:19 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Jussi Maki
 <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>, Andy Gospodarek
 <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>, Andrew Lunn
 <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, Hangbin Liu
 <liuhangbin@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>
Subject: Re: [PATCHv2 net-next 2/3] bonding: use correct return value
In-Reply-To: <20241017020638.6905-3-liuhangbin@gmail.com>
References: <20241017020638.6905-1-liuhangbin@gmail.com>
 <20241017020638.6905-3-liuhangbin@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 17 Oct 2024 16:47:19 +0200
Message-ID: <878qumzszs.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hangbin Liu <liuhangbin@gmail.com> writes:

> When a slave already has an XDP program loaded, the correct return value
> should be -EEXIST instead of -EOPNOTSUPP.
>
> Fixes: 9e2ee5c7e7c3 ("net, bonding: Add XDP support to the bonding driver")
> Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  drivers/net/bonding/bond_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index f0f76b6ac8be..6887a867fe8b 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -5699,7 +5699,7 @@ static int bond_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  		if (dev_xdp_prog_count(slave_dev) > 0) {
>  			SLAVE_NL_ERR(dev, slave_dev, extack,
>  				     "Slave has XDP program loaded, please unload before enslaving");
> -			err = -EOPNOTSUPP;
> +			err = -EEXIST;

Hmm, this has been UAPI since kernel 5.15, so can we really change it
now? What's the purpose of changing it, anyway?

-Toke

