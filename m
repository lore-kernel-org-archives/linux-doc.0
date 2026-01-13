Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0634575A
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300981; cv=none; b=Dg/esetvKKKaya8m7c7EWawRWCoVgKrCgMfcD9dZ4UlWjT5u+wMTF9Ar9V4eZgLM3d6nwDtY5BJQBLDoLH7zcEXe7avxr7e7FH7ocHELLrOLFElHu6Eme8JdG5NeQtCTPMZIla5HuJHmAvZLeVnGOz4l2BDmokkdqDPrww1cAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300981; c=relaxed/simple;
	bh=h/iEAdqPaIY6WKNvkMpng0b6z40syJH+JgYaAQOu/Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sodAjAgcW/5jNbju9koZ5VMr5YALNIoklABMZxsqPxYd7gV0OFSieQ4zf2ncal5YbFPSLRgIXk1cM4nJuq3oJIAtNTq9CmSGf734W4FxIsA3Uv/BRC/pt2UpTSm8cfeR2S0R++vFMwtA4ryYGjXOMnnil7gunC7/GnxwaYfwFkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbGTUi6x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbGTUi6x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso43365505e9.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 02:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300978; x=1768905778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkhtI/R2xS3vmnHvCQqFwCBZTI8re8hBml5kcRz0zBY=;
        b=dbGTUi6xuFCFDtZvChjPqVXFIpJBzcboY/+8bIt8Mpg5BT5HXHdalGDlR1fHJCL1dF
         wdff2CYW56pIKesR4Csgy3hQtn99aNLr+w92OSyWKhyzmYCA7BTuo35KlGTKeAZgutZt
         qXtVmXGOSdZYbkZmC7HGOVJN8ovdNPpEdQPbLk8+OHZoXxWrq+rvgEn45clEh+thX3T8
         s0YXJChrVfPpnJ0GzFEuNa8G3f4SgakkPrTrv+7FgKytR+l+zr5RdgSdBW/vFaDVtNBl
         bfm7UB5ubRZECmu/fSdk5EkGS/ALXQNiBioDJaRvVRIfFmJEIsvC1g8NICR2plnfbOYH
         nCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300978; x=1768905778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkhtI/R2xS3vmnHvCQqFwCBZTI8re8hBml5kcRz0zBY=;
        b=HA1YXBrjXe2WmW6sLIC8S6LHcZPaXFJK0uWFc8v3faJ1tV2xwd+Lq9QwTvhnxg0U8n
         qnEj2DKoPxb9JhyqEpV1Cq474XFIHWIK+skEDHRN6lOaMgUOveZER8raipZLmKdX1Pki
         +XcPXvowT22wtDxznkEWZ6FQbtPjeOoZJMTL9xtKq/FIay4lsq5pmLwOBc+0Z3sh0cwy
         sltEcysKAcUwgrsijg7k5ha//zP8RYl09VjjquL3v7zO0lWtS41edSvvNRXgs/+Ca60T
         0CJoQ6Y2Z1uFzmcWu8di8IBmS2lAKWTqrLlsswN2K5Wseecs/SZ33nxnVE8BrNgnPmnh
         DqdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxoaKuh5fwH6tTFQQARffx0wbcSHuU7RT/rlUdLyYP4l+uKKygaEt22fFSxzY9XVyhdCb6YRkaRhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySCOnjccQ07Y+g/xYPaOx/+A6bTsu+0Rk6LcBRcwp4NwGpTmvE
	Wyxh/SfpLRCD9mfRER/4MDpuk113ws28gEty4oVwSIF148FgFLA5cnrm
X-Gm-Gg: AY/fxX5wIamOXb64RVdj/8kaAdepsfzXIstW1lmNBokT+FZwwzpbKabtaHS+IJzFT+/
	bRqqdQXnyBhx2KXU2UdBJiEbxy2yxPKHeYUiUb9Bvwsa6Vut8TRozNA79k5jM2e8dYxkhpQ3ztE
	otdWHh5VZePLDicPvbEbQ1bfiACf7YHOsVB6+zziJn/atqcacA19ehdK7RzI97FONs7/lNTyqtc
	IIOwt6XU65Yp9tsa1KJC+agqP2mg/AFPmflCnExLVvJF/1I7mXlX4+uMds7QnM4EQY8X/C7ia0Q
	7V8O4vH7dEgP/hUALAYzveB05VhxfMceca/pgj59ubaxQU4J5EyQjn47Sanb7y/nJLTT/D/zPDt
	7EnTpFEqBFEwlGBVrrsngq01Drh73MyeOZuBDmCcFHbTsm0WnIDJMvMOtVMDqql88eAh6hKzdND
	08WYUeGDiB/LPkJe0pnTNAAypPfb9iUimV8Jfdvv7aA8wYlxHs3hhX9xwYyoPkOZfT0IoF92Q7n
	gacXUYdl4y3Qhg5dvyqT2Hv45uqq46O6wK8GQR93IPEufiCwbEpmnhFYYXv1EPnBekjpnBIxqu2
X-Google-Smtp-Source: AGHT+IFkZdiJcndAA0MyUMm8x2SeND7c9WKpL4+wjJVZyc9wRUscpxmE8qJsJDcPKd4tkE4BoGQKUg==
X-Received: by 2002:a05:600c:3555:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-47d84b3b5dfmr248265925e9.19.1768300977891;
        Tue, 13 Jan 2026 02:42:57 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed9ea45cesm13306085e9.1.2026.01.13.02.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 02:42:57 -0800 (PST)
Message-ID: <52b4ac3d-7634-4545-af11-e25b589db700@gmail.com>
Date: Tue, 13 Jan 2026 10:42:52 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 6/9] eth: bnxt: adjust the fill level of agg
 queues with larger buffers
To: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
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
 <8b6486d8a498875c4157f28171b5b0d26593c3d8.1767819709.git.asml.silence@gmail.com>
 <4db44c27-4654-46f9-be41-93bcf06302b2@redhat.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <4db44c27-4654-46f9-be41-93bcf06302b2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 10:27, Paolo Abeni wrote:
> On 1/9/26 12:28 PM, Pavel Begunkov wrote:
>> From: Jakub Kicinski <kuba@kernel.org>
>>
>> The driver tries to provision more agg buffers than header buffers
>> since multiple agg segments can reuse the same header. The calculation
>> / heuristic tries to provide enough pages for 65k of data for each header
>> (or 4 frags per header if the result is too big). This calculation is
>> currently global to the adapter. If we increase the buffer sizes 8x
>> we don't want 8x the amount of memory sitting on the rings.
>> Luckily we don't have to fill the rings completely, adjust
>> the fill level dynamically in case particular queue has buffers
>> larger than the global size.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> [pavel: rebase on top of agg_size_fac, assert agg_size_fac]
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
>> ---
>>   drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 +++++++++++++++++++----
>>   1 file changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> index 8f42885a7c86..137e348d2b9c 100644
>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> @@ -3816,16 +3816,34 @@ static void bnxt_free_rx_rings(struct bnxt *bp)
>>   	}
>>   }
>>   
>> +static int bnxt_rx_agg_ring_fill_level(struct bnxt *bp,
>> +				       struct bnxt_rx_ring_info *rxr)
>> +{
>> +	/* User may have chosen larger than default rx_page_size,
>> +	 * we keep the ring sizes uniform and also want uniform amount
>> +	 * of bytes consumed per ring, so cap how much of the rings we fill.
>> +	 */
>> +	int fill_level = bp->rx_agg_ring_size;
>> +
>> +	if (rxr->rx_page_size > BNXT_RX_PAGE_SIZE)
>> +		fill_level /= rxr->rx_page_size / BNXT_RX_PAGE_SIZE;
> 
> According to the check in bnxt_alloc_rx_page_pool() it's theoretically
> possible for `rxr->rx_page_size / BNXT_RX_PAGE_SIZE` being zero. If so
> the above would crash.
> 
> Side note: this looks like something AI review could/should catch. The
> fact it didn't makes me think I'm missing something...

I doubt LLMs will be able to see it, but rx_page_size is no less
than BNXT_RX_PAGE_SIZE. It's either set from defaults, which is
exactly BNXT_RX_PAGE_SIZE, or given by the provider and then
checked in bnxt_validate_qcfg().

-- 
Pavel Begunkov

