Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1338910F
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141046; cv=none; b=szy3/x1JWWEvsBzUJaHVChP5w64okMqBgeNuZTMkImrjYQC6bLJADDSDCzC2FxxUbcpzbdLF/pQFvcgoeFMPoWISX4ALjR/rnDdqGKJb8HeyFg8XBhfWH4VQJNVVqQFvzOd8MyeIHG7AD+27BjegtV0rFU6g7hTblVR3RFbueog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141046; c=relaxed/simple;
	bh=uL1w8BEtt8Np/I2lqGqbLuXM7I9yviHkRH0NnWW0ons=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5XZjyjJiXNYfIayeqFmRzgQXkGjqeLi/cpqAztM4G6TwWxw74BYGlRgVnI1HvZnO5YLbs4RkZzN9asAS5js9EDywK1+qU4lCe10lDJ/Hk8OqBesBXFd7IfTwdVxlVj7vDi/WCBTMuwIU1vND8s4H4UoWdCF4lM/KOQC3/KppEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdledJKk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdledJKk"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e00eee27dso171396f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141043; x=1792745843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/q2L7BS45aTpoyNh7m1QrG5eRubgbrBzhsyuMzS0/Y=;
        b=OdledJKkHyKkUe6e5iBmeFLKmwU4PVSsxli3jDVGIf+o2l8l/lL/Q+j1oJ2S+OFZkZ
         vu1HLC3kzj3iQ81Du7bUKzkjPOXU6kzbKOss+TygfuoNDqCJpX9bnLZh6HATnZ6gFEpC
         2cFzzS5HTqFarzB0Fe4uaW/n83p3wxocH21RfEM02yq6NBTJPhuaJGU6P5yDl7K7GC28
         FT219PpULEJ93e3nq047QIiZ+xObxIw7LApAj16ai6Y+1iFPmVjW4L9m+gs40+k/R5TJ
         Nd7sfxW0mU3wypTvpiiXEuSj7lDUbSD75uz0m9WjqXnxtRDLLaRAnsGaS4TErlGrUrtY
         b+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141043; x=1792745843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/q2L7BS45aTpoyNh7m1QrG5eRubgbrBzhsyuMzS0/Y=;
        b=Dz5LvFC0FEcjXKoYUdb+EJC/Pur9uvQrsqvODNhxyEQ1dQPd09Vj04g6CAlCp9oZ2U
         MGmYmoO0OXPksKl42givu2edT5+8Kpp8cM/P8LWXLImLE3y6b1Rq5C84yD6yutUZlGvJ
         BOsY78yHK1JcNgEpWoKwnHIMHpJkeJjGjlocY4fsJpYBvgyPtfgOSpZIqP0JiSA+fH97
         WThQ/KV2aAZpXWW8gwkRTRID8HAzREjFsR9w3D0EBSZHb3UZKYGdwRY5vNQSkU7su7en
         HN/LhfuEV6YwXaHYWiMpwRj1Gswmw+pq/RxDGXJ3FVjO3ZLqYxSWxvedYuue8q3+naJh
         Lo3w==
X-Forwarded-Encrypted: i=1; AKwUvBwGViIfEGwuYgehb4wP2cY22mjYMjJt1oLxf6VqRFuyTo6LlQWNWPN3n8LsiIb+07pNnVbGjJ5fhPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1ATWGehKZzv2oA1KSK+2mBb5z/vMX3JA6Qyr0ooB2CgBBS2Cl
	doaMoR7M72irNIYc7K9tTHf/ZJt7ZkWu+/ZD/CVf4HCQtlc/n2UWBlEF
X-Gm-Gg: AYBFou1S1/fcdbxSaMUgflwqmK1+U0oV4d+4YiNR72YQ7T1wi1uWgAehOrfBhvtuA7h
	a42yP6I3i76DNQO92b/SOD1NyEPZemKYeYFB8F/Fkh7XGN7AwHqzI8PDPE5qUxWiOMPxs0rUIeZ
	NJk9PhZkP7ijwo/LHG2rjaFyzPKfHiYMaT/Oh/LfOtmwF3eOSbk2MizFwCRToI1MR2Rj462K4ne
	JzEt3/+tbYiCKDykgZ5mPWclk1uNTUwj5zQ5bXtTj/mA+uEjlSgAE672Vs2QdKPnpPB+Edglupf
	fzhdRGWKBEIVpLgxFYD0BCrnvdZz/Nd/ARGinIqV1c4ZvTBjhSxLBxdPsjH2bfsKPQbc/R20LH2
	MXg40sEVuuOJl3UVZbUa2GxIBgz4YikPVN0jrt4gYpUXuT/ugK7Vu6s0EX7hgxQQTNhpRqAcM/3
	6g6gxU4bdZOPt3MkWdj3rJTh01zEeL4f+muJkVKnyAuIKXEGLqerDlatVvYxzX0378YDPo8yEBM
	hV3kCemelZGurjTqeUqD8vckJb9oNeFh39O3ouuDryNYUeh66s=
X-Received: by 2002:a5d:5e8d:0:b0:48d:f7ef:721f with SMTP id ffacd0b85a97d-48df7ef72e4mr8636884f8f.11.1792141042620;
        Fri, 16 Oct 2026 01:57:22 -0700 (PDT)
Received: from [192.168.1.18] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdcc0f20sm3509146f8f.11.2026.10.16.01.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:57:22 -0700 (PDT)
Message-ID: <eaeeaecd-f51a-4c2e-8439-36c7b8f6721b@gmail.com>
Date: Fri, 16 Oct 2026 10:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vma: avoid spurious write locks when mm->mm_lock_seq
 overflows
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daehyeon Ko <4ncienth@gmail.com>, stable@vger.kernel.org
References: <20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org>
 <f5548d05-5aec-42d0-b9d9-c14fb575dec9@gmail.com> <atHa3-KlMPg6oy8v@gremlin>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <atHa3-KlMPg6oy8v@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 10:19 AM, Lorenzo Stoakes (ARM) wrote:
> It seems likely that you're using AI to generate these review points. Please do
> say if you're doing that, thanks.

yes, I used an LLM to find the commits I pointed out and check if my
reasoning was correct. my bad for not mentioning it. anyway, I reviewed
everything and checked that it was correct.

[snip]

>>> Cc: stable@vger.kernel.org
>>
>> the parity check relies on e5e7fb278e59. before that, mm_lock_seq only
>> increments on unlock, so locked values can be odd or even. should this
>> be limited to 6.14+, with a note that older trees need a different fix?
>> a straight backport of the odd check would ignore write locks taken on
>> even cycles.
> 
> I have a plan for older kernels (just make the value 64 bit...)

okay, I didn't know.

-- 
cheers,
jose a. p-a
