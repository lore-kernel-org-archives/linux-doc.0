Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216F3264EC
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701396; cv=none; b=V5GMz7j9xk9Yv7GoRRHgM3ApmRVtqYVy4sVRdTsTfWQqLTzqhqIerJqMdE9G8gnSfJY8hFwaBcuD7QimYdArvWDRdFEUu47EjQUlT+4fpF3dLcj5o3Oa2iMuTyi65ABe41wU27fdOrLHkmW4P/1oQfjO8Gm9xF+Ggqh0bzFkT30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701396; c=relaxed/simple;
	bh=4j2H1vTStRkJsGqGfZjGs1SWh/WE1AFeFjGWmvXOPNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt3L076lEIBzQbHcfji15Axc5x9IqBSGZwaWhLvN48jAuSI2nYVm9/DxDMDWAT4UQvC++VKxda8Aioy0PNZNqlc70e3falC/cjxabM72SpqT+MY9f1fD2OCoeXVbuBzxdQZVN3WA9RHoL4tddknBF/QDjjl/XvvSMwpWMrraK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UBV9Wq7v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UBV9Wq7v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so10509575e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772701394; x=1773306194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smWzxETQFde5edH1yawclh397DslBFPt7zhbpAy3Arg=;
        b=UBV9Wq7v3AQspgKns33Lytf5OoGZH79zkSSK8iyFiMv1v7jqRherpBFwwAaK9l8PUW
         fcTKw30xNCTKFf4V9AbE6fAPMRGr2kkX8VaauNVRrcpHGZokItj2Jn71j5HFoE/ZLNrw
         yB9yUVwg15Yqch0ouUC6OsrlgkalSQk4AVC9KujtwyNKRbDZ9e5Td811RQTcTznkAFMu
         9lomwHq3vX5b7oUZfDFrj8M9eLVrQTPWMW9fROOmeqeg1fL7Eo0qHp0YK8GsvxaqZK5O
         437/p1YpQyab+Nb3K5NzlTfSX6UB+d/YBkDExo0Kx6duXKfR+aD2jPqakNAvEsxtED1B
         pdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701394; x=1773306194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smWzxETQFde5edH1yawclh397DslBFPt7zhbpAy3Arg=;
        b=NKm0sitb5NqMZ0UqGTa6NEgZIiEHoMNTkG/725f2zrcSliKIgB1ZX3uLE0gvPpRqaf
         VUTTFnk92cPZuulpzIP6s49M+h7jrCJpYNPWPaY0GCAe+fwYNzbWDu+Icu53c74aZmsd
         MyiAqmtG9AURfY930JA2EDV8jUqbLPq77MdPgWec/SOke4pONmLuyFntw4FC0HuDdIhE
         Hm8Hk6UOFSyaTbirsH8Q7h1yErkVB11fZN3D5hsSGHiI6vD7omoqpmDOndUH3Ue5WdYL
         9p2B7YLSVGsoQkFjOUeh1UZn5L/bcd7+gl+yJd+1ZM5goSC2fyhbj+22RnViGpWaFBHu
         pzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8b7IsVaIXYNFFXzAeQWS/e90Tw+G4KoXXypwY1LnZGnSplONU1lsAERv9+RCqe0D34Kh7ZRmsGIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7zFbOHB+AXSOHvaNcCtERR3B3R7vm0dl6JrvuOgg9jJZ7Z2Ss
	0OUU/VLCaV5h7eVXAfXGG4gKdx/kHHT9mUJqbr5QIyO46dOvmWudyAlIyfaJGaiYzRo=
X-Gm-Gg: ATEYQzx3Rokv04KkKeXV69kGjgHMWCQsnAzcXumlMeswKu0vSk90GZvHPAgTk0WAl7h
	+W8WL+Sow0DoO+8+Vl+cUS57FwGT0u3/LQTmGAAR3sWZyYSUTgtanB5AFxH8CUYOnwVaEjdoW8D
	IxFjbLJu9TqWOupbZfkS9jv8M1qcBgKhOR6u73/lZbNS+DLEuqZLyk2PmnTXYKpG58iixeMjWXe
	+Y+BCh9dv6puqfK0dAjxWUqRoJqGTZcQVdCj/pzpqD96QajUNExKTM2X4RdmENfY8CnEJRrDKVf
	YFxm7qKiAoK6aaHXDXS8O/LtQoReyjzl0WMHllhLQiGni8n/ja1+NephkHYHRJD9+s3bptyukIH
	D1dmj+uCB7o5Mh1lQCAPyHGRbDEqf7N4kPlEei9KdCVRwGtXczFvy6ebuHru+NhXwjbEzRUBK9O
	xaxunhCzuKw8N9aF9IjVtWzWOKjgxBiaaSVVH3tm2yE5hj7PM/RffSyI66Lw==
X-Received: by 2002:a05:600c:1986:b0:477:9a4d:b92d with SMTP id 5b1f17b1804b1-48519897935mr42870965e9.5.1772701393663;
        Thu, 05 Mar 2026 01:03:13 -0800 (PST)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae4a68sm24849435e9.9.2026.03.05.01.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:03:13 -0800 (PST)
Message-ID: <8011ab29-de9b-4a9e-b437-a514f6e462a0@suse.com>
Date: Thu, 5 Mar 2026 10:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: filesystems: clarify KernelPageSize vs.
 MMUPageSize in smaps
Content-Language: en-US
To: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Usama Arif <usamaarif642@gmail.com>, Andi Kleen <ak@linux.intel.com>
References: <20260304155636.77433-1-david@kernel.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260304155636.77433-1-david@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/26 16:56, David Hildenbrand (Arm) wrote:
> There was recently some confusion around THPs and the interaction with
> KernelPageSize / MMUPageSize. Historically, these entries always
> correspond to the smallest size we could encounter, not any current
> usage of transparent huge pages or larger sizes used by the MMU.
> 
> Ever since we added THP support many, many years ago, these entries
> would keep reporting the smallest (fallback) granularity in a VMA.
> 
> For this reason, they default to PAGE_SIZE for all VMAs except for
> VMAs where we have the guarantee that the system and the MMU will
> always use larger page sizes. hugetlb, for example, exposes a custom
> vm_ops->pagesize callback to handle that. Similarly, dax/device
> exposes a custom vm_ops->pagesize callback and provides similar
> guarantees.
> 
> Let's clarify the historical meaning of KernelPageSize / MMUPageSize,
> and point at "AnonHugePages", "ShmemPmdMapped" and "FilePmdMapped"
> regarding PMD entries.
> 
> While at it, document "FilePmdMapped", clarify what the "AnonHugePages"
> and "ShmemPmdMapped" entries really mean, and make it clear that there
> are no other entries for other THP/folio sizes or mappings.
> 
> Link: https://lore.kernel.org/all/20260225232708.87833-1-ak@linux.intel.com/
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Usama Arif <usamaarif642@gmail.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Thanks.

