Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990D621D583
	for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676371; cv=none; b=OArrunZPYEilc6W5NHYlwxlTJjQTxgXcpzyM+uvTPQ0PLp1Ry2KtoXJw8H4bpXxFW7J/HAhncRNmm87JBDexPvG2s6wnLb9V7rIG6ZOZBDlDFrtecfnKe9ksXGs+LAJq0NkxY1RLFVnP2lQvl4tnBnKXXgFN4PvlwOQ3bxc6TEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676371; c=relaxed/simple;
	bh=1l+TjhQp9Q1J9Sh4/4LccqAiC1Cy11CEzVtYjhTLHU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyheQ8k3YiTc5nGM4rK4+p2QinnSRfIc0dhiCPpTK4oNJibCz1nMNW+837fqCCGt+XPez5IPclbkp07T0Ocf4GKpl19R9fEztDhEL1vHyGTt26B+NP00Zb+bczTwBYAIiANyGiSMK4QW3CKLyJKC8sU5iIPuQi3iXBSH6HPmOVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRjBOrUN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRjBOrUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752676368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dPEOMS9uwY37weCLvcDPRO7UbyKU9Tf2sqinEDH0Om4=;
	b=WRjBOrUNuAB9D9anykEInoL2rLKtpKSOKvqrLQFU4UzUIdqwVwC8lyMzraQfCh+4GRTCZX
	J+iRvtwOCBe0sR+ejlg/vbz/J89gtgDP4EJyoyKqcqzTCw5VHR7R0ZOgvjIvZgdVdYk+Uj
	xQxvC1OT3ybnYyGh74wVP4l1GEzg3LY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-T_YALRikMBK6TVNuL-GNNQ-1; Wed, 16 Jul 2025 10:32:47 -0400
X-MC-Unique: T_YALRikMBK6TVNuL-GNNQ-1
X-Mimecast-MFC-AGG-ID: T_YALRikMBK6TVNuL-GNNQ_1752676366
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-454dee17a91so52346535e9.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 07:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676366; x=1753281166;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dPEOMS9uwY37weCLvcDPRO7UbyKU9Tf2sqinEDH0Om4=;
        b=K7xn/2uZiJ/uxpBTaF2ARRU9VAZUQDuHk+j+a0jRS7Q9oZJjInIDpJBOAG89f+6tuT
         WtuCpsiG7lvDdrcaBkUdOJQ6ejmiB3GqlkIu8caUQZaIAInSiXiOd0GSwTXPVJHovS4h
         paBcW7Rft0nnJ13KsIFn20WtqRC7luptrLjqJZUyjvblaZX4iNSv0ItfK5O49LBAYSo3
         0NfAkVMl3Qs+d18nMaos3fD5lErxs3F7qtqzskXphM+MM4bgjsraziL0SsQSnbYpD3KP
         ZzmDzQzfe/+pppWo9EzRW1iv67goppheKjWgx5UsEs+U08alT2rfBc/YcxihA+ymBI9S
         Te9g==
X-Forwarded-Encrypted: i=1; AJvYcCXUa2IbyxOIHjdNXPTG5qS1oPSp8bPtUdVVh/hlqKrEH6ck6CWmYw3yfOaTMfoqtqhbLnB4D5RPJD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJfLNW5yOLpOupIkI65Sl62ZWk6s6Fu/F6xVzC7Q92+FcO6iz
	87r4y9e39U+ZhN3bBhxn57tdcjF9UZtTojV+idr+PlcuhJqIvF7LrQh13EYOmYAJz82AojocowT
	zSEXXpkJcIToBGj4tC/5YZ/d1UWVEqD66Be2769H+Z90meo4Q1SS/bOppxW7s3Q==
X-Gm-Gg: ASbGncsFQOPr3fMJ+bFsEJoGd8CqPrjEyXpey/mEhW0JnXmJjq/3QhHq13eb7jkpOmM
	PUQ+ls27seAGCRwXg6C6JA/X4zHijgE7zUD3xs8PMecQDY0eA4ODd4bKsmi6Lbq0pPM9tUW3AzG
	y1qnk2DgZlyZoy/j25IxGNbzuXAGtUVoJl8iPBxkE88+x346iRxCi/kwvuCxNzy2EobN8Kfnbmc
	OWu+vngYre30q9WOUGhk23ano9JCSkboDrOQevjl5kQIX419W+mvOggLzTdxDdyr+H/y+KrtCo+
	ryYUSI0abvLeYD7eQD9ttCPGvuPlnkEPfW/zU2VWc3zckOB3C9SOvOPD3gF/PUtkpHpy8YoMt07
	I3B7SYmNZY41ZMp0NzSDad/pR2Vs9p+Xde2BKpzbXc3AZ5la4rlWeVCrrMPtkB7syxzU=
X-Received: by 2002:a05:600c:3b97:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-4562e3a29e9mr24451145e9.23.1752676365910;
        Wed, 16 Jul 2025 07:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZMT5m45p1tCk9bvbDvVlLWULYFUoSYYJMJ3qlLHGbNtVt/1JcySJN5NgVdjsnSgos3dkhXA==
X-Received: by 2002:a05:600c:3b97:b0:456:27a4:50ac with SMTP id 5b1f17b1804b1-4562e3a29e9mr24450675e9.23.1752676365450;
        Wed, 16 Jul 2025 07:32:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1d:ed00:1769:dd7c:7208:eb33? (p200300d82f1ded001769dd7c7208eb33.dip0.t-ipconnect.de. [2003:d8:2f1d:ed00:1769:dd7c:7208:eb33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e0d758sm17727799f8f.49.2025.07.16.07.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:32:44 -0700 (PDT)
Message-ID: <290d669f-e358-471a-95b7-c46f974742d0@redhat.com>
Date: Wed, 16 Jul 2025 16:32:43 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/14] khugepaged: skip collapsing mTHP to smaller
 orders
To: Nico Pache <npache@redhat.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com,
 dev.jain@arm.com, corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, akpm@linux-foundation.org,
 baohua@kernel.org, willy@infradead.org, peterx@redhat.com,
 wangkefeng.wang@huawei.com, usamaarif642@gmail.com, sunnanyong@huawei.com,
 vishal.moola@gmail.com, thomas.hellstrom@linux.intel.com,
 yang@os.amperecomputing.com, kirill.shutemov@linux.intel.com,
 aarcange@redhat.com, raquini@redhat.com, anshuman.khandual@arm.com,
 catalin.marinas@arm.com, tiwai@suse.de, will@kernel.org,
 dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org,
 jglisse@google.com, surenb@google.com, zokeefe@google.com,
 hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com,
 rdunlap@infradead.org, hughd@google.com
References: <20250714003207.113275-1-npache@redhat.com>
 <20250714003207.113275-9-npache@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250714003207.113275-9-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.07.25 02:32, Nico Pache wrote:
> khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
> some pages being unmapped. Skip these cases until we have a way to check
> if its ok to collapse to a smaller mTHP size (like in the case of a
> partially mapped folio).
> 
> This patch is inspired by Dev Jain's work on khugepaged mTHP support [1].
> 
> [1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.com/
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>   mm/khugepaged.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 5d7c5be9097e..a701d9f0f158 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -612,7 +612,12 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>   		folio = page_folio(page);
>   		VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
>   
> -		/* See hpage_collapse_scan_pmd(). */
> +		if (order != HPAGE_PMD_ORDER && folio_order(folio) >= order) {
> +			result = SCAN_PTE_MAPPED_HUGEPAGE;
> +			goto out;
> +		}

Probably worth adding a TODO in the code like

/*
  * TODO: In some cases of partially-mapped folios, we'd actually
  * want to collapse.
  */

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

