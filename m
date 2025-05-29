Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1A02690F9
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 10:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515961; cv=none; b=J8lekyubuwahEIS5LLhu9C1f+zyJFOOI7qQvYtglpfGp6eVH8ONn7sLyKiO8XDhFV3azD6Hr7sRUilMTpH3/1G2pNimwKfy5ER0P67mgIDyJ22Fbp6w6Ek+U+R5sF37pkCILbrm3HoHfhMqEqycrovEYi0v4e0UOoYJwI6X6r3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515961; c=relaxed/simple;
	bh=kBj9PhMFAM+IQupSeDZxxWt0qPV6glwylmFd7BTMlGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNB2QgecDb2Rg8ukeJr2XFoTE63vNBHFf+JhUW6fwNomoBa1hBc0jUjtX8X1cl/51LZxkbT1YaGI2oj+0PsVsFQkiB/jnyrNHuC3fYYHTFoBfuzcsOr+2hCivEtexh4+YkHT7IeM4MuW7fb8psIQzCnZ9Z9E7ySDnn3Q+Y7aPgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/IX6yFQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/IX6yFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748515958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
	b=P/IX6yFQcjgrKQbcu8xkvHQdfQhtgUFHY9sN0cqMN1KlbZ7XP+lBjpuk5b28sjDB9ghWN0
	nvVySOfMZifDLJUwED2CSqRi2P5pqE60gxbfyKHMT54rvheyYJpYLxj1hPBStg36J49YUg
	qeaQqiZ/Aw6mJvPgO4lhSqW/KAipRbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-Z41XWLB_MzqryyfdfSoOXw-1; Thu, 29 May 2025 06:52:37 -0400
X-MC-Unique: Z41XWLB_MzqryyfdfSoOXw-1
X-Mimecast-MFC-AGG-ID: Z41XWLB_MzqryyfdfSoOXw_1748515956
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3561206b3so342765f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 03:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515956; x=1749120756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLkIh8hUpNx+fetBHcv6ts2+oAr71F0OW4FhDVnFMS4=;
        b=gil+9KNbnWScziv08EDpuLZo5iP643te/1fkCe1Uz3yn+Bgt3p5TCpeExCDStwAgMi
         uHedrz8qa2OwgpG1elazNZNyUz3VH6k5Sknyfdcc4FLeTdGKUAfYbW9abCEApDNT7D/u
         ovcpTPJMowNvn40n6kjPc8yAhb7Anb8V3iMAStuneGvMNNruzP5NaO4xBN69j3ORgraP
         K5HRCsBNb+IMimp67rMp7gpdclFv68Frhzbx258C/NDvNI4GcVey2Py9bV/anE6H4DCo
         M6e8y6U/3Cx5oXdeCIyKIhiDWX92MpxEDpNz5Jtv4Sb42qeBhW2gWT7BxTspi8TUMxSC
         KhMg==
X-Forwarded-Encrypted: i=1; AJvYcCXdRWY+12q6kXwx2bjj3cmDqa1M13aew/fbyGdnthugHaDwuiMUgV1ThxnOJbkFYaIPLPampFVwvgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbwz2/VZn+JP7AhQ3OxFFUE+MkK5k9UQFAdZ2svhm1vdWxdrxq
	2Rztkuw05L1fJ7rP87pMoEvX5AFYybPr88BPtgN3Lz2mv8eTf5JyV1rNz686sl4pr5pef+O27L5
	hYayfwfNpyoV6p0lDF6hAjXhBLiz1Fw+nIpqrgY5bHv6EHZFLUWiAjo8MGLrTzw==
X-Gm-Gg: ASbGncvoL50jlY+cecZ0IO6JoaHcipsawJ5WgkIfxzDqbG3VeE0J4RvPLbVPL/E860E
	VzwshYtubozYdowehpM+fnZFyPt5lZ9zfPkiPHFsOmKHFhysntIIIof3uUKPIAzqS7VkFdCtCTt
	8MJZis9NQ2ejdYSkoZnOCyZw8hPTcGjdBqLLqQdAAN7axvR0Og0vr4xxnZrew48q80bkDTua28O
	3Z41+BQmxac9JQcQjKrOoAcjej59sZ5wpSXKlYYtdCltZboYhX/hvbpsEuegLXVpQTU/xF1pGG/
	qNP0KMGd0Lh5D0LEstJPP6G/hzLWRtFdVrwwBJTUG3HkJrngeSbtAfbXdpQ=
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548898f8f.26.1748515956330;
        Thu, 29 May 2025 03:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd5rBzaY1hUfRsYOE+gTC/pugRVRTJ9nUCAUf9lmcPzrrorgZJVoTSNaWXkDhPqzVybmEIrg==
X-Received: by 2002:a05:6000:2905:b0:3a4:cfe3:850f with SMTP id ffacd0b85a97d-3a4cfe3866emr18548873f8f.26.1748515955955;
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eebsm1627199f8f.44.2025.05.29.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:52:35 -0700 (PDT)
Message-ID: <6ae0ad5a-f560-43c5-a581-e4699634b65e@redhat.com>
Date: Thu, 29 May 2025 12:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: wwan: t7xx: Fix napi rx poll issue
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sreehari.kancharla@linux.intel.com, ilpo.jarvinen@linux.intel.com
References: <20250528082827.4654-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250528082827.4654-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/28/25 10:28 AM, Jinjian Song wrote:
> When driver handles the napi rx polling requests, the netdev might
> have been released by the dellink logic triggered by the disconnect
> operation on user plane. However, in the logic of processing skb in
> polling, an invalid netdev is still being used, which causes a panic.
> 
> BUG: kernel NULL pointer dereference, address: 00000000000000f1
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:dev_gro_receive+0x3a/0x620
> [...]
> Call Trace:
>  <IRQ>
>  ? __die_body+0x68/0xb0
>  ? page_fault_oops+0x379/0x3e0
>  ? exc_page_fault+0x4f/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? __pfx_t7xx_ccmni_recv_skb+0x10/0x10 [mtk_t7xx (HASH:1400 7)]
>  ? dev_gro_receive+0x3a/0x620
>  napi_gro_receive+0xad/0x170
>  t7xx_ccmni_recv_skb+0x48/0x70 [mtk_t7xx (HASH:1400 7)]
>  t7xx_dpmaif_napi_rx_poll+0x590/0x800 [mtk_t7xx (HASH:1400 7)]
>  net_rx_action+0x103/0x470
>  irq_exit_rcu+0x13a/0x310
>  sysvec_apic_timer_interrupt+0x56/0x90
>  </IRQ>
> 
> Fixes: 5545b7b9f294 ("net: wwan: t7xx: Add NAPI support")
> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
>  drivers/net/wwan/t7xx/t7xx_netdev.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_netdev.c b/drivers/net/wwan/t7xx/t7xx_netdev.c
> index 91fa082e9cab..48007384c030 100644
> --- a/drivers/net/wwan/t7xx/t7xx_netdev.c
> +++ b/drivers/net/wwan/t7xx/t7xx_netdev.c
> @@ -172,7 +172,7 @@ static void t7xx_ccmni_start(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -192,7 +192,7 @@ static void t7xx_ccmni_pre_stop(struct t7xx_ccmni_ctrl *ctlb)
>  	int i;
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -210,7 +210,7 @@ static void t7xx_ccmni_post_stop(struct t7xx_ccmni_ctrl *ctlb)
>  		t7xx_ccmni_disable_napi(ctlb);
>  
>  	for (i = 0; i < ctlb->nic_dev_num; i++) {
> -		ccmni = ctlb->ccmni_inst[i];
> +		ccmni = READ_ONCE(ctlb->ccmni_inst[i]);
>  		if (!ccmni)
>  			continue;
>  
> @@ -302,7 +302,7 @@ static int t7xx_ccmni_wwan_newlink(void *ctxt, struct net_device *dev, u32 if_id
>  	ccmni->ctlb = ctlb;
>  	ccmni->dev = dev;
>  	atomic_set(&ccmni->usage, 0);
> -	ctlb->ccmni_inst[if_id] = ccmni;
> +	WRITE_ONCE(ctlb->ccmni_inst[if_id], ccmni);
>  
>  	ret = register_netdevice(dev);
>  	if (ret)
> @@ -321,9 +321,10 @@ static void t7xx_ccmni_wwan_dellink(void *ctxt, struct net_device *dev, struct l
>  	if (if_id >= ARRAY_SIZE(ctlb->ccmni_inst))
>  		return;
>  
> -	if (WARN_ON(ctlb->ccmni_inst[if_id] != ccmni))
> +	if (WARN_ON(READ_ONCE(ctlb->ccmni_inst[if_id]) != ccmni))

READ_ONCE is only needed when the the lock protecting ctlb->ccmni_inst
is not held. It's not needed here, and likely in pre/post stop operations.

/P

