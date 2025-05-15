Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB60255E44
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 17:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330207; cv=none; b=ehLhJe9gfroXf3q1UTbWGwdhLK/5oTc/kmny+SpDRJH74idj3e+1rcipuaKePRqyJnv4OKVfF77fqvDPCXBuFbPcI6aEkq1PIO8Scb7rDFujvpZ8F2+lPJL0v0h+CUVhbesoq1z+KhBrfm7zLvV1XfaZQToTEY9XdLK0qnBolQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330207; c=relaxed/simple;
	bh=Wu9CN8cU2eIJLPbkclunjDQBHOB1LGeNCMobWcJMl74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naZgd+m4rTaEVS2IQNnwyWZag2du9arV1EH6heuAqm5s+jbDnmgvVn8qIksyVybGX71B0YLY1iU60Zc9q94Tgs+BFHTW3oJYXUOEBXW02HpVmLuWWJOUABBh8l4uCXUk9X7THo93dQBfdnrrqCMXN8Gf28T0dent1wGmLZtnAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M0o5uutB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M0o5uutB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747330204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iAWWIGzcWMSzmzl7vBt9br5Ej4p9kIiuncRmzg0hyns=;
	b=M0o5uutB3r84n8jPHeYEhcy3+Ca9svhjsbbbB63XQ5bTbOHA50Rc2kRV4NjIr3P2oDMqcu
	TeCtYKEy5tHiLf8MUN9v5pIN4sXhcdkcQmd/3xHSHBxsSAYnESkt7VETlrfO0H+EZMvs+k
	CjWCmxwUMLlJ3ipW/qCjk9pz/vFDBmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-dSTRp7siOkaTxMiEvB7H-A-1; Thu, 15 May 2025 13:30:03 -0400
X-MC-Unique: dSTRp7siOkaTxMiEvB7H-A-1
X-Mimecast-MFC-AGG-ID: dSTRp7siOkaTxMiEvB7H-A_1747330202
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b9bbfa5dso600802f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 10:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747330202; x=1747935002;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iAWWIGzcWMSzmzl7vBt9br5Ej4p9kIiuncRmzg0hyns=;
        b=ESaZNxhtzQ9wfi5o/B7GLHnHaQYivu94BcfVF4A1I4aAUimva5QuYQg0wRz1NadYkp
         oZyngKTClbily2P4EcWZKuZNE3qopXXC1O8/Z4aYoutnGw9FunhBubFFcUHCx8Pid5HA
         lpviUQmy1aO9XKEMUXmEPK27OOmVh4+DGYxDFyfPfoXNW2u0MYV4uLzthHlWH0iU4Zuh
         TUM28FFu8Kz9OS7waJJO+/d6Hl8KVWdGnXYs0HNh0kaUhlTwoZoZRqnw1Y3EMqwUO49f
         tJmiPgqGiFk2gvVtx8dQS/dEyYnWog3RVzdZwlK0WpwsbrssQS2apV0haV9cffrKQg4Z
         WC4g==
X-Forwarded-Encrypted: i=1; AJvYcCVlAitbQGW1/HvdBl9xHYl0AaP+uu8fPR4nVF+rhMrQksMneB3q9Cn7/fSmRLgHvglz7nuFY/reQ1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvBdBxX1UJ/y1j680grZ1rW09XBUzByA2T2g66RB+OKFTfovx
	kJiTZeoEPZuHxuT25+Y49CRqWH8U5Z8YCiwGzTbcMrwmBVjwf9LlXIQn9ytUYISCq+KOy3erqKg
	gclUs9b+Y7MRnSAIghfAJZ+O+jTKFzFrOf28khqP/sMSlLWYLYeg12SeXhlErnw==
X-Gm-Gg: ASbGncsG4Tq4Y99duPl8SDVCESPoi1iTBUN5J3t34odmuLSnjdSKsWusNpZxfBCpxCB
	7VoaQV98d0PS6vWAGDsw89AxV2Anh2EnsbWJssGy3ONAKmyZoh0ULWYz71rRiZgCL+7RHQGPJDD
	fG3dtMwM8PhlGJ4Oqgn8FDIYL5i4GIIvsBUVBX59MpzgeKzpDpcGvQK6g3Gbi/rcYZ3URfcj9WE
	rK5NVFEtlG/y9NCihqAhWxT5X6JH5aH8yTkL1g3ovHMY5yh89ST0RQF+CFLR61haeimaJcw44ay
	iSy576INaZCFDQpLSWRupr8/5Sxckr1x1Dc/xGrv6XZcpiATLEJxt5VVq6raVeI78XTyScXcELx
	2h0jE1QycAAS0Sway2ZlwpTkHHc4uZpg5OdHjNE4=
X-Received: by 2002:a5d:51c4:0:b0:3a1:f653:85dc with SMTP id ffacd0b85a97d-3a35c856484mr504154f8f.58.1747330201754;
        Thu, 15 May 2025 10:30:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7V3L1qf75ISjjrGSygFxMC/TtU6voWp5U8Jdrr9RczingKOOFm/9Uku/YhzmIMea37oxWgg==
X-Received: by 2002:a5d:51c4:0:b0:3a1:f653:85dc with SMTP id ffacd0b85a97d-3a35c856484mr504137f8f.58.1747330201343;
        Thu, 15 May 2025 10:30:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b1bsm140134f8f.53.2025.05.15.10.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:30:00 -0700 (PDT)
Message-ID: <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
Date: Thu, 15 May 2025 19:29:59 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
> 
> Did we document all this? :)
> 
> It'd be good to be super explicit about these sorts of 'dependency chains'.
> 

Documentation/admin-guide/mm/transhuge.rst has under "Global THP 
controls" quite some stuff about all that, yes.

The whole document needs an overhaul, to clarify on the whole 
terminology, make it consistent, and better explain how the pagecache 
behaves etc. On my todo list, but I'm afraid it will be a bit of work to 
get it right / please most people.

-- 
Cheers,

David / dhildenb

