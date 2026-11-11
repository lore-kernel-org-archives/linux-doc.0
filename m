Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433556;
	b=Sny4N6PxyFhzDgp1c3HYogUAAj5nyMbcupi4acaVAzvZn5IixxYJKeTQqA9+WJU1l4en
	 /120m3WH5A7idBny1ujyvvRptLDIZ1VxxE+XgVHcuDLBstEGaMvY/C/3h6iqR1WuEtOLv
	 wUM6+oYKuL40vV05EiUOo36X76vCyP8ujJXjnapfGfCFOMt3hMHI1ALqOAPVmoP4qMRL9
	 JZbDj9bkMhW7XW6s+LxRymD6ehGynW6Sp7ku2gWF0nT2ii2QJZZOFzOFhz9CtSGPW0lqR
	 qfE3lfCiWn1sRAGbpC6o8chUvkPEI2PhJxXWg0lhkFG/M/+L2v4CK8GHLfAskXbPHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
	b=ePDJPlw4SpgwIaCUnf3c+8QDJWTXxK1ZfP3mg2j2K0i9U/j26ByVaCtKV+UpaF4YqBIb
	 RVkmDfrTZFNU8mORdAQXtTYPBazJ/MaxYO0qMojA1hP4b4y/JgCkVCLMx+U0tQwAb1dc3
	 XHviE9WzKDjdO5lMuzmfjBGq/3tHPvcbhv4kQeJGAdnEK+v8Vdv6lA0wfLSTlJuW3Xqya
	 aeGSB2E9GNbeyo6fetkZAvTOhPi0P0BgrQWzDItY8YfxvZWVk5A+tYoF3uPy7IOZ73Upb
	 LXYFUy+jy7pwAf/526xS6as7iqeUlQZq9OGE4vRccI3UlgbkAnE+r6m3DsoImbAjYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzcueSLe;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F98A606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F98A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qzcueSLe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6509855eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433555; x=1795038355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=qzcueSLeYHggSiVgoRPHkJmtg48KhggoXZvHTshSi1L66DeqB5dkQMxdb8ooCa0mq0
         jWTCW3kgrMzvjtVYFkYBTAJxhvAdPcf8EJMp+QiSEL/+GZxejjjbxA1CzyfRh6Iy8syw
         FlHWKGYs2pNU1jWivP6JyUS3dRIRLSWhSXdnn+eJMMOJF0eA/+TN+Bm35ULvgquVr3G+
         LC51WQgCRIyKV//acQjsePs5P5t9C0dlTdu8IHdUWWJeOJ1BAdcR42TvYyaUAptbDNG0
         t9WgMJsIJwQX5VyDrB4yfKmH22ryypscL0FH9jlVJGw/jbFqTd1K0Wepxif4VEIIWCOz
         in6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433555; x=1795038355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=yF7pHlxiUQwRycJk2nCDNYnduD4oVFZ76O2SmewgLi2qFqzmGB6OsGkbetu97LB0St
         b+KGOcgS3NiBwtl7izypofdofb2elaTfiGoD+e2Uu7k+sq6HNDWcv2lSopO6yDWEO9ou
         vOiwfLDIZrzmUxgah2g9vy4bzhHCgy1vcY+BxRtV5npAoUAPaFUeCZ//fDqVWSxgcXry
         v/cIJLaJD/aqHbX0FjjpE6B26OqdgUyhR+Z4ibOy1U5D2Vltb9ONPDldhY8RJ27qgCsk
         ZVms+CIMYYKL5ZkUkePfkfZn9qiP4588a812nt6dWFlMeJv79VhyQR3fSe+Qgfs8xiyH
         G2hw==
X-Forwarded-Encrypted: i=1; AL+hErEtVfrizc3Y2vSWMWQfMASlCErclzlGqozJShfJIWkvmizsYo82y3KYT7uvxC2E9s/xTZmHBu6nzw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z90EFmCZblFikCBAd/7eRGhy0WHFHBkt9mkns0NLqk9Cadn9Vqn
	HPBHsCpmsaNecmG4rOcrWhjkk1jiH4YyBTiczSpORNZZnXyzPOqvxRxF
X-Gm-Gg: AYBFou0ertMrl3gPltnHLSjMG+7NCJPMjMXPDDu8cMSWDAJFiIDGnY73r230GF2XZH9
	QgJo9yJKb0weqP+PRv4HlaBFIiFymYBxDGvji1LsW0CqJQhaxqO6NyavZCYNSB0J0iEJJQsyh3H
	3q5mGTlew2G+FkrlS69AouZSBQHPWK3XmsaOOxaqEWEQlddMR37yFA8EDZEhP+Y+yDZKaGgzcey
	5QkeQCO9U744TwUBuzQZJ0oX0Io1eHZrZ2ypvYm+TYqbJw/aC4oWQ8A01St6GBcFjzmNJeZmhFh
	KOgEoUyyrYxREc2ivjR29qV4YGKrJ4zW0OheUoezgASmuEpFwfVj7eUUXlRZtId7m0/sj64D1Hp
	9f5ZUOipDt105dL7WlGm58AQUvo8W+EDVHa0oBAKagqyAPDJsxOvAW91L+nWcLMOU6IPiyNR+j7
	B8uT258IEEpPG68GFnbCAIZPXpC5NYNoEAm4s7+0RzYgekVwdmzcP1sqcQqKTebb/jnxyT/H2ez
	qsT5qSq8QceHELhYXQBVCvdaKFWoxiQowVI4DwLcU3WIAHUProvP36k1n0RZSTTg7jTUcOkOpAE
	ZnVCf35WnUugFJxcH5hHgFYO/g6RlWdiwIGhbzsjXhMTTnvY+rGNNdfBaRv7KkDlqZU+8epXBhQ
	GlosrDn7U5a8T5/kcf4Vq5YvEvDDCWww+VCZhFw==
X-Received: by 2002:a05:7301:3f19:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-37686d31fa8mr5532433eec.31.1794433554164;
        Wed, 11 Nov 2026 13:45:54 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::6:1f95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm38006432eec.23.2026.11.11.13.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:45:53 -0800 (PST)
Message-ID: <f9979d3b-2a6a-4fa4-ad4d-10e5d4958678@gmail.com>
Date: Wed, 11 Nov 2026 13:45:51 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 10/11] eth: fbnic: Support RX buffers it
 cannot split
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>,
 kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, io-uring@vger.kernel.org,
 Mina Almasry <almasrymina@google.com>
Cc: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
 Weiming Shi <bestswngs@gmail.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-11-bjorn@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261110102039.1002605-11-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/26 2:20 AM, Björn Töpel wrote:
> fbnic packs several headers, and several payloads, into one page. A
> provider without MP_CAP_FRAG needs one descriptor per buffer. Give
> such a buffer a single reference, program the queue so each header and
> payload takes a buffer of its own, and drop packets that break this.
> 
> Header split is now set per queue, so link up changes only the drop
> mode.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 119 ++++++++++++++++---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.h |   2 +
>  2 files changed, 102 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index bfaa284e497e..d96c957d6fba 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -761,8 +761,14 @@ static void fbnic_page_pool_init(struct fbnic_ring *ring, unsigned int idx,
>  {
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  
> -	page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> -	rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	/* A whole buffer has one reference. The packet takes it, so the buffer
> +	 * may be reused before its BDQ entry is cleaned.
> +	 */
> +	rx_buf->pagecnt_bias = 1;
> +	if (page_pool_supports_frag(ring->page_pool)) {
> +		page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> +		rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	}
>  	rx_buf->netmem = netmem;
>  }
>  
> @@ -792,7 +798,8 @@ static void fbnic_page_pool_drain(struct fbnic_ring *ring, unsigned int idx,
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  	netmem_ref netmem = rx_buf->netmem;
>  
> -	if (!page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
> +	if (rx_buf->pagecnt_bias &&
> +	    !page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
>  		page_pool_put_unrefed_netmem(ring->page_pool, netmem, -1,
>  					     !!budget);
>  
> @@ -993,6 +1000,19 @@ static unsigned int fbnic_hdr_pg_end(unsigned int pg_off, unsigned int len)
>  	return ALIGN(pg_off, 128) - FBNIC_RX_HROOM;
>  }
>  
> +/* A buffer that cannot be split has one reference and takes one descriptor */
> +static bool fbnic_bd_one_desc(struct fbnic_napi_vector *nv,
> +			      const struct fbnic_ring *bdq, unsigned int idx,
> +			      bool ok)
> +{
> +	if (likely(page_pool_supports_frag(bdq->page_pool) ||
> +		   (bdq->rx_buf[idx].pagecnt_bias == 1 && ok)))
> +		return true;
> +
> +	netdev_err_once(nv->napi.dev, "Bad descriptor for a whole RX buffer\n");
> +	return false;
> +}
> +
>  static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			      struct fbnic_pkt_buff *pkt,
>  			      struct fbnic_q_triad *qt)
> @@ -1007,6 +1027,17 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  	/* data_hard_start should always be NULL when this is called */
>  	WARN_ON_ONCE(pkt->buff.data_hard_start);
>  
> +	/* MAX_HDR leaves no room for a second header in a whole buffer, so
> +	 * the device closes it, with PAGE_FIN, after the first.
> +	 */
> +	pkt->add_frag_failed = false;
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub0, hdr_pg_idx,
> +					FIELD_GET(FBNIC_RCD_AL_PAGE_FIN,
> +						  rcd)))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_head(qt, hdr_pg_idx);
>  	pkt->head = netmem;
>  
> @@ -1032,7 +1063,6 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			 len - FBNIC_RX_PAD, true);
>  
>  	pkt->hwtstamp = 0;
> -	pkt->add_frag_failed = false;
>  }
>  
>  static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
> @@ -1046,8 +1076,20 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
>  	netmem_ref netmem;
>  	bool added;
>  
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub1, pg_idx, !pg_off))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_data(qt, pg_idx);
>  
> +	/* Without a header buffer, the packet is dropped. */
> +	if (unlikely(!pkt->buff.data_hard_start)) {
> +		page_pool_put_full_netmem(qt->sub1.page_pool, netmem, true);
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +

How would we get in this state? Does the device need to misbehave and skip
the header descriptor?

