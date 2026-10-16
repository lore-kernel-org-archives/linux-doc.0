Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF355542810
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792176024; cv=none; b=FzWTqEjgetHz+ms9ou6LDsEl8mgXoms1iwhKwA35IS9CXw5or+b8o1rDB0ojkZ6iyo6LOiYB0z4sfKL5tjWMNe5i+/IQoBoZTDe9IRcbKNKzTmB/NB17yHNae6YVzR50JVGD2+wg1EBOVhMZjmfjLiEeuwOn9fwtqzfnYPms5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792176024; c=relaxed/simple;
	bh=TtCwQmW9z7VLSlbkIUYvUJ6XV+W61FfizwGxp/7PXxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqzShSj09EiLevAWvsSvNluQu3gNPtg/vYAfFzWl/ZkeOV95EM+Kx/2UV67G1l+47pnAcpbepV5+AY6458vc9YkJ+v3rQ3vvYbr9uGhdb/o25sC5fcuHzN9CrDjGBImxwnfTMkC8tGT+cnhFzIOkWaDJTKPhxhLjRWPX/3a0Rt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iO9n4n4p; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bC6qo3gx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iO9n4n4p";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bC6qo3gx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792176021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
	b=iO9n4n4phFlCEHsDnKmRV5n3MDmlwFv2eKca1PUO9m/2WdHFjW1h0B5YT/d+pu5czbfQq7
	HAyXFr93EH8lpKFkt+X5Eg8YvNParexvDj9ZZK1bcXvUnwISzmR5wsGDwF3VoUV1dN6Cxr
	Wv2yrb7OYhZ6rQ0von5xdBR2TPHL8Q8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-RVScx97QM7iPHplvmf-giA-1; Fri, 16 Oct 2026 18:40:20 +0000
X-MC-Unique: RVScx97QM7iPHplvmf-giA-1
X-Mimecast-MFC-AGG-ID: RVScx97QM7iPHplvmf-giA_1792176019
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1ac6663e1so2281125e9.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792176019; x=1792780819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
        b=bC6qo3gxeQgiJZ8bkrTygAfW6HXrIZ1k7LJyh8TLXObK7HAQJYHT4pJKSLH6tOGssc
         QY14v5ilGa9TJIMATsH3gf5kS/6e2BBoxixSYRRFE/mt5xtr8wt2+c/4UWq498TH0dsk
         M9Q8Dv8jsObX8cJtNzNXau/+oT9mxbRW/kopvp7X3mHFWWFoqUYSBFafJhG8yTYQnrhW
         rZdD8hkKntgkdCLVIF88pTCDW8symjjPcVxzdWd+3plGnD0nRLgnC1y06fSLGEO/CeUZ
         5qccn7MUq0nTNMQT7M7TUpFzrwwp/H3Wi3bwQCmLvgbjWbfnP99O9cLFUtYKFWVXPeuG
         sX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176019; x=1792780819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plc50fRCIOdcKHDZ5D5nq9FAVnLtqLtSVPaltfZbIaM=;
        b=jadZvi2QAoKv6HVMMDK3KwoDw4PkvKHYxhpkz3acRTz1d7LjERvbi84MCKtWCmbu4g
         NxcggnUcas+i7B710n8B04qbXdwZWVfgMVD4d90k/AE3o8Cfuwj+35Mf3eGgOUtHMeef
         QXobO8cq9L8ENQ/D/4BU8w1erP9jwGWC5pJywt4lJ1fEOJ7Tm8HR7AghbPDMm/RQdP3x
         qd8K7QrmCCl7RkhRcjjaDu4KKhiaq84sDwlM0p9ThJtuNb9aYd+I3Avps8FUca4K71J9
         L49cChjQcEuutULs5r01XXuYXZ5S7pfJIP7S1EBK3s6f01y5zhen43Ef0Y4gConsrxyY
         j1CA==
X-Forwarded-Encrypted: i=1; AKwUvByHX4yRuo45yRzh+maccH7fq8FLNws4Kpbl4MizLrjK0WcIE6JVRlzNYhvIA+CfQpC3GN01nEqqy1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbiHe6gzHnlzSaPk+TivlCVP4a5ylcsKNy87wCerWzqHaoeehz
	LvFIeHYoDCs2D8mJvWRS636Gn1GPrBk2fdB3CbXgP4Su2zYf4x4kDk8f5CtmYk7Uq5w5sIg9ERM
	mQARz41nN7FVBrafbhMDA/kK2x30+cvW3qH1aXsSduCdCGfXHkuf0IVK364PnYg==
X-Gm-Gg: AYBFou087CJ0h4OiDBslxRp2DGVxwIqPJiyPAnbcKrUKFDXnBX81YNxP3i0zIg54+jG
	SAS1gFaHSUxJUE6iOR8h+T1OuqcryKF087ZJl2IheSHLYJ+z7iSzYiZvU9wOscG6BfY71S44mVz
	cn1iaV6OAtUnNKKv5+4QZGDc0sY5iKqyvwKVCeHJeG+7McVu6OnQO4ffhwTNynjuLxbA8y0s1Kw
	ulkSvZJdJZryQPlR9H/AMQ/NnuDArXXrVkLRVC7y094waT3lp/01Wqbs76bXL5zg0tQqLZdmUzQ
	kYD8MLpzAhwR1++gdaGMApsZSk8fMfAAFmpvvUTn+vke14W2PVh51ErpE58kr7XrNoelUgQ=
X-Received: by 2002:a05:600c:3e85:b0:4a1:d798:b08a with SMTP id 5b1f17b1804b1-4a1d798b0d4mr12241515e9.21.1792176018977;
        Fri, 16 Oct 2026 11:40:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3e85:b0:4a1:d798:b08a with SMTP id 5b1f17b1804b1-4a1d798b0d4mr12240665e9.21.1792176018224;
        Fri, 16 Oct 2026 11:40:18 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cc642573sm56208515e9.2.2026.10.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:40:16 -0700 (PDT)
Date: Fri, 16 Oct 2026 14:40:13 -0400
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
Message-ID: <20261016143944-mutt-send-email-mst@kernel.org>
References: <cover.1792067836.git.mst@redhat.com>
 <ad05a40681719a579691a1da6413f0dd7064f2a0.1792067836.git.mst@redhat.com>
 <willemdebruijn.kernel.3a7d04e1c306e@gmail.com>
 <20261016051827-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.1d7ce6b64753a@gmail.com>
 <20261016134823-mutt-send-email-mst@kernel.org>
 <willemdebruijn.kernel.2deaddfb31bd9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <willemdebruijn.kernel.2deaddfb31bd9@gmail.com>

On Fri, Oct 16, 2026 at 02:19:39PM -0400, Willem de Bruijn wrote:
> Michael S. Tsirkin wrote:
> > On Fri, Oct 16, 2026 at 11:30:17AM -0400, Willem de Bruijn wrote:
> > > Michael S. Tsirkin wrote:
> > > > On Thu, Oct 15, 2026 at 01:50:54PM -0400, Willem de Bruijn wrote:
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
> > > > > >  Documentation/admin-guide/sysctl/net.rst | 15 +++++++
> > > > > >  include/linux/virtio_net.h               | 23 ++++++++++
> > > > > >  include/net/netns/core.h                 |  1 +
> > > > > >  net/core/dev.c                           |  6 +++
> > > > > >  net/core/net_namespace.c                 |  1 +
> > > > > >  net/core/sysctl_net_core.c               | 54 ++++++++++++++++++++++++
> > > > > >  6 files changed, 100 insertions(+)
> > > > > > 
> > > > > > diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> > > > > > index e586e17fc7a5..7f230929c37e 100644
> > > > > > --- a/Documentation/admin-guide/sysctl/net.rst
> > > > > > +++ b/Documentation/admin-guide/sysctl/net.rst
> > > > > > @@ -246,6 +246,21 @@ processes are dropped unless socket option SOF_TIMESTAMPING_OPT_TSONLY is set.
> > > > > >  Default: 1 (on)
> > > > > >  
> > > > > >  
> > > > > > +virtio_net_hdr_csum_check
> > > > > > +-------------------------
> > > > > 
> > > > > Make more generic, virtio_net_hdr_validate?
> > > > > 
> > > > > In case we add more validation in the future (as we have in the past),
> > > > > without having to introduce multiple such knobs.
> > > > 
> > > > But it's uapi, are you sure we'll be able to change the meaning
> > > > of an existing knob, even if we keep the name vague?
> > > > 
> > > > > > +
> > > > > > +When processing packets with a virtio net header (through tun, tap, a
> > > > > > +packet socket or a virtio network device) that request checksum offload
> > > > > > +(VIRTIO_NET_HDR_F_NEEDS_CSUM), validate the packet: complete the checksum
> > > > > > +in software, or drop the packet where the header does not match it.
> > > > > > +
> > > > > > +When disabled, the header is trusted not to corrupt the packet, and the
> > > > > > +checksum is offloaded to hardware (or not verified if it never reaches
> > > > > > +hardware). This is only safe if no protocol is processing the packets.
> > > > > > +
> > > > > > +Default: 1 (on)
> > > > > > +
> > > > > > +
> > > > > >  wmem_default
> > > > > >  ------------
> > > > > >  
> > > > > > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > > > > > index 357115ff0ec2..aa2f8ac4657c 100644
> > > > > > --- a/include/linux/virtio_net.h
> > > > > > +++ b/include/linux/virtio_net.h
> > > > > > @@ -5,6 +5,7 @@
> > > > > >  #include <linux/if_vlan.h>
> > > > > >  #include <linux/ip.h>
> > > > > >  #include <linux/ipv6.h>
> > > > > > +#include <linux/jump_label.h>
> > > > > >  #include <linux/netdevice.h>
> > > > > >  #include <linux/udp.h>
> > > > > >  #include <net/gso.h>
> > > > > > @@ -78,6 +79,19 @@ static inline struct iphdr *virtio_net_ip4_parse(struct sk_buff *skb,
> > > > > >  	*thoff = nhoff + iph->ihl * sizeof(u32);
> > > > > >  	return iph;
> > > > > >  }
> > > > > > +/* Defined in net/core/dev.c, enabled while any network namespace
> > > > > > + * has net.core.virtio_net_hdr_csum_check set to 0.
> > > > > > + */
> > > > > 
> > > > > Should this be a global sysctl, rather than per netns?
> > > > 
> > > > 
> > > > For customers I work with, it would be much less useful.
> > > 
> > > Third option: make it an integer rather than a boolean.
> > > 
> > > 0: no validation
> > > 1: current level of validation
> > > 2 and beyond: if we have to extend it later
> > > 
> > > Not pretty, I'll admit. So fine to keep as is too if you prefer.
> > > But I do foresee more changes in this area, if history is a guide.
> > >  
> > > > 
> > > > > Even if per-netns, most likely do not want it writable by netns root
> > > > > with user namespaces.
> > > > >
> > > > > That is the equivalent of ns_capable(CAP_NET_RAW), which is the cause
> > > > > of many crashes due to bad packets ingested by, e.g., a packet socket.
> > > > 
> > > > Hmm, yes i get that. Two knobs? a. verify b. the per netns value ro? Both
> > > > on by default?
> > > 
> > > A single system wide field is simplest.
> > > 
> > > Is there a benefit to making this configurable on a per netns basis?
> > 
> > As I tried to explain: a specific container breaks, you decide to trust it,
> > you do not need to trust all.
> 
> Ok
> 
> > > If so, that's fine too. As long as root-in-namespace cannot modify it,
> > > so readonly indeed.
> > 
> > 
> > Right. So I envision along the lines of:
> > 
> > net.core.virtio_net_hdr_validate_all - validate packets from any netns,
> > netns root can not change it, only host root
> > 
> > net.core.virtio_net_hdr_validate - per netns
> 
> Then skip the global option, as it's just a convenience: the same can be
> achieved by iterating over all the per-netns settings.
> 
> Per netns validation, but only settable by root, not by root-in-namespace.

Hmm I don't know how to achieve that. Are there examples of such
options?

