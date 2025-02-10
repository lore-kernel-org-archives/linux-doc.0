Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD1257432
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212780; cv=none; b=FcIY5MRfptaKSCRs/RZZoAbwLxPXSI/e+GT/fjifEdsREzUv6ETtZC22yA/9TNyp7UpeHsb93EBm0raoDrH6CdgV7/kyyL0RGBu+crGlotNFpHG/4o1AtLbws+rq3xDanXknc5spuRlsb4oKw1Xz25LRG8bcbb4ktiBP/092dpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212780; c=relaxed/simple;
	bh=x/sZGvUzfxRrq9nYLFJINjPTLTHbf/GtI9WuU9nK5ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQvtL2+gm41w+nTWguF7OH/aqb28pZrStSLceP4cYwiSwLcKAnIdzDoLd3sRbS4/B+/ZgK5pbk0iYq6BI6BgRFl5lKzmDLFu7alTSE4L/Emei1iaOFxVRxyRawyqyNFG8l/rWn/KtJfBcVCTFhPuee0p7R9OOT6Iy01uVszYEx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iDKSD2jA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iDKSD2jA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uYWKjcQduNIKs9dJZokUUBWiThkKPtNIV6gvjS6SD6Q=;
	b=iDKSD2jAzyupcjZIyRshZ+Uq4gBeosVmwh/L+M1BkBRjqYnIfrIMq79PLoryfpmMZd8qBb
	V2v+25xdv7AF39++W50po+Cdihd51rocr5CymQ4/sPHIg6nB3sR60ySDpa2hPj501y0J/J
	3EPpBdi10E6vYFMrAQNxTtA1asM4hfM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-hSvXF4RHM4qlhgjAh0SbSw-1; Mon, 10 Feb 2025 13:39:35 -0500
X-MC-Unique: hSvXF4RHM4qlhgjAh0SbSw-1
X-Mimecast-MFC-AGG-ID: hSvXF4RHM4qlhgjAh0SbSw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43628594d34so27730765e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 10:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212774; x=1739817574;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uYWKjcQduNIKs9dJZokUUBWiThkKPtNIV6gvjS6SD6Q=;
        b=i0/L0UqYuyEJCEuv2sxRUdRO0lF8VORgp+BCjNzyBsK98XBpHwuTsnszrLEIWfRbCx
         maFZYCq0sW1LWLdcK/0DBQkKlgH8tq8rp9NG7+z/v7U9XWU4ZOxhXrnpJ+1+LxSD3Xza
         kT2QQeHee3qlpr72QYkuWQ+yZBlwyv5Vtk0OI2AnNUkZp6yyIPPv/QayVS9Q5YnQCuxl
         79HeYHKVcq//6G7rB+3k7lAXQN2Z3eXphGOoD6+aadjXpGewKaD3thh3eyIzi/HZfwid
         TEDJDnpNmM4Kzsvg2rUG0ExwbJY/jsK3ghzS/xTHBf47n6Pcs48iJbsTecH3Irnula64
         Q3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGEMWCw/eW8byQIX7RuF1J2UUScgA8HSPn3/pJqgSx0tmT6EIdEFp2+k9rQHA2rviy4RHMCQZvWuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwJAAfFXO1uOPB1obnd9wyP0Qgf4XLpUUHJMqGVfPKHPinJ97
	FO5EjbOBzQpvJxtD/5EtL+CYD//EGciGosURpHVtmwtn8DrtkcMKUYIwPfoxwb9cma6LnU6OOFi
	ugJ3/lO8s0qbqTble9yVKf8jpU/lAaRj2MTlUG+EfvNGzKI6EKxx0N20qHg==
X-Gm-Gg: ASbGncvij2aR+0lHd+FXu7XQ2iXCkPRSFfTKchN7LQbcuZ/HmcTbrR/IaJxEHIwgVdH
	/pZnpjMYw1U8Jv1wav/8KW1xf391QUiiB3TO3fDwsD0y94RqhwT4SeZxqrWJja1G23n7CGj/Nv8
	Ga3Pr1UvdsICX3WT2DD06n/5P7+BhVkuGN+LnAK0pQnhOwee6ALmBq6P60x2ZpKEzOx3QPAzXDj
	6BCT6XJQR2GO0oS+6NaNqisHrvFJrdJJTEkMOLV6WxDIxrxXCRxFV72jM11cQVDeWFRlRg0qffd
	6LIM4B3acvIcEjJbV5gsSsgys1SkGraEPXY=
X-Received: by 2002:a05:6000:1fad:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38dce708d90mr10228202f8f.37.1739212774663;
        Mon, 10 Feb 2025 10:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvxARJ76HOuGFHzWjgTSgJca+XchsbC+N32+KUziB434soeJwYLOC+oL+ipLCoVO9VZXSzlQ==
X-Received: by 2002:a05:6000:1fad:b0:38d:ce70:8bdf with SMTP id ffacd0b85a97d-38dce708d90mr10228169f8f.37.1739212774160;
        Mon, 10 Feb 2025 10:39:34 -0800 (PST)
Received: from [192.168.3.141] (p5b0c6c7f.dip0.t-ipconnect.de. [91.12.108.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd2e0765esm7764114f8f.82.2025.02.10.10.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:39:32 -0800 (PST)
Message-ID: <48dec767-3e14-480e-a3df-1298315894f6@redhat.com>
Date: Mon, 10 Feb 2025 19:39:30 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/20] mm/memory: Enhance insert_page_into_pte_locked()
 to create writable mappings
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <7db953c8cc5a066b4aa23dbdf049c6f35cce7b99.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7db953c8cc5a066b4aa23dbdf049c6f35cce7b99.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 23:48, Alistair Popple wrote:
> In preparation for using insert_page() for DAX, enhance
> insert_page_into_pte_locked() to handle establishing writable
> mappings.  Recall that DAX returns VM_FAULT_NOPAGE after installing a
> PTE which bypasses the typical set_pte_range() in finish_fault.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

