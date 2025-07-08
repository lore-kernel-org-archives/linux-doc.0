Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20572D29D1
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 16:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990457; cv=none; b=jyW6cNx+eDdlUoJsIwt9ecoaUUhp4xZr58PbQRiVXOTzR4OZd+0xMubW8+ThwgTuzLRj0MsKhMNbZvUpLXf4cWTbf2oyMbEXQ1FgEzJU4E8+EUYaWcVq1bBb6gXfWEHcuAOz8xvXp27zMKV5mA59NJAXYjjCsht6Kwx1TumbXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990457; c=relaxed/simple;
	bh=StlcZvK6aGILEdk1KZNWda5UzucYRHUtZYuMqW7hhhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcdJChV0I4hYgaTPhr+ZEVyIXZeay/DNsvzOYadQ1blo/YJIP9Zk6FBdP0ZPTEt3jpp8pAZnfH0/iviFLy6plgUyuG8YgdzIyB6LhI8LZjelM4UT1AiPv2SEpi4YsLKailEm2fllN+8SNKvROwigvDRnJccoeCbuuCHfst14RNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vq+3H54t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vq+3H54t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751990454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k7rmSrQYi60FMAPm+K5LDdHo//beZbxEAuJpXe2zQCM=;
	b=Vq+3H54trZwTo2iLjo8VTt9Ez9Q5tEuz8HinD9jpPSiilF8Xq2R/YNR5OgH0VgKrqN7Ao2
	2wWQIErvpv5ZnEcuDWIKvBCG3oz/RnPNDHZlxPPFhJdytS6iDQdsaMZLkf79x0HfjWlLeR
	C3cCBBMfNmp1wVi2U6PThZemF1X48OY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-77jpcIqNN36nqP1_uV5W5g-1; Tue, 08 Jul 2025 12:00:52 -0400
X-MC-Unique: 77jpcIqNN36nqP1_uV5W5g-1
X-Mimecast-MFC-AGG-ID: 77jpcIqNN36nqP1_uV5W5g_1751990451
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45359bfe631so24726255e9.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 09:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751990451; x=1752595251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7rmSrQYi60FMAPm+K5LDdHo//beZbxEAuJpXe2zQCM=;
        b=npUOlI5V+uoNpYD3MGhd3Bw6gX0Cw7YbsbFmcLuT+8QhOa6Q2Tq7K56cZDT4RzZ/zB
         mwvGHP7MJm66xjQHykB57x4xC3AHad7MhAPoIjKHkCFUafaTRED/b24ng+isImbYCbjl
         jlHUwbesdvmTCi0slZTLWDtKUpvnXZD44pjTk4YqLV564/ccTSUPc+WofSajWsCtGF1I
         ybnBkSCv1f2pvvJt1KEQzSTzgZhdyUaAZHIvCOdBBwoHd0KEq2OJ15aVmDxzLQbf6iwy
         lGEdP6k/gqF4FfbAF3JwOzG4WoNaQ53/GGk1i6Wcv64PUsCpFUwIEfQUSwReAlFaP7jc
         K4uA==
X-Forwarded-Encrypted: i=1; AJvYcCWJish70VHm9Ekxn6MiaCY5FjmSiUgloX4dDPqmjZAiwnzh1l2wXn86L/JJbIHSXXMHDIArxgSdvPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuwzTbXDP6gFu6ElOgQJLdYjsI8n38KVn5lRphlhq8362WMoC
	5WNsQCeEGqYaqjLs/i5pHWFFQGR1q6EqzbIVDb57SMbxV3I/1H4MGb+KjUHPNaBMHVSU9AgOVpb
	bbiWSYgLtH+3D1qyFvbfCVx8XvajY7bgPIRW/C/zB7s3yvfQKzcCkrg0H+8nFxw==
X-Gm-Gg: ASbGncvX3sC4/vicy3ES7BuFxBvSvSBNDyHoDG6cd3cvan2z0tywLoYMrmaLiY/oxtb
	j56CYrXvahsb/iLI2NPNUDQFwvS0gzxKwetO4BDuEZ9+aNAVp1R+Ib6P4qzXNbFysyUjb/Y59+D
	5NuLDjkW3XQMcfXHPQmQvqjqFZPqFxaFn3EICrhXP/cUNzkQIIw/yN8uOxjJ0JEIWMnzn2MGNyk
	NVqqftqg2TGa9mKmQq1WRPn01kQ1gqvr1/9xvb00GXx7hYWyPQcCbtcuvq3zxbehbUU6ZBwSwEC
	qlghuSMOu3SF9Nc=
X-Received: by 2002:a05:600c:3e0d:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-454d35ffbdemr2267415e9.7.1751990451155;
        Tue, 08 Jul 2025 09:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiSR0msPRTkgKz930LJ0aKsR6/r+DX3T5MYEMydUmRzbvpCWWwSZ1kxGtK+XaWrTCCG9Ic8A==
X-Received: by 2002:a05:600c:3e0d:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-454d35ffbdemr2265355e9.7.1751990449097;
        Tue, 08 Jul 2025 09:00:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd3d7d44sm26526055e9.30.2025.07.08.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:00:48 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:00:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 net-next 0/9] virtio: introduce GSO over UDP tunnel
Message-ID: <20250708120014-mutt-send-email-mst@kernel.org>
References: <cover.1751874094.git.pabeni@redhat.com>
 <20250708105816-mutt-send-email-mst@kernel.org>
 <20250708082404.21d1fe61@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708082404.21d1fe61@kernel.org>

On Tue, Jul 08, 2025 at 08:24:04AM -0700, Jakub Kicinski wrote:
> On Tue, 8 Jul 2025 11:01:30 -0400 Michael S. Tsirkin wrote:
> > > git@github.com:pabeni/linux-devel.git virtio_udp_tunnel_07_07_2025
> > > 
> > > The first 5 patches in this series, that is, the virtio features
> > > extension bits are also available at [2]:
> > > 
> > > git@github.com:pabeni/linux-devel.git virtio_features_extension_07_07_2025
> > > 
> > > Ideally the virtio features extension bit should go via the virtio tree
> > > and the virtio_net/tun patches via the net-next tree. The latter have
> > > a dependency in the first and will cause conflicts if merged via the
> > > virtio tree, both when applied and at merge window time - inside Linus
> > > tree.
> > > 
> > > To avoid such conflicts and duplicate commits I think the net-next
> > > could pull from [1], while the virtio tree could pull from [2].  
> > 
> > Or I could just merge all of this in my tree, if that's ok
> > with others?
> 
> No strong preference here. My first choice would be a branch based
> on v6.16-rc5 so we can all pull in and resolve the conflicts that
> already exist. But I haven't looked how bad the conflicts would 
> be for virtio if we did that. On net-next side they look manageable.


OK, let's do it the way Paolo wants then.

-- 
MST

