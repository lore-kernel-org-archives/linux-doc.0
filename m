Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589602;
	b=aDX6DZ2fwQ1ZDueRR8rAM38cY1XwE1EZcjIf8w7XaiOAZZRQUNmlJNSnuBWdSij6QF1H
	 dbVZE4D3fBuFTFd+LAsKj3VpCVkrH4KcY/yye9mGdVHVUDfeoEVtyUU5nhGrahWJbFW9T
	 7ZzMzgdh9P/Uq+6VAZEUgolZl/+BUB/YCEpXQCYFONhqJn5ipgZOyWK7K46mQ32sKWioA
	 X7iYOtWpYB1BQaRq9w3znWOpMAKAWFilLt3A/VcNGGZgtpaK/iwuq5Q3qAlR7kcg07Xpu
	 oC3/hW4hal3tPyzdI58ZqHohmPDZ/RJxH4F2Ip+DOfTQkYYAw32GktAVhay24qVui2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589602;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
	b=I/6e0AUOkAJr10oaamZRQmH+GBQmF40uj+fUCGuRaoyL5cOG4YeepYsI+oHQPIGkWjT1
	 pAWVdZ4YFSmodDuR/D19C8TAGI1Mc3bxbNRTWQsDkAhtwdRQkTrM2wgcygW6eHPxSWhE+
	 335kYDYW6pBDp5pKlmC9ns5ZrjfzcPxIPKPkO+r5U+MadbNiI8pGfaf7PaF7C7nZs8WrN
	 WoLYPCNoFrN//Z9+DBz8Q/9yTTMb7gZdzaUE01so/SmOeZuP4M93uAJb5ruqDmtFQta7K
	 5Uy0QyDImVjLtqDCFPY5fNIQkXUZvGgCPrnRnRyfsw3gf6qQ/KCXsADgJ6c6RQtIVtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e2gHZ26b;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOFjBJ7Y;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2653606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2653606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e2gHZ26b;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOFjBJ7Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794589600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
	b=e2gHZ26bDcZVmjNnP5itMSUk0JgsqlVoufhv6xY8lYsxY1w3opJu7NVXsJL0AvdpI63mfY
	ABeRWr3Z5VBwI85EXuKBY+LG3gX0iEyduiduJrFtDNQWcOkXykG9mnQavh7414TxRav0Te
	t7zj0wuaEfaVh0tk0jA8CP6k7naMr3E=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-bAyG5ZaaOMqgkLbsaGJaBg-1; Fri, 13 Nov 2026 12:06:39 -0500
X-MC-Unique: bAyG5ZaaOMqgkLbsaGJaBg-1
X-Mimecast-MFC-AGG-ID: bAyG5ZaaOMqgkLbsaGJaBg_1794589598
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb96533adfso605522a12.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794589598; x=1795194398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
        b=OOFjBJ7YMq4qZZym2L56O8Gxc+U4X3QbgzGKfWibcMFiDZ0tfwPAUHnhQ4bO1SjIgu
         pOWhuvO/+1sCPnRjlJgdQlehL6SFyEI4lIDw0ruzHs/TKNWtmAkZJ+s9ptgbUQcQWs2O
         9sHSN1CnZR2YGhTIgcFRv7puOv44mvbAqxiZloxMpXbo3quJkU4dYC0FMSUjZ0evLBga
         C5w2UvIQ3qjq12X1iP8V0qrglQcDnS0ZNQOeHoRcG/okIALq1cowt5orZz5SpqVjiX7G
         NyOGKmReAP+rXuVUByoSx0skeYa6Dc9Rk6r17nzPgEX+dZPeB1j7iZsu+Ntsgt0iHMzP
         8/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589598; x=1795194398;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmmnV/ymSMAI2Dol5zCaEFZv43vlX+d7yneKTBH5aJI=;
        b=XE5tc6csuJzsh5PcXvYlfdzbWd9OcJ8yHFOnpWKD8JUuVz6Qhiu08oAIDDs9m4fu77
         iaZCMRtWX8TW1IHqGpitYZvCcUPN/fQVgWa2FbhQCeZKNghm/iCJdCm+1v4uvPXsVKfz
         QoNt2WWI2P5ud/gshoD3NNeHGH71hQzs0OFUCfoMOimMBJwuterppWeMK7dg120KXegX
         lyBgmoWTIRaLbDUvAZPyX9TM0qprO9Wo+5YJLy4ama/gOpVmHEuIhKveoc5ChX0TX3Ut
         8QY6woPZE9/R5u2env1gp83Tord6hd+0YxwvPpkb1RnEKphM50uYPLpvyzl1OEjOWnbK
         BtdA==
X-Forwarded-Encrypted: i=1; AL+hErHchVeBx2Q8PGpfRgw4R1CgV/gPI1KnS/JhUUMJ4wSoHLtOXWEDZBp6C5nDjVNTg/YdDEVHgJ2cL9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tZl4hLunpmOvUE525ELxnkQoMN/mSh+gJZULGOcCJ1o1FmFix
	UNH5wAnQdRnr/Fke1wI68uEgzAC/SPko5TKIsc99Dq+ygIGW7S5ydhD0k/sZLLknbz+E2yjhVbz
	+YrLqS6yoBNFe7vB7f4WZ3Wxapqb1nKfS+nfmstkfcYMcK9MUBxGYej45CyY8PA==
X-Gm-Gg: AYBFou2foTKreGocwApBJcvSag4CXE0Qe/hMPTUCehgu+PM4KhjStRmBvlbPqyp1a8c
	VdecdH8lmLC+NWRcYiQ5cTSQ8QSAiqrp6206QmevT9TaMogz2g8Gy6qjkagkTd1NDRfRU0OSAJd
	9Wd7hXzciKxtpkLa4ZD25EEgvvSfYpczsBJ+9UQKubMVY3samJgkBS/EAL0TVrkxCIX2jlpWg9Q
	TKA7vK9rKeiiwjS4uJomFiLDvCv4Wnu51zxP6JVNiA3Ri1hpf52+3wiWB8+peUBjZJQRVBMyvA5
	GeFe6/KVTHuf/yGjCG4irTnxG6+UKVqAytV5n6CAmoJGxgzklCy6raDgw/p+Ku0VsSFYyzcRQCa
	SBxzUKULKH3JqWnTp68eX1kghH8UQG79kuo9LTD3PSbVYWYvWjmJHy0AuFQ7NZ7JUXdf+tkc=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b1b0a1b56fmr2668123a91.26.1794589598103;
        Fri, 13 Nov 2026 09:06:38 -0800 (PST)
X-Received: by 2002:a17:90a:dfcf:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b1b0a1b56fmr2668105a91.26.1794589597671;
        Fri, 13 Nov 2026 09:06:37 -0800 (PST)
Received: from [192.168.1.102] ([117.245.168.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm2247977a91.3.2026.11.13.09.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 09:06:37 -0800 (PST)
Message-ID: <2bae83be-bb44-4541-bf1c-5861f73a7394@redhat.com>
Date: Fri, 13 Nov 2026 22:36:30 +0530
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
Subject: Re: [PATCH v3 1/5] kho: reject zero bootmem scale
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261112-kho-bootmem-sizing-v3-0-f0c8d00295d5@kernel.org>
 <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261112-kho-bootmem-sizing-v3-1-f0c8d00295d5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/11/26 4:08 pm, Mike Rapoport (Microsoft) wrote:
> kho_bootmem=0% sets bootmem_scale to 0, and then the bootmem areas are
> sized using the explicit sizes that default to 0. KHO remains enabled,
> but there is no usable bootmem to load the next kernel.
> 
> Reject zero scale the same way zero explicit sizes are rejected.
> 
> Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe31819..b30ba686cb301 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -703,16 +703,22 @@ static int __init kho_parse_bootmem_size(char *p)
>  	if (p[len - 1] == '%') {
>  		/* unsigned int max is 4,294,967,295, 10 chars */
>  		char s_scale[11] = {};
> +		unsigned int scale;
>  		int ret = 0;
>  
>  		if (len > ARRAY_SIZE(s_scale))
>  			return -EINVAL;
>  
>  		memcpy(s_scale, p, len - 1);
> -		ret = kstrtouint(s_scale, 10, &bootmem_scale);
> -		if (!ret)
> -			pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> -		return ret;
> +		ret = kstrtouint(s_scale, 10, &scale);
> +		if (ret)
> +			return ret;
> +		if (!scale)
> +			return -EINVAL;
Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> +
> +		bootmem_scale = scale;
> +		pr_notice("bootmem scale is %d%%\n", bootmem_scale);
> +		return 0;
>  	}
>  
>  	/* parse ll[KMG],mm[KMG],nn[KMG] */
> 

-- 
Regards,
Mukesh Pilaniya

