Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DB2147FA
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408467; cv=none; b=S2dqBLeOOHGKYn6cSo+8qkLgnlNT1EEFgQ7MYCcTOPzLMs98k6MrugGIxe/JpveVSXPuUQ7DdBo/RlLuob8k0OMDYWwbLDJX5WWWh6XUNvKBQg6/w/FzCBW5KDSRDBNyDDWlpnuBJsnZObX8CcLLeuftC6ArOwPUp22QNxxAe8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408467; c=relaxed/simple;
	bh=Qk38VXpNNITAt7xRhep592aDF5AOkqXBIeZKZMfgj1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUjdYEDhJfDgSPIjc/EJoXgynq9JyE2yjjM6N+UTiM3IUtC5iT645VmoPksKHEhs5+fz85xGii5ya2j4KliZSumevO4bbQU7SGBDbq/MrQpGQr8iXKLADSjfgVtwGDZjHmsW2gjH+FqETfE1Io/6v/kfzVv5rC18C7kaQmyoZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gz3ApXnq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gz3ApXnq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736408465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvMHmhw41jW2VMbkE+Q7qKoGQkCDW1O/R8raW3Ad35s=;
	b=Gz3ApXnqK6eOViE0ztATqS0CiRVfTUfTXGPCEHLrUNRk4Hb66K0ifT8ehr3bMdN4l8ggLw
	F2+TzCT8cLRp1Kx92m+ySOIDBiNP72aU4+mN6UK7pRlyqRu1ZIpQlREp9VD5jH8OBSjeXx
	dvVf8N3VSXlc6Qr+k8EYhS1LfYLbAF0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-y5dm7fH-Mu2cjQ3Wz9-HlA-1; Thu, 09 Jan 2025 02:41:02 -0500
X-MC-Unique: y5dm7fH-Mu2cjQ3Wz9-HlA-1
X-Mimecast-MFC-AGG-ID: y5dm7fH-Mu2cjQ3Wz9-HlA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa69e84128aso46853666b.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408461; x=1737013261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvMHmhw41jW2VMbkE+Q7qKoGQkCDW1O/R8raW3Ad35s=;
        b=qsewOxLbnl2qTgSRCpTNfwl2/fgODrLBXD8b6JxeBPi9Tu+GFCumFohaplLWdRZtTl
         G6PPwxP+OI2aysDbJqY8AfX54p0qkqUbcRkwx/rpz+Pcm8dwUp6j7+/k2F3x1mp0MRA6
         ja+YF1YJU09Q0zAJ54P1dc6zvMYFrV3rchNmw2TY4OU9On+W7lDmV3K5WrJR3lR1Rmh0
         1KOUPOfnkqAv2e8pF+eeqO6IJQgBLZtrRN/jyW6C1aDH+hCrZlsChzLaaAKyzwsa7FVr
         jEnlvVyplNtt/Z+32xblUtDD8lhFs+byUEgivVLJEKdLdh8SQ3AsjkF9n4MrknDxHqp2
         ZoSg==
X-Forwarded-Encrypted: i=1; AJvYcCUv2GApWK8owY9hFEzAhdeuxAoo/XT84hfENYKALkz/PBBkeLzdN38ZC26UbTnRMvelXyAd+vIgiAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjV7iIL0WUVDzBtdC2m+sJqCJIg9Qtwlbf/v2pU6BzPTdoZved
	fJbPjxaC4cgjH+nvmS3i88B0g4fcCZqGoOTlpOvq8g5Wj0vuJVM+/3QAC8mtoazPUM6Zv/8S9mE
	Z5otVF9gsJUBnywaIxUaacMDzFF9JwKho2sdEPQGgjcQ1AoHJXM0HQD4NTQ==
X-Gm-Gg: ASbGncuLDHdcMKy7i1f7agJDugNZzybWPYmOSuRy0jKjXXRu1Y3IIyLTvBRLOesKhKi
	L0rkq+4fpAB6eP0xrb5ryS/BuKjoHV3CQWggMmOUuvNcW2oFgQONU6jcY2Va4wMLySCoyu361gx
	bc5cav+tA5MmeDiPR2cwDUWO5dZYMhxyVKFfBfCZLuoSUuJm570f+fyaquVpFKOzHRiqpOeAez5
	+cpZD8f9fUhn8amNqlBW2t1iooZCnLFSVz1BCHHozFfN1nZnZg=
X-Received: by 2002:a17:907:6d01:b0:aab:d8de:64ed with SMTP id a640c23a62f3a-ab2ab6fcf85mr565432666b.25.1736408461318;
        Wed, 08 Jan 2025 23:41:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDzuwKOL/SH91ITfaKkGp53CDAvxvv6OgtnJor6T2CNBRRh8F6ch+wN71Fz8qty44wy1eohw==
X-Received: by 2002:a17:907:6d01:b0:aab:d8de:64ed with SMTP id a640c23a62f3a-ab2ab6fcf85mr565430166b.25.1736408460902;
        Wed, 08 Jan 2025 23:41:00 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c91362a2sm42852366b.85.2025.01.08.23.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:41:00 -0800 (PST)
Date: Thu, 9 Jan 2025 02:40:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	gur.stavi@huawei.com, devel@daynix.com
Subject: Re: [PATCH v2 3/3] tun: Set num_buffers for virtio 1.0
Message-ID: <20250109023829-mutt-send-email-mst@kernel.org>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-3-388d7d5a287a@daynix.com>
 <20250109023144-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109023144-mutt-send-email-mst@kernel.org>

On Thu, Jan 09, 2025 at 02:32:25AM -0500, Michael S. Tsirkin wrote:
> On Thu, Jan 09, 2025 at 03:58:45PM +0900, Akihiko Odaki wrote:
> > The specification says the device MUST set num_buffers to 1 if
> > VIRTIO_NET_F_MRG_RXBUF has not been negotiated.
> > 
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> 
> How do we know this is v1 and not v0? Confused.

Ah I got it, you assume userspace will over-write it
if VIRTIO_NET_F_MRG_RXBUF is set.
If we are leaving this up to userspace, why not let it do
it always?

> > ---
> >  drivers/net/tap.c      |  2 +-
> >  drivers/net/tun.c      |  6 ++++--
> >  drivers/net/tun_vnet.c | 14 +++++++++-----
> >  drivers/net/tun_vnet.h |  4 ++--
> >  4 files changed, 16 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> > index 60804855510b..fe9554ee5b8b 100644
> > --- a/drivers/net/tap.c
> > +++ b/drivers/net/tap.c
> > @@ -713,7 +713,7 @@ static ssize_t tap_put_user(struct tap_queue *q,
> >  	int total;
> >  
> >  	if (q->flags & IFF_VNET_HDR) {
> > -		struct virtio_net_hdr vnet_hdr;
> > +		struct virtio_net_hdr_v1 vnet_hdr;
> >  
> >  		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
> >  
> > diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> > index dbf0dee92e93..f211d0580887 100644
> > --- a/drivers/net/tun.c
> > +++ b/drivers/net/tun.c
> > @@ -1991,7 +1991,9 @@ static ssize_t tun_put_user_xdp(struct tun_struct *tun,
> >  	size_t total;
> >  
> >  	if (tun->flags & IFF_VNET_HDR) {
> > -		struct virtio_net_hdr gso = { 0 };
> > +		struct virtio_net_hdr_v1 gso = {
> > +			.num_buffers = __virtio16_to_cpu(true, 1)
> > +		};
> >  
> >  		vnet_hdr_sz = READ_ONCE(tun->vnet_hdr_sz);
> >  		ret = tun_vnet_hdr_put(vnet_hdr_sz, iter, &gso);
> > @@ -2044,7 +2046,7 @@ static ssize_t tun_put_user(struct tun_struct *tun,
> >  	}
> >  
> >  	if (vnet_hdr_sz) {
> > -		struct virtio_net_hdr gso;
> > +		struct virtio_net_hdr_v1 gso;
> >  
> >  		ret = tun_vnet_hdr_from_skb(tun->flags, tun->dev, skb, &gso);
> >  		if (ret < 0)
> > diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
> > index ffb2186facd3..a7a7989fae56 100644
> > --- a/drivers/net/tun_vnet.c
> > +++ b/drivers/net/tun_vnet.c
> > @@ -130,15 +130,17 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
> >  EXPORT_SYMBOL_GPL(tun_vnet_hdr_get);
> >  
> >  int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
> > -		     const struct virtio_net_hdr *hdr)
> > +		     const struct virtio_net_hdr_v1 *hdr)
> >  {
> > +	int content_sz = MIN(sizeof(*hdr), sz);
> > +
> >  	if (iov_iter_count(iter) < sz)
> >  		return -EINVAL;
> >  
> > -	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
> > +	if (copy_to_iter(hdr, content_sz, iter) != content_sz)
> >  		return -EFAULT;
> >  
> > -	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
> > +	if (iov_iter_zero(sz - content_sz, iter) != sz - content_sz)
> >  		return -EFAULT;
> >  
> >  	return 0;
> > @@ -154,11 +156,11 @@ EXPORT_SYMBOL_GPL(tun_vnet_hdr_to_skb);
> >  
> >  int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
> >  			  const struct sk_buff *skb,
> > -			  struct virtio_net_hdr *hdr)
> > +			  struct virtio_net_hdr_v1 *hdr)
> >  {
> >  	int vlan_hlen = skb_vlan_tag_present(skb) ? VLAN_HLEN : 0;
> >  
> > -	if (virtio_net_hdr_from_skb(skb, hdr,
> > +	if (virtio_net_hdr_from_skb(skb, (struct virtio_net_hdr *)hdr,
> >  				    tun_vnet_is_little_endian(flags), true,
> >  				    vlan_hlen)) {
> >  		struct skb_shared_info *sinfo = skb_shinfo(skb);
> > @@ -176,6 +178,8 @@ int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
> >  		return -EINVAL;
> >  	}
> >  
> > +	hdr->num_buffers = 1;
> > +
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(tun_vnet_hdr_from_skb);
> > diff --git a/drivers/net/tun_vnet.h b/drivers/net/tun_vnet.h
> > index 2dfdbe92bb24..d8fd94094227 100644
> > --- a/drivers/net/tun_vnet.h
> > +++ b/drivers/net/tun_vnet.h
> > @@ -12,13 +12,13 @@ int tun_vnet_hdr_get(int sz, unsigned int flags, struct iov_iter *from,
> >  		     struct virtio_net_hdr *hdr);
> >  
> >  int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
> > -		     const struct virtio_net_hdr *hdr);
> > +		     const struct virtio_net_hdr_v1 *hdr);
> >  
> >  int tun_vnet_hdr_to_skb(unsigned int flags, struct sk_buff *skb,
> >  			const struct virtio_net_hdr *hdr);
> >  
> >  int tun_vnet_hdr_from_skb(unsigned int flags, const struct net_device *dev,
> >  			  const struct sk_buff *skb,
> > -			  struct virtio_net_hdr *hdr);
> > +			  struct virtio_net_hdr_v1 *hdr);
> >  
> >  #endif /* TUN_VNET_H */
> > 
> > -- 
> > 2.47.1

