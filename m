Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962842A9D
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990827; cv=none; b=YeBE56UInKxcv0ml8cPL3TjnhnRNVj8eoSEvk31I33cxb2vUzqFs4pf7Z3tT01kN6NtqyC1s05hoZBj1ULDJgin2NWbpn6lDcBStpBtjlzPFuky1veAZo+C8LeT0ET5n8iOW0kcu44CrQ/71fMge/a2VLR2KO994FZZYrx9Ru+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990827; c=relaxed/simple;
	bh=TepVpHg8AVpSrg+5W+IoBXQqQu1WmaltNqJVHkqahjw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F5ZXzp7LtpCp1vECrfylz/yBLcfoofKrw7dthVXdUyMnanYYD/1T95faZxmJsMmCA3o5RtxuWXaSuFi1Ef8SoVXMWcRIkvm6Glb5hDVQ02jSs/9+dF/ExmWPOvF38LU6o7t0uiyW4HnhyHKElS/dcEZju08R2CHsjzHf6LkSpBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GQ/SGh5+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GQ/SGh5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760990824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PKh7G80lkv2sTBwVQW8NOrlVTbOZbgJeWVR4B2ZVux0=;
	b=GQ/SGh5+KrCJVU294/L8IsfphbyRayehDjn0b46mpKwaqy/KkWE1Rs/udFsl3k+993yjB5
	bc+cUraZdr4aTiEUz6QeyQOJHVXJWWCm9S2jSuhhTFAjI5r/DGy79Vx3Jd+bfzrc3rLU9N
	ZpVqu1abDSs74/uRvlYrUcv3hT15/U8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-fohC9TVlMcGwBTpW2LzsYw-1; Mon, 20 Oct 2025 16:07:02 -0400
X-MC-Unique: fohC9TVlMcGwBTpW2LzsYw-1
X-Mimecast-MFC-AGG-ID: fohC9TVlMcGwBTpW2LzsYw_1760990821
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55443b4110so3488212a12.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760990821; x=1761595621;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKh7G80lkv2sTBwVQW8NOrlVTbOZbgJeWVR4B2ZVux0=;
        b=B1oZuFyu5EfX2RQbkmaKYixykNHI8UU3T9ND1mFPUGcKy00dbetpxdQxGllLLsCQf9
         bt5EIDmjFtSELSzQkDfPs3J9Qi8hIUgv/bDbit1oBkXmNH3soRrka6jKiqBIN9jYDfF5
         cYEOF+EQyyjHR8kdkyc34X1BEh3zKUKoThDFxcES9HNdk/gQz8ahiBTm9aCSUlUFx8dU
         pJKnjeNKaPZ5dEQ6QVOg6TI218vd2AmdOvVEMEOrFxE0AnngT4s1mOsNz5Go6BbhSQfP
         7eyVeycqzNDM5lIG+wUgAOrRvqm8OedZc3LeK/fDCwiLbwJ7PrB9ry30NrlgMNqzdWCj
         Nvrg==
X-Forwarded-Encrypted: i=1; AJvYcCXKsKVMGrcmMuzwM88ItVB7ctNZ25NSe9ZyIFLiiKFWmGjkCSWyhkbj0B8COCN+AfRv71j9q4I6KnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNl8TVO0Qpn6o7E1OlUMkWEx/Kwk+hRTIICLssGEh6ZxgvnIMr
	Awoh1fHRfznQHp8/9/ww2wm3XU6PUxbNs3mmzqcZIZaUdrEZLHuXuXeOTY4z5HwF/eJjSEBIcLk
	1Na0qDAICQluUnEmiNuB12w59zRkMFX19nFrRIo7xSLay47ItGTnqwqU7VPRQduCuRDGlAA==
X-Gm-Gg: ASbGnctcA2ipF4KMQA68xZSkVVyFdIs6iwV4Hdub1Kvdj0nZbtdLMxPyz51HZSSM+6D
	YoL+jrsfdTCvwqfre04OEhanXFBcbAvRuYRpf+8KuLtGdpdAiXouCJBvQFRhth4x70nKD/3jTwv
	VGKZNimN28pdjrAf+3CZm3NTwNpxCWmY40FG8HMudQNr0fFXx1JPj2t0kcxddiKn4Rgq+hk4hj4
	efgFaWtuXnzv/Lb8r3ill2lLEqh0i9mfkmprD7UM9DNXwyKW0wKK/dI9QLVcdRH/5+ir7mBVPMl
	rcZOvRt2DDUaAmGPZhDXTXEDiOxCJXtyf6+tsGfvElIGMoMUy5NlxFywg/8RrDmfsbpmrtBtPqk
	zCqJ9KAMtyHRTGCAEQhocfpJj9kg1ITVkY6HKHFUZHOp2xw==
X-Received: by 2002:a05:6a20:2443:b0:334:92ac:602e with SMTP id adf61e73a8af0-334a7a5ff7dmr20340280637.30.1760990820901;
        Mon, 20 Oct 2025 13:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELfTrmFc6qObTq7RgTaOXi9eaIyZMYW7lgC66KaADWOu31BdOjK1L/BD4LajKA4fu+SbfJTg==
X-Received: by 2002:a05:6a20:2443:b0:334:92ac:602e with SMTP id adf61e73a8af0-334a7a5ff7dmr20340236637.30.1760990820374;
        Mon, 20 Oct 2025 13:07:00 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39442sm9136114b3a.20.2025.10.20.13.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 13:06:59 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <9160740c-a56f-4fb0-bda7-bbdaa04f1d3d@redhat.com>
Date: Mon, 20 Oct 2025 16:06:58 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/core: Enable full cpumask to clear user cpumask
 in sched_setaffinity()
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Nico Pache <npache@redhat.com>,
 Phil Auld <pauld@redhat.com>, John Coleman <jocolema@redhat.com>
References: <20250923175447.116782-1-longman@redhat.com>
Content-Language: en-US
In-Reply-To: <20250923175447.116782-1-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/25 1:54 PM, Waiman Long wrote:
> Since commit 8f9ea86fdf99 ("sched: Always preserve the user requested
> cpumask"), user provided CPU affinity via sched_setaffinity(2) is
> perserved even if the task is being moved to a different cpuset.
> However, that affinity is also being inherited by any subsequently
> created child processes which may not want or be aware of that affinity.
>
> One way to solve this problem is to provide a way to back off from
> that user provided CPU affinity.  This patch implements such a scheme
> by using a full cpumask (a cpumask with all bits set) to signal the
> clearing of the user cpumask to follow the default as allowed by
> the current cpuset.  In fact, with a full cpumask in user_cpus_ptr,
> the task behavior should be the same as with a NULL user_cpus_ptr.
> This patch just formalizes it without causing any incompatibility and
> discard an otherwise useless cpumask.
>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/sched/syscalls.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 77ae87f36e84..d68c7a4ee525 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -1229,14 +1229,22 @@ long sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
>   		return retval;
>   
>   	/*
> -	 * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
> -	 * alloc_user_cpus_ptr() returns NULL.
> +	 * If a full cpumask is passed in, clear user_cpus_ptr and reset the
> +	 * current cpu affinity to the default for the current cpuset.
>   	 */
> -	user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
> -	if (user_mask) {
> -		cpumask_copy(user_mask, in_mask);
> +	if (cpumask_full(in_mask)) {
> +		user_mask = NULL;
>   	} else {
> -		return -ENOMEM;
> +		/*
> +		 * With non-SMP configs, user_cpus_ptr/user_mask isn't used and
> +		 * alloc_user_cpus_ptr() returns NULL.
> +		 */
> +		user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
> +		if (user_mask) {
> +			cpumask_copy(user_mask, in_mask);
> +		} else {
> +			return -ENOMEM;
> +		}
>   	}
>   
>   	ac = (struct affinity_context){

Any comment or suggested improvement on this patch and the following one?

Thanks,
Longman

