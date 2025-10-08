Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E5623BD1F
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953151; cv=none; b=WhWNgDSMEB2rQCgjUUjI/CvR1hhSOV94fjpXPZ7XlGc/tbd32fGh/c1bU4fhRRzVY8Ntbr3us/4wwBkkW9NW/uHJt7/PsLmbYwWx1yKZbNfDR8+tp2Xw6PwzwqT56QK+9uy0Xk2t06z3rRwLbVz45/j+HATnxSa57q3p0lMS+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953151; c=relaxed/simple;
	bh=f4lr5plTPmT72ZArDdPUKOMGD7bcpZzT/GwCWENFslQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNgE0yoWDDZebbCMvYLM/P1wV7YOamld1/CyTkcy7k/9qaPNbsR6XdqveUFi9FkZ0HRdaddDVEkvljc4fb9zkwN72UXcrlW/IAEoSt5LM70deSmjABO65+l65BhvXxKqZHjLvUSAdqpFnZswT2oi6/olhKHZYtpqfz+lz6BmCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKAlqxU4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKAlqxU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759953148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RtTlwRw/t9hpT+l94+pAzSz0mGXw5QPtsOjkoODOmNY=;
	b=AKAlqxU4+Icxrnmj+wGyWqPwFKKTtFeVh33XXj9pneYNBkZzmtJ968dbQGvdPrkAmsEKMI
	iIkXpPVo0g9z1kn4+iG7tjaq3GYa/sbLX1litS8TlEFLMSb9OwB4qXKYrZDZE7fNE2XiH4
	bkt2VzBQBFkhwGBhaLTdnvljpSct+K0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-1R5a_-J6PTGGiSSjIH7WCw-1; Wed, 08 Oct 2025 15:52:26 -0400
X-MC-Unique: 1R5a_-J6PTGGiSSjIH7WCw-1
X-Mimecast-MFC-AGG-ID: 1R5a_-J6PTGGiSSjIH7WCw_1759953146
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e3d43bbc7so1044105e9.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 12:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953145; x=1760557945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtTlwRw/t9hpT+l94+pAzSz0mGXw5QPtsOjkoODOmNY=;
        b=MSxMy/Stwli1Q0wC+Qq59bk0BWEnxhTXwtrypdrKcIo/XYyOOTPv/rbaUZ2wny3W1o
         z8E34OuUP9P2nQNvXXKSP/wZE0SWn989h2TopLHYHw7sS0l0WihDVtcS6fAR2aEMTDfW
         jgU/YntWF8hATgbasvZNCFMui6gGbQ9b/AfMlbQvLN/qmYZSfArg7iuqP38XLPzpo742
         bQrA97TyThyKyDfPoQO9ZaO9qT9VxPo0+IVTHQ0jfPjddyrNOqD1axnVeq6EeQwdhfp9
         eOdNlkDJgH0ex6smvycs12FUu/6BLwEst8R3NhWX0Yi4LMlwmk3wgQRCkXHMLSpWPTUp
         0CSA==
X-Forwarded-Encrypted: i=1; AJvYcCUxtFIzPI7sYPAe56E+a0MtyCKxZj2j+1TgzjMtgje5jrtAiI7mqNQu49Uqq+qBPbGU0KUEiH8KneM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZiETvm4Z8awNSETqFrNn7VdlU6Fj8vt6m4PADzi/OhQJcO2B
	pn05StooWE6CW6t/i97t5gMXPCl+9QDMLo+gxfPwAhWNlX3vJFI98KjgA5JcCijTH95pd0gW2Xr
	lo+/Ycs6hjMonoVDpDGQn+vwO9hvzKOWxSENh/eULrteIwLwQyTBb97m+Lj5n1w==
X-Gm-Gg: ASbGncttCxFlFJtM+RSgUAE+sV0ouh8Zu678pHMLpRWotjhRI5v14yW5Z0aq7GdPzJS
	YY8EroyyUD64WXVboddJhgbbD7XZgHT+qpaQJZpt9jkdPfNa5xCTMIyd776pR54YRwmwDMgha6M
	MSklLDvmHdAInqj8ASfunLrW+N6ugGJP7HnyzWuEqJRcr2sz4lwuVfbmEhEQzii9AKxI7v0nL+U
	O9wOFxl7E9x6om0JyLlbuZYe+53nbBLgc+4iWKE1Oo88fI/RHbOxdLnIsLYhshGGdOE9Fs6KOIn
	lV5QLipuoqfVprvnB5T0CQ+52RbZ2EGRtZeeWND6rOTmxQvPVWtOM3CVrDhqo7X5JhfEJAcgvAE
	Lv78hb6AM
X-Received: by 2002:a05:600c:529a:b0:46e:3e25:1626 with SMTP id 5b1f17b1804b1-46fa9aefe15mr33101665e9.19.1759953145620;
        Wed, 08 Oct 2025 12:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMCtqEpQgXh2ZeUUnrUMZuhOCP6i4VisyQMUewSPB0pVRauuNVK/j/FRYcpK2qrZwm7+c6bg==
X-Received: by 2002:a05:600c:529a:b0:46e:3e25:1626 with SMTP id 5b1f17b1804b1-46fa9aefe15mr33101455e9.19.1759953145211;
        Wed, 08 Oct 2025 12:52:25 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9719sm31915894f8f.31.2025.10.08.12.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 12:52:23 -0700 (PDT)
Message-ID: <1763f0d9-37fc-4c3e-b31b-2cfac33d5c95@redhat.com>
Date: Wed, 8 Oct 2025 21:52:09 +0200
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
 <b6d472ba-e6cf-4c96-935d-88c842ab3cd8@redhat.com>
 <aOa_A_i1HUt1wzCj@gourry-fedora-PF4VCD3F>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aOa_A_i1HUt1wzCj@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.10.25 21:44, Gregory Price wrote:
> On Wed, Oct 08, 2025 at 09:01:09PM +0200, David Hildenbrand wrote:
>>>
>>> fwiw this works cleanly.  Just dropping this here, but should continue
>>> the zone conversation.  I need to check, but does this actually allow
>>> pinnable allocations?  I thought pinning kicked off migration.
>>
>> Yes, it should because longterm pinning -> unmovable.
>>
> 
> You know i just realized, my test here only works before I allocated 1GB
> pages on both node0 and node1.  If I only allocate 1gb hugetlb on node1,
> then the migrate pages call fails - because there are no 1gb pages
> available there.
> 
> I imagine this would cause hot-unplug/offline to fail since it uses the
> same migration mechanisms.
> 
> Worse I would imagine this would fail for 2MB.
> 
> Seems like the 1GB limitation is arbitrary if 2MB causes the same issue.

Yeah, with hugetlb allocations there are no guarantees either. It's just 
that page compaction / defragmentation makes it much less likely to fail 
in many scenarios.

-- 
Cheers

David / dhildenb

