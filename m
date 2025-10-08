Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4392F2857E0
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 19:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950078; cv=none; b=iTHxT48CY0FgU/9ExXzf9LI4+zzqg7c4miK+qQYKZyi/v0ijz7RjCHOqVd5Spw/yo4QG68pyw07OLZSRPoSlSCFcxv4435w0kcH4/1egiHnXKRFs+rkxEABLF1XW+Rr/pbJnpETv7fFzzpXqXtr+If7Y45NcpH/iohdWw+mO2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950078; c=relaxed/simple;
	bh=ZbOcDrJPTH73vir3XLHLdPGv6F1OMbzcI+LUEUpPNsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkanbFXb6On+b/mMEWqqHC4sEINKNvC73buCumYwZ+JXWsEwKyJ9dhq1oKvZbtnWcFTV1xXADUBryaqKcGc94k7PSxuRLBquP/cz+eiZN5nRZttF1sQiaGbxJeMM+IV6OW3LUyD8hzyIZ9J4i7T4YDa0h4P8iGJAlRKBBdOoQ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XrImTAJi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XrImTAJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759950075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xbDB48GoIfubfhUk0lRIFFeY6aC6AxZ+kgHto7K7Oxc=;
	b=XrImTAJiGxyxw8sI2FCBwvDtGh1uETgo8WMe9qX9goLQiPNMu/H0PlTJnGQ+whgO07fUez
	ZqA22Hf5a4CopPqw4dQ7fxXkHsLj5Bb8rWuM+8H7Qg57+t/n+zEXrp8A5M65mgt2JCzsqT
	dz6ugecgkdmKDiU9RAgfbB7OrLHmdkc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-ViLFOdjjMfKUmcD05du-Bw-1; Wed, 08 Oct 2025 15:01:13 -0400
X-MC-Unique: ViLFOdjjMfKUmcD05du-Bw-1
X-Mimecast-MFC-AGG-ID: ViLFOdjjMfKUmcD05du-Bw_1759950073
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso1062295e9.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 12:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759950072; x=1760554872;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbDB48GoIfubfhUk0lRIFFeY6aC6AxZ+kgHto7K7Oxc=;
        b=VooCs5AaJVHB7J4EsqlFfiA0zXWdbXzqXDdhNhp4KtOdGb3Yg+sj7xU/aMnHng7a9+
         2SUwGCyH6oSQiGXQBU/j6g6rDmSKdX+G0RCHN1YENd9/q62kDZ0K4yaga+YtG57kLZ+U
         B4fDpScDzEbbXXmkw+ndV25MFdZhZ/6jOOo8pUbEs3wkz/odOMQO5BaR52fIbcS4SEts
         Zv64Kdt3FqeBcB6nLgmAH5fl7mary8/jdCH7hrjgZQzhtrqPJ8uDiaf9YLxTF4sHp3Ka
         uuf89C/rcGXX2PwpgClzz4hTl1yHERTQOqKyNyF4vs3/Vu6phKSdhrbnuAmo3C+W8p6h
         gyqA==
X-Forwarded-Encrypted: i=1; AJvYcCWNbh0yEm7PWBJYXaA7eESNrIIOBTMWUeLot81ppa1i3vK70L3JBjuaSQxMO8O4aZ9is7w7yLxgPsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEZOzFTAITVZuwyhh3rOvAfr1vDEYiIezCNk+OWv62gBY8PNp
	ibGbu5WYP6WU9f6uGMYwHiX6X2AXyI/wPdE3jrHcBQvaWdObdWi8Fpx0nOhJDuMM91XeEBg6nL/
	bN/x8jI36HTUT4OQtLcGVAqYeAs0fVwinL9ybxatiAL6LU/Fd/l3co8cXEf6Ydw==
X-Gm-Gg: ASbGnct+dwKbpoMrsyDamHgRGtUj557902EBvPzReoCDKR0aVQxD2NKspycHux4Ye6f
	DT/1IhPoyZggIjx8pi5iQnrsJwV3LmT6gZweS+/SlQm608HFANvv0Uk84g/K3DbOyw3TjhIkLww
	8Doh8W9xsKS3du4zBOH3CjmZR6tuvvcf3jq+reU/T8eZaXlT+D0gJat8XaBPKbDBIOEmrkTH4mB
	TOPkbjAcKGOpPIhZqaHgGznJs2kmdND1aFaG4LsOiF4lX3EKjpzhYD6xO45gF14pd9p8NejRYuU
	Es0C0T+z9w9roMF4ck0Kctrgn9na6PZ/FJ0MkZkNfqUnkd7xIUAEPdWjhK86Z1PHPuyQMCu0b8y
	gyjAG6Yb6
X-Received: by 2002:a05:6000:4201:b0:400:1bbb:d257 with SMTP id ffacd0b85a97d-4266726c2f0mr3059269f8f.26.1759950072437;
        Wed, 08 Oct 2025 12:01:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+eGTotVGiFRKomIEq6GkpKr6FGrcxlMRZd7jUbDDAkTfSgQerCvnSBP6CMzqlbSkIjvKLIg==
X-Received: by 2002:a05:6000:4201:b0:400:1bbb:d257 with SMTP id ffacd0b85a97d-4266726c2f0mr3059240f8f.26.1759950072025;
        Wed, 08 Oct 2025 12:01:12 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe90sm31001480f8f.23.2025.10.08.12.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 12:01:11 -0700 (PDT)
Message-ID: <b6d472ba-e6cf-4c96-935d-88c842ab3cd8@redhat.com>
Date: Wed, 8 Oct 2025 21:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
 laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
 joel.granados@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Michal Hocko <mhocko@suse.com>,
 Alexandru Moise <00moses.alexander00@gmail.com>,
 David Rientjes <rientjes@google.com>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZyt-7sf5PFCdpb@gourry-fedora-PF4VCD3F>
 <f4d0e176-b1d4-47f0-be76-4bff3dd7339a@redhat.com>
 <aOa0UPnxJVGvqc8S@gourry-fedora-PF4VCD3F>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aOa0UPnxJVGvqc8S@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.10.25 20:58, Gregory Price wrote:
> On Wed, Oct 08, 2025 at 04:44:22PM +0200, David Hildenbrand wrote:
>> On 08.10.25 16:18, Gregory Price wrote:
>>> On Wed, Oct 08, 2025 at 10:58:23AM +0200, David Hildenbrand wrote:
>>>> On 07.10.25 23:44, Gregory Price wrote:
>>>> I mean, this is as ugly as it gets.
>>>>
>>>> Can't we just let that old approach RIP where it belongs? :)
>>>>
>>>
>>> Definitely - just found this previously existed and wanted to probe for
>>> how offensive reintroducing it would be. Seems the answer is essentially
>>> "lets do it a little differently".
>>>
>>>> Something I could sympathize is is treaing gigantic pages that are actually
>>>> migratable as movable.
>>>>
>>> ...
>>>> -       gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
>>>> +       gfp |= hugepage_migration_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
>>>>
>>>> Assume you want to offline part of the ZONE_MOVABLE there might still be sufficient
>>>> space to possibly allocate a 1 GiB area elsewhere and actually move the gigantic page.
>>>>
>>>> IIRC, we do the same for memory offlining already.
>>>>
>>>
>>> This is generally true of other page sizes as well, though, isn't it?
>>> If the system is truly so pressured that it can't successfully move a
>>> 2MB page - offline may still fail.  So allowing 1GB pages is only a risk
>>> in the sense that they're harder to allocate new targets.
>>
>> Right, but memory defragmentation works on pageblock level, so 2 MiB is much
>> MUCH more reliable :)
>>
> 
> fwiw this works cleanly.  Just dropping this here, but should continue
> the zone conversation.  I need to check, but does this actually allow
> pinnable allocations?  I thought pinning kicked off migration.

Yes, it should because longterm pinning -> unmovable.

-- 
Cheers

David / dhildenb

