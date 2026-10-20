Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538441;
	b=W7qHysHBnQk5cr/9KtPoAVOrMKxjWINU7SlPcSioqhFiQ0jExSYQB+fudLDIueGvuL+S
	 CCe+ABNp/4fBlvp5IeAcoDNLcNeXJNpPytZYr+PEqc4BPZTmEElcFe4QJwpja12ZCzQMu
	 2fFZNoLCT+HNuoXzUXCm+yKBs+4zFaCNt/Lv65I4g3b//Y5gUPCMineFX+PpGdMIKPuK5
	 16+iSZB0ZZCiKhSVcpeu+g22crGJbgnfCoJjPuLDs5wFszjxfbDzNN5WDuHurwbtNG4qb
	 gmBoX6V4QmpuM7m/ZWqGtM+yUNLyI7DAuGKqJjB+MARsd/IHhXxQUrfQP4kxfd+CH9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538441;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
	b=DzW6jL8/sDGowtAKET6VhL5xQcvvbJNfT0kL0ckTlRojtMWzOO2QXHeEaCmzc5rdqS9v
	 51mseIn5vOjq96MB7P7JYKCCp/Oclp29KAa+dnEd5b96/qjUGCwZlH9y2fGb1PolSrYvQ
	 A4BcHYKnCvpDa7m7Izycsarz7eKS9xU7Kcapq8qPo6b7J94/cm5Of9e+HfsWBCcCyKlgJ
	 4gAycIV7ho0HTNvSzlTTEr2y5DqITYENZ3GW6ZiXF4Gc+ncsnMkOyXPDVLeEfgWpRnhNT
	 QZgRqoFVdkiIEcpkbUJrvvEfUiOpJFGp+8Hqzz8XAg92rFmn+9mhyBTrO3kmDYxDa6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOO3im+7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Ue/UIrpr";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FE2606A319
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FE2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOO3im+7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ue/UIrpr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792538440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
	b=gOO3im+7T0jHqNyBUA7byCUMNLOYstoaaEcnNT9tJ5RX/w3lur5T9o0cVKvOMiq6xtO0vv
	De2cBvJ7zHO58oMxNKQaLBWOgLmJoz36/avKeZQCTVIxOdLgc4vtY/2gUnQOq/DGuWXIIA
	JVpkuwnqduv9V6jVOVtEj6XDxYuBcNM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-HKG0MsALO1KbWJtUAGVY-g-1; Tue, 20 Oct 2026 23:20:38 +0000
X-MC-Unique: HKG0MsALO1KbWJtUAGVY-g-1
X-Mimecast-MFC-AGG-ID: HKG0MsALO1KbWJtUAGVY-g_1792538437
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dfaaea30cso84140f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792538437; x=1793143237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
        b=Ue/UIrprYHR+2XIIAYcBHSmjkR7zGegvXtlSz7Jt8tWZvBDV8M1fah4wIjTmd8Cp1n
         q9aNpJ3rq3lPhXkzt1sjaOZIfuwvzjDd4IpgGyWH2T8vooQDgdvS7d0awY5X9txSa7Qs
         f+hzeanNcZOYNbByt/VTBoJ3RNsHq1n3ReI25+2Cd2uqRKHuwxi0b1gdrBEM0leA6LQO
         kGw5k9dxv5yyxzu1A8v9bJZMBag6GexyX9ytTg0NkNcZZPDX9Z7tFIq/UPP1RPXnvadX
         QwjCDwhVN8FrTSPuuN0X45t57WwPrrj1NCSM1VXnXeo9VC0LXaS8J6yOGA3p8qiOefz+
         u9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538437; x=1793143237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5fko3A9W0gmx80fHOluIXSlmSb91oJTUY13Ek4gCSw=;
        b=gNdhWl1GiNWZO5Qmuz8BVmYrmjyFZLtLPhDC7aZX1fNLDduT08iP9Es8muth8GYYir
         p+6Ud8yB9eG/tbx0oAD1/ujaH8IKarlxp1bXZp6oH1LgIkRyzdS7FJMwwi5VM7weEMWt
         gY7bpmYf6/zMWR+mvhL87OLspK+nj9uXRWmpWqsfVRhWjXp6GRde9Bmy8DEXpY+InuUl
         s87Njr0TQ4faSSkKEoZ8mWnlrfhKb5SWa2sSwGtG9xw/0QkIOo6UJ1imM4cuIWfxArK5
         p3eceP1b4kt1F36dN0ROaQ2rb3ygSx9uuowMUicrTas/PRHsLeEFX5ghehOKfZMEzMO0
         4dJg==
X-Forwarded-Encrypted: i=1; AKwUvBx+of65gwD3XvonLUS29LvmbZjd6O175jpVmOXS0Dc8eipw7P2mj6axbrSzakaixFajbev3I8Cmj/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJyz4d//VI0/1OrO3t5P6rW3i8IL7opUfX8WXh6K+6CvMS1J+D
	9fJiZ9+yLUC+i6aG6WW+I3WPslVg9Q0UOs0RuobufDcVEhrbPASajRr5kMcgylDKEIkPcOq6SVi
	07rX4s0mWyZuIvrnYxPGIgU6eBKLoxUERFt0M0cOEpna8PrsBGqNX/1QJ/dGQ8jF4sA++rg==
X-Gm-Gg: AYBFou0B99t1qKOQvHAcIIYVcd4y6IspxAWuTXp925pMKAVL85Yv3zPOuv5yG/vhnIQ
	xgsyRzJ4lTULyptLxRHodXF+a9wrZ4yP2BSmJPsSMpMLg6edXeiQ1zGDtq38VyyQPfIGpPl8GEj
	E1V9VUdLsIPBJxSJ8kI4EBV4HETS6v6vlQOdMVn6bhRZ3fRdPrQR0LNhp/mxjsTRZUhDVL41vhP
	wrc7cWQ7tZwLDJ/23G7ze12gHsyunn6TucWoxJ7Jlw5evbtLGBMWmMKngps3prnplCMVOU2NROi
	6xEjcSLTIUikF9ukEjJiEiFiI08FuFOeqXxdyfIwooR//UucQtJ/7nevOxPxEhDqF4niQQ==
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e2642ce22mr436280f8f.2.1792538437154;
        Tue, 20 Oct 2026 16:20:37 -0700 (PDT)
X-Received: by 2002:a05:6000:2313:b0:48e:d27:bee4 with SMTP id ffacd0b85a97d-48e2642ce22mr436239f8f.2.1792538436673;
        Tue, 20 Oct 2026 16:20:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0a2sm1544348f8f.10.2026.10.20.16.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:20:35 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:20:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v3 6/8] net: add a sysctl to opt out of virtio net
 hdr checksum validation
Message-ID: <20261020191918-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020165610-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.34b42ddc625c5@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.34b42ddc625c5@gmail.com>

On Tue, Oct 20, 2026 at 07:13:42PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > > +/*
> > > > + * Protects changes to virtio_net_hdr_csum_check_disabled_key and each
> > > > + * net->core.sysctl_virtio_net_hdr_csum_check. Readers don't use a lock.
> > > 
> > > it appears that they take the mutex_lock below
> > 
> > Some of them? But
> > virtio_net_hdr_csum_check_disabled doesn't, that's the point, right?
> > 
> Yes, but the statement is then too absolute:
> _some_ (or most) readers don't use a lock.

don't use->don't need?

