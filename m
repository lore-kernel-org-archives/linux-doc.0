Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6A1F0E56
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 15:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758899986; cv=none; b=YOF8U1mpx3kvOnMWRklDt1FXeTjmtU+QOlHhIQyuEMXJoTPw+AVaUs8RIpnYW/9Gl90v6R908jvDWW+eqFOu51V3wWFSH48nzk53lv/awnhH9LG5eOIgaUzzspb31vsxLUBByLqODBmR0+axncSiMD8SOPuvQWHu8BiHmgdvwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758899986; c=relaxed/simple;
	bh=2XTLs4doltlPuCdYFOVv4qEsvroIMNWoNu+9BpzlsAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JMES7SE4eBvQEBOgqMsqBHzNxs/ILqx+I4ZKCRmWUoTFOUzO+gStYrE5VTt367p/WNjxCqqa+FoK+N5YC0zvpdfeZyvpSbpnguJ1AogbUWgNBMXBih3No5vbv/PTwQEcC4ROI3P2w00ht2IuHi1gG74WJCR9QVIWezdptn397bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDD3xchw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDD3xchw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee130237a8so1686867f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758899984; x=1759504784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWlR0y/Sux61rdpKVNHDRpox6sYOOn7qAYyRTBv/JhA=;
        b=WDD3xchwUJXWqIVv0OYJtLca4TTpdEF98mfveF1/kGNklukMa3WR+wJrd8Z2v2Kr9s
         8qLa0J1OWNimYBLg/iAPwHoKRCzacxdE8bKGf3ZiIz6fzOuu+aFF05OH0ANYzNnevtDZ
         7Rnq+4j3BCCnHx5U+5Uu0qVQV60BcQvMA54iFpzDq6NvcQ3zrHRsiYuvKhkq1WEIK18M
         v5y5vNxpXhjchwFfgSfGW5SITLRAxjkzRLDOcjDlnYf+BYi2ItdZ2+6co7Z9uBEo0drV
         lOX75b0TxB2+CCvyboL4T/vPoIiw81pKWDy5+DjNruoobJq858MM/aY5gdnRBo2qSw4w
         owAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758899984; x=1759504784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWlR0y/Sux61rdpKVNHDRpox6sYOOn7qAYyRTBv/JhA=;
        b=VoO3mK7RIplOpqXKeT7ddkNKRdxB2LJX/QNJLiA9ap1KDha2l/wVg4NRXZUHlH55KP
         7ujCen5HSdmrS4WX+WMjsaWb/W+F9P8K2nQfS1tGvWVDiYQ5zXcreqctAEtww9zar0i9
         xxPpgDjml2Bu04r2R9CY7AMZh76Cd+8Mmrg8geVmBY7qcuEWQE1w6YQUDGpsi4IFkeiP
         MUODv9r4gBTP8RzeDnrJ8UQixnCpI9ZJZKbLfG3KGCC76T6yi2ojWgOdh4NFPAVGlPt9
         k1NfgHhufp7cxbCzlS/bWhhUgjuZeWeYt28TAP+LbI7mTlXnMWsbvz+/kP6oWWzNwebg
         Wm/A==
X-Forwarded-Encrypted: i=1; AJvYcCU16CNDox7fk5MsDXLJj5xsvblSYHl4wL0fCduPVfFzRx4M/DRO1VS+0sZ+DcONhGD5iDHtZ1tEEww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE78OEccIJF4Dz6gUbi01wf43ETk85afplB7I4coMWj2ugj48r
	06kLGkJX5miBwevoAJUxmCMJ5QqCm0FZSFaLxIy8RZUOXGvnu8aRMtpr
X-Gm-Gg: ASbGncs+7Glk9o8Zkb8m8rHnPke2VUhRMBzVb2KkAh9dVc73ins9q9km0ZHwNxtkZ7A
	xThQtPqHrzbbEPRKEzK+IZxXDqIGV6vhvOxXIw8f+BotReR/VKpAkIfQVtqsnHOuyI+ULAUQA6j
	LRkGb8NqACJAva1iFA/5RbJzcJ8w1auwd8n2ijf+xH5H2vEhfE1jklpb8LvlwL0bhKRhWsGHkKg
	63OCFHyvdFEYiea9sjZ7qrGBXGMh0bzeFJLO/WGu34DKigMiKiJCXjsiFzZGl3CqjbpYDhALBJd
	1D/NI4PPz4dTFBgqxtA+pvCnmayBR79h/RAKD/ti1+YCvRZMEb56wRja7iKwp8H4yFIhkcqTXcC
	4Pv5Oo2zXzUxyzldS/B4J7Xw0YQHwGUH9jEm0znFu4SsCRSFjo6XOquBK/iTqJv+QNuq62yyBQO
	UCdvsTxK7l1V392jX6adIQyrHKRcmLC5vqfnVhgd8=
X-Google-Smtp-Source: AGHT+IEa1G8Cv8YRgqFXmAP3TAlQSquRLXr05PhtZGwjiNd0B//b+MGhp44cDbdJLfkDnbto9V3Cwg==
X-Received: by 2002:a05:6000:1889:b0:3f8:8aa7:465d with SMTP id ffacd0b85a97d-40e4adce7e4mr6096265f8f.30.1758899983520;
        Fri, 26 Sep 2025 08:19:43 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5? ([2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab6a514sm120108055e9.22.2025.09.26.08.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 08:19:42 -0700 (PDT)
Message-ID: <37ec3e8b-e46d-40d4-826d-b4b2378015cb@gmail.com>
Date: Fri, 26 Sep 2025 16:19:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 mm-new 05/12] mm: thp: decouple THP allocation between
 swap and page fault paths
Content-Language: en-GB
To: Yafang Shao <laoar.shao@gmail.com>, akpm@linux-foundation.org,
 david@redhat.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hannes@cmpxchg.org,
 gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com,
 rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com,
 shakeel.butt@linux.dev, tj@kernel.org, lance.yang@linux.dev
Cc: bpf@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250926093343.1000-1-laoar.shao@gmail.com>
 <20250926093343.1000-6-laoar.shao@gmail.com>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250926093343.1000-6-laoar.shao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 26/09/2025 10:33, Yafang Shao wrote:
> The new BPF capability enables finer-grained THP policy decisions by
> introducing separate handling for swap faults versus normal page faults.
> 
> As highlighted by Barry:
> 
>   We’ve observed that swapping in large folios can lead to more
>   swap thrashing for some workloads- e.g. kernel build. Consequently,
>   some workloads might prefer swapping in smaller folios than those
>   allocated by alloc_anon_folio().
> 
> While prtcl() could potentially be extended to leverage this new policy,
> doing so would require modifications to the uAPI.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Barry Song <21cnbao@gmail.com>
> ---
>  include/linux/huge_mm.h | 3 ++-
>  mm/huge_memory.c        | 2 +-
>  mm/memory.c             | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Usama Arif <usamaarif642@gmail.com>
