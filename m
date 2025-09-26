Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40513957E
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758898497; cv=none; b=OjT/4mBKQuMLwAa+9y9VAS8UTIEBUw4nH76uMP9xjrslwwcReFtezFHPFPLsGix1h75U4x/pfegyUQ6kN6T5b0lAMVfJC4zE3E5pBOBco2xwTZsLzGutFO+GqfcviO0tp5fospQqo62vrEN1JqERlmxfHXz/+rjFk59crUfJFvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758898497; c=relaxed/simple;
	bh=rJ4vWF2I9u61rArQ5Dfe472q6LLKDmCPOmpVjXV2tl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPpenWkq0MGJIHCzDeylMuKTRBjcQx2vuSFRFtgtPjx4tzAWoS9lj3gdZFxV/62mKZCrlvI/d4Bk7D5a4sAeZN2s5xkFrX2FsFMqlFJ1JId3taMzPku7AfKTFXQFkFsNeWu2zAZKhyWY/byngObU2VQ/TuuIC4p74IzMFFzeLMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+HWnP4T; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+HWnP4T"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so21643275e9.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758898494; x=1759503294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BY05iPvOa2qw1XDOJIPHyncKPIyxi1vtKF/LrunZtR4=;
        b=Q+HWnP4TqimxGrg5UJ9weoSuOJhYG/cB5FuD8kkPvMfr7WKY/Q8QAJ7WNojEGvyMHN
         90zURz7aS+ivth3s5DUi8HCjVFL2xcBi58zxWfYpNzfPwoyi9J4NvPn6HBJARXxC7pT1
         J4wmqH1ZsVAgPLJmqQ6CtQipQyqvjKJpTg3VmiPfHBUgpxSYhvrsC6HlmEAlkWqn8XK+
         uTyvLMb1y7dmreIqYzXOqXny/5JQ47o/IjAVlg4uVEDjRSunxAXR+Lu+5g46Y/VPuc5d
         c09bAMl1aJJ8z/BVl//bVr7z8VuR8FRW6pmApcR8INgAt6GjXfyJknnjGQ1CxI8M2f97
         8XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758898494; x=1759503294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BY05iPvOa2qw1XDOJIPHyncKPIyxi1vtKF/LrunZtR4=;
        b=a1BAxi4oFdK+xtYW1K1g1kJPPqzuQz2PU9C1x30YVvyby/Io5UHZm9WHpEoN7xUvbK
         IAVqjapjjG6aK6egWqwVlx/T9QS93FkU5bD+hoX8ivMJm0jr3xttS4V1b1xelvDqmOTF
         Q/yh/XNBGf1d1PUTLRkjzDaW4WPT328j2m1UTxrL2TtH8WmQ4keDRunPLlBHX6astsuL
         0pJbkWzzlA1/LwfT0VrfumXJsSphfkQaKSxWw3xoEkcgw+eNx8SN+EhBSSwjCj/ZfoEK
         F00IJjMuOiAanaAhSqZNOECZjujhlbJNh1Z3nwE4k71xSF/xUrKOOCfrkN6B5FOyqJf2
         LRFw==
X-Forwarded-Encrypted: i=1; AJvYcCWE/Ndg6dX0Tc4Pfi4Ro5Mcjp9Wg4b/qgwABgzy46Ui9GxsYk3hZ+n80TGjJ3OXbUNJ+BRKvDvPHLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyURwa4ee2fc9OoANgCUFhFUuAEAGWwGISyYZsIwX0riGl5JXON
	g/BZlAgywETWfRcIkl9O63DA3xclE3tS2bjzZHzMredPaUSZQG9m/wbN
X-Gm-Gg: ASbGncsnaHpfjwf71bu1zJGqI6+p+lkhucsBz4H7rH3mHrzpmOmC0o1btG+YTkR/cJH
	zZ++QL0yi9igjNZIs9t4lwt6nAAb57TsboLSDTxE2kFhh+q9AkAdyB3G5ejpsfYoAs1BJl2veQN
	uMIMKJRhXTFLiqkAoG+M3SC5IIlt/aKAW2eVxVfVsZkTJru6Zpwj+592O4w7HpyMafFF2PGQod9
	4v1ilb0vFNs6GaoV0wvRTVHEIlOV3PGmtvJbJfSa4I7AEaqt0cQDDzyvb1lGkEJQFmLt3nhN0SR
	ndzVbWr1rEiHatUFtvgrsRfn07GuQn6dhxuvqVkm/+Dg69v7ERq8D18DfsbWyZ3OuSXvCJuHFr7
	6WgSFWI3KbPZlCgNfMa8/OmXwolqVYGR2PF+0ufNrLG+baZ1F55ZoHFoAb2yFjo9SuX8PShiU9i
	FTMJlAxXamWXzT0X/R1y6m8dWqJ0xt7+z5kw==
X-Google-Smtp-Source: AGHT+IH6XAUFoxCMg08arme1K9l+Tyhl3fwi9t5NToKIciERmlCjEeowzXgbzR1NtvHV+IE4Iod1mg==
X-Received: by 2002:a05:600c:3b10:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-46e3299a5aamr71003245e9.7.1758898494406;
        Fri, 26 Sep 2025 07:54:54 -0700 (PDT)
Received: from ?IPV6:2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5? ([2a02:6b6f:e750:1b00:1cfc:9209:4810:3ae5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31f1dsm119224235e9.13.2025.09.26.07.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 07:54:53 -0700 (PDT)
Message-ID: <4b8817a4-5b17-4fa1-bc07-1808b495b8b8@gmail.com>
Date: Fri, 26 Sep 2025 15:54:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 mm-new 03/12] mm: thp: remove vm_flags parameter from
 thp_vma_allowable_order()
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
 <20250926093343.1000-4-laoar.shao@gmail.com>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250926093343.1000-4-laoar.shao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26/09/2025 10:33, Yafang Shao wrote:
> Because all calls to thp_vma_allowable_order() pass vma->vm_flags as the
> vma_flags argument, we can remove the parameter and have the function
> access vma->vm_flags directly.
> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> ---
>  fs/proc/task_mmu.c      |  3 +--
>  include/linux/huge_mm.h | 16 ++++++++--------
>  mm/huge_memory.c        |  4 ++--
>  mm/khugepaged.c         | 10 +++++-----
>  mm/memory.c             | 11 +++++------
>  mm/shmem.c              |  2 +-
>  6 files changed, 22 insertions(+), 24 deletions(-)
> 

Acked-by: Usama Arif <usamaarif642@gmail.com>
