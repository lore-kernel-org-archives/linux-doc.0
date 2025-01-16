Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6350285
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015269; cv=none; b=SqYNOe6z4Q3RKe7F/pWBDDB4D2O9XrViGBcxGq32U1lrKJUcFN+wnieOsQ0iEd/3fm1p0WrKZO4OROTI1IZwcu+/+B6jd4CFGi1NIGMYXd35wASwwen9DNv91pkAieTnOqJXxY72uYyLWp5Xf8sli5xsxdxTJTIEBbBUMaW/iG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015269; c=relaxed/simple;
	bh=fort1JpzFCk9aJtnmJGBE2dcNxsiha4izVe2Fx5p3d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnUugfJhEBEEwMP7LmKniv5Htx9JSG+lvn8I/X8fQJOYrg6cU1AAl3awhqWDKp0Ru6hH7n0ahUPVhrI+27SBCU5Pv4jbnNqouJl86AFtJd8FZ0VPqOmovctjgrJfNyaxWtwIDyH3HD1Gzjjd2AexkGoTxetJ808og1sRt8XEhM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTRgc7kE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTRgc7kE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737015266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERbJSuqsAOXaaj6eB/CkwpIU16l9eEjJ8jUx0oPfO3Y=;
	b=fTRgc7kE8hh4l7jRuyDI5GItj6qh5RMHvzOX+QXmPgNF98xK0daWm6wjHWrgPH3FuqW7Q/
	N9j8NJ9fEVzuPTjcpKNCe2c/1Oa2CA5umSGwRTcctsDSR6SfenPb1oyQsi/s65tlk5BeBr
	g24vsliaYeVF5OYMqlwW688Ow1pFYz8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-YcMqvESiNuuOUqie5tUISQ-1; Thu, 16 Jan 2025 03:14:24 -0500
X-MC-Unique: YcMqvESiNuuOUqie5tUISQ-1
X-Mimecast-MFC-AGG-ID: YcMqvESiNuuOUqie5tUISQ
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385ded5e92aso265193f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 00:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015264; x=1737620064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERbJSuqsAOXaaj6eB/CkwpIU16l9eEjJ8jUx0oPfO3Y=;
        b=Gmro6WllwMMbph7R8RwuyeTJu5pz5d2FDODSBwIRGCqYQ+AQeF2u6h5oOXXjvlL9bs
         DEhm7r1/Vuhdtp8L8PDMFNoi7aa2u7/e+Q9hX/4vzhTSi460YhL6PwzOAFjUzy/VE+KX
         Ue1SeCwJipw3ByjKzCGTqwK7OP5Lk3RgCssCQfuVaHqO6nwoTaBD7kTKxIURJTP1hj/g
         HvzVQRw1n9ugLjlPcH9MmjwP8/2ZX/rvHIdFPcGvaypkkOotT3v58HH3famAjy3Mab/R
         C6c4utBuhsu61frGXLRwA+dTFOIgx0YcllmpjuWq+D9LAX39S2KdZ477TVbs5nHgu+N2
         dbEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5uZ0naxUIRkwWoIiZ25uf67E2pvZeaV+esHejGqMlEz6pk53exckDZZWQLg10xX41gAeSzapGhdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YweEV/Yn/5pWWSidpTkcgN2Z6JZKkF5oAhHUiDGD/CA0aFN/Pet
	7wZXAkmqS8fbTvdtQpGM65huWClyKAb8fbgGKQxxJDlajKEMVlwMUyRxE4XMjBD54VaqgBKyp5w
	ggvM4uONXdEcsuUEXMtE2t9din+Iq96zGkuN/seSOJt+TSfw6oeCd8dE/3w==
X-Gm-Gg: ASbGncuGsoZqHb1izHX9XKgDoHGAQrVnvz10XacAPB813zDJVjwQ8OGd8MvSk+98btK
	CXCT3zaKQEdedc9qNnACci4e8rt/aec90CNC70Ch+KLqL7yJI7q3jDtT/YLUxAFBAO5Kf4zT/zD
	wZjl3q0Zu/IKE6WX+L86oLIXC7lzDll52mKwhrd35OZRnO3136ZTFLulyzNVa3NzT9isdW8FR1K
	88XyMfeYIh9ZGzYwK1r48saHC0lFsR3vpKYCfXtWJNI3dRHy7XD
X-Received: by 2002:a05:6000:2ad:b0:385:f5c4:b30d with SMTP id ffacd0b85a97d-38a8730dd17mr7142032f8f.39.1737015263728;
        Thu, 16 Jan 2025 00:14:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVuBvar1zeSUO961UzYaw/R6lkjncjPewk3IhqyjOPRMXTTO5yWHL+JU+PeFfMlECdyG2zMA==
X-Received: by 2002:a05:6000:2ad:b0:385:f5c4:b30d with SMTP id ffacd0b85a97d-38a8730dd17mr7141999f8f.39.1737015263364;
        Thu, 16 Jan 2025 00:14:23 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0bdsm19629001f8f.3.2025.01.16.00.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:14:22 -0800 (PST)
Date: Thu, 16 Jan 2025 03:14:18 -0500
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
Subject: Re: [PATCH net v3 0/9] tun: Unify vnet implementation
Message-ID: <20250116031331-mutt-send-email-mst@kernel.org>
References: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>

On Thu, Jan 16, 2025 at 05:08:03PM +0900, Akihiko Odaki wrote:
> When I implemented virtio's hash-related features to tun/tap [1],
> I found tun/tap does not fill the entire region reserved for the virtio
> header, leaving some uninitialized hole in the middle of the buffer
> after read()/recvmesg().
> 
> This series fills the uninitialized hole. More concretely, the
> num_buffers field will be initialized with 1, and the other fields will
> be inialized with 0. Setting the num_buffers field to 1 is mandated by
> virtio 1.0 [2].
> 
> The change to virtio header is preceded by another change that refactors
> tun and tap to unify their virtio-related code.
> 
> [1]: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com
> [2]: https://lore.kernel.org/r/20241227084256-mutt-send-email-mst@kernel.org/
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Will review. But this does not look like net material to me.
Not really a bugfix. More like net-next.

> ---
> Changes in v3:
> - Dropped changes to fill the vnet header.
> - Splitted patch "tun: Unify vnet implementation".
> - Reverted spurious changes in patch "tun: Unify vnet implementation".
> - Merged tun_vnet.c into TAP.
> - Link to v2: https://lore.kernel.org/r/20250109-tun-v2-0-388d7d5a287a@daynix.com
> 
> Changes in v2:
> - Fixed num_buffers endian.
> - Link to v1: https://lore.kernel.org/r/20250108-tun-v1-0-67d784b34374@daynix.com
> 
> ---
> Akihiko Odaki (9):
>       tun: Refactor CONFIG_TUN_VNET_CROSS_LE
>       tun: Avoid double-tracking iov_iter length changes
>       tun: Keep hdr_len in tun_get_user()
>       tun: Decouple vnet from tun_struct
>       tun: Decouple vnet handling
>       tun: Extract the vnet handling code
>       tap: Avoid double-tracking iov_iter length changes
>       tap: Keep hdr_len in tap_get_user()
>       tap: Use tun's vnet-related code
> 
>  MAINTAINERS            |   2 +-
>  drivers/net/Kconfig    |   1 +
>  drivers/net/Makefile   |   3 +-
>  drivers/net/tap.c      | 172 ++++++------------------------------------
>  drivers/net/tun.c      | 200 +++++++------------------------------------------
>  drivers/net/tun_vnet.c | 180 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/net/tun_vnet.h |  25 +++++++
>  7 files changed, 260 insertions(+), 323 deletions(-)
> ---
> base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
> change-id: 20241230-tun-66e10a49b0c7
> 
> Best regards,
> -- 
> Akihiko Odaki <akihiko.odaki@daynix.com>

