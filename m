Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78828CF5F
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938212; cv=none; b=iIwyJL0XcoeabIID0iQawYjHzR6FmeMnMdSo4SeNOlV1fzyAEfxOfEE7SHwDLsWVV38yHb/ChvfChh/vvhPuztAlcDyWMIHmvmkacVUL0CHf1CVz/loFaQYbBALFeUF3I2c+PIubkG2slPTy6zs140FCdeJL8eMNvfLa4n8hC2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938212; c=relaxed/simple;
	bh=ERlHrk6EJ6JZBnRe2MdPcCm5Je+F3pbGM2LW3RuE074=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KjA22E3lvDFyr7DDZbLu1Ll4fUIcEuczuloF8bili7hlayF/xOyHeWljtfvoeVO7bETDGcm5S2q72+eqtPONjnSJ2pidq8phd7KnQzhbOwwVBgmljHICXSO6zK1bhXUHWYI+2fY8TL9KxU0OK+bhAhfO7nfQGcHg2qi0RMzvXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G0jy+nMg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G0jy+nMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759938209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YUhSb2gRG9q7wfoqgmoV/rOSyHa9AmwtjacpyBWGooo=;
	b=G0jy+nMgii99F7EGr5iZ/7JuNu0x3qu/y2h0XwlZtJphzo3mwSxZhAoqFpUnGdeBkIYHS1
	wLQe3a2DoEJqVd7/9mA2cKJam/1COn85A7LWwdp3jhk0t96/DFDRQI77wZQGADe594MAoN
	bFzO12lLqjhQOfrrwUc1xHVuPcGSzO8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400--p27-knsPgm2fVaQkBkY0A-1; Wed, 08 Oct 2025 11:43:28 -0400
X-MC-Unique: -p27-knsPgm2fVaQkBkY0A-1
X-Mimecast-MFC-AGG-ID: -p27-knsPgm2fVaQkBkY0A_1759938207
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ee888281c3so68973f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 08:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938207; x=1760543007;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUhSb2gRG9q7wfoqgmoV/rOSyHa9AmwtjacpyBWGooo=;
        b=l0agJD/XQG9noHu9xS2TtXuScHLPlaOx0GJTW7+DYmO6WvhSZYMljSrBO11uZdAG9c
         Yp/+yufkujm1Cvr5j8bOHe8MGHLu/3h5PIaYeaLk2OjMg5xANsPZDqzHpj21xHdUm+gL
         3CKFCrnb1kprc+bEg5TsN+n2QHDvnqpe72XNTEcOkXsjR9g4lp3B5VZ0EDxybAwqQ6Rd
         aN/JdajvPKSO65o9QYzBlgCXPmX9Biy1n+pqgus2t4odyb8+f9RYihwpatW/zkmAeBJU
         c5geOq3w4ZNtaa1b6RKxEegP3Kv/kFoQ2J765KaEREjwbdMOwP/n6qdoRQXef/KEPFhM
         PNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlmf+8zjLliomoxurqXnGXCgLTUi06PZKV42toIysaSwPCpS5j6rALohWqWi9CSm2NgalwQL7UCGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyoPYga9s7tyjlUpEJvNREFa7nQOSWXHs93PTq2xfKinV+BHR
	3/3eHeyrDmidBfA7vwkT6QGLZfmC9Zb5JBSk9vvt7XuYLcgFKEtcpMytK96xESavU03qi7afURf
	T8kivb0ZmG5KJ+sI6ktn6PSG6dUCwjSIK1Mc90G5roif2Z4Ufp2f9FoW0GVXJuA==
X-Gm-Gg: ASbGncuWGtkWjzx3t7U5iRX4/usytLoT/egieW2qNCM+nj18fXSoeMsOjBnqhZXZ6WI
	bS3icSpJzrHJfLNMZdzgf80bVilp8y7E0QCQIEGIY3C1B1aZlto3M4YStOcKHhDIr16YgqqdYh0
	a1GTf4knT8N7SGFgOwfpsxDvHwHERgqrs4Tum4sLCT4D5FaNnwrU8CfOaxDv63V+TcoUxD59e6+
	F6xkGUmN1g0IBNWfB+S4hz7Lp6wXEo+68zDuCZcpv+Zfw44ajiNEDRR3qiBbON8Oby97j+mprcn
	WA3FJAOqKDNZNKD0sVSBalXMd57kck1H5xBZDU0I3qBuf4CVl+SZuOZGj75Sq7rdwpVChODGoll
	1lGGY9W3q
X-Received: by 2002:a5d:5f47:0:b0:3eb:c276:a361 with SMTP id ffacd0b85a97d-4266e8dd630mr2663640f8f.54.1759938206751;
        Wed, 08 Oct 2025 08:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg/1BjAZFBrqRhTVifCxpXqhRM9mNYNtgY3LS18mLzhLVabrk7varIJms3tUeaWhS9aL+yvg==
X-Received: by 2002:a5d:5f47:0:b0:3eb:c276:a361 with SMTP id ffacd0b85a97d-4266e8dd630mr2663607f8f.54.1759938206331;
        Wed, 08 Oct 2025 08:43:26 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4bdcsm30484973f8f.54.2025.10.08.08.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 08:43:25 -0700 (PDT)
Message-ID: <83e33641-8c42-4341-8e6e-5c75d00f93b9@redhat.com>
Date: Wed, 8 Oct 2025 17:43:23 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
To: Michal Hocko <mhocko@suse.com>
Cc: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org, corbet@lwn.net,
 muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
 hannes@cmpxchg.org, laoar.shao@gmail.com, brauner@kernel.org,
 mclapinski@google.com, joel.granados@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
 Alexandru Moise <00moses.alexander00@gmail.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, David Rientjes <rientjes@google.com>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <271f9af4-695c-4aa5-9249-2d21ad3db76e@redhat.com>
 <aOaCAG6e5a7BDUxK@tiehlicka>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aOaCAG6e5a7BDUxK@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.10.25 17:23, Michal Hocko wrote:
> On Wed 08-10-25 17:14:26, David Hildenbrand wrote:
>> On 08.10.25 16:59, Michal Hocko wrote:
>>> On Wed 08-10-25 10:58:23, David Hildenbrand wrote:
>>>> On 07.10.25 23:44, Gregory Price wrote:
>>> [...]
>>>>> @@ -926,7 +927,8 @@ static inline gfp_t htlb_alloc_mask(struct hstate *h)
>>>>>     {
>>>>>     	gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
>>>>> -	gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
>>>>> +	gfp |= (hugepage_movable_supported(h) || hugepages_treat_as_movable) ?
>>>>> +	       GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
>>>>
>>>> I mean, this is as ugly as it gets.
>>>>
>>>> Can't we just let that old approach RIP where it belongs? :)
>>>>
>>>> If something unmovable, it does not belong on ZONE_MOVABLE, as simple as that.
>>>
>>> yes, I do agree. This is just muddying the semantic of the zone.
>>>
>>> Maybe what we really want is to have a configurable zone rather than a
>>> very specific consumer of it instead. What do I mean by that? We clearly
>>> have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
>>> zones. So rather than having a MOVABLE zone we can have a single zone
>>> $FOO_NAME zone with configurable attributes - like allocation
>>> constrains (kernel, user, movable, etc). Now that we can overlap zones
>>> this should allow for quite a lot flexibility. Implementation wise this
>>> would require some tricks as we have 2 zone types for potentially 3
>>> different major usecases (kernel allocations, userspace reserved ranges
>>> without movability and movable allocations). I haven't thought this
>>> through completely and mostly throwing this as an idea (maybe won't
>>> work). Does that make sense?
>>
>> I suggested something called PREFER_MOVABLE in the past, that would prefer
>> movable allocations but nothing would stop unmovable allocations to end up
>> on it. But only as a last resort or when explicitly requested (e.g.,
>> gigantic pages).
>>
>> Maybe that's similar to what you have in mind?
> 
> Slightly different because what I was thinking about was more towards
> guarantee/predictability. Last resort is quite hard to plan around. It
> might be a peak memory pressure to eat up portion of a memory block and
> then fragmenting it to prevent other use planned for that memroy block.
> That is why I called it user allocations because those are supposed to
> be configured for userspace consumation and planned for that use. So you
> would get pretty much a guarantee that no kernel allocations will fall
> there.

What could end up on it that would not already end up on ZONE_MOVABLE? I 
guess long-term pinned pages, secretmem, guest_memfd, gigantic pages.

Anything else?

I'm not quite clear yet on the use case, though. If all the user 
allocations end up fragmenting the memory, there is also not a lot of 
benefit to be had from that zone long term.

-- 
Cheers

David / dhildenb

