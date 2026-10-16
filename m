Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4D48DB55
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792174636; cv=none; b=NHJOugDAqQ+QK0Rv+ypI1QvSkCevFrS9mhcJhd+fkYoQ2hKsDafaCswoFlTJK2j6gh8nTEWzQN0mNLvxBB774M9S7HW1ChRE82wE7gAqg7nxulOoKh35SqX4bVy9Dyc8wstFBYqZ7fqVG5mld0KzrORSrBYe0utsZIMEa2hruaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792174636; c=relaxed/simple;
	bh=SBCt/eBXMWQ8dCo0YSEHtUPDvD40Qpw86uvOcqNS834=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=j5mYzj7JY6kG8wjQBvbytiec2gX4x/6/EpniOcFSdVBRN6x/m73Dyi7drzcu4gFD89l5L/wbIeKMfakDDX+g8k7H05K/NecK858bI577zaVE4fdQFVJVHbc3SgJ/cOUPR7A9mkOYbVR7MzEVMkav8pwN50S5xsAlGlvMhW9oWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LB3pgZ4C; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LB3pgZ4C"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e9a1f1681dso149060e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 11:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792174633; x=1792779433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y8u6hYFXZk0LfN+Hez4/Z5m0bA/NCutshHV861wnw+M=;
        b=LB3pgZ4CUJXxXMAzxjd23UwEauPagvkvYuJeVPlXl7grKK5cjddpphlzR+zMVZa12f
         gusrI2PfnCS4A95A/lhEhAd+APKEo1Z3sMJvOL68uMCQw8VI1GitZTFgYMhUQxbKdVFO
         dlV3sPd8RCEtUZM0ZU1P97yO6VVrHA78mEISl39kOOPF0DPNjtJCGW0YXYGlkLL7NOKU
         0Dy2JJPKQaTpX8gFk2pqddkg5th5fYEOxTl+oBWY0yJaccycLdBGr27vRQuJQagyGFQ3
         xepvZp3kbhqOBhLG2x2jGvROnddeLOA5zblXCRtBjOJCXJZsNbx8AD/xNKMd0DIFT74y
         xB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792174633; x=1792779433;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8u6hYFXZk0LfN+Hez4/Z5m0bA/NCutshHV861wnw+M=;
        b=E3Y9fxkHjEvWL53Uhq2PNFrD6XrQGtZUvuTlDXsyAypxbxSuC59FAQi46fcIYKLsne
         ifiCW7ejD0i3OAopb29X23/xrdvVYu9RcEaGZcR79la1a7SmgMsg6fjU9DXHicaYH2D4
         7HxOSJp0xFPjbg32Yo++XT5PrfYgV7xcGpG97f/q/2+tipWJ3nmzOIkUTyAJvQP0kYI8
         eqLDlMhgYugd/fHKCJe3Jk7DuSVbQqoCr49vIqWj69n8COO9eG/rqaTWiVvryLcL9vBq
         UuDJWeuQCMBw8DiP9CWx1+/r9jeo8fz5kbWk9SCKFcV2uLllnSRrDoFci7JvqU9pTGGV
         AX/g==
X-Forwarded-Encrypted: i=1; AKwUvBxQ32uA2YzoEq6MbSEpUUh3N8prAGfcDlMxoZAFQ/nnrbYgNp+nfQIjsI4or1/CNK1FaqKAVYEqw6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYISyrCE9jRi9sw1GUhlJ9ERly4v8dvz55Zob1qZXRwWq603Qvq1
	VoWxBaylwrrJ3c+uW3a3Wp5URuwUH2YIxuIu6so0bQhq+9HxGuDWH4eM
X-Gm-Gg: AYBFou38gHLmPXXaLpVhd3YA3TsyCOKLKABjQozhxJ0/myppc1vRFDrzG9PuEtMalHJ
	fp6mBvboExKwaRRYUDqwtySHIzuy+jvo+7H3ce3JFvBMr5YlXCUdrvZ5YOqNvOkNQ+9NUa7oHjw
	XNx7YRsoCdUzVR0FOun3Fqx0LNRba9enDKmKkAU9paTH6ynVhMQBOAJ7E9yYkl/qqYloD3p/c+0
	hnk+rtBp+HMsZpP9X+gOXTuyIagZ6sHfWza8EYovau366OX3ERdhAg/Fg/QhGjEznCzvdHIlhG5
	LHp/0oWltZauYXBuTU89fu+UlrS4/t0GV+0t4Pl85nIZ0Mp6kgJMgkYktQX1OijdENp+NuWV+kv
	BU412F1ETyv1OooLCOeKX84t/vBsOsBNz2N1g7+Z0GHIHbH76gBeMPS1Fel5YMe0Ad9Q47Rpvsx
	uFgwM7vhXGRT+N4/ulBoQyn4WTlqMJylnNEOxWDBRTnTJ5QPRy8FoBuRTvF/KXCniyRycntxEej
	OZXnF9XROUD1e9iohtRk2XabixL0IV9optWYVruVMhjnHV8QZC4fC0UwuD5/Pe5v6MhD7QLGsUV
	svfOaRah2nMxHo/YtDi3D6s60f48SVuYBtAUQiVXHtlWr0oY
X-Received: by 2002:a05:6102:4187:b0:7c1:94eb:d72b with SMTP id ada2fe7eead31-7cc36b23993mr155186137.34.1792174633433;
        Fri, 16 Oct 2026 11:17:13 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9908366328dsm2092409241.12.2026.10.16.11.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:17:12 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:17:11 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Simon Horman <horms@kernel.org>, 
 linux-doc@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1150b0c0fbbbe@gmail.com>
In-Reply-To: <20261016135328-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <ad05a40681719a579691a1da6413f0dd7064f2a0.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.3a7d04e1c306e@gmail.com>
 <20261016051827-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>
 <20261016135328-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net-next v2 5/7] net: add a sysctl to opt out of virtio
 net hdr checksum validation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Fri, Oct 16, 2026 at 11:30:17AM -0400, Willem de Bruijn wrote:
> > Michael S. Tsirkin wrote:
> > > On Thu, Oct 15, 2026 at 01:50:54PM -0400, Willem de Bruijn wrote:
> > > > Michael S. Tsirkin wrote:
> > > > > The ingress validation as implemented by the previous
> > > > > patch is stricter than what it replaced: GSO
> > > > > packets whose checksum metadata matches no transport header are
> > > > > dropped, and non-GSO ones get their checksum completed in place.
> > > > > Such packets used to pass with the metadata unvalidated,
> > > > > and with no overhead.
> > > > > 
> > > > > I judge that this should not affect any deployments, but there is still
> > > > > some risk that it does.  In case a deployment depends on them anyway,
> > > > > provide a per-netns switch to get the old behavior back:
> > > > > 
> > > > > echo 0 > /proc/sys/net/core/virtio_net_hdr_csum_check
> > > > > 
> > > > > The default is validating.
> > > > > 
> > > > > Assisted-by: LLM
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  Documentation/admin-guide/sysctl/net.rst | 15 +++++++
> > > > >  include/linux/virtio_net.h               | 23 ++++++++++
> > > > >  include/net/netns/core.h                 |  1 +
> > > > >  net/core/dev.c                           |  6 +++
> > > > >  net/core/net_namespace.c                 |  1 +
> > > > >  net/core/sysctl_net_core.c               | 54 ++++++++++++++++++++++++
> > > > >  6 files changed, 100 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > index e586e17fc7a5..7f230929c37e 100644
> > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > @@ -246,6 +246,21 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > >  Default: 1 (on)
> > > > >  
> > > > >  
> > > > > +virtio_net_hdr_csum_check
> > > > > +-------------------------
> > > > 
> > > > Make more generic, virtio_net_hdr_validate?
> > > > 
> > > > In case we add more validation in the future (as we have in the past),
> > > > without having to introduce multiple such knobs.
> > > 
> > > But it's uapi, are you sure we'll be able to change the meaning
> > > of an existing knob, even if we keep the name vague?
> > > 
> > > > > +
> > > > > +When processing packets with a virtio net header (through tun, tap, a
> > > > > +packet socket or a virtio network device) that request checksum offload
> > > > > +(VIRTIO_NET_HDR_F_NEEDS_CSUM), validate the packet: complete the checksum
> > > > > +in software, or drop the packet where the header does not match it.
> > > > > +
> > > > > +When disabled, the header is trusted not to corrupt the packet, and the
> > > > > +checksum is offloaded to hardware (or not verified if it never reaches
> > > > > +hardware). This is only safe if no protocol is processing the packets.
> > > > > +
> > > > > +Default: 1 (on)
> > > > > +
> > > > > +
> > > > >  wmem_default
> > > > >  ------------
> > > > >  
> > > > > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > > > > index 357115ff0ec2..aa2f8ac4657c 100644
> > > > > --- a/include/linux/virtio_net.h
> > > > > +++ b/include/linux/virtio_net.h
> > > > > @@ -5,6 +5,7 @@
> > > > >  #include <linux/if_vlan.h>
> > > > >  #include <linux/ip.h>
> > > > >  #include <linux/ipv6.h>
> > > > > +#include <linux/jump_label.h>
> > > > >  #include <linux/netdevice.h>
> > > > >  #include <linux/udp.h>
> > > > >  #include <net/gso.h>
> > > > > @@ -78,6 +79,19 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> > > > >  	*thoff = nhoff + iph->ihl * sizeof(u32);
> > > > >  	return iph;
> > > > >  }
> > > > > +/* Defined in net/core/dev.c, enabled while any network namespace
> > > > > + * has net.core.virtio_net_hdr_csum_check set to 0.
> > > > > + */
> > > > 
> > > > Should this be a global sysctl, rather than per netns?
> > > 
> > > 
> > > For customers I work with, it would be much less useful.
> > 
> > Third option: make it an integer rather than a boolean.
> > 
> > 0: no validation
> > 1: current level of validation
> > 2 and beyond: if we have to extend it later
> 
> 
> Oh that's an interesting idea. Issue: userspace learns about 1, then
> someone sets it to 1 thinking this is the highest level and in fact
> disables some security.

True. If concerned about that we could change the interpretation,
keep 1 the highest, subsequent for legacy.
