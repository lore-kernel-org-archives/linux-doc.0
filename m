Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC7C35AC00
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462573; cv=pass; b=fb0ooR4l+UtaxWfblGda6PVvoRBINem1UHczoZ7SynKPHCTiwrL2SNYvc2FYUkK3OfA6h3lZlA/XslxRzkUk+ZXL7OJ9VIY+BMmcVTKXLzYMEekL1tzdWgJYTXYlkbhTUSGkBFP4MQ8RquLsNxyVuWe1z+VSNIIkDrBvdn8cuiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462573; c=relaxed/simple;
	bh=oIoustKk4MCA1sbn3VwyOj5Ut9UQ8rmwcxgVxCOzBEw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9IYSHNET8xxL97FNI7jEuFKudpMRYjVKf0fwbEsSE+2dbMD4e1J2YYfJFZCLXAVdEg7QAFpCK3XC/1AWTN+phzPi7Rr8098DIpGGDb6tVKM0hzsLZz1nD2GRBF0EcwH4riDzAerK/yjXav55xsIRcEoC90Frml4r+Pk6GYZWSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n4ivHikq; arc=pass smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n4ivHikq"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba57fso14097946d6.2
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 15:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790462571; cv=none;
        d=google.com; s=arc-20260327;
        b=njDpdyhzAXlwJxAp2p7guk6ENSXdS1p9T95y9l1ms6rYngzZPLa0Kx+O3+mDkZ0Z4h
         ae9ba3P/8NFHGRBKB/3uNolbzSVh+ZeKi4QYXLm7UGWqnnfhaPH8nyOJp6Uxm00LR2xF
         b4AUUSwyMQ47121x01HpoZEjwL7KDHkGc0DNAZW3Q9t9EgntI8E4afmZUzQkt1rH2rBW
         bUmbDFwKDcFeH5yfhKiJBefui8j8sIpLCbLJSjcREyNVkBs85aC8kfirVyz/7r59YVrk
         KNhdh3vwt7ssxcGhbnwEttgBtjeFB2yX6svF9cYoY0byUy9ZFQj3RKWIL3pVCXQhD0do
         TECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        fh=mZ+JQKnyXAp5s7FB/naJhLYTMRFPWeNfNCIPm/fsWUA=;
        b=GmnDk3qfjGl3VCmaoeGnCJD3ZS2BASbJhRRh1qLN6InRxizySX+NL26RsMljhUH5A6
         Q0SwCvb3exUY1n7HTMypO6P3L/qlVJ0Jb7Rt7W6ZuRhRHAE3/U0T2vhnfUcO6+QUgxEI
         ASAG48NzKhm6NQ/ivp9FO7M/Z2MP9AEY6IvLx7mvuaKkTQ4OKHGn/VpZ9MUSkoucYsq3
         e95UR/CyYjGAD9UXXo193kXqSkHWoFlUbpTNKAwXBcGv8yCAWZit5mO2vY2k5v/JheLE
         pDJ8z3vItDoJE50/omM1k7lPHJdrBkwFVGQOdj9j7oLP4XD7ROcF/YzVGxUeds6jWEVc
         K2Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790462571; x=1791067371; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        b=n4ivHikqoV8KJDh7LQu/SK6F88rEqYd2t2lH+kHUYuj1WKGVWjFT7Fdgxky03Aj5Nl
         RYrFXkJCF7yMws79bx7mINZ8ksDj2hSmdwHd/oMAEAPAE41vXwG7z/CgOoUrvxB1+wRm
         ev4JE8NXqZ6vKaI3emAj7hGz2Eh71Qd7wWX7huuTFMbsjQloRC3hn468HRddYv19OCXT
         UK7Li5D3ctZ0Y3caVk7+A00pmorXk12A9skAugvqeEjCx8/TjnADSgFNncc0MwuXdvO0
         NmDSaXA9rdq7R9UX0Xgl38jOmPf3p7DGOytMrO3I3H0VnGb03kSw4oKkPacUsdg1Wlfl
         zyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790462571; x=1791067371;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPvBitOMBlhp8Hdy1YMUl7WEgUJJU4NLUnrbTGzbCOM=;
        b=UeUCcY6ga91eQRrU7OBTEK+7bpCLY5qkCjNHMwwke0ZKtztPKZteo9Eyj1t+Lw9ipI
         Ghi9HU6baisXIEvgONlgFN9DdkUhaN2G1g/1du4FESgAOIT7rLaaBUgPZN6ZjSdLU9h9
         vEdUbHElten6kRVeW6uoQSYsa7LWHxRoW6aT1Ef55j91cAw1pbpn5HJV8fK+oyFpQBBF
         1drQzIf+RhAVcctE/eMynQw8Unb+7odw1+bBMJjHTFUZiCn8EGa6VU9sm7LRLfjg1sKm
         FoDCnNkeKHn6l3jojKHRmDIi9bAqs1ER/rV7H/I9UcY08xRzdpr+jPMhn4Vj+nDIl8nI
         oQWA==
X-Forwarded-Encrypted: i=1; AKwUvBwdMzNcH5BQ5nqZkthQW1OHZze/hAaB3b0XlxcKOynoxzcuHZyQDvBV4HRmsVPrtBmkEvaDMEbvghQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBnn3DbJGhwY9LQ4/ZspzaYSakZAOSeIyflXaiQe+v8m+pDbjS
	VwxRapMTXAi4l8lMObi83Z8Do7K6d6E+oScIm5TfwTTCSV1/26KN2Nz9wuQrQ/Xai9Ea71hdKeJ
	GL/xxQNLJ54w7Qy8+UcfYFmOl8ilucYy1i1in7wxM
X-Gm-Gg: AYBFou2HCKHSczCLCfzlQwEmaQrl8xBbD/oJLXY3+ZuKMDS2GY5JPn5Asz5C4ux7M0o
	P8DfBs8AT8czrz8l87rfOCsPGIsCqy8JUYS+5HaTZ7vSfBAWLbvVkOuhVRznMLo5nNTvM9Jtx09
	fx1A2Y7EnejpwKntSAIf50CJPqRSLdg4EvP3AZgGDv7tSezIVvUEr2vZNWjF+9kj9hwxmnV9c+k
	Mwig5kyVAD0SqyZCbcnt3FdjhRsj/C+s6CHTkTbJULYkTxeWHCbKNLsKd5DUDKsCdBcnYQf9tkK
	M3DA5et64XQH/pgF6SeKAI/Gb/s6xuDX/hoz0GyEdyfngGDVc9QZjXFbmgRD7WsPS6ztqDsTkB5
	s20zkjqCbO2T0M24j9QGr
X-Received: by 2002:a05:6214:419c:b0:914:4464:41ba with SMTP id
 6a1803df08f44-91444646dc8mr70530596d6.26.1790462570563; Sat, 26 Sep 2026
 15:42:50 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2026 15:42:49 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 26 Sep 2026 15:42:49 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgHZTYUuFBXS3sGyyjiveQOeLHuPxvud8o+R3NCCwM6Ukw@mail.gmail.com>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
 <20260923220912.46905-1-kmehltretter@gmail.com> <CAEvNRgHZTYUuFBXS3sGyyjiveQOeLHuPxvud8o+R3NCCwM6Ukw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 26 Sep 2026 15:42:49 -0700
X-Gm-Features: AclHuK8P2H5EpMJy1YvK3gvIP-rpUihsCxDjwpAZl1LdwcYKlVTgraMVSJkaNkw
Message-ID: <CAEvNRgFPpigP6zq+6+dvC7nubFBjeYNZYPj4RHB1uXd6c26H2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix HugeTLB subpool used_hpages tracking
To: Karl Mehltretter <kmehltretter@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Zhao Li <enderaoelyther@gmail.com>, Jinmeng Zhou <zhoujinmeng@bytedance.com>, 
	Alex Shi <alexs@kernel.org>, David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
>> 2. On splitting: 1/4 applies cleanly on top of both queued fixes, but
>>    in my tests it made min_size-only mounts worse on its own. As far
>>    as I can tell, that's because it starts tracking used_hpages on
>>    those mounts, while the two error paths only release it after 2/4
>>    and 3/4.
>>
>>    HugePages_Rsvd, expected value in parentheses. Q = the two queued
>>    fixes, wrap = 18446744073709551615:
>>
>>                                    rc3   +Q  +1/4  +Q+1/4  +1/4..4/4
>>    min_size=4M only:
>>      SIGBUS faults [1], no files (2)  2    2     0      0      2
>>    min_size=8M only:
>>      failed mmap [2], umounted (0)    0    0     3      3      0
>>    size=8M,min_size=4M:
>>      SIGBUS faults [1], no files (2)  0    0     0      0      2
>>    size=10M,min_size=8M:
>>      failed mmap [2], umounted (0)  wrap   0  wrap      0      0
>>
>>    With 1/4 alone, the min_size-only mount loses its reservation, and
>>    in the failed-mmap case three huge pages stay reserved after umount,
>>    presumably because the subpool is never freed.
>>
>> So it looks to me like 1/4 shouldn't go anywhere without 2/4 and 3/4.
>
> Thanks for testing this! IIUC from your table, 1/4 introduces
> regressions.
>
> How do we handle this, should I squash patches 1/2/3 together, or is
> there some way to use the Fixes: tags to require those 3 to go together?
>

I think I have a better way to organize the 4 patches and the two
already queued. Will work on this.

>
> [...snip...]
>
