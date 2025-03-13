Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E541DF975
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863543; cv=none; b=nCCjrR73UTkd6jKTJHjzyKiOaCSsJeCBrkjsRPUO6WwMPeSgMlclZ5fQxrgZsFoD7RRW8cRtttR7qqZYRWPKGUSAF2gZS8KvmWtyBpeIzyPQEosEvkEDk3RxxMRvjPefK9cnfkoc3w1LjL1Cce31R+4T8num9b1CI5VNJvwPr9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863543; c=relaxed/simple;
	bh=37LJNif6aGyyhlJh5h8ixFPgluvePWafJrCynYtE1IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtWc/nVMkQP2Yp+wVbkhsUJNXVHnuZNQ85U3S2uUe4+Ij6hbeRXFkHfVWx5YZQbMA/qGhNlmxOwkrMxN6Jh8pmA1vOjflmsCCC5UD2Ase4Q0wTiMEfpFOQ/NeqnH4lRsFjCY97eJPXabzCyM85OQt2bdhZY2Z0zoiLY30cBE6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iVLZfptD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iVLZfptD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741863541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I8+KGKdJ4EK24n18Z2V3Wf8YYaN68pwFttwmHD5FeXs=;
	b=iVLZfptD+pn64iyDSyI9HvKJqVIM7VARZHxcm78tK7bXK16d5pvAEVqfSAZ+i/8WL45NFP
	aPWFUwTjTeAcgfyqPAK6tfAFSlncRiHt6fnRxCRDA0tfz23QQmF7w305BVYFt5RPOx90Nj
	Aay6tMPBv48kV7h3ux+IRm/SmWV6868=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-Eih71LrBNVSzjkxvcjpVLw-1; Thu, 13 Mar 2025 06:58:59 -0400
X-MC-Unique: Eih71LrBNVSzjkxvcjpVLw-1
X-Mimecast-MFC-AGG-ID: Eih71LrBNVSzjkxvcjpVLw_1741863539
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so304235f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 03:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741863538; x=1742468338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8+KGKdJ4EK24n18Z2V3Wf8YYaN68pwFttwmHD5FeXs=;
        b=EiogNx6nBC9Uhq/NbYtYPGJ0cnYUXO5w6V8PtCUarU+shEy/3kYfQnHxSZKLFWjQoH
         8akLt1FU1/cFi7/GnJMhwG5scHj7cc4QldMpUm7mq2dbEKRMIewfJWbOm75kH7XNzzcg
         m9Pz8FL5rno9msZiFiLtIt7WXQk/A0+124u+C++T5S8CpR9ZXf2rEwJVw1JI2YlO1aiM
         k72MRVIMa6PlSFc/MG7Z5IBs0UYBU3Ps95MseGvqfYRIaAYExighWMoNz/bJvqELEmxI
         n441/ZFjCrHGi4IGmDzi4XWndbh//fx9Dj5QNA+nWv4C0kktd9wDwV2D0BfUIMNQxff+
         49Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWmv+CqOJRg4XRaURW+FCos4qnuj8+sQMpebQAKQgvg4qG3J3OnW71Jgh2jBZYg9go/2uFFd8sWFNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHTKuhY5KzM3pkxpbNaxLQEVnbEI4/xRam1cIY45RealFBzimB
	DmkdwPLj2zO78moRIcdzHCYBJ6lRPLpC0PxgKdpLKtiPRJdOOk75MX9Fm44s6frsdfQnmpJth4p
	dvpvHXayd+ExOuCFFg3H/PIJQzg+Kat7lVlBpMWWHpH5K4V+YfoaoTXUMTQ==
X-Gm-Gg: ASbGncsT2oE8T3C5Pc2VioC1POAgDvsc/eq2SIsDPzydz+TL/dpgl19yAUdok7uYL09
	+3MaB1nX7ky+w3l2h27OqlDtgFxqeadGYcYFANrUtQke2mQqpQNGhBXnhfgOcuvKe+atDzmf5EJ
	TqPuz4ZN02cVphX4G6hOCZ/8wmlBFPIm6Js/r6gED97xdK522cI6kRavjw/AvM0vcCqPWKqACWg
	2A0b0g2P4Wh3HoPJtzAfE7MK0soyrbCZ3AaRyKfXLdm44ZFOs0fFm7ELtjoIM4erM2+/XTD8B88
	5tYVJtGSYvjphMLEk7lc3b6I/MeW4/NJgl9RsSYH
X-Received: by 2002:a05:6000:1aca:b0:390:f738:246b with SMTP id ffacd0b85a97d-39132d1cc3fmr19536581f8f.15.1741863538687;
        Thu, 13 Mar 2025 03:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl5a/zzB4j/bQzrh0zOYukq0rCxpL/1iN9vmTUtNgl3blwOPgCRfDtKqTKHkVbblM4clhX9A==
X-Received: by 2002:a05:6000:1aca:b0:390:f738:246b with SMTP id ffacd0b85a97d-39132d1cc3fmr19536568f8f.15.1741863538262;
        Thu, 13 Mar 2025 03:58:58 -0700 (PDT)
Received: from [192.168.88.253] (146-241-6-87.dyn.eolo.it. [146.241.6.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7582absm49566905e9.17.2025.03.13.03.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 03:58:57 -0700 (PDT)
Message-ID: <b62ea2ac-aff3-4a00-bc3a-960c28bc5522@redhat.com>
Date: Thu, 13 Mar 2025 11:58:54 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 8/9] net: check for driver support in netmem
 TX
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux.dev,
 linux-kselftest@vger.kernel.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn
 <willemb@google.com>, David Ahern <dsahern@kernel.org>,
 Neal Cardwell <ncardwell@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me,
 asml.silence@gmail.com, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>,
 Victor Nogueira <victor@mojatatu.com>, Pedro Tammela
 <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
References: <20250308214045.1160445-1-almasrymina@google.com>
 <20250308214045.1160445-9-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250308214045.1160445-9-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/8/25 10:40 PM, Mina Almasry wrote:
> We should not enable netmem TX for drivers that don't declare support.
> 
> Check for driver netmem TX support during devmem TX binding and fail if
> the driver does not have the functionality.
> 
> Check for driver support in validate_xmit_skb as well.
> 
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> ---
> 
> v5: https://lore.kernel.org/netdev/20250227041209.2031104-8-almasrymina@google.com/
> - Check that the dmabuf mappings belongs to the specific device the TX
>   is being sent from (Jakub)
> 
> v4:
> - New patch
> 
> ---
>  net/core/dev.c         | 33 +++++++++++++++++++++++++++++++++
>  net/core/devmem.h      |  6 ++++++
>  net/core/netdev-genl.c |  7 +++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 1cb134ff7327..5553947123a0 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -3868,10 +3868,43 @@ int skb_csum_hwoffload_help(struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL(skb_csum_hwoffload_help);
>  
> +static struct sk_buff *validate_xmit_unreadable_skb(struct sk_buff *skb,
> +						    struct net_device *dev)
> +{
> +	struct skb_shared_info *shinfo;
> +	struct net_iov *niov;
> +
> +	if (likely(skb_frags_readable(skb)))
> +		goto out;
> +
> +	if (likely(!dev->netmem_tx))

Minor nit: I think the above is actually unlikely. The skb is
unreadable: is supposed to be transmitted on a device supporting
netmem_tx, otherwise we are in exceptional/error path.

No need to repost just for this.

Thanks,

Paolo

