Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131F922ACFA
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751958733; cv=none; b=l4fqo3LgWHlE6q3vuPuzaH4QoXojhBUJU0TUfKrGziMEHF9DCcIrDTuIenVKZ4Dx8QfugvXFJr/UCFBCGqYhC/CJuQ+8Uw3DFaM4zk69d6asYmEjPwHOKaHeVKzbRAkaJuhAaq18N2Jk7OOBSojlIIybUJnZoZC2zO2TPIVyjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751958733; c=relaxed/simple;
	bh=5lwDy8ZYNMTW4ldI2+BzIqOokv8FO+QSb76sSEuZo+U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bUBOaQ0NA582Z6/VTUBsRTTQNeIYyGhUNWRZpd/UlTZhdh6IfiRyzB3T7M0Vbd3qo/ncR9sckTpv4AV/DWXAvGwMsoXnbPWYknUHHHXSoF7GBF6lA81WzylveuujikL4TTeucyVmrBO57f5DO/Q2L1A6bkrcRfOxmm/ajVyUyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a3EmyE9z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a3EmyE9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751958731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6al2WSZTd7CdtJL8s2F8tIL0jpPencH2sAuuH9551kk=;
	b=a3EmyE9zxPSfDeGSPMlMvR9Ae7FhNQ3F9TjSqLm6lLyEn0AEvmQ6PormYnS2OA0jrGQppY
	JkzKLWsxKP9Ir9/AZPrlCSTni7ZtGAlMyQetyvs+Myd2LShBREg6lyCRQUx2R9frxJ99mX
	j8OGBQqg32pk7OyJ20Max4ZNx4h5ojA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-PQrthmw3Pd2y_ikcI7uy2A-1; Tue, 08 Jul 2025 03:12:07 -0400
X-MC-Unique: PQrthmw3Pd2y_ikcI7uy2A-1
X-Mimecast-MFC-AGG-ID: PQrthmw3Pd2y_ikcI7uy2A_1751958726
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b39cc43f15so1892660f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751958726; x=1752563526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6al2WSZTd7CdtJL8s2F8tIL0jpPencH2sAuuH9551kk=;
        b=bdphpcZ9JuLapxf8VyR7yDzAl1ztbhCmjeVVs0e5M1M3KPnbObRAR97FzpIzRz+vu7
         v4Z2MqMh94etV7LXx/FsCUxwSAkyx2nUb6IGjb8izRvN2c36/jqae4F9G8s+1+f4Qzgw
         OjlahywjJ8Rq6BUCMv5DQpWYhUDrYjpyFOzuJiiGk1gqXStiSZ9UDyewEk3UIbVvLIU5
         8mML2XD8Tlrp9977I5rWoptkIX4VmgjY3PgGL6yNePLjjiwgkpBnaEsioGzwWe5ysGjc
         gd/5H+hu30JAcooSK+JjcfTPxUnCI9DkgledbYKAZK3lfYKGtvEf6hhJsIpZWzUz/Obn
         boVg==
X-Forwarded-Encrypted: i=1; AJvYcCWwBp8+D02RqnP10pyAbha/x+0fGv+F/+49QH4+9VRep5beTGw0wyrvPYx7n4Ess+N0uoD8piIUNGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wslJpkVAhAhLBmTESpLgdG/wHEJPQGucpqbpFwFrFx2x+OXV
	to5qc6z3T7bEJOwMfouY4vhuKQ4oBGUfc2v29BC/hdJEmE6yCch2j2O8WjXSsYajEMwIbS8IK4/
	KU3aO6j7bvxlc79LeIumLjxuN+H8UZbJLA1R2ccgLqtDEZ6485W14y4wgvCekhQ==
X-Gm-Gg: ASbGncsF++nPrJwvr5ZY/kL9/QLKwUPAEEbJj+RprswXwGgDtT94ODrNiv7v+PodNqi
	OGcOwMaUDzschV1Jk1PNj4L/d15RF7E2u/E3Cnhl4mq2vqzh5giBPtBwMjO3RJGhF7hurxWdsdv
	QPvlV2/AVktbfA9q6X+FeBp4JxsHfJ+vMob1B9sTer0Vs/q/ixypqGRlYAvOp8nnyXEbTdjuYWp
	2TRayaJSBInFrd6g5fMnAMBypxIs6uD6aIjUOvTlxYssYCnOcNcExFAIQ31bZEhS52Wapc4+jRc
	4HrwkAZlIu/OUxkvWr+GIx90lk6E/mhO0hSjxup9x3JK8Nx8BCqJZiqRDv18oUNrzwyNvg==
X-Received: by 2002:a05:6000:2289:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3b49661da34mr13442611f8f.45.1751958726390;
        Tue, 08 Jul 2025 00:12:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUa0YAy1NBgIDOiXc5gNSB+BOVkjsJ3ZjAZUt++LCSItxzDjYj+HoOIwwZ6aldycNJxaG+/w==
X-Received: by 2002:a05:6000:2289:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3b49661da34mr13442567f8f.45.1751958725979;
        Tue, 08 Jul 2025 00:12:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2717:8910:b663:3b86:247e:dba2? ([2a0d:3344:2717:8910:b663:3b86:247e:dba2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd4938ffsm12723525e9.21.2025.07.08.00.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 00:12:05 -0700 (PDT)
Message-ID: <41eb8d72-bfa3-4063-88af-1ec23593b0f8@redhat.com>
Date: Tue, 8 Jul 2025 09:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 0/9] virtio: introduce GSO over UDP tunnel
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1750753211.git.pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <cover.1750753211.git.pabeni@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/25 4:09 PM, Paolo Abeni wrote:
> Some virtualized deployments use UDP tunnel pervasively and are impacted
> negatively by the lack of GSO support for such kind of traffic in the
> virtual NIC driver.
> 
> The virtio_net specification recently introduced support for GS over
> UDP tunnel, this series updates the virtio implementation to support
> such a feature.
> 
> Currently the kernel virtio support limits the feature space to 64,
> while the virtio specification allows for a larger number of features.
> Specifically the GSO-over-UDP-tunnel-related virtio features use bits
> 65-69.
> 
> The first four patches in this series rework the virtio and vhost
> feature support to cope with up to 128 bits. The limit is set by
> a define and could be easily raised in future, as needed.
> 
> This implementation choice is aimed at keeping the code churn as
> limited as possible. For the same reason, only the virtio_net driver is
> reworked to leverage the extended feature space; all other
> virtio/vhost drivers are unaffected, but could be upgraded to support
> the extended features space in a later time.
> 
> The last four patches bring in the actual GSO over UDP tunnel support.
> As per specification, some additional fields are introduced into the
> virtio net header to support the new offload. The presence of such
> fields depends on the negotiated features.
> 
> New helpers are introduced to convert the UDP-tunneled skb metadata to
> an extended virtio net header and vice versa. Such helpers are used by
> the tun and virtio_net driver to cope with the newly supported offloads.
> 
> Tested with basic stream transfer with all the possible permutations of
> host kernel/qemu/guest kernel with/without GSO over UDP tunnel support.
> 
> This is also are available in the Git repository at:
> 
> git@github.com:pabeni/linux-devel.git virtio_udp_tunnel_24_06_2025
> 
> Ideally both the net-next tree and the vhost tree could pull from the
> above.

As Michael prefers to hide the warning in patch 4/9 and this series in
the current form has now conflicts with the current net-next tree, I
just shared a v7, with a more detailed merge plan in the cover letter.

Thanks,

Paolo

