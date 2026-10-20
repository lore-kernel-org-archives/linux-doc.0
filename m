Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526478;
	b=glbBghzToPjdcBEtRWXmbx/4oQyQ2q7DwHdRgriokVTD3T87qyuNv88v4c/SL+C1xDNU
	 FTL+H5D/pjhBUfUiv44v/Z0DlT5pOZPgSoMhSk17qn5Nt/WrFX/tVLkRynum+3nbFgc17
	 P1YS5L9Bcl4gkAAh/Ek/h18j7JuisuhZ6HvdXCgKa5gsx4fJmkMjv07OcB/cIZTJYX3wa
	 k3oGOjv3bT4y+oEyHBv20SagNvitRe9B/RBIc9WcD6bm4s5a7Oz+pLCbLH9h5cqhF+zjU
	 h5BB9cpXKEi/ePD/Z9gEE5tVShuh/ALizOPRmJw+EKtYExz+FsKKbfu73JrHxSRbvcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526478;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
	b=KrjMMN0mWhyL7u5bc34pYPVTs0yoj0bvsPIB8GypVvyzgtUWc9eLsmu1+bBDU6aLBQ+W
	 ZuEv5zK4MUXS6egIQqddrog1c87kJRawzr6EywylVg1MOu1Zmq1Ku69xdxbjNGcMnbtHX
	 oQG7iPKlsMKiDmMtXxYqbsRhnCjhOJUMbbbLJRQIeILokSlTbM2yn9e1LU0+ctAauixqe
	 1hlRnFIBAkgsErfd5E12pexqUNysruNhkxHmbPeja9srekV9eAVHVb8NwCyteLUEX+GMd
	 q8TsBlV4BeQxdgkcz8IRVLMhmbed3mpkpYQYnM1qxp1IdDM+CDOzUQ0U82KZluMecqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5VdsOPX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RxSvZcvo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E6606A323
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3E6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5VdsOPX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RxSvZcvo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792526475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
	b=E5VdsOPXqa4xsqxi/sxSxdZgQoS6+fASz3elMJV4F0NE1tZnfU/C5wT1CjmIh61As2KirW
	e68ybuFvXA3WHVtH3bpqETZis6rQVadouIQs6o1l32Rj2XLLAHzxplgmTPqkqNfaP0w3+j
	ob4KXKPrRFezzCxmtb7dJwgwCWqCo9c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-nCmHEN1OPcWYozEbuPhHUg-1; Tue, 20 Oct 2026 20:01:14 +0000
X-MC-Unique: nCmHEN1OPcWYozEbuPhHUg-1
X-Mimecast-MFC-AGG-ID: nCmHEN1OPcWYozEbuPhHUg_1792526473
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso27717535e9.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792526473; x=1793131273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
        b=RxSvZcvo6lyk1Ci+d7Q/KJ19r5bvX39NJhNNsXMBrcK7mnCLaQJ08daYrsO48hN0Fs
         hWbEwVdhG30/LsEmE5uFmzdvi2OYfQhFxT3vxoLatZbIWhRSrSuPMvOJBDg+Q4AZBm8g
         IxN6/F/y3VMBL+q8kofMTUasIB5h4oAsNU8DzbkTCuNlDp6mwmpMow7NVKpiMDcMW1js
         +sUAyl7DyHH6cBfhLqHDBojwgOCsZ6k5rlU7Mblz6FNhsu48mpM6LcHFgV6GX6I/2YPv
         efqwno/aTCqFF93leqmSfRMfzzQ5S6ZSd+H1mETSpTE7fx5xJnGCogwEDmpLX3OOny5C
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792526473; x=1793131273;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zI4sbiHutLhUzts3GNlZ8BZlCgpCPi+nYzjoB3+wLIE=;
        b=pmq1eh1GBPT6qgKlJnacXwmEjJV3Y3sv7IOLKkM5rbW/AV4u7/UacRFRtKTBKIaf43
         hjguJet6Rk2dxOzCth3ZRBlEREPTUCjEq2AyVaG0HXskl0eV30Yxbi7uJgqRvYi2npiB
         3eTrklHNEjo9QBIi8gh2bN9K7iJAFhJLwIUrin19CJz9l4V8/fY8SUamOluwt5ocRnsi
         jtqPqO7muUqsJfEsEX/ZTwxXKePLXJUoptnYqUPYvgpMbRpp7+XkT6ubLz2xpUYPmL3Q
         NoVyIjw6Np9CWSnespADEEep1cn8QE09oPVWaI1yZk6FRMi6mDbCfnOBMGDbJUo15qHv
         I9oA==
X-Forwarded-Encrypted: i=1; AKwUvBwfuMYgXmQZmT/7eIbqx9Ww+dK81DtGq+4hXFnrCYSQDhSIBuV8skLSfiuLgNjn3zTb2168rMH3M9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWWTDqA93hJrL4Jh+FnjQyzV4A7jWGsnK0pjaKvh22V8hUwAPj
	msQ0fkmQqi4mMoCZt/QR/9T8tdBFBpL2enFfa2W1dSUxNuACOdBoc3akjKrkWBaRSJarkD8n9yp
	ew9TPxrFC1Ts60PNBXGkM1AjgcvkleSrwE1Bvnx4vPsAujl7TMOteSe1tfdsSYQ==
X-Gm-Gg: AYBFou2kFhaDPTvVxeNOH9joTdjzuvwVM/358BnRaE0EAY8XvT3sJDiBHu+y5hr74Qv
	uPhviejq8rr+ov+J7K6J1925pFTHloiqgXnlYtcNnFpHYtJ3APmQlZWsRfB1GA69mcOyBsmqV9O
	pfqhM3Uh84B6x0VOxxy66UDPynVX1uvkCkmyqtZw+ttdBukfXNXXRv12kW22gHseu4CGI6kOIXi
	Lc52Hrk9rm0mQWvqmK28pFra4uYaAzY+sGRbUn/5dY5nDeqrzF7mrDhQMJFby+mNjL0gg0zyR7W
	ipw8pyt1iaQunRFy0/GeSzP0x9fYh3mEv6YxAwNtqyUmPQ2XBurRg3wsJYg1z9ISIvw/wA==
X-Received: by 2002:a05:600c:8010:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a1fbf8577emr14172855e9.33.1792526472959;
        Tue, 20 Oct 2026 13:01:12 -0700 (PDT)
X-Received: by 2002:a05:600c:8010:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4a1fbf8577emr14172305e9.33.1792526472489;
        Tue, 20 Oct 2026 13:01:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb96bc7dsm22498245e9.15.2026.10.20.13.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:01:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:01:08 -0400
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
Message-ID: <20261020155917-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.187d58ff2bce5@gmail.com>

On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > The ingress validation as implemented by the previous
> > patch is stricter than what it replaced: GSO
> > packets whose checksum metadata matches no transport header are
> > dropped, and non-GSO ones get their checksum completed in place.
> > Such packets used to pass with the metadata unvalidated,
> > and with no overhead.
> > 
> > I judge that this should not affect any deployments, but there is still
> > some risk that it does.  In case a deployment depends on them anyway,
> > provide a per-netns switch to get the old behavior back:
> > 
> > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > 
> > The default is validating.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> >  include/linux/virtio_net.h               | 23 +++++++++
> >  include/net/netns/core.h                 |  1 +
> >  net/core/dev.c                           |  6 +++
> >  net/core/net_namespace.c                 |  1 +
> >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> >  6 files changed, 110 insertions(+)
> > 
> > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > index e586e17fc7a5..b1a1c4714b22 100644
> > --- a/Documentation/admin-guide/sysctl/net.rst
> > +++ b/Documentation/admin-guide/sysctl/net.rst
> > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> >  Default: 1 (on)
> >  
> >  
> > +virtio_net_hdr_csum_check
> > +-------------------------
> 
> virtio_net_hdr_validate? In case we do have to add more validation
> later.

If you insist. My worry would be what if that validation is again
user-visible somehow and we need to distinguish users who want
to disable that future thing and users who want to disable
just this current thing.

Hard to predict the future. But I will go with your intuition.

Will check the rest.

