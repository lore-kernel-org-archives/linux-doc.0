Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBE20550A
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287384; cv=none; b=d8zHglcl4Vr++/i/fFWqPDNbClde6HzsT4SrUsknkWPUVhyYUxBQnpe7ePs2/iRYdK1AvzdxQUbMn0iWRz4VwR7TSlcWSBsbaIZMZ01BhlaDNfNHgkp9BivE3MJ0Lsq3UMux3I9qi58azwBUn//81JSCdiM9TbHXgKqJhqfS+Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287384; c=relaxed/simple;
	bh=aVuqaNznx/5mZdLJC0vjrOwYEAxdll74BF6plXLxd1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKgZ6DeHj8AVesSCoQEZbEUDA5cwmFnQ81Ps5V8jloEAGBWVtwUZ2+cavMi7rKb1eoJ0DUmfM+nIZ2VTk3B+sIge64wO5ojaPMx1Ff9HKVe31q7lab/0dBQy3V+CXZ05G5th5054C9QRFyezJixNFWZW0uuzoXF7clFHq64YSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMNT58b7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMNT58b7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742287382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+9EOSMwZ0yperbosZq+EsQ8tvp7eSF9vKmD44NR3ec=;
	b=VMNT58b7yHnM4jOlFmCMFP2r5ETJsIrMtDA1DE8zI8iBBKi1uZzFyfJxpXfTeRr/LZKJj/
	ruszcL3BhdQjCrZnQWC5h0v/qjw2D675yy/B6ut2q7qIamVBPPewK1bWuIUixUZcRKtF5u
	vGBL65zEdU00kd1J42sggksn/Kft2n0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-Hrz45zFTO5C0bL_Skgin2A-1; Tue, 18 Mar 2025 04:42:58 -0400
X-MC-Unique: Hrz45zFTO5C0bL_Skgin2A-1
X-Mimecast-MFC-AGG-ID: Hrz45zFTO5C0bL_Skgin2A_1742287377
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so16095675e9.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 01:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287377; x=1742892177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+9EOSMwZ0yperbosZq+EsQ8tvp7eSF9vKmD44NR3ec=;
        b=OwTFoQ3/VyD+U4wOsxaI2B+g4vB9nM6wwBBJJRwC77pBswzFbiudTCR0Wc3HJIAZRp
         9CEg8+FOR4McYyxHi8I/2t3AkLyyUGPDCC6WIN/hBf/5zE95McrWtjVAypzMn7chejTW
         aVc3Hr9pIAuq2cVuuxgOUeShFqRCDbumLl21M4eB6Jc1kB/KxHmbTQK6aWuqBA/6MRsL
         oLKsMZZ0SG0jSoKrd2f7yKJNDJxU9JHG8flDUOwFJXmE0YP4RLtKm8GNeMOUJtpWlu/x
         pqNwRAf5Rm55mr7EDHi7jR60nXP8qOoPGPESj4XswRdCmRXtD1e+GjOeHDv77mRMF+Zl
         adMA==
X-Forwarded-Encrypted: i=1; AJvYcCV4Oa7tnIMkcxqdEltPEQw0UzKfebz+0csPUTW6bGQ5idYHpPEaT4CrZQ3+52M57NUdanSuSgMiM0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxN3Ict6gUzTgrcQfwV3kODF1FPly2Qrvd5x/fOAWzfo3ZLrqr
	uVBX7trzzWO9lRbcb/3mCeSrWYIRu3jO9I+PHLcVPB009U19TudDz/eoSJdEpu0iMqA21WC+CYN
	d5/jZ7ePHv33VhVYxTm4u6dQ1JdW7ulbK4pSbyM/2IBk6DLT2CddSH92oAg==
X-Gm-Gg: ASbGnctrNZEElI9I7suJoSbbMrH4zC0u8tBM4POeOReuv2SLjC4mcezNIst0do8B/1z
	2/v2sp0EBUyIQy+ZgBA3IBbTcU27+rwM8V/pmdmggrNmlHiPuNE2WM6JIR26+g/fkAdr7rt3jt3
	UcsMgVcRodXfxs+HkNMbgcVM2Kqa5Ky6H35oK3F0AOuaW2GOFSXZklEVCSGgjbzmepIbMKvmxgY
	TgXUokRxVl5nWEISB91rOpWCM32DEsWpprfB1RJEseVMhR9SgDUcYN12GWQkzbSQWgg5T7Ac41z
	ksaWrcI+mOq/R7ckDEtJM/48Om8vLR1ERYEok2lFro/Lhg==
X-Received: by 2002:a05:600c:1d84:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d3b9d2769mr10024225e9.23.1742287376843;
        Tue, 18 Mar 2025 01:42:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHILQIoNqyHItwOTFUtVNmBDSJea3jYt34PUTdt08Ok/vxBredo4KmYrx3e6SVCEbItbB4gdw==
X-Received: by 2002:a05:600c:1d84:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d3b9d2769mr10023915e9.23.1742287376480;
        Tue, 18 Mar 2025 01:42:56 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62ccsm128436605e9.7.2025.03.18.01.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 01:42:55 -0700 (PDT)
Message-ID: <cb9294c1-1d3c-4fe0-bf84-63a2fed1e96e@redhat.com>
Date: Tue, 18 Mar 2025 09:42:53 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 6/9] net: enable driver support for netmem TX
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
 <20250308214045.1160445-7-almasrymina@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250308214045.1160445-7-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/8/25 10:40 PM, Mina Almasry wrote:
> diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
> index 6327e689e8a8..8c0334851b45 100644
> --- a/Documentation/networking/net_cachelines/net_device.rst
> +++ b/Documentation/networking/net_cachelines/net_device.rst
> @@ -10,6 +10,7 @@ Type                                Name                        fastpath_tx_acce
>  =================================== =========================== =================== =================== ===================================================================================
>  unsigned_long:32                    priv_flags                  read_mostly                             __dev_queue_xmit(tx)
>  unsigned_long:1                     lltx                        read_mostly                             HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
> +unsigned long:1			    netmem_tx:1;	        read_mostly

Minor nit, but since a rebase is needed... pleas use only spaces to
indent/align the above fields.

Thanks!

Paolo

