Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577685;
	b=5SDfEPN4gon6DbNx1TQz2DB9fNY8nK/o7efGfAFBt5NfrKQnK2X1onngl4RD8LjonUXu
	 jbLUbqe8N4Yqf7mtDIa0fKL2hwrhAhB9vWaJnUzBJTXL0idt4WHLqHiNGUDcjZTY0vnDS
	 1ujd9dgCXlOYccvJVtsT2wvAjxveUcSsz2ilx9fDqWhm8uUpEelWAzaUL/TzrUUSaexJo
	 Lb5IA00RoykViqSe6WEgArllPikKzSOjcOP4+i3TAQ9GtVS3pHNqPnV0Lcovihd0p6sx2
	 6odw/Xeh/q+LqWCcHXVUKkFtcDyXMq3FxSR/4O9fWdIiO5biiFWtxOyABZHIyZUD9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577685;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=K3ulWQ1GRQqZjrZU58O9Jzh/ioB+BuDoUJ+3ua7x2FFlR/69k+/87rFwhc5HK6OU5a7L
	 JYzV8OUGtykZQVMC1qraZDYtwWDXND4V8RU+PiQbcx83UN/UiTrrZg1Q3kLCBMjFXJSOD
	 k5YtGzRkIojMTN3UEy+f+K4In5hAvoBcF4sxnCGJKswO9qkDGILG+p+aLyCkLk1Cytoox
	 rIoBdFf0Ix6ucIkZgdjOpFzRYDfkm4C0FYioSOnet0sJRx95r3YTraRBSdTAO/EFzvtSS
	 E/BrV4VMf+NRwBrR/3FTCRnF5YBDIZv/qA+gLh1Kjmk25EkoEETHUyUOrmKsrFWIO6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1160606A31F
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 10:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1160606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpixcOcI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ejAaswOC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
	b=TpixcOcIc+qEmEDiQ0FLw+S+qtpggT3NqH0RIXuzC8XKV/f9YbgNr3ahFBE7fZ+GDb2aiM
	MJ8Tu/HXmRNLwBcF7ACuwPEadiowaMAmgZJ/st10hS9I3uA3Zr1aRYCnlG+rN/XIpsvwi5
	q+58VurQ3uB5vhiS4wynDKnC3HLs7QE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-a_Ztnx4sOumIRBzZGvwA6A-1; Wed, 21 Oct 2026 06:14:36 -0400
X-MC-Unique: a_Ztnx4sOumIRBzZGvwA6A-1
X-Mimecast-MFC-AGG-ID: a_Ztnx4sOumIRBzZGvwA6A_1792577675
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c415561aaso377618f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577675; x=1793182475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=ejAaswOCkEY3H7XHMvAZgqt+YFWmaA2GRwEj+PstMfsG6vKej3aW9Mc3rh9fAEWYEb
         pg2JMCkAPE82ExN+TJKKaHRxxf+3uJRlOUFuBXopOsn1ymGHjdcQSgg7go7o2YFOI6B4
         5Be9HrAfZ3MzPuPr3CKBSUBj4Qny302DJ5AAyOadKTYOToXS4tMVBUuwRD052omVT7J0
         MD1H88CSDfGxOULqFgCsw8YcCa6ZqWGbgLZXdbr5TZ9li9gphxupZM28UZ3UNFe32CXU
         Z6TO6k+AYwCq6yZ5V00AlM8z7dgnk6dWXWcf/KseDK8hkirdiHm+lEyFTAzhw2dNekkJ
         r8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577675; x=1793182475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaMrw0UGiuCnM59eNBEdevbmBZ2o/qyOQGg9zp+WMrM=;
        b=LrzpEbDnPAgW5SF5LuiSR/DYJy+jvJKtJ/LjiWiWlb0vwadhF1lRCF1wmlG1PWgBsB
         LCyKZmRofMqH0Ve5W7g/ejrnmGcZ2TbvONhO18odH9w6CS2GAcjUVrr5StJ7bZhSmllY
         LoJRCl1HGxk6RyevyljTUOng1hW3j2i7gqQ3OtjayuTOEBc7cQ8cYsERWYZRauBYJUAW
         gpQ7KVRPQXj7OPlZzReCuCWwIF+tZ8emDiuNsMP4rIxzP0CHGmoUS0QL7D3CY4w72Uwz
         FAeEZ0x7T5TnhI53DcmatmgKMfSJvq2Yfc/dLEkKqZNXaE7u1J/QA5Bkf+Xm4smEaOv6
         84Ag==
X-Forwarded-Encrypted: i=1; AKwUvByc6emtPH/HWen23ffdLKxkZqWpVWVwVFl2P0vxPGxHoV+DAwcyw1/6xLgSiOvQfLNZ9yaQRqueF9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBCK7naWjyO1IuxiXglFC1+oPJakhOAHfnHAairvEgG6bdPNr3
	BuOvcdCDWXJVHFYPTfFy82th/V4wIV5M60AjNluEtv8mMZxcRGEbMtIVcW8qndFMg2VcuF7ZWI+
	OdH3cq3nRrlsEzyhNNoJqf+KQ+hXhYXvS8dealXraSFtaZIiF9cF8lKm3kGLYRw==
X-Gm-Gg: AYBFou0OGRepPcQZjKsIzTPC2hK+SUeQSyHG1/oC+e0PVtGUxcWlwjQMMXl41DcThtY
	78vSKOhbSWFLKSnPn7a2Eyy7T8GxQn0aCVJgl3I2nPKGf416OIK3fBis29nY/niD35+1ustHy5K
	5I2wBb+erC7LPJpKal5hKhp6S/kpzSnVmxj9rHxqQ1BIUcm+8NPxAWM+8zuoyOX9VQ2hZuOhfsP
	w4HloAhO2Ugz5vlpKomvgYLB+KjmxdnNTW23lmeQIDR+V9Pzi5k055VaSXFzjVN1uYizeCNHhoZ
	DugZKbxhkqTRNmxA1jekEuTDyO48MhzI1b9diEnCVUV+vKy5c/+ixfj/Co9Ve7r1t58WbmBPomN
	ACGndbw==
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754093f8f.28.1792577675500;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr3754032f8f.28.1792577675060;
        Wed, 21 Oct 2026 03:14:35 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f0bc2sm4512724f8f.1.2026.10.21.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:14:34 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:14:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@kernel.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: [PATCH net-next v4 3/7] vsock: pass the netns to
 ->has_remote_cid()
Message-ID: <atiQfOneKTIyhGHX@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261020-vsock-guest-ns-v4-3-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:06PM -0700, Bobby Eshleman wrote:
>The transports only use the socket to find its network namespace. Pass
>the namespace instead, so that a later patch can ask whether a CID is
>taken in a namespace without necessarily having a socket on hand. This
>will help with avoiding CID collisions when devices move between
>namespaces.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> drivers/vhost/vsock.c            | 4 +---
> include/net/af_vsock.h           | 2 +-
> net/vmw_vsock/af_vsock.c         | 6 ++++--
> net/vmw_vsock/virtio_transport.c | 2 +-
> 4 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

