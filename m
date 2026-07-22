Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70562F4A05
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700463; cv=none; b=rrt1GAHjnJF5yYcoQdYhRef1WUu4olAl6cWbF8C78AEhPKXGgBrWbZSF84obqQVfoqOY8/M0uGPpOT5MHVHh8FlKi6aUQAqUQY1OKr6TE1d+GpLlbs6NNRamh+JSfKjauvCtKSAI4pZCd5bfidSvYt+RJAjnA5/vnArPOSHJ5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700463; c=relaxed/simple;
	bh=EItOFMrzD5J0dUaznC9Hvz0SZ+f4YhpCUrgg2lIJKqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kk7pS492zRIlO8b/wzOO8JmoBz+GsUP/5fkaPLYXdws61jnTmy6logYsH0MoJVuVA3me+QthRs1mQm/JR3GVX1FGZ9bmoBB0YpWF207V512WcrjKuZosGVVHP7lPGFePrcFq9dG5jDCLnVC+/96L7q9cnmkun2LgXH6BD1lAx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QeTW8BnX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3hzLWSv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QeTW8BnX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3hzLWSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784700460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UATT60izd8r2IgiySOiquvvuPaRo1zLjW77cpIyRqiE=;
	b=QeTW8BnXemlsVYNXa/vg6wKL1Mf1mdI8zNaeIPJh9ixqcDJt8VjuhwXNS78eiNOS8NnTEz
	yNaxRZ6sIzUNJPA38y8Xt7RYmBzlLTYtJ7sqPAo25z/eJ/Ak7GR6eQnBjGxfOoT5Y7iBuk
	tTemGsSwvpKxnVcyTOFAGOIWTChAmXg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-bsg3N3jMOiKznTR6K3tHZw-1; Wed, 22 Jul 2026 02:07:39 -0400
X-MC-Unique: bsg3N3jMOiKznTR6K3tHZw-1
X-Mimecast-MFC-AGG-ID: bsg3N3jMOiKznTR6K3tHZw_1784700458
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955b84e25eso26869795e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 23:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784700457; x=1785305257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UATT60izd8r2IgiySOiquvvuPaRo1zLjW77cpIyRqiE=;
        b=H3hzLWSvKY9H5gfb5MJ/Q4Ve2sBSGe5+frXCK/vUhYKOWeOv71n1wTXGeyq79g1UAF
         acYeg6gSIu3XYVXB50sABQ4MX5jBIKCLUBlFlLe5V2D0qOXP4veCgBtZkPmKeMaFK5Ke
         CkH+gBOjIO4SDpJj6jfoL2obfbqfqC6yhrnQoxIDLt7FwPafBczGBqe9Z5s/5OBljAUN
         7w5NMVwCg/diLhyLPNDW5pXrhKxJhXFXRzfGWZmp2rPZwUsOeQIbuiZ251tX/JnshkIa
         lB0X2sK01BcKLlzGeEDR9OHosjqNE2NOYxekwKYnZgvRwHEkcWTdQlZVyYdColswdjIo
         +sIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700457; x=1785305257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UATT60izd8r2IgiySOiquvvuPaRo1zLjW77cpIyRqiE=;
        b=Uw/QLbyiKi/NN1+yKu6Gw3yIgLvKAy7JEL7pj10KLKp/agekykM3gjgj5XdsimLDdm
         noJkSvxtj2UNly47RFyQgT1ara5h0wmrUA5EaaZe9oi8bmoSwXsA6zu2IICcUj5zWGsh
         UEbjt2uQbjWrv83dAhNbhPGk57cLk0cxzHCIeU9GYXDuuhU2rFc76hxNfyjg8KVOT732
         nOUQ9Ipmi2V/8ntM+Vmtdso7eI+a99zjZFKfaji5Vdiq5GcUiOdZAgsIsDbgNGozbx3l
         8Q7R/xCCkh0IXMAXgvv7mhsX369ymuYcarUNlDKKqotnI0l50Rz02HuuuUArJVDjXLL7
         qVOA==
X-Forwarded-Encrypted: i=1; AHgh+RpQXD+DU1lsDKGUceFOpjgIu1F1Tm4USK28tV4gtAOcPm8fV0wUx6ISUwNI7bpi0Zx70beeG9nejHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPNMFqs2UNrXPVu8/uTGqTAvALZYMuDItOKjNoLK4Jl5Ln9tE7
	/cJyOssDMaoJXobtIhChceCCBkYeda3tX+9L3tL9E1PLZrmYO/8VjXXv8rzvBktynFxq2MJxUb4
	VFKRV3EGHa8X2+BoEmwJ/A/SbPZYTVRLy2QOVHb84/HdpxsajmJCGVSDMKboNLg==
X-Gm-Gg: AR+sD10qmbtUUFrzAsxcFE+uKqm445+0RnNYvkD4yDoS2Qf6UJN7I1BrS0OtYWgrKlb
	dyHd92sal3w66dUuDPhHPccUdxpFc8eUTNzcH4bXAnra7rJy9e06XoF2GkEEDfSYD7RSqmQT3c5
	30yE2ZOABuheyBQ+EP2/KM8YMzN5QFE4pnwtPB4RBZw3ufIIqyv++TEvhAEJu6m+ewtT7d1uF63
	vJpgLo8utIaBLshxNoJKwCJRxW2IvDNsNwjGILaMxBL0rXO4gkxQGZ4Gw7d4E3Mq7WXpTioUw7Y
	DIiEQkcC5iDWdaJDQG37wcLMrEuOX9IWGB6EBAKZqxHSoB31tKRXj4CiQHaxtBVsCeqoaiSLxuw
	6k6g4MgWi5MvkkUa39LTUug==
X-Received: by 2002:a05:600c:6a0c:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-4954a40bd0fmr180569815e9.31.1784700457504;
        Tue, 21 Jul 2026 23:07:37 -0700 (PDT)
X-Received: by 2002:a05:600c:6a0c:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-4954a40bd0fmr180569565e9.31.1784700456958;
        Tue, 21 Jul 2026 23:07:36 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm123740345e9.12.2026.07.21.23.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:07:36 -0700 (PDT)
Date: Wed, 22 Jul 2026 02:07:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Schippers <simon.schippers@tu-dortmund.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Brett Sheffield <brett@librecast.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] tun/tap & vhost-net: make qdisc backpressure
 opt-in via IFF_BACKPRESSURE
Message-ID: <20260722020611-mutt-send-email-mst@kernel.org>
References: <20260709095511.168235-1-simon.schippers@tu-dortmund.de>
 <20260714092506-mutt-send-email-mst@kernel.org>
 <5016ae84-7049-4a5f-91c9-ba0047b06ee3@tu-dortmund.de>
 <5089fc5e-2fb8-41fb-9aab-42b22cc2c201@tu-dortmund.de>
 <20260721105853-mutt-send-email-mst@kernel.org>
 <20260721100715.5b43412d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721100715.5b43412d@kernel.org>

On Tue, Jul 21, 2026 at 10:07:15AM -0700, Jakub Kicinski wrote:
> On Tue, 21 Jul 2026 10:59:52 -0400 Michael S. Tsirkin wrote:
> > > > I prefer applying it, but you maintainers must decide that.
> > > 
> > > Hi,
> > > just a gentle ping.
> > > Has there been any decision on this patch?
> > 
> > Hi netdev maintainers. Given there's a perf regression otherwise,
> > we should either take this or revert the original and reapply
> > in next.
> 
> Revert, please. We were AFK and are now working thru a backlog
> of 1k patches. The new IFF_* flag needs scrutiny we can't afford
> at present.

okay. Simon can you post it pls or should I? And once merged post
re-apply for next with the flag included?

Thanks!

-- 
MST

