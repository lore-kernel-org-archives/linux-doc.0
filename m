Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792527738;
	b=XQv8nH4FhdIbrq5+bY+tEA1hikeeCY1ekhEyGEJ3e+SkSCr58iPxoFwGLzbvuF9U/DwU
	 KhScf8dvulZj4NikKmvmPoJPXlRbsm/j+EHpoLICgMrK8B+AqxYSRh9AOweQy4MVybSNz
	 VAtcwuKKdTtySkHsYtDNAuWzD8ktSUKc9/Irhhjm6oJ5CJTn4yeHkbX7Q7GIth45hRkaW
	 EoubYNrVG78PFz05mVoqoWjFhXFsdytGXNVUFqA51Qpe9uIEDDZSCLjflOCQlHf58UH+i
	 84IFhGoIqwIHTACq/VPoawWP1kRNLnIqi0LczLMhjL+1t7SOvWtycnMTRrN4PqjT+wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527738;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O3Fa0tNjFaT8a2Kp5IrJp2nupauYC9YO/ztvfGUmcCA=;
	b=anHi3Bo22wLl6iFMbKnrjNUDsaZ25OqdK1IKtGOt/vd+7u7HPRK80vxnSWgCUQFmNdc3
	 S5X7r6a5+Ut5GVvNMCTwlB7Dq8gtexEd4nJ2DjrCmHjrF3r5HA5oTjA/Wfm+CogjcQFUq
	 40DBvYcXq/U5ts9At123zLgQgkJ/eI/zOetv/i2SLEFO3eE5wwtRv7C0SJ8uXQwysH7PS
	 1IrbPUXxrgtP7MWSmzrtaMtjerRlBKY9tgo6ETvrmvykmeMtZCaOiFv40O5I7uPpCppF6
	 TWq1+yR9EaQjjWqnwA0m3VlgNh+3hvrRh7JltYK8XLzYqFYs03PjHZDnkZMjgIFPZog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ugs1THk+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jANqynKY;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB0606A31B
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DB0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ugs1THk+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=jANqynKY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792527736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O3Fa0tNjFaT8a2Kp5IrJp2nupauYC9YO/ztvfGUmcCA=;
	b=Ugs1THk+aFEhkNXwghiFoXYZOvvqK2Y/kuQXCmSIuxFc8fjjpzMTjB6MCV5Rvp95wiA+qi
	pObMy2Md2O1jzDnIBsu0JRBRy3tB2SGEFD/9bQYYyus5a0nhhY0xTLVsc2VWeIoEKW5SKX
	oR4I0h9OJ45uNNOm8jNtF97IFgsCKFg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-M5Qf6UahMxGhXrKJeMABmQ-1; Tue, 20 Oct 2026 20:22:15 +0000
X-MC-Unique: M5Qf6UahMxGhXrKJeMABmQ-1
X-Mimecast-MFC-AGG-ID: M5Qf6UahMxGhXrKJeMABmQ_1792527734
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1bfd5516bso123735e9.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 13:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792527734; x=1793132534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O3Fa0tNjFaT8a2Kp5IrJp2nupauYC9YO/ztvfGUmcCA=;
        b=jANqynKYI4bjvIyZ+6Op+etbknpKHYweOauGCKUxq9YND33QXH+mzMbX1QYs6jhDfA
         gz79jZ8gVhxGjr+9e0EVQ+riY8AXr/FwfQZ8LRL01FR1rcx92aNPf06Xohr/8Uav30cr
         6Lk8Cy3SQwKfSepCDy3jDJjwPXIVJPtzsGH2BP94SvC5PovVOJPuYiSoaCGZLUSsFjWS
         UQPYx+XYNoaOC507pLbUV7Rd0VEkWwAnY6UqVt34ucKwMaIq6Rmu0JF7CzMsjbre7Rq9
         9S5GATcqdHXGsVQojRVtMqXbR3IC3xB1A2OMBDAbotUBg97A5weBiHgRrMbiVr9AZA6b
         PYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527734; x=1793132534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3Fa0tNjFaT8a2Kp5IrJp2nupauYC9YO/ztvfGUmcCA=;
        b=ou7IwdU4t6vAQz3GJtxKr83Y2jdva686BYwk47DefXQtNF3rmnaSnLPRlo3eSCm6y8
         w/WFCePPhLfKVtrnjnrE0QY3+gEowT6ezT4tdoet8kDcnmfNHFBrY/3HHIUCW0cGsgTs
         0/cncf/lrALKk214VvnqcWi1rvk4RxV98I1CoSz75yKHY+rw1eGiyb/Sfv8+ET2jfaOZ
         2CzRInxVfmxEiB3IHbr9PR7RQZlSDgpZzjsN/R1UFiD2ur5ANyrHLPfIKypGNvmUMbua
         81ic2Inaewyjgv3cbDpTY1MsN1dUvZ+Brd0IHg5pyVEzr9GUmPvi3pIBxk4sbS5inqEc
         PsvQ==
X-Forwarded-Encrypted: i=1; AKwUvByiYkbCR8uZlwWj/fIT7jPvHc8+nsYdFgflKju+VRdTn4UH0vpz4fFU2arF4L/YFpGigDPZCRgyH1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKAJ8/h605V9U4BYPHlUne6npJDzzzjWTMp6e1QGiCgXbXtHxP
	9NCjTriZYsTA3f0Sl507FzL2x4/4S6k93c5gW6imYkWcghH3WWz2xDFrXF5ga2CSUp1xcGdX0Ax
	ifEAIzTUUjL56erYCmKMEOcg6liASyCQSZk6eItgMVvxol/MCVa1LPk1ytKBVPw==
X-Gm-Gg: AYBFou34FqlVn9GLMU5vy0+NHciS8MFVzjMeOuzXqZJXKaOec9KLViFzfaNLrDWXw9L
	OWi/VKRa3ut74nYVJLUROdpFi6HPeW6OO+EhxEW+5hfxyESONverDvqIUbrQu1d1QKLU5x/HYyI
	7/3RIL4yrKNJo6/NV/606eeDg+Jk8mJuW9LmG/rcVso8Qu3FKyOmye2NDtuklCZOohZBO1/c1TR
	MFgEdqhvgh9CbpWsqFle0geTmpUiOxOAlGSDvIpxDWpXI/OzxyvhPRJndUk4X1n8qmPMRkR9Nhu
	I/v02ebrHvIl5qY6ovVc/1uzVYd4tUQ8pXDQdaaYaX2iyPl/ZyJfDn4OUXg4KP7+nHuFUw==
X-Received: by 2002:a05:600c:888c:b0:4a1:eccb:53eb with SMTP id 5b1f17b1804b1-4a1eccb55d9mr100028395e9.6.1792527734250;
        Tue, 20 Oct 2026 13:22:14 -0700 (PDT)
X-Received: by 2002:a05:600c:888c:b0:4a1:eccb:53eb with SMTP id 5b1f17b1804b1-4a1eccb55d9mr100027865e9.6.1792527733682;
        Tue, 20 Oct 2026 13:22:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eedesm625191f8f.14.2026.10.20.13.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:22:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:22:09 -0400
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
Message-ID: <20261020162048-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2c9decc16892@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.2c9decc16892@gmail.com>

On Tue, Oct 20, 2026 at 04:19:41PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > Michael S. Tsirkin wrote:
> > > > The ingress validation as implemented by the previous
> > > > patch is stricter than what it replaced: GSO
> > > > packets whose checksum metadata matches no transport header are
> > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > Such packets used to pass with the metadata unvalidated,
> > > > and with no overhead.
> > > > 
> > > > I judge that this should not affect any deployments, but there is still
> > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > provide a per-netns switch to get the old behavior back:
> > > > 
> > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > 
> > > > The default is validating.
> > > > 
> > > > Assisted-by: LLM
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > > >  include/linux/virtio_net.h               | 23 +++++++++
> > > >  include/net/netns/core.h                 |  1 +
> > > >  net/core/dev.c                           |  6 +++
> > > >  net/core/net_namespace.c                 |  1 +
> > > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > > >  6 files changed, 110 insertions(+)
> > > > 
> > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > index e586e17fc7a5..b1a1c4714b22 100644
> > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > >  Default: 1 (on)
> > > >  
> > > >  
> > > > +virtio_net_hdr_csum_check
> > > > +-------------------------
> > > 
> > > virtio_net_hdr_validate? In case we do have to add more validation
> > > later.
> > 
> > If you insist. My worry would be what if that validation is again
> > user-visible somehow and we need to distinguish users who want
> > to disable that future thing and users who want to disable
> > just this current thing.
> > 
> > Hard to predict the future. But I will go with your intuition.
> 
> Thanks, but definitely feel free to ignore my suggestions.
> 
> My intuition would be to define as
> 
> 0: off
> 1: everything one
> 2+: sadly needed fudge values because we keep having to tighten,
>     but some crazy workloads need to opt-out to avoid breakage.

yes you said i just do not get how it will work for userspace,
maybe u can explain?

and what specifically is needed right now, while we
just have 1.

