Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D70367F21
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646004; cv=none; b=WT/HLBu7tNksN+p3+MhrTYVaQ+XfDwNGa0REwviZcVE9tRJ08aOpus+VwtmQxhKkCWi5l0Dg6sgRo8QGLL8QHAWKGCPcfiWCx2fb0OImH9QssgHJm4Z2pVsaudVFunNraA/T7AnC8Yji51UypSUzPJBfRlHMeYb9kZtymX9m7dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646004; c=relaxed/simple;
	bh=TcK76ifJ0Z4VlXfYbMDVybg1ZGOuiCooobYCZs60pk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnJ23L17wcT3eCxR0xqfUcuiWm9ple1b/PDEfs2SB3iVsmx1HQiYwbAhnI8l7cAfkfZvHu+Md1J8UhqmYJ4s/i9cTTHA8nZ88UPvEv9wE7G+3r9j/7j/4XBA0pqE5uKi10NsXl2q7f/86omMh9W4AaY2DK9sNS3OmEc7PnBgiV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNEl0G6e; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mdMiUoyH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNEl0G6e";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mdMiUoyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784646001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ceRTbadFpgJqwcQ9MpntM7cuc9uc43skQEIpoL+u/ro=;
	b=DNEl0G6eSM3yIwZN95zYIVsnzXYigDeHaE5UTtcCyU2KnxtnnYywK1CjYdw5UR2OzslGk7
	YRtqKrDm/ugUAE69iJyb1PuF49Q4XAc24kj5rvfvi6p0UiXcWU8joeXAucI6IPqdcsE3ah
	xqlVtWoeUdp2ZHReJMYtdYQ4yULGKec=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-U9Xy4GjFOTKIjrd4VVcYzQ-1; Tue, 21 Jul 2026 10:59:58 -0400
X-MC-Unique: U9Xy4GjFOTKIjrd4VVcYzQ-1
X-Mimecast-MFC-AGG-ID: U9Xy4GjFOTKIjrd4VVcYzQ_1784645997
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767b782so59897995e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784645997; x=1785250797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ceRTbadFpgJqwcQ9MpntM7cuc9uc43skQEIpoL+u/ro=;
        b=mdMiUoyHxPNdwYohE3tulXfHfpt/p74civKcTrj+B35cQ5D+C2QTA6d4yAIoQTzQd8
         C+cWGuEGSYFJG3obBt1CM3TSCChascDQuV2ma2hapjMcqzNvnr5YsChVMy1WnpjtJQNm
         Azf/t+pMkYYDH3MsOcYDFYUK+Q05pPZASgPeb4whQ2gEtHcFcd5Y01hMl5iLLt8Cb1bZ
         I/+S1PsE7DIMyxQqDFM7UySNN0pf92B6enM93Tuz4ltzez+mRk+aPGNjFDXUnRTkWcxb
         x+rjMDLeRIhm6m4ulOmc13k5GLKFNyLbJgJny2YsqxhCPoPj4hKz2lltaW4AAjhZ26AA
         2UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645997; x=1785250797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ceRTbadFpgJqwcQ9MpntM7cuc9uc43skQEIpoL+u/ro=;
        b=QEzaBGgwpw38aF23TYd4cxP34anJDeL9yM8DyJxysqfOpYIJthgUAwCLslJea0BnB2
         XHxRhqDaFWxgONS4TcAUsGio7cs3gI+jD4LVR2sM0r+6vR3wMar4YDrpBpBsyh/zow+6
         Xd7QY84bpYsVrSdbn9QfbN5rc4kwoH+XKlUWNLx6E/MEjLpS6of3Sl0TJGGtb8qUCAT1
         HjB7NGs4ak4k+i1k2j1vckqFv4BKwUfij6DoaruVqdhoKEvs385tzaST8V/y38Jm7mis
         9ukF6v+16UilQU7YGJtYSAsvAAND1FN/jP0sUh5UarvKA3phtNZ1DArYFch5DN4/YQol
         +0WA==
X-Forwarded-Encrypted: i=1; AHgh+RrvYMM3Vrqs+2+F9awZSjJ1Yn8g0nPLMOcrqIH2qZOmRmYrl/YcRP3bkKP9fExIuQA4XJkCgWhYLrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4PwvTog+uyeU2i0ABraaPN9FGfBciZcFINPF2ECyTYTAZZGt
	ckHku9OA2nc/1xXATng689aieVRuIR4PRAcBY3o+WtkSooqfLbFdDyHDeHuJrYJR1X9kiSHBlcf
	G+foPXjsAJrQwoSoAQrZLRHGk9BQM1MebHhaiWT+12pFySCF7M2lUYsPb4QmC3A==
X-Gm-Gg: AfdE7ckJ0NreclX8f0GSeI+O0xyS7Ym8x9O3MN2SNzmOYE/bWsrHYCW5K5+6rCDX0bH
	xHtS69jZOqKHxj2RK1jx217ywPvgqVTxgWPupJJ0pwLCv1bNBYZ/AcVokG94Uhe2d3wR/iKWG71
	dOfpxRTr8U4kwClf2cwxSxTB4GNsQGN+SHSd9Togau43Gw/sDTpWeCPGX6PUOod14iTelTT2deS
	vlPJ6DD9iUywALT+VGXiaGIEjFbSMGa2kTogEqC/maZKIftggmSq2kO0KgL7oEfcSABIPZVPFVM
	WX7uWkLUV547tLzeWGQmkN9IuKYMaDrzi70xRZJHjMSrSNvV9TjG9RACS/NVMWUwPpxRHh+xaqL
	/WAQvs/4o5V7HuHUEecSYWw==
X-Received: by 2002:a05:600c:c04c:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-495648fb143mr40821705e9.7.1784645997152;
        Tue, 21 Jul 2026 07:59:57 -0700 (PDT)
X-Received: by 2002:a05:600c:c04c:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-495648fb143mr40821295e9.7.1784645996584;
        Tue, 21 Jul 2026 07:59:56 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e496afsm41604679f8f.1.2026.07.21.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:59:56 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:59:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Brett Sheffield <brett@librecast.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] tun/tap & vhost-net: make qdisc backpressure
 opt-in via IFF_BACKPRESSURE
Message-ID: <20260721105853-mutt-send-email-mst@kernel.org>
References: <20260709095511.168235-1-simon.schippers@tu-dortmund.de>
 <20260714092506-mutt-send-email-mst@kernel.org>
 <5016ae84-7049-4a5f-91c9-ba0047b06ee3@tu-dortmund.de>
 <5089fc5e-2fb8-41fb-9aab-42b22cc2c201@tu-dortmund.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5089fc5e-2fb8-41fb-9aab-42b22cc2c201@tu-dortmund.de>

On Tue, Jul 21, 2026 at 04:04:33PM +0200, Simon Schippers wrote:
> On 7/14/26 18:50, Simon Schippers wrote:
> > On 7/14/26 15:40, Michael S. Tsirkin wrote:
> >> On Thu, Jul 09, 2026 at 11:55:11AM +0200, Simon Schippers wrote:
> >>> Commit 1d6e569b7d0c ("tun/tap & vhost-net: avoid ptr_ring tail-drop
> >>> when a qdisc is present") did not show a relevant performance regression
> >>> in my testing but on Brett Sheffield's librecast testbed it shows a
> >>> significant performance drop in a IPv6 multicast testcase. The regression
> >>> can be pinpointed when multiple iperf3 TCP threads are sending. For 8
> >>> threads the performance dropped from 13.5 Gbit/s to 9.13 Gbit/s. This is
> >>> the reason why this patch makes the qdisc backpressure behavior opt-in.
> >>>
> >>> One option to accomplish the opt-in would be to set the default qdisc to
> >>> noqueue at init. However this may also break userspace as users might
> >>> have chosen a custom qdisc even though most of the qdiscs did nothing
> >>> for tun/tap in the past due to missing backpressure...
> >>>
> >>> This is the reason why in this patch, the flag IFF_BACKPRESSURE is
> >>> introduced instead which is required to enable the backpressure logic.
> >>> This means the stopping logic in tun_net_xmit() and the waking logic in
> >>> __tun_wake_queue() are skipped if the flag is disabled. Setting
> >>> IFF_BACKPRESSURE makes an attached qdisc effective by stopping the queue
> >>> instead of tail-dropping when the internal ring is full.
> >>>
> >>> To avoid a possible stall due to disabling IFF_BACKPRESSURE, the new
> >>> helper tun_force_wake_queue() is implemented. The helper safely wakes the
> >>> respective netdev queue and resets cons_cnt while the consumer_lock and
> >>> the producer_lock of the ring are held. The helper is run in tun_attach()
> >>> when a queue (re)attaches, in tun_set_iff() for attached tfiles, and
> >>> in tun_queue_resize().
> >>>
> >>> The documentation in tuntap.rst is updated accordingly.
> >>>
> >>> Fixes: 1d6e569b7d0c ("tun/tap & vhost-net: avoid ptr_ring tail-drop when a qdisc is present")
> >>> Reported-by: Brett Sheffield <brett@librecast.net>
> >>> Closes: https://lore.kernel.org/netdev/akVnoOYQOrt8k-Gu@karahi.librecast.net/T/#u
> >>> Signed-off-by: Simon Schippers <simon.schippers@tu-dortmund.de>
> >>
> >>
> >> The patch itself is fine:
> >>
> >> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> What bothers me is the timing: we
> >> are past freeze and this new interface hasn't been tested
> >> much.
> >>
> >> We can either apply this, or revert the original patch for now
> >> and reapply with this for next.
> > 
> > I prefer applying it, but you maintainers must decide that.
> > 
> 
> Hi,
> just a gentle ping.
> Has there been any decision on this patch?
> 
> Thanks!


Hi netdev maintainers. Given there's a perf regression otherwise,
we should either take this or revert the original and reapply
in next.

Thanks!

-- 
MST

