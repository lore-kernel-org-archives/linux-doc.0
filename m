Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387C361DBC
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527067; cv=none; b=o1MTeZ6kKB4cel2+uoq/pfcP3qAbNQGffvAyCPicSLhly0CjbIdDhq4eZTvgfiNE16NE3T2WgRjbXVZT4PJhpSRStJpu+Ch8yYs/YQHKt++esravaUen90aIFut31xrSx/yCfpIYzMqjpiozXpyknod7gsFMhgABITEJBSAPSPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527067; c=relaxed/simple;
	bh=V5ux1nZN04PwAUuGu52W1iz2CbiB1pVFL2Nt7W3m3IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTnLqZZ+Wd4TZmoJZi63ccEAb/7fmIurpKeq5XjLx3dIeXpuDUBnUnFzx8w2nvhNtXyoEcsGNygwsxBYgTOoeiBRy9x+F87bDlOF8PIsRog+TOFhkdQdu8AMPmMFV0L6AmRwDprx+P2IAUSC+I0c86uv+OgNqThoCa/9Zn7/Y88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c05qyYMt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9Zr6g/4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c05qyYMt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9Zr6g/4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783527065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vo2GCqsDo0gKVs+6QoyTlZNbpg5pdmI6w3O4Dfz0CRY=;
	b=c05qyYMt4hmFy/zGuvHscBLYVbcYYgTcspxosMPWmFznJ7O0iCF7M9KwsJS19859/jRZOq
	vdBHQ5KXLDimh7j6WVgmcvP5CVL+FzaQvm7fSCcqarhD92e30xEYU+Q/jhLIYVErDM+vqt
	+ImiQscojBfIQ7sICn4Cj7oHkw8vfhE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-snkOy9gmMPu36N3vZ1WpFQ-1; Wed, 08 Jul 2026 12:11:03 -0400
X-MC-Unique: snkOy9gmMPu36N3vZ1WpFQ-1
X-Mimecast-MFC-AGG-ID: snkOy9gmMPu36N3vZ1WpFQ_1783527062
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-475b0b4e8d5so908166f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783527062; x=1784131862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vo2GCqsDo0gKVs+6QoyTlZNbpg5pdmI6w3O4Dfz0CRY=;
        b=c9Zr6g/4UBNEzkylVPUrye7+0oJXUDCK9+qFDRhqr9mpYSHVH8XRHfw7WXwcDuhojo
         4DCfx9YyXvdJ+oJKvW6SyQ4izFgdZ18H8Aq8jQAioJbPkBJEt8KQJZFKzTrZpvhIppA0
         ni6fQqVw4u0P+V4oS6xYEDAejoosNaeaSkL4gE41NUUNx84N09aYBiNdVqbGtwwnVB7d
         9AFZMXeN20YZCndhTlMEUfa0to5tJiXD56o61b39+3UuSwORnP6Q03zIpgnMv7BIJfbh
         ZSt9wc5JzRRg3CQFEdj/z5x+XWLx7yY5mWkRtF3ZhEAHsdUS0hbTLaNIgPAbL078iBNB
         H82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527062; x=1784131862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vo2GCqsDo0gKVs+6QoyTlZNbpg5pdmI6w3O4Dfz0CRY=;
        b=CzlLRc7P3S+yiaIDlvpoMxq3Tb+a9ccNX0BFsap8qSUCJzj5L3g7VWOupKcvcDcvIh
         arc9uGxXO2VgLVBmDinsmoquWg4JpjkC8iNISB3PtcM4azbXcDzvNVR3vRCBc09MeYV7
         NPdLbTL1acpvEa4hOsarqLNqup2ELdIfVWqW8amFPxknkVePhZFSGVvy2OBK9MOUEW/A
         3xdlnmskmHFFTpBio8UssUunMbAMYYAepY4AQET1b0I+ZmtJKaLRfArVPmKZYNNEGWWo
         Y6KmdisvWAy2BMVFJ28KDO1Moyy7swkBtJL82b9/2eSfpYdk9vw9C0U14uy+6ZYY/0u2
         cpkw==
X-Forwarded-Encrypted: i=1; AHgh+Rr20aO95d2IqvLoiVSLwd6n9R+FTKOtm4NvKnKftudrHUL1F9DxJmEQzXb0FqqfmSG3ZAKY8qYaArw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Xrh6Dbt54IHnuUEtPFjXAPDMFtYf6VRYjaJqTtv1ez1DSfIp
	UhK/nNuJHIrq9bKSG11JwntBJRo+yLAOk9QJN7y5tJZvBeRWj/L9Xa1JoVqqLUnNvP8EHkYaEXB
	nAgm1cV1HhhtYJ9wLN/V9v86IkwGWpnNg7qskcILEqVXVS23zY45Pm4JKG1VN4Q==
X-Gm-Gg: AfdE7cngwpV9mxUz3vNVvruhuXJ9KINeYbq/UcnaNoPfmhsJswkBM2LHpxrrTR7xXZV
	ps3uH1tBoTlNSy7pPl36m+jyYw+fdhXwwHtu/JBWX199TO8N8lRcoquk765TvRGoDHKyHCbIYxY
	rUzZoL6BnpUj1dWTLUG+p9htphYCANSoWU6wTsBPXMehx5V+WYgPjZyUHVk0YmNABSWaVoDwn/d
	lfsWEuzzD1S99rmy0U4ZYO725FIIi2hiSZwre0SI21rDKcYoZoA48673WUcl3HTSXbG42K/XeUA
	xbVQBSDAE1VH2TM4n3+fLg/7didU/1dFteUWh75ZtL2dZq4bV3JMt9rP66QtYF0oTI3NH1QLM1c
	ya7yhdSiV3or5WbOfeFgS5pPuAs8D+Usm
X-Received: by 2002:a5d:5e8c:0:b0:46d:8169:bb39 with SMTP id ffacd0b85a97d-47df075c5eemr3831553f8f.37.1783527062163;
        Wed, 08 Jul 2026 09:11:02 -0700 (PDT)
X-Received: by 2002:a5d:5e8c:0:b0:46d:8169:bb39 with SMTP id ffacd0b85a97d-47df075c5eemr3831505f8f.37.1783527061636;
        Wed, 08 Jul 2026 09:11:01 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44511080f8f.15.2026.07.08.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:11:00 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:10:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Brett A C Sheffield <bacs@librecast.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] tun/tap & vhost-net: make qdisc backpressure
 opt-in via IFF_BACKPRESSURE
Message-ID: <20260708120925-mutt-send-email-mst@kernel.org>
References: <20260706094242.115992-1-simon.schippers@tu-dortmund.de>
 <akt_Q7kdR3Zb8_GZ@karahi.librecast.net>
 <20260706091706-mutt-send-email-mst@kernel.org>
 <2728c540-2e76-4e06-9064-ed1dff071cbe@tu-dortmund.de>
 <akvhhy_JpH64KrcL@karahi.librecast.net>
 <0d28fdc4-3c03-48d6-bd59-e59f7a01f4b6@tu-dortmund.de>
 <ak1cIAwQzKS35x0m@karahi.librecast.net>
 <c743935b-7b6f-49f4-b1dd-3fe1cc528464@tu-dortmund.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c743935b-7b6f-49f4-b1dd-3fe1cc528464@tu-dortmund.de>

On Wed, Jul 08, 2026 at 05:12:19PM +0200, Simon Schippers wrote:
> On 7/7/26 22:05, Brett A C Sheffield wrote:
> > On 2026-07-07 08:52, Simon Schippers wrote:
> >> Brett, can you try the two attached patches here with iperf3?
> >> I think testing with 8 and 16 threads is enough, so where there is a
> >> regression.
> >>
> >> The two patches are about time when to wake:
> >> Currently we wake after consuming half the internal ring buffer.
> >> One of the attached patches wakes after 2 cachelines (128 of 1000
> >> packets) and the other one just wakes once the ring buffer is empty.
> >>
> >> This would really help :)
> > 
> > Sure...
> > 
> > 
> 
> The reverted results for reference:
> 7.2.0-rc1 reverted:
> 
> threads 1
> [  5]   0.00-10.00  sec  15.3 GBytes  13.1 Gbits/sec  368            sender
> [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> 
> threads 2
> [SUM]   0.00-10.00  sec  15.9 GBytes  13.7 Gbits/sec  1567             sender
> [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> 
> threads 4
> [SUM]   0.00-10.00  sec  16.5 GBytes  14.1 Gbits/sec  6701             sender
> [SUM]   0.00-10.00  sec  8.00 GBytes  6.87 Gbits/sec                  receiver
> 
> threads 8
> [SUM]   0.00-10.00  sec  16.2 GBytes  14.0 Gbits/sec  19319             sender
> [SUM]   0.00-10.00  sec  15.7 GBytes  13.5 Gbits/sec                  receiver
> 
> threads 16
> [SUM]   0.00-10.00  sec  14.4 GBytes  12.4 Gbits/sec  43593             sender
> [SUM]   0.00-10.00  sec  14.4 GBytes  12.4 Gbits/sec                  receiver
> 
> 
> > 7.2.0-rc2 (unpatched)
> > 
> > threads 1
> > [  5]   0.00-10.00  sec  20.4 GBytes  17.5 Gbits/sec    0            sender
> > [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> > 
> > threads 2
> > [SUM]   0.00-10.00  sec  12.7 GBytes  10.9 Gbits/sec    0             sender
> > [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> > 
> > threads 8
> > [SUM]   0.00-10.00  sec  11.5 GBytes  9.85 Gbits/sec    0             sender
> > [SUM]   0.00-10.01  sec  11.4 GBytes  9.83 Gbits/sec                  receiver
> > 
> > threads 16
> > [SUM]   0.00-10.00  sec  11.6 GBytes  9.95 Gbits/sec    0             sender
> > [SUM]   0.00-10.01  sec  11.5 GBytes  9.91 Gbits/sec                  receiver
> > 
> > 
> > 7.2.0-rc2 with 0001-tun-set-waking-threshold-to-ptr_ring_empty.patch
> > 
> > threads 1
> > [  5]   0.00-10.00  sec  19.6 GBytes  16.8 Gbits/sec    0            sender
> > [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> > 
> > threads 2
> > [SUM]   0.00-10.00  sec  11.1 GBytes  9.50 Gbits/sec    0             sender
> > [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> > 
> > threads 8
> > [SUM]   0.00-10.00  sec  10.8 GBytes  9.25 Gbits/sec    0             sender
> > [SUM]   0.00-10.01  sec  10.7 GBytes  9.23 Gbits/sec                  receiver
> > 
> > threads 16
> > [SUM]   0.00-10.00  sec  10.9 GBytes  9.34 Gbits/sec    0             sender
> > [SUM]   0.00-10.01  sec  10.8 GBytes  9.30 Gbits/sec                  receiver
> > 
> > 
> > 7.2.0-rc2 with 0001-tun-set-waking-threshold-to-tx_ring.batch.patch
> > 
> > threads 1
> > [  5]   0.00-10.00  sec  19.6 GBytes  16.9 Gbits/sec    2            sender
> > [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> > 
> > threads 2
> > [SUM]   0.00-10.00  sec  13.9 GBytes  11.9 Gbits/sec    0             sender
> > [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> > 
> > threads 8
> > [SUM]   0.00-10.00  sec  12.7 GBytes  10.9 Gbits/sec    0             sender
> > [SUM]   0.00-10.01  sec  12.3 GBytes  10.6 Gbits/sec                  receiver
> > 
> > threads 16
> > [SUM]   0.00-10.00  sec  12.5 GBytes  10.7 Gbits/sec    0             sender
> > [SUM]   0.00-10.00  sec  12.4 GBytes  10.7 Gbits/sec                  receiver
> > 
> > 
> > 
> > HTH,
> > 
> > 
> > Brett
> 
> Thank you again!
> 
> These results show that waking earlier performs better in this case:
> For 8 threads we get 10.6 Gbit/s instead of 9.83 Gbit/s when waking early
> but we are still *far* from the 13.5 Gbit/s when we revert everything
> (see above I pasted the reverted results there).
> 
> So I come to the conclusion:
> 
> 1. Waking earlier/later will not fix the performance issues. It may
>    improve the performance slightly.
>    Apart from that we introduce smp_mb__after_atomic() for the re-check
>    on producer side (noop on x86) and a full smp_mb() for the re-check on
>    consumer side.
>    Nothing else stands out to me apart from the overheads of
>    netif_tx_stop_queue() and netif_tx_wake_queue(). But we must use
>    those 2 functions one way or another.
> 
> 2. Users may depend on the dropping. Without backpressure tun/tap acts
>    like a pfifo qdisc which tail-drops. Some users may require this.
> 
> --> I would merge this opt-in patchset, it should be fine (it is not
>     flagged by Sashiko anymore btw). I would not be mad if it would not
>     get merged but I am out of ideas on how to improve.
> 
> Thanks,
> Simon

I am fine with it being opt in, but we IMHO, need to be more clear, for users,
opt in to what this is.

-- 
MST

