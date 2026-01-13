Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E538A729
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 10:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299609; cv=none; b=EJY6rn3K5cM7KMnPpm0Ifpkzl2kfky2X4XN0ZTBNwpkoruPreuj+XFvI/PS12AhHbbT6nby7a9oUuSauV2OKUr92QpXbU0R4nCLO4CPyXkymGvkTA36yei98nSEIFCsfTODhJoJtGW0DhX9vA/VL8xq+/k44Zoew6BpVIjA8+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299609; c=relaxed/simple;
	bh=qrJawEyRk9QiRfi3F12wRwzElwNErv3g2l29eOs+r0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oy4VlqN66cou6F9Yo5wlmLd0law7LyjnmDKq1XQo6omsc+zMb2d8vXgAYZFi5nNyMtDTT59RbBfjH8ylqGe8XJXaGJOOCEU+Eo65AXLoAARrcEBGWNabPhoFcX38jB4oj2fp7Tjy5UTHA0sygH9H0SxcM1s87MjssLXAcsQ4AfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIcheGNe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ooiqeq4C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIcheGNe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ooiqeq4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768299605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bv1RPjaO9ZdZred2Z39o/pHiVJywyFuAbsRMKmfexlM=;
	b=HIcheGNe7k18hNS9kZhjl0ulo7Wm+W1t8ShqjQcofzTqFPNU4fuW/S3YXicuWwSiFqcwLr
	uGcyI+GcR9J8Y6SuUbE8ZoOJUbIObs2bkpN/QI4nAB3TmTRR2uOqmsdfMLddIT95+rcA95
	NkxLc9al15W+MOLub7mvhPOXcjXbh44=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-NwgJmM4NObim8pZKZKh-gw-1; Tue, 13 Jan 2026 05:20:04 -0500
X-MC-Unique: NwgJmM4NObim8pZKZKh-gw-1
X-Mimecast-MFC-AGG-ID: NwgJmM4NObim8pZKZKh-gw_1768299603
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-432db1a9589so1708633f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768299603; x=1768904403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bv1RPjaO9ZdZred2Z39o/pHiVJywyFuAbsRMKmfexlM=;
        b=Ooiqeq4CDJAdeztIVeP08RIjonIFbu0Ix1QSuGAGLnpXxoa1G3zjRACEzvO2cO3ng5
         K2zLp5murkupoMQjsTkt9xyL+bugptxPbtuaxL0PmUm2MeHLsh6JpmYCJcD6ViHvQH8v
         P3Xjf6FBz8ZsWfwg3RlydqvAFLgF734ZChGJX/Rxjup6E0lD0YazXep9YNEvw+gEXxhB
         y0PYSiW7q1diBoV5bcyaw+WPI0/VuMzlg9av8Bske1sOljgBO+qV2wTVqNaE7l0+wop6
         BIE3XlsWPy2wCq73FGqRfy/zu5PLxZ441tO03GqAILwUpvnuVJdr777gVgEP+SxqdJ3w
         xkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299603; x=1768904403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv1RPjaO9ZdZred2Z39o/pHiVJywyFuAbsRMKmfexlM=;
        b=pzW9GqW2a4JBm9ILUTWVn4mAuXM9Xn1KxFWfx/fa9arLUR9sbN0POZZ9aXrgirC4Ye
         /RxY6ZwBseEqXi5OG1yj624vNIMNyhsEcZFzZWK548YQmyJ7w54cUFlfpmmQ0KpvlFJm
         XiL0Uu74sxwMC6Mdxe6b7S35gPVKgM8JxQflr7pYgyDWMSBiMmHY9qIs2DPtlElaXJwF
         gtvkvaLiNMBibS4iyac47TgqE+f7/WtKWtb8RsH6Xo09Ri/PMGAu9et2zxWH48vIZleD
         F9wcQeaGWZJRby/YvhSOcRQyWaSM43UzxjnRTq9z98YZD64pd4Q4rCS0WBqWxWwvWQGm
         zJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVkjVZGIJiD1h3RfnjKWPXLioOxaSXxH7hDnDMm7IdnqWTB5I8lvqSJwQVbfcBYBmwsBQhdFFmtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMto3k/dXAvYW18blIJGZpDyW3FAlW+l14DBExvtSgyLnvhHE
	hWqDpnAfO9ksBPskwzN0of6tWhmzTUAb38fr4eCLFafqwu1nlAwn8G6gK1Zp3ZmDZDDYFRPOZic
	UAG6ju/NB/UsbDE9YDu7qRVdtB+n3G9wuZAlbUINinvF5GRsF3sJ4TGjVFipiQw==
X-Gm-Gg: AY/fxX5JBY5YMa86sdSpnE3bZzR3U52LxU8AqQOfxWGUmRhjvKv8tFiaHDVO91ZpFlg
	M8xLMSfbma9eHH3gMY3nlb5o/IAaPVGRlZiIxJqUhf86Ra5R/JhyrEMra586KAYGqUB8TKNqczy
	btql+gQ7Cliv5NGzXp7SHVDm1meXg8jBbVvFYKtelva2VyHeXrXprLibPAnvYqc5arZOgxJrIDu
	C7amOBDM1z8jUF4ib+bCWA1UD7gxSpTbus3LcX08pxH3f/N6pENCYvuptqp1d9krJ0s4keOUJPc
	x/VmI0I3kKv0inx/vCMf7XR+w2b+4AcerG0l4ULFIOWgjk0oRmBH601YddvOAha9GgB+qKv9F6E
	OtUuxyThJBHG1
X-Received: by 2002:a05:6000:184d:b0:431:35a:4a97 with SMTP id ffacd0b85a97d-432c37c3600mr21248021f8f.59.1768299603301;
        Tue, 13 Jan 2026 02:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrath3hRlhdo9WrSLU/1jbO11BPh+MoIv4sHPe4d/wYiA0ReRHh6C563cNyJeTG7EVpok72g==
X-Received: by 2002:a05:6000:184d:b0:431:35a:4a97 with SMTP id ffacd0b85a97d-432c37c3600mr21247977f8f.59.1768299602857;
        Tue, 13 Jan 2026 02:20:02 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df96asm42541852f8f.28.2026.01.13.02.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:20:02 -0800 (PST)
Message-ID: <017b07c8-ed86-4ed1-9793-c150ded68097@redhat.com>
Date: Tue, 13 Jan 2026 11:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 5/9] eth: bnxt: store rx buffer size per queue
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Joshua Washington <joshwash@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Alexander Duyck <alexanderduyck@fb.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Shuah Khan
 <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>,
 Ankit Garg <nktgrg@google.com>, Tim Hostetler <thostet@google.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>, Ziwei Xiao <ziweixiao@google.com>,
 John Fraker <jfraker@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Mohsin Bashir <mohsin.bashr@gmail.com>, Joe Damato <joe@dama.to>,
 Mina Almasry <almasrymina@google.com>,
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Kuniyuki Iwashima <kuniyu@google.com>,
 Samiullah Khawaja <skhawaja@google.com>, Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, David Wei
 <dw@davidwei.uk>, Yue Haibing <yuehaibing@huawei.com>,
 Haiyue Wang <haiyuewa@163.com>, Jens Axboe <axboe@kernel.dk>,
 Simon Horman <horms@kernel.org>, Vishwanath Seshagiri <vishs@fb.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kselftest@vger.kernel.org, dtatulea@nvidia.com,
 io-uring@vger.kernel.org
References: <cover.1767819709.git.asml.silence@gmail.com>
 <e01023029e10a8ff72b5d85cb15e7863b3613ff4.1767819709.git.asml.silence@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <e01023029e10a8ff72b5d85cb15e7863b3613ff4.1767819709.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/26 12:28 PM, Pavel Begunkov wrote:
> @@ -4478,7 +4485,7 @@ static void bnxt_init_one_rx_agg_ring_rxbd(struct bnxt *bp,
>  	ring = &rxr->rx_agg_ring_struct;
>  	ring->fw_ring_id = INVALID_HW_RING_ID;
>  	if ((bp->flags & BNXT_FLAG_AGG_RINGS)) {
> -		type = ((u32)BNXT_RX_PAGE_SIZE << RX_BD_LEN_SHIFT) |
> +		type = ((u32)(u32)rxr->rx_page_size << RX_BD_LEN_SHIFT) |

Minor nit: duplicate cast above.

> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> index f5f07a7e6b29..4c880a9fba92 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
> @@ -1107,6 +1107,7 @@ struct bnxt_rx_ring_info {
>  
>  	unsigned long		*rx_agg_bmap;
>  	u16			rx_agg_bmap_size;
> +	u16			rx_page_size;

Any special reason for using u16 above? AFAICS using u32 will not change
the struct size on 64 bit arches, and using u32 will likely yield better
code.

/P

