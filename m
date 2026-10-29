Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275779;
	b=QOG79p0yWkxslX0neA2/6haRL4DC/PxNmqzExFozQbe2LQs1zXIQxST65wExydCQF8FB
	 zX270Xl1rR0FuZdKzT4jSEkHm3OieLzJM1xau5QGLdeHGtdYCL22wzEoOZ2zY4MXy8AHN
	 LqNCuOP2E8yGLHgYNFFH4HNwsE8n7YSb1n1o4beGS+453UaPg8v0pCbhpwMvop+zLsZKr
	 9ak33FS3wUtxJpqkn/Yv+SmbFvmRJ2JW4Hu1hV0AJ90W+0yjHWWUru0C1V4tWvA+28Rrb
	 ri8yW5F20hGcDcUzG7gImW+dtuPxYXZTu0OEyD7yT8vFOAHQV50JQlAW+YA85AZ7Umg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275779;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/MiKP9fyeCAaFA13wlpLP5Q9RvZIGZFi3hjz454dnr8=;
	b=USzeKTiCoOb290lQwexUOdUPUfGNSEZgtFum0xDA3Qnx7QGIVeGOKSNqLaFzxL97ZLb0
	 sVBRUWg6mdjyiaDw9we2He3KmYn9PLsvUAYntquxCQBnwhS2Gun4oIzCRhgpMxhz+0gHn
	 FvVgARYcqffJmlgCosOHnuNaU3CBRNUjT8vwf67/yDEtt8SqFsVI0/7YVpGPpq1U7nn5g
	 N5Let+oFMSY97oDLg3/QajoFTdOGGhFX6qDnuUjIhZcnv2cjeHixAzffcXRKppmUClPO8
	 Rme94NxDCYbcqgABMqZtSIYXZaJCA+FJ6VTncubnaWeJ0yNEEbG+uYyKh93DGUf7+cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N5jlBlxs;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzPi2lyC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D255606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D255606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N5jlBlxs;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzPi2lyC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793275777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/MiKP9fyeCAaFA13wlpLP5Q9RvZIGZFi3hjz454dnr8=;
	b=N5jlBlxsn3C3dntKNHpktZZKy1nTyLpmBQFr86ZjVjlv747jjjcUfYtPLFWAdv6xK2vshv
	vy73OY0g34JjSfrGH1keHmWvdX8wucFSGLwmbNBjZ0uKQYcPCKztksEt6VN9qgfzemiR9V
	ZCffb2S5VX7HS5/SqWfNMvgvfscsCIo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-bxPhiuIiPD6xgGW3_wS_IQ-1; Thu, 29 Oct 2026 08:09:36 -0400
X-MC-Unique: bxPhiuIiPD6xgGW3_wS_IQ-1
X-Mimecast-MFC-AGG-ID: bxPhiuIiPD6xgGW3_wS_IQ_1793275775
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so14437955e9.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793275775; x=1793880575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MiKP9fyeCAaFA13wlpLP5Q9RvZIGZFi3hjz454dnr8=;
        b=VzPi2lyC1gDfVNKIkL7/03RCEGjlS0zUU4zgmxAT61ShYkZ5/2DEQsTNv/1NEasox5
         zUYkHqFQywwQ0EhHsL81xDuCjpl8qrL6e//KxpvtQntsZ4xbIVBSqcAnXSFgOMCDH5zr
         tJ2y+PE9r57UwoNu/REswSMMlYFxNoCyjwCuG5oQEIWQrZbx+s6ekFA4OcXbaXibI/Ue
         7gW7A6FvPknaWZr9T+9TfySlxRjIeUaC6ddat8s3CT4hHc2gP07thYUhsEzBJT/OzklO
         5WWKzbmzzLn7a5KpMFAJiP0A9l99v+9goTAti2UWtI5oqS/loKs5Cr9BDYdaE+MAfgfz
         tuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275775; x=1793880575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MiKP9fyeCAaFA13wlpLP5Q9RvZIGZFi3hjz454dnr8=;
        b=rpE2KyZamTChYTU7YVmLxYq2xOtCBU1CtxmeEntE4127UIVEL6tjjoZMuKsI2XXi8x
         g0RqraMZzc8q//7m3EEaqbwiALv5FIw4kVq3aDzjl4CwaT8/Cue9NmGRJYz11MmbhOEO
         CriVrZut7KP9GbGKSQCa0Kv9Iwl0awCDM9qFdnem3fufAZnDyDpPzPXoZo26djoEixeB
         s1GXMMuEswrPwZ3SgXWE/n+zfwK2YnPq0w87zvmN0058/ZPSUBuwk65F2rOpIMACvk2N
         hZ+t7fUAmWRRR3ZKY20S5nprwLHitpT/J7cgcJmrzlJEJMjWyuFA20KI244PgpQQDAzm
         L/jA==
X-Forwarded-Encrypted: i=1; AKwUvBwYCePebzcPgQSVlB4VvnQkv3yPfLoKvp3RUDca8DThqDP+XO9+F+EFORkPq1HmhzrQZNRTUPN0bVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDad/sdagB7OP1ch/BEe6F+j2UZYMkwPcg+1WsIpJyfNQ7ywvN
	pufRPxJkiFFrJjp/8RRRefE/hA66jn3iz3SCA6YFrUFrkwHyg0a3sRYG0HbzCLQhpwQNgiCneWN
	5sHCT4N2qZKXnLzGmuUnzoFD9gJU+oy0ZfIsUlYV5rB6h/4RK9Ah9NW+KCpWp0A==
X-Gm-Gg: AYBFou2Pus3+9M1SxAV8cIK06DdLVlpP4/6SDOeenDK+8kf+lsUnJ7GVkk9s5xNzqc2
	BcDnBc80tNnfqlJhYSgq4wdKM32JfGz6ynNL91nVtowWFfe4/PGWNbYAqQXn+nsE7ZQmpLleCbf
	YuwxrPVWeVHdUdiNhS1zqCpBkV+Z/Tc5/ZcPGU8r4xabZhnRzqVUkO0r+VuVPQlBtG95Zhp+2KK
	UfisBnGsRgckafkmLAySTbM3qBqJNpK/hI3xqlmKaaeUOMuTlLE86QMjpjlXRM5GMZ8UEXpQHIN
	7JgUTnqGnXVtTP6h9dR0LV6EXQ8+OZf55/RWeDOMYcrxAgsZXISZxyYusZ4YlG9JQL5Mq4lHju6
	24ggXS34OXPTBamN5KVzpxQfEbB6GHL3NCPIZ4yIBdTDVP2DRcVk6ZcuHPubVqEFmDBMui5Vxh9
	wlqY4qNgT+bI9jKsQx4DBGwGU0flwx7qZGwd7qNFz2jHO91WY=
X-Received: by 2002:a05:600c:4e01:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a967ca03demr123795535e9.35.1793275774941;
        Thu, 29 Oct 2026 05:09:34 -0700 (PDT)
X-Received: by 2002:a05:600c:4e01:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4a967ca03demr123794855e9.35.1793275774447;
        Thu, 29 Oct 2026 05:09:34 -0700 (PDT)
Received: from [192.168.188.234] (ip174-129-192-82.pool-bba.aruba.it. [82.192.129.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm28654975e9.15.2026.10.29.05.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 05:09:34 -0700 (PDT)
Message-ID: <d2cadc0f-f52f-4a89-99f5-4a5fb621e944@redhat.com>
Date: Thu, 29 Oct 2026 13:09:32 +0100
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
Subject: Re: [PATCH net] ipv6: bound temporary address regeneration advance
To: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 horms@kernel.org, dsahern@kernel.org, idosch@nvidia.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 alexhenrie24@gmail.com
References: <tencent_F6E8C7CAC6D390C8E912EEE4FD9FE4333505@qq.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <tencent_F6E8C7CAC6D390C8E912EEE4FD9FE4333505@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 09:22, Yingjie Wang wrote:
> @@ -1394,6 +1405,7 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
>   	struct ifa6_config cfg;
>   	long max_desync_factor;
>   	struct in6_addr addr;
> +	u64 min_preferred_lft;

Minor nit: please fix the variable declaration order above.

>   	int ret = 0;
>   
>   	write_lock_bh(&idev->lock);
> @@ -1430,9 +1442,13 @@ static int ipv6_create_tempaddr(struct inet6_ifaddr *ifp, bool block)
>   	 * idev->desync_factor if it's larger
>   	 */
>   	cnf_temp_preferred_lft = READ_ONCE(idev->cnf.temp_prefered_lft);
> -	max_desync_factor = min_t(long,
> -				  READ_ONCE(idev->cnf.max_desync_factor),
> -				  cnf_temp_preferred_lft - regen_advance);
> +	max_desync_factor = 0;
> +	if (cnf_temp_preferred_lft > 0 &&
> +	    regen_advance < cnf_temp_preferred_lft)
> +		max_desync_factor =
> +			min_t(long,
> +			      READ_ONCE(idev->cnf.max_desync_factor),
> +			      cnf_temp_preferred_lft - regen_advance);

The above is quite ugly, you can probably make the statement more
palatable using some additional variable to store the intermediate
values.

/P

