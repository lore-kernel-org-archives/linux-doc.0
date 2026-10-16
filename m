Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7358E2D8
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 17:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173094; cv=none; b=gpKuJHjRWYXEId84+amv+9dMqnJ2uf78geJ70wGm4G1D1Q0fDnmMZ3/kLOkfKRAALQoD9VTdt+FrfcPL4hdB5Z8CfsduoiOGquy6KX2iIT3jnOlcJfJ7SzS1z4/J2G8rtCRtnW+dJk7+E74PqG9dYsirxf+C76Z4+x+VQGkY56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173094; c=relaxed/simple;
	bh=mcjHbTCaVayfmlcAGqrGUKY2cLvBM1brbv0Ml34HCNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3E/6sM5bJOS5xKPJ/7GZS03cOzyLL8rB/juKg0pPZLdGmTqXK7wFWj7MtpdNODJOqJhKaM3/U6Qh1HrR1HDCba+Ws/MswJj0BnMqFYusTaAipHLZvCFM9DP/6RPNBaiX4whYkNk/HSMgFClRY2g/xbAi5RQJzZFerXWifbj5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEZWR9TO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfleaDsC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEZWR9TO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfleaDsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792173092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W74nlXHsz1uD6EVItToAyocJ9byMIagIgs9+oTaSxM0=;
	b=hEZWR9TOgLF1iH4ciKnUY1IAjvpNGM8V37blixJD/tWb8LwATZpEi5Woft0Z7BMq3OmeS9
	/ovz3omlWi+xBj1Xc0QCb7N4nPYafTzkIJ16wuoBZ9o1y0jxINoVXnRcBLcpO/Q4chalzI
	c847JSKOMvhhgsIuMsjS6uMUA3X6ghQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-LbcWv2cdPMemHmWqH84YNA-1; Fri, 16 Oct 2026 17:51:30 +0000
X-MC-Unique: LbcWv2cdPMemHmWqH84YNA-1
X-Mimecast-MFC-AGG-ID: LbcWv2cdPMemHmWqH84YNA_1792173088
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b02e93a1eso68464f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792173088; x=1792777888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W74nlXHsz1uD6EVItToAyocJ9byMIagIgs9+oTaSxM0=;
        b=BfleaDsCKFL9BHUqW/U6Sh0oe1BWsxCMN8//1ucf7R2GouhOYYoNVU83o8D/VPxhZe
         WZ/hLcGUS1c/FZK7uCv/XMMsc8NqtxVXFQ4ap2gPy6nVikwYgJZC+ezCiJML0r097TnW
         J6qHkT9u6RH7kK+IJA9GVvmWbIhIXK25KmygwnYIyRZvX2MB+cMgmscU6I6M9A+LG3rb
         yWUL6Dmf/XGSbbN2U281cW6gMbOZH6pUAAMz703dRE9yL4ZNyWMqjQPcWqjW6RtrzgE9
         tDeErOkgMOUh92F/resIwFB7NsngkzD3w/RhxRDFsYMZi5BMdws7+0Cy2p0+homNNry8
         wGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173088; x=1792777888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W74nlXHsz1uD6EVItToAyocJ9byMIagIgs9+oTaSxM0=;
        b=Ni9b2adrC3smRUQ8XBsbPAv2xuVc6XV2N6i+JMy4jnzV1HtsYvJZCLfHPsQekz10dZ
         KNuSr2OWiC8KRBFqbUOC2gP+b9p1hy6qTqK2NJUgeRW8r0OQnfSb/odij1c9F5ivdue7
         Rvt4IdJ4Zs65j3BVXWVDr57XogmdwC8AWjxcyfnT5IEOB5BUPIquNe7iz8HCoqjI9aGq
         vZnL4J21leX8i00tjY4UQ4ktjCY9sc0kKXQkSAojuKShW8+0FesFobSWnUDZLSRrssEP
         zoT8Q34rNbzcwT4mkVPMDhLWrryr2lQ8PLcfkn7spB2XSKh2mQUNkbhGZPg6r4RVaP2Z
         58Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzoIIVdtgk7eEHFV5dSfOIGGLkOyx6h/3tJIZ320yJ2H3PpgIMkVR6e+azykS4B+AcfvjM8cFcssAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuyvXMos0PWM4+RUZLfTBG+Hvi7husNSpdFyzwiF/PZRbXGHjH
	EprbMhRIrr3aQ+Ri50sD2lGasDzXzZHESF+WHNUy6LMtqHzn9/zalo+xCepDnzN+hn4NtUohivA
	J5JuRptl0AWZAuPvyu4eC+7ji++qJJZsZuGFwFdMWXSoLu5IgeiMglUvkcInEGA==
X-Gm-Gg: AYBFou2ZrZZ4JcHGTTw46ESm/O+HomBD2Cga63/Miy1Dsr2B36ncgRkWyYt6uzUdPXS
	/PdReDkSHtlAJwSSZGpKSDO1mZ2f/rZUUC272JqJ75Zf+Ksa82izLHS64Mj64zfX5kWPm5Pp71e
	Ai309V+dIQuYXSaQqq+V0cpSaggzlIDMikzor2CuK1M53YYc4RT3c6dEcm/MGYfviSPn3VsUIZh
	tku6fznmBXlBVI33RmNdJ+EkaPSMFI+ZwP/l7XP7mTTYcDgxrxspMBk+pBD7FfchqUxySO2t0dU
	QgJ7DfNC7fZ7QcuZn3g/wkOzBZxxB3LbhhcOpbcpmgoOM03IGzeudngNR8hcuK+s6Kw1C+A=
X-Received: by 2002:a05:6000:40e1:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48e07f9ebc9mr605349f8f.43.1792173087860;
        Fri, 16 Oct 2026 10:51:27 -0700 (PDT)
X-Received: by 2002:a05:6000:40e1:b0:48b:1c:d6e1 with SMTP id ffacd0b85a97d-48e07f9ebc9mr605297f8f.43.1792173087273;
        Fri, 16 Oct 2026 10:51:27 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfe4d2321sm6861579f8f.19.2026.10.16.10.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:51:26 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:51:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/7] net: add a sysctl to opt out of virtio
 net hdr checksum validation
Message-ID: <20261016134823-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <ad05a40681719a579691a1da6413f0dd7064f2a0.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.3a7d04e1c306e@gmail.com>
 <20261016051827-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>

On Fri, Oct 16, 2026 at 11:30:17AM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Thu, Oct 15, 2026 at 01:50:54PM -0400, Willem de Bruijn wrote:
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
> > > >  Documentation/admin-guide/sysctl/net.rst | 15 +++++++
> > > >  include/linux/virtio_net.h               | 23 ++++++++++
> > > >  include/net/netns/core.h                 |  1 +
> > > >  net/core/dev.c                           |  6 +++
> > > >  net/core/net_namespace.c                 |  1 +
> > > >  net/core/sysctl_net_core.c               | 54 ++++++++++++++++++++++++
> > > >  6 files changed, 100 insertions(+)
> > > > 
> > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > index e586e17fc7a5..7f230929c37e 100644
> > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > @@ -246,6 +246,21 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > >  Default: 1 (on)
> > > >  
> > > >  
> > > > +virtio_net_hdr_csum_check
> > > > +-------------------------
> > > 
> > > Make more generic, virtio_net_hdr_validate?
> > > 
> > > In case we add more validation in the future (as we have in the past),
> > > without having to introduce multiple such knobs.
> > 
> > But it's uapi, are you sure we'll be able to change the meaning
> > of an existing knob, even if we keep the name vague?
> > 
> > > > +
> > > > +When processing packets with a virtio net header (through tun, tap, a
> > > > +packet socket or a virtio network device) that request checksum offload
> > > > +(VIRTIO_NET_HDR_F_NEEDS_CSUM), validate the packet: complete the checksum
> > > > +in software, or drop the packet where the header does not match it.
> > > > +
> > > > +When disabled, the header is trusted not to corrupt the packet, and the
> > > > +checksum is offloaded to hardware (or not verified if it never reaches
> > > > +hardware). This is only safe if no protocol is processing the packets.
> > > > +
> > > > +Default: 1 (on)
> > > > +
> > > > +
> > > >  wmem_default
> > > >  ------------
> > > >  
> > > > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > > > index 357115ff0ec2..aa2f8ac4657c 100644
> > > > --- a/include/linux/virtio_net.h
> > > > +++ b/include/linux/virtio_net.h
> > > > @@ -5,6 +5,7 @@
> > > >  #include <linux/if_vlan.h>
> > > >  #include <linux/ip.h>
> > > >  #include <linux/ipv6.h>
> > > > +#include <linux/jump_label.h>
> > > >  #include <linux/netdevice.h>
> > > >  #include <linux/udp.h>
> > > >  #include <net/gso.h>
> > > > @@ -78,6 +79,19 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> > > >  	*thoff = nhoff + iph->ihl * sizeof(u32);
> > > >  	return iph;
> > > >  }
> > > > +/* Defined in net/core/dev.c, enabled while any network namespace
> > > > + * has net.core.virtio_net_hdr_csum_check set to 0.
> > > > + */
> > > 
> > > Should this be a global sysctl, rather than per netns?
> > 
> > 
> > For customers I work with, it would be much less useful.
> 
> Third option: make it an integer rather than a boolean.
> 
> 0: no validation
> 1: current level of validation
> 2 and beyond: if we have to extend it later
> 
> Not pretty, I'll admit. So fine to keep as is too if you prefer.
> But I do foresee more changes in this area, if history is a guide.
>  
> > 
> > > Even if per-netns, most likely do not want it writable by netns root
> > > with user namespaces.
> > >
> > > That is the equivalent of ns_capable(CAP_NET_RAW), which is the cause
> > > of many crashes due to bad packets ingested by, e.g., a packet socket.
> > 
> > Hmm, yes i get that. Two knobs? a. verify b. the per netns value ro? Both
> > on by default?
> 
> A single system wide field is simplest.
> 
> Is there a benefit to making this configurable on a per netns basis?

As I tried to explain: a specific container breaks, you decide to trust it,
you do not need to trust all.

> If so, that's fine too. As long as root-in-namespace cannot modify it,
> so readonly indeed.


Right. So I envision along the lines of:

net.core.virtio_net_hdr_validate_all - validate packets from any netns,
netns root can not change it, only host root

net.core.virtio_net_hdr_validate - per netns


both set by default, validation runs if either is set.

-- 
MST

