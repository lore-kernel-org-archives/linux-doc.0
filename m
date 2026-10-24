Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874906;
	b=VTvZE33B0FsTL5OYNAFCswLupg7vEYsOLJdm+1BjxudS0BAR49Taevf33Oguu/EoxSLY
	 RqzZlm9k73gWZvKJDrdqFMTaUZhQJYcv6WfKp6XZMCxVwXljdYrz6nMlpjZPETd8bOVb3
	 iGPjUvK5ouzdinOLzK2D6Phur6eXqO6YvCh/QxdNsv6zSkaEndmD1FSbg10s27gF7Z4zh
	 bcYYRC5W+1ZVFz/VZOLezt8KnQ9SQkei+x4srZBAJMLmh0Yz4feybPrioE0oSmS7AAWfJ
	 OPHLTDQVvyk5BRFadwPqJS6go2OQU2x6pPIw5U9/RjXQ9VtGj9AyMeDxJKuvgcLbKFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
	b=UgSDU3UlxkDukWuCywCb8jDUS+Y0rOu6n5ECtCcLBiKQxZwSPMje/kq6OXJjlwjp6gQG
	 XKhXz3hz2bzmrFcEwuu3e01LBioNLQfZD1CXcdewAPFib10op8vh/iMmgiFX2JYqaObKI
	 LyImCi3zdueXD7WeHBEINH9WDKhKhlh4oN3xZgPxBevYunvUie+A03lAYe6WzGwh2aE8x
	 nM/t/g0f2KZ6u8DLKsy+WINxBBOAjVVhS1THpjw37xw9cGxYRfAVhtNYe0MOFvibnAcVJ
	 AIsQ/nJzIXxiNfFuKsQFabRk16wJUQhQDwh/28M0GPOoLW8IvVrMrMx1JiC+spmz3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=N8V6EIzF;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78A5606A31D
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 20:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78A5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=N8V6EIzF
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a707f37eso19929416d6.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792874905; x=1793479705; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
        b=N8V6EIzFsfngUUiSHlqZ1m2daMfL/rg419LomABkwSxzbcs1D5/Nsk7zhezLDULqs7
         EeeKmor8mjzpP+jF2Eq/Jgt7819VQMOwx+L/G7Me6G56+yMPSJXwkOn4VGVjpC7pmkmx
         hFqtptPuu6KpkC51AQyW+SMj9+cBfEf851ShXi6nxSlUV63+3Fh16wIyDL34MIBbOldz
         zjqOMTH/kWaclXaKGBhsjrq5f4NAv4jnvfQcLveu4r/CsejNa7ZovPHwrEEjexmAWzjW
         KYthvDIXysA4LgN8Y2UdB/nq8B2n51cSlOuVcsXCfrtZLx+NU5rmigp9vcRxx1sAC7jl
         aqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874905; x=1793479705;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuPJgnsG0Ng1Dae+yMYUghn3Dz0uN6VmqtORQTrWN9o=;
        b=fzXC6ScQQI1H/xtjy1pUhF0kYt6qHlKRvmWOBhyPfLqCA1Rqh+HKBCIc8yS+zODKXb
         NZLYXwVRDbEpKUKOPK47EMsaIxWdXCDghkDqKp5tWc4eCKt66AixIzm+TR29gVzxefNI
         09mSk2dKnYed8Wojl7tB21vY5gEVuxyKzPG8M4Uwac66puwtegTGqR5JlvsqXWUERdhi
         sadrh9vWh1eLL8hrgqMeJp1X49arMaQSxFnbdviOgiHah169uQDq/bR5gpyIFUtJUirq
         6WzBYMfG/JC6S6gfiHINDIZSnhkJuIDIzSiAHHU0fFuKBeiYQnsxsrkRnXWVWe1K1x+7
         Um9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNhslqzRGg2asSu5+Q3kQmFZE8qFuJiGKRqJWNrqChlQHMYatG/srcORXholPGacSUxjrRmFh+/co=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj/RsyaIXqx+x2cdLCEovrqaVj94zuP46Aac2zrJoTpROSPkiB
	JJA0iSWnqhBMzw141GIdJRXDQN8udfRC5SKizkE8Ulusp16B2UiePwNy1l12FhD1t/Q=
X-Gm-Gg: AYBFou3tql8KAY/r3xGudwj+YCyJYPG0Duif3duXwzTAxqCoo2rGXQiLna3jNluzRvD
	b8MgGJg4zYdUChVe5ZsbXJX8WA66LKensgCMpKbH4bHCNBq6sHptofQhj5pSVnTA6jEVVQwfIGR
	wjKFbodGhpQ/gaIgJ84LwEnAiKbaiJWhqe19gbESt2prH99u/Ii7iAkkKiyk1GS6RDuAEmMjWgz
	pA24viclBsM4tKj8thVtSPCPfEa+5Ncfzx4CXf8pzH/28pCamwHtKZ2ex31dPn2PAQqKeswidUJ
	5QpYPK5uiXDJSgJdw/ecdHO64IkHkafFBE+hN7B65Itx1KPYF7HBCYetXOa8CgWOBRhqHVfuzwA
	6N4O8NII4iIsSGDscHSF8fU4elJg8HmWrF4HmIN+shl7SOta/s8Gf3/71u0vkiXFbD05acE9SC5
	fW6tgArR/lc+jIeUbADEQMq+BMGN/ZRuVqJp1EVnVD6PErTyaJp3mSQkkbIA+CKR7AGMCpgF1+V
	qS5JQXxpX5F99Gwev655OiQy6Fi/DZqi8Zf6TSuhQQEeaJrF+ZgAZfV2Y+vlCzY9r1EWX6+ZEm/
	9r/5CznvwPC4q6/YhQRDlY2zAAc=
X-Received: by 2002:a05:620a:4001:b0:93e:9292:1b9e with SMTP id af79cd13be357-940ef7ad8b6mr372744585a.1.1792874904799;
        Sat, 24 Oct 2026 13:48:24 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0a94a5csm258574885a.41.2026.10.24.13.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:48:24 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: Path forward for Virtualized Swap?
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Rik van Riel <riel@surriel.com>
Cc: Kairui Song <ryncsn@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
 Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
 Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
 Chengming Zhou <chengming.zhou@linux.dev>, 
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, 
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, 
 =?utf-8?q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
 Meta kernel team <kernel-team@meta.com>, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-doc@vger.kernel.org, 
 "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>
In-Reply-To: <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
 <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora>
 <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org>
 <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
 <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
 <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
Date: Sat, 24 Oct 2026 16:48:22 -0400
Message-Id: <179287490291.4123581.5790613647977714588.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-24 14:16 -0400, Rik van Riel wrote:
> On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > On Sat, Oct 24, 2026 at 4:03 AM Rik van Riel <riel@surriel.com>
> > I also hope there is a way to release swap metadata completely too.
> > e.g. for fs, you at least have umount, and can rmmod the fs itself
> > afterwards. We also have many ways to bypass the page cache. In cases
> > where a virtual layer is just a burden, we want raw physical swap,
> > and
> > the ability to swap off that too.
> 
> The VM cannot operate without the swap cache, though.
> 
> That is very much built into core parts of the VM.
> 
> However, having swapoff remove all data from the swap
> cache, after mapping the memory back into userspace
> page tables, seems like it would be fairly easy to do.
> 
> Does that meet the needs of your use case?
> 

It may be good to talk about this in terms of discrete workflows and
interfaces, rather than in the abstract.  Just describing effects
creates a confusing situation without including the cause.

Isn't this as simple as having something like:

echo 1 > /sys/kernel/mm/swap/drop_cache

('simple' is doing a lot of work here)

-- 
~Gregory

