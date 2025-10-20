Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6822B2D3A7C
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991704; cv=none; b=Dr+4eJf0V4Y+FrJ6DPJdtg4qDCV44VliTwBAbZl2/XkV4fXDMpR2uAvTilamihI+wgLf1VqISZ02cO6eUw3BacbTP7xs/tdt6hcxxnp06OvTFuttvHM005WFVen0F55DBlsr4EcEsKLHOFDSTHdZtHHOl4xmz2PczgEViIH96ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991704; c=relaxed/simple;
	bh=O7ggk7Nya2Zw+h3bXNG0Q1fd+e9Ti+fQIx2OnLYhtnY=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T8wp2SjyeMhDlS4wRZrna28SwI+Sa3Vyoswe+rNnh+eT2I1L+PosaTuUkeXZXtsKRdBukuhjp2BCJ86Np8Z9TNuFJBMH1lL5PfDvP+Rt0fZdcikQlmQDom0kkQBU5LJnyGCcv5bmYTHGwKXIVM35jFnvnyFogafCvYVdDZ7iXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+g0PzcG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+g0PzcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760991701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4x/uC5ywndvfKWeWSRFra+0XOEMIfHFjLjomZb3RbvU=;
	b=F+g0PzcGroQfjesy3mF1zl6GoftZIkcZyB+WiRmdjaTtqbnfsunplo48Ul2zXnXqiZ6hMM
	Ywa5vYQcjxQHo86637o0A5SMFLCOgtXTz8hYLY6UBNMiFcE+pwVf9oWSouaPEOp8b2w6vB
	PMs6JKVzEio7KUkEa+YsMi/5Y/2bG/Q=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-teljxq4vMMCwpB3z6z--VA-1; Mon, 20 Oct 2025 16:21:40 -0400
X-MC-Unique: teljxq4vMMCwpB3z6z--VA-1
X-Mimecast-MFC-AGG-ID: teljxq4vMMCwpB3z6z--VA_1760991699
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e91599ee5so1230652185a.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991699; x=1761596499;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x/uC5ywndvfKWeWSRFra+0XOEMIfHFjLjomZb3RbvU=;
        b=ukWvMfbX7xCWFtJzFNyCkeMdPfvJySa04TBOErDHDr2OaEHGA9pcU0Yx0P3ulEnlrZ
         u9iD/B0tdQcUXzmOntk9XinhfqXrjEJVgwa81H64excQRjoLQNia2B9ZHR03an6/nfIq
         rG2liVLOE9VJFI9zG4k/MTjtimL04QcooTEgTF/lGVoCIv3lWxbERW91aPPc6Gp9L0+s
         lNnMhMGWb1sRUNVIeGZNTTnvjSV9Yy0eAAht+DgFnhZn2WADVXrQ6QRi5WHBX1L11lwW
         Zho8oFFPHV8xXFFHAspA9IkpawI7XKxUXP618v7+yMStH1+Kt4kmWG4seJ+EVl48gxfN
         uCMA==
X-Forwarded-Encrypted: i=1; AJvYcCUkqtD8N+8aDuajmTQlIeKLCRpsxg8gQyL+TO4SP+htMoJ71oHPwAWGE6EwPi4yTcP2/LcdpgZBiuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdfsRd6EoUTljBSBDMtH/JPfDUiJXrrSg3oABiGDkEVtURyv8
	N5oazdgAposS96VsdWq6J+3/p2D5f1lw9pbOm4sTgzukFYkZHE/9Co/jFxIjrCwn+5nSctArCkX
	ddj7K5Nc5g3IoQDAicZZSJOpan4s9eGsCLPS2t9vD1qAKUNUOa/WXNobDva67Ig==
X-Gm-Gg: ASbGnctXPwSaZlvnT1cwZOu5gMygX6lbNrkYlbgZThvdLUh+6AACX8FD5FpOYM7SiFc
	+gg+d9pYtr7ghM/KWE1G0/FbsLsP2V61cwaC/419SQ0qRXnyQE099Bwh6sgK04XcgSJcyT43x1H
	pmPDi4GhfacJyqPYNARvu5oX6r6M4agWF8WRP0V7qIR0CJfvRLxinNoHOaiSV0XA4F/AF3MrTbb
	wcWX+s4Wv1C0lVu2B6z2mKe5IR3riZl89jTXe67A55ls3OmT5EuhcGMsfxPBAJnkaD6qQhoBkt3
	9YuORY+tIJldN9mjWd241LNYzxB6nrRyWuyYaEQ/AONFHTSFUUP+bg2Hgu2bXVZ/i+0v1nichPw
	AW8Di1rFKxrSDlP0taU0rRDWkqVQ57SXDxa9B3vfZXIyNAA==
X-Received: by 2002:a05:622a:1917:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e89d297d9cmr186222781cf.23.1760991699575;
        Mon, 20 Oct 2025 13:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjWyNuClL4yp5tggEpYb4T/9H2PBTt3fgPzqpjxOglETJgAfVNPI8KlxW+xaHSjXd56MMqJw==
X-Received: by 2002:a05:622a:1917:b0:4db:5202:d4c with SMTP id d75a77b69052e-4e89d297d9cmr186222281cf.23.1760991699103;
        Mon, 20 Oct 2025 13:21:39 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8aaf8d4f6sm60534271cf.17.2025.10.20.13.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:21:38 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6967a07f-d48c-4fdf-8adc-414d5127b576@redhat.com>
Date: Mon, 20 Oct 2025 16:21:36 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/core: Enable full cpumask to clear user cpumask
 in sched_setaffinity()
To: David Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Nico Pache <npache@redhat.com>,
 Phil Auld <pauld@redhat.com>, John Coleman <jocolema@redhat.com>
References: <20250923175447.116782-1-longman@redhat.com>
 <21ade241-76b9-4f0a-8e99-be033dcc882c@redhat.com>
Content-Language: en-US
In-Reply-To: <21ade241-76b9-4f0a-8e99-be033dcc882c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/20/25 4:13 PM, David Hildenbrand wrote:
> On 23.09.25 19:54, Waiman Long wrote:
>> Since commit 8f9ea86fdf99 ("sched: Always preserve the user requested
>> cpumask"), user provided CPU affinity via sched_setaffinity(2) is
>> perserved even if the task is being moved to a different cpuset.
>> However, that affinity is also being inherited by any subsequently
>> created child processes which may not want or be aware of that affinity.
>
> So I assume setting the affinity to the full bitmap would then allow 
> any child to essentially reset to the default, correct?
Yes, that is the point.
>
>>
>> One way to solve this problem is to provide a way to back off from
>> that user provided CPU affinity.  This patch implements such a scheme
>> by using a full cpumask (a cpumask with all bits set) to signal the
>> clearing of the user cpumask to follow the default as allowed by
>> the current cpuset.  In fact, with a full cpumask in user_cpus_ptr,
>> the task behavior should be the same as with a NULL user_cpus_ptr.
>> This patch just formalizes it without causing any incompatibility and
>> discard an otherwise useless cpumask.
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   kernel/sched/syscalls.c | 20 ++++++++++++++------
>>   1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
>> index 77ae87f36e84..d68c7a4ee525 100644
>> --- a/kernel/sched/syscalls.c
>> +++ b/kernel/sched/syscalls.c
>> @@ -1229,14 +1229,22 @@ long sched_setaffinity(pid_t pid, const 
>> struct cpumask *in_mask)
>>           return retval;
>>         /*
>> -     * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
>> -     * alloc_user_cpus_ptr() returns NULL.
>> +     * If a full cpumask is passed in, clear user_cpus_ptr and reset 
>> the
>> +     * current cpu affinity to the default for the current cpuset.
>>        */
>> -    user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
>> -    if (user_mask) {
>> -        cpumask_copy(user_mask, in_mask);
>> +    if (cpumask_full(in_mask)) {
>> +        user_mask = NULL;
>>       } else {
>> -        return -ENOMEM;
>> +        /*
>> +         * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
>> +         * alloc_user_cpus_ptr() returns NULL.
>> +         */
>> +        user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
>> +        if (user_mask) {
>> +            cpumask_copy(user_mask, in_mask);
>> +        } else {
>> +            return -ENOMEM;
>> +        }
>>       }
>>         ac = (struct affinity_context){
>
> Not an expert on this code.
>
> I'm only wondering if there is somehow, some way we could be breaking 
> user space by doing that.
>
I don't think so. Setting user_cpus_ptr to a full cpumask will make the 
task strictly follow the cpumask restriction imposed by the current 
cpuset as if user_cpus_ptr isn't set.

Cheers,
Longman

