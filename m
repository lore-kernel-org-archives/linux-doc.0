Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637141FAC4D
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321136; cv=none; b=XN0WcPAUbcl+pjzHcJXOSg7PC/5KAV+MFIrbCHgRWWFOq7byeNUKYdjmUMz8JwyM10hh58MoQfZK6jk/iUkCUbJ9iua5yItoCGsu/FuG44h4QWyGHZWWxUFlCvlF5UfoN8gfmvP5SMy3S6PMoqqy1/hJt/TtKYeE4iHOHl3zdfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321136; c=relaxed/simple;
	bh=r6lHcZz9goQTR/AdHXm2xzjAabEXma+tWde/d6HxJv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIZNyIGw+wXmta//b7irJVoBkxtBljuGHvuawvtedFkxltbQItHjxT/ssO31b88z00Xqwd8fuOGMCk5owhJLn+hNU9Sd/uVm1iDU4K+nKO21mx9RB/pXWw/S4/0TdBxIOAXw2f4hmQxjmLJRfGvLvNsve5b876ZhX71pvrQ12xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=geD85YXB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="geD85YXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747321133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/CxE9bCL5PD09tQ971VmxfUOU3wTfEij7H/TOOZj92Y=;
	b=geD85YXBxdrl5GkWtQ13bBUesbehoVoG33DuAJYUR6ud1wbvDpRolE8HYC4nUH8M2oyzqN
	m5VnJ7usf8/bqZlj52uCBvH2f7U4Jzm/H/aSDSTO7vpkF08SqjwYQH9Xeb6jCjm9Nm52nt
	QYnUslB6oJ5IfdGA8CDwjhCP9ZwMovU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-R4rm0W2uMNuSquiMI_nm9w-1; Thu, 15 May 2025 10:58:52 -0400
X-MC-Unique: R4rm0W2uMNuSquiMI_nm9w-1
X-Mimecast-MFC-AGG-ID: R4rm0W2uMNuSquiMI_nm9w_1747321131
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so9930825e9.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 07:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321131; x=1747925931;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/CxE9bCL5PD09tQ971VmxfUOU3wTfEij7H/TOOZj92Y=;
        b=YmOPmIt2qfb3NMYsnZ5AzGp311ovB7S9hYzT3PYxs5h7ykNF1E8x5mGNik59wzqhOr
         5FAdw66bJqokCyQVRpqg1iqvHyDcOhgEynhRUMHnlKmRbD1kCs2j9/+iTpWTSBUXmVMD
         DGCCwVzUHyv+fnnc34gcyJI94WMDrSZ1l/uM7LszhpIgQcUSLzliUmcRTDNOZdLV4Zmo
         rY0ZEKfaU2jlFlS43+AZeJoFV/+1VA3QCC8Btl/YNVcwcysgjXlFDob9A8/WeESY+jm5
         Mtgzo6LuGKg6oxWvWfY9bUl3zflq+EHn7PudQkyducT8I76RyUsSPDZ8HMX1RWnIeWxq
         4YbA==
X-Forwarded-Encrypted: i=1; AJvYcCXlT8WIRa5sMpEFj2eweh734iV5fGmZOStG9fzyu0XWtcchhniAEgoawy6ieHDvIumYU+LIcUfO5gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNn7h1FFSeq6XZLHShFXcLB6z4PhpH+D9uT0HBB/KAehpDnTdk
	bpyLByGlQdaC6P64APDexXCqx+PxeR4Zy5zIN2/Jmbtooq+tJnE/Hsr0a7wDDy/TOrW0ShrbAKq
	3NjUOX/a61vJuQfs7IbM7v7dzav3uv07gdaTwaRDFauGln5rqGE6kua39lQ==
X-Gm-Gg: ASbGncue9McyUgXyTyY7G3dp+bANzCNRw9fneWEbjPkBx2zN0RKO5OtdYUZWMroGpPS
	BPGkyqgwN3zEi/wrYApYuzbP1nwX0nbXxnTaFJW6hq9tNInRuuw8F7FaKyP3Buny05Biz0mnYEm
	TGDaPOH2/wgJ26Go6FKyln7jsihgkJU/W2lvBkcoJrFNik55zjvrNCCFxgCwAK8lTD8yifKfL53
	SaGCOClYVG+HHsFm/2YfxqHw65iNngwz/NcrJvyfHowx0BaMXfipZL6G2g0Wu8frJJtVUXh06z+
	G8gSvgTmOgQI5+8WPQK6MvzM4eUBcmvQkn6aLDUZ6Bp3oXgCsDbjxiJdXK2nGG+zakpBn1OJzPq
	UKV8AjXJ3g2uonxwKGKwJgbjG08g4gK0YpEOUiwk=
X-Received: by 2002:a05:600c:348d:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-442f84e4829mr37728865e9.9.1747321130899;
        Thu, 15 May 2025 07:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV0v4kgJnVftN8hTEWOyIU15LHHnd854OQF9+2k5U+kUqTiu0BYby4vs4uBZoCdsxBZlvJjQ==
X-Received: by 2002:a05:600c:348d:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-442f84e4829mr37728585e9.9.1747321130472;
        Thu, 15 May 2025 07:58:50 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef400sm68706915e9.33.2025.05.15.07.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:58:50 -0700 (PDT)
Message-ID: <51aa0ced-e736-4eb5-a376-75dcb30469be@redhat.com>
Date: Thu, 15 May 2025 16:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Usama Arif <usamaarif642@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <47603579-4d42-4617-8386-6656341c8d56@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <47603579-4d42-4617-8386-6656341c8d56@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.05.25 16:56, Usama Arif wrote:
> 
> 
> On 15/05/2025 15:44, David Hildenbrand wrote:
>> On 15.05.25 16:40, Lorenzo Stoakes wrote:
>>> Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
>>> outlandish stuff and needs discussion.
>>>
>>> You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
>>> never is completely ignored and overridden.
>>
>> I thought I made it very clear during earlier discussions that never means never.
>>
> 
> Yes never means never

Good, likely worth stating that clearly that there are no overrides (I 
did not look into the series yet, I was only responding to Lorenzo's 
concerns) :)

-- 
Cheers,

David / dhildenb

