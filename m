Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538496;
	b=oWqt+VvP5rDCkKU1Ld4VSBe7PFXyP8cy+FBxQDVqvvtaxrkl9uXQDNiAFcSFbHvhPpcM
	 2ri64DrWmWkspBQcg46xVq/xU0i0AyJqB+nVp+92s1s7DT+O9cSb+n0+9zPZ47feeqQ9S
	 FiALZ9SjvLCX9mRYdEyR27RFH2vhLajSpwZDZlDMnBKwPJKadVbBEj9UQ31kDTvku7xSW
	 LCjNbR1B6wDeLTiq8GZAhATEG5iAg2gLXeodfFN00BUgCNYbuwBNaLfMHdQgD6D1Bzges
	 VBQ+Fg01D8CLdxI9J/sNJ7In/bb5quQfbcXGrimHzApyYHpApqSNtXW4ECOSeV1IEVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538496;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
	b=drFUcu8QkQtzEAojCRQkrhaTsypQosWoSZhBFaUpoaKiKI8MOx7BjO6yZCSBDSnDV0VX
	 XtflpiOuL6H3J49Tff7K1cymqPto0TbKE4ZaqqUdkL2cZsiB3tyKQbQz/d350i52/I0NW
	 NxtR1qBBr5N0mEw9STiO6ow/Yjqckf4SveLUnVtng4tZmMEJmU0FCwrb687eZpvIOL11F
	 h1qoGHNA6d9KxsNfbGqi0dtQS0C39I/Fh+8c0IBS+7R1HuQzc9yl9zu+ki+0rfIl5LWv0
	 F22NUgpsJi4XVlcwUF35TLeEWngu3cmdSIu7vCpHbBVkkpXL8lsKZ+QCqD0Hl07AQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7XqyUYb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pPN38QY+;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8975606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 23:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8975606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a7XqyUYb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pPN38QY+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792538495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
	b=a7XqyUYbO9u7bSxvf3wM8+1GE+RC8Rpb7ke+4uLp3gXW7pN7dickXC/yTOTzDtMAXLFzUz
	EmuPQLJGkfhcOEChmB2YPbEJwodqM+P9MhkcD02XYO2ZfTA5KXno0rYlyWDWgIMGFp/6Ch
	0aeTjZVig2F40suSreB8iS2oOtLxP+A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-3xuEZUcLN36pb9ihPDoS1w-1; Tue, 20 Oct 2026 23:21:27 +0000
X-MC-Unique: 3xuEZUcLN36pb9ihPDoS1w-1
X-Mimecast-MFC-AGG-ID: 3xuEZUcLN36pb9ihPDoS1w_1792538486
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1721559b4so859405e9.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792538486; x=1793143286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
        b=pPN38QY+Q/90GQrL3H/REBLoscFnRJ+2erzMdVFFYQ7fxPVp9i8heH/2YFBk09gPxP
         IrkZz09Yb4encLshue4vKPZYJX/ivb6RIOCn1cndpaYFDaBE1AotZoyb6h4oYiihQB9H
         7ROi6cV/N2uKKUzko2LIjqaqDcXKzo39vgkxWR7YOSM38pTJfqDxmEDvgKNMgIe7rmP2
         TvxNTKvhbGmNkd9lqOo5XnnJKkwXZ+CH6fd4BjRDmXMow9Xk2rcmbBnHmUSkdj1KEl2q
         x0OPglAyN8U+agkavMABQjhIPz0g/ANdyxzPbqzRMAMsCo6Y/C1e2Y9srFkCHn7x4USC
         p52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538486; x=1793143286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJVYnLvaEVwucHW+x0AHb90jt4BURilSyy87F4cjKH4=;
        b=uuSLbnTxJdv8rMA8JshfI8DmBg18aBN97ocovFjWSw5nq2zA+qCSNRYBushD67NJYz
         NLSUfN4mOj0bw4f4q+QJzEG7X9kyVbnNJnDeEP7gEYTTcTzzSNZc8D6hYYlfiHKd0iCn
         3Dt/fMW8cFz68zKjO2LOUKjA39C9K/4teDX7OmmBzfkdFUMqxlZpYWmgxh4lf+LP57Br
         3/fB94ZwOTSHeuIIlXNnjdgUIxPLWqfdfwrR/vyBen15yTJuAWt84bs9ReBj72loY6KL
         Ru8rsI9AH43OPtCblozAxhGOzF+3T9zmDZ06CbhcVPRIYRRBtHYoJgyNfeDwi0S+Bhnb
         UQww==
X-Forwarded-Encrypted: i=1; AKwUvBzyQtwaXaKucPzEVvCpTFUEQBkx+jVmVEJbDsDyUWVxvCEwf6i9FYUr/K3Y0kEr795iFW6UszI7dnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk8DMjkMpDozgIuQSbamXvMONBobpAKmy9PANvpTYbIvUizxNO
	q4AjrfjMmaUObF8IDHQ7YCmyYwJsdrZsFq+lvQBqDTjIAq+YavTOzItsURCVxCXaYgU1PKAtkll
	ytS6K7vSrvDoaGfkTus+rKoEWqll7/hjqTwupOgF06sArCjGfx6kHO9KeppLpXg==
X-Gm-Gg: AYBFou1mbKMeWEmXKPa8GOQgRdwmFOlCtIK+K2XoLVYrU8eTJfRrzYvVkfmBuy4YPb8
	Y2fRtDj9a7aTSlmGMKievNxNDG2/vcjVmpxZZYw90R1kEnkT4Iz6Yrfc0s2+DtSZKZ9e9bRM4f+
	D/PEnXLMH5pp1ux9uTk4s0UFJW2AXI9vzY7k9urmD6pi63lohmU8ZU0ZyXFehvThrbglJB8yTSw
	EbWfR6ypFPafTsq+z1yiTaW+LqqParHlfKTBPt/7psZfHjsElM8nUezwOg86lRBOWL9y77bZ0yK
	iM+mgRAQmuk/d23eRvbCuiQbI0hstr4ypNV3NdJCzHZW98UXJRYm2Q7fYWaaOUzgYU92Eg==
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr3979885e9.30.1792538486083;
        Tue, 20 Oct 2026 16:21:26 -0700 (PDT)
X-Received: by 2002:a05:600c:3548:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a1fdd145edmr3979245e9.30.1792538485547;
        Tue, 20 Oct 2026 16:21:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm12797555e9.4.2026.10.20.16.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:21:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 19:21:21 -0400
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
Message-ID: <20261020192040-mutt-send-email-mst@kernel.org>
References: <cover.1792411304.git.mst@redhat.com>
 <6f23c55c6eba3e3ec6b2c7e3a80728a326ed58af.1792411304.git.mst@redhat.com>
 <willemdebruijn.kernel.187d58ff2bce5@gmail.com>
 <20261020155917-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2c9decc16892@gmail.com>
 <20261020162048-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2eabbddbe6528@gmail.com>
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
In-Reply-To: <willemdebruijn.kernel.2eabbddbe6528@gmail.com>

On Tue, Oct 20, 2026 at 07:12:57PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Tue, Oct 20, 2026 at 04:19:41PM -0400, Willem de Bruijn wrote:
> > > Michael S. Tsirkin wrote:
> > > > On Tue, Oct 20, 2026 at 03:54:23PM -0400, Willem de Bruijn wrote:
> > > > > Michael S. Tsirkin wrote:
> > > > > > The ingress validation as implemented by the previous
> > > > > > patch is stricter than what it replaced: GSO
> > > > > > packets whose checksum metadata matches no transport header are
> > > > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > > > Such packets used to pass with the metadata unvalidated,
> > > > > > and with no overhead.
> > > > > > 
> > > > > > I judge that this should not affect any deployments, but there is still
> > > > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > > > provide a per-netns switch to get the old behavior back:
> > > > > > 
> > > > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > > > 
> > > > > > The default is validating.
> > > > > > 
> > > > > > Assisted-by: LLM
> > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > ---
> > > > > >  Documentation/admin-guide/sysctl/net.rst | 19 ++++++++
> > > > > >  include/linux/virtio_net.h               | 23 +++++++++
> > > > > >  include/net/netns/core.h                 |  1 +
> > > > > >  net/core/dev.c                           |  6 +++
> > > > > >  net/core/net_namespace.c                 |  1 +
> > > > > >  net/core/sysctl_net_core.c               | 60 ++++++++++++++++++++++++
> > > > > >  6 files changed, 110 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > > index e586e17fc7a5..b1a1c4714b22 100644
> > > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > > @@ -246,6 +246,25 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > > >  Default: 1 (on)
> > > > > >  
> > > > > >  
> > > > > > +virtio_net_hdr_csum_check
> > > > > > +-------------------------
> > > > > 
> > > > > virtio_net_hdr_validate? In case we do have to add more validation
> > > > > later.
> > > > 
> > > > If you insist. My worry would be what if that validation is again
> > > > user-visible somehow and we need to distinguish users who want
> > > > to disable that future thing and users who want to disable
> > > > just this current thing.
> > > > 
> > > > Hard to predict the future. But I will go with your intuition.
> > > 
> > > Thanks, but definitely feel free to ignore my suggestions.
> > > 
> > > My intuition would be to define as
> > > 
> > > 0: off
> > > 1: everything one
> > > 2+: sadly needed fudge values because we keep having to tighten,
> > >     but some crazy workloads need to opt-out to avoid breakage.
> > 
> > yes you said i just do not get how it will work for userspace,
> > maybe u can explain?
> > 
> > and what specifically is needed right now, while we
> > just have 1.
> 
> Right now the sysctl is boolean.
> 
> If we define it as a narrow, very precisely defined sysctl, then its
> exact behavior is set in stone.
> 
> If we then add additional validation later, that can similarly have
> unintended breakage of weird users, we need to add another sysctl.
> 
> And if that validation is not entirely independent, i.e., builds on
> this, you get a weird set of interdependent sysctls.
> 
> While in general systems will run with all validation enabled, unless
> they do something weird that gets hit by validation.
> 
> A single broadly defined sysctl ("validate input at the source") can
> be refined over time, including to expand to validation of other
> virtio_net_hdr fields or protocol combinations.
> 
> Even if defining it more broadly we can still leave it a boolean:
> all validation on or off.
> 
> Or, optionally, we can also define additional validation levels,
> e.g, 0:off, 1:everything-on, 2:validate-csum-only.
> 
> 
> 

So I will just rename it to validate, we will see down the road
how it plays out?

-- 
MST

