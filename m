Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577480;
	b=0XqNPJXM1Y4YteYjOK/x1VHrdfrzjINOr7Jk+PcTYbrF0d5SfpUx2InI0JzdyIrZIVv2
	 1byxdLUd9ImnRjzX4cLe2JAVzaEfVQvVn/IOPMd56EGN4vZ1EjIyLyiiOXjDPHPe+lYjD
	 9ZQSJk3AMFf7EUxcKn4zvzdOyn5DzXS7prHQwHH3B+69fr5XBuT1KdKkJxQ8Z0qOxvPeV
	 Z5I+vdAYQMWs7jL7OlJkuUkZqnqK0of9Gb5Fxr8mWI/mWRO/KUgXYZ1Tad/onIeGhKO/s
	 Cx83EKEkNGqPbB9LM0RRnD4kpRWC8/IomnmZevgF/WMfpdsxfZi4xEXrLzGyB3yIqBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577480;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=KXyDdCvsVdlnaMy+F1t07XU9O0Y18tehWJnToWJWhAXopk3wyFjaAxIaCsO8u/dK1ekL
	 53cuZhcniToR1o9pbhj2P9p/0I6Dle+ouAnPd+5Y13cd6EtRrBJ7nNhrIYhvKlLG5kko4
	 YeJRwLHyGHY3h0frJ5qESj/TY7DqlxJkB64cApjE/y7mmq7Dk70dNcykAyJq/QKm/tnH0
	 eFo5LGgqg+zgoGaVzgbVD5aqaK9ajwia0GF/I6cDTbI+V9Hvlkpk/VxPuYGqB597Y9EVW
	 TGZrV+VwV07FE3abmB3aMOUbW0fu/yNOAWMgMs8uncFvYLXmD6hfUbaI5hBeXuDsT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRJpuDgZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B218606A320
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 10:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B218606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRJpuDgZ;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p2NMMm65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792577474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
	b=DRJpuDgZ7LgJO4mT4LS0rmTR2Oit+nfgKj7EybX09VGAcbFwck8EgxgOKLEMi+fvZZUlEw
	ZEQ7SIOEFNXramMqkbi3fIlhVMWLKVB6GUUqUYOUJciRsvaCvjL3SDmrUt7ORVAwp2Tas1
	DQaWVlFzjGEhDHyQoMiDU9wwdfqCw2U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-MDaihOzNP5O_udRoypsU1Q-1; Wed, 21 Oct 2026 10:11:12 +0000
X-MC-Unique: MDaihOzNP5O_udRoypsU1Q-1
X-Mimecast-MFC-AGG-ID: MDaihOzNP5O_udRoypsU1Q_1792577472
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so4064625e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792577471; x=1793182271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=p2NMMm65jqUj/I4P1B9BWGIMi03CnY7qLB07ZBtujZih+ki0UsAbslcVS2RDxNYh/Y
         o2MMminxeoAs0V/jx+OZTBzf5RO5ereCCprRDR9pxx0wCTK/Zz7oPSzfiE2J0EIvRujU
         EzSPPpgnyZVIGxuwDqaIzeo4/hfhsxkaAQlpY4dwJbyLi7J9KSLygKezm5TbHBggRyXN
         3lJ6ksGEVRgwPNI0sQblkaXKLUSeJ6clUYyNgsMUz9s4A4u9MHlKa8AHjjU54WO+6yID
         rxfnlBdy26X2A/hQnxRPrHn8oMD6vkQ0eJvUy+avYZqyFNoWTcqPhPN0k7R+bTNR/5ZG
         NLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577471; x=1793182271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vVLJOhfTidMKw4MIf43k3Z+xniDsBdpWe5ByNjjrE/o=;
        b=COb6G31SL5t/Low5PYGJFTh8ph9rn/lK4kai/9NcEJmZmLfC1GCbqQ9UpRW7zrk3cT
         C8xRQiP4QLgaSiG3ASY6Rr1W7BJkVzmREaC6l0UC+Y11x4bfro11CnnMlmfA7xeC34FS
         gm/XYQWE+miLtN996eb+uZCwhH53EnGx9LhVlMdmVMLMg+w1Xmk2ttm5P/LvVYKq6f6Z
         aKjxFtzQa7aBzLOepi0fgdxswQEtDl7FPQxhS7SSy8Wag03/UtGmToQ1WGid2IVNEp8r
         hbat2qS8+SE11zzfNX8tpiaQVN4bOcKt3+XaLVRDOSc1yf560fqbxd35Ic8MVC2GBrks
         DypA==
X-Forwarded-Encrypted: i=1; AKwUvBwfkUztfzHGKZEgFAacq6fLxPzzU7oIwoiM3Z+3Tg9jCOkkJu+mSxLaTf76S8/27yfTTX1JBJa+VSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJh38C2dO3s2cnaP/aoOxCl7q10nfWUzPRoIYuSyjLX4F7fbJx4
	1DeGliMs7EgEEP2iwgBHr0NBDnVVp3ajkAjp+JoO5NBjo4dCjaR00pB7+BtThKXWoUTE0Iot8w4
	BTXUgMOlb+DFRuv4jr99hs6vRsijpm9V0hGEa5jQ2gfvnCD3pXyV/Flc07nGh9w==
X-Gm-Gg: AYBFou3PeEyYCC7yy5VKg4KzCSeJryzO7+pdUVdNJgcgy0G+Ikovr4KzP9LxZz+qXU7
	AbTaARU8tAOTetqL8zmLSNdBEdSnkxlxkB1bUgqaiB6wc72vQ6+xC3XMMd5tsVzXF83+DHgKS5G
	gP9snDAcyfMf6JcBdAoh2gCIU0pRB8Nwq/4mQPfHagQsY/O2ceCO05zLtDSmI+/2bXSSYLNeaEC
	CS9XwvRGGiouqnvnktJO9LHnaexCG+VEqxRQWG+Px0PtNwAM5Nv4FbeYntv6a1ygGGKXDYMQW8Q
	R2w1Uk3jJo4eNx7LSHMSRNel5o+uKFWAGuPOApOeB6SpIufWKyHZ4N38mbcAkgKanE+Bb9xGOb9
	/CDTaRw==
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31195345e9.2.1792577470807;
        Wed, 21 Oct 2026 03:11:10 -0700 (PDT)
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4a1fd8a7d77mr31194065e9.2.1792577469551;
        Wed, 21 Oct 2026 03:11:09 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.178.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d699dasm152330945e9.12.2026.10.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:11:08 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:11:00 +0200
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
Subject: Re: [PATCH net-next v4 2/7] vsock: rename the vsock pernet operations
Message-ID: <atiPgleCntfwV4-N@sgarzare-redhat>
References: <20261020-vsock-guest-ns-v4-0-047527cfccfc@meta.com>
 <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>
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
In-Reply-To: <20261020-vsock-guest-ns-v4-2-047527cfccfc@meta.com>

On Tue, Oct 20, 2026 at 06:15:05PM -0700, Bobby Eshleman wrote:
>vsock_sysctl_ops and its two callbacks are named for the sysctl tables
>they register, but the init callback already does more than that: it
>also initialises the per-namespace vsock state through vsock_net_init().
>
>Rename them to vsock_pernet_ops, vsock_pernet_init and
>vsock_pernet_exit, so that later per-namespace work can be placed here
>too.
>
>No functional change.
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
> net/vmw_vsock/af_vsock.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

