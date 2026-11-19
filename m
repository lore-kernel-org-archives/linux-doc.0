Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795056341;
	b=4mwZ/Cn6yVYAbSUaKiKe+4Cw5w8OpjCHK2DZKj4f9OuF774Dk+Kya0UDULqyt93mZFTF
	 Lh3dVmScLxX1dlzTL0xshCjH8r3lvxFBOpaNtcT23PKJMs33HZP+3Nu4SMvdg98zq55Vz
	 v3RoCNx0Z92riuRMF7UCn7ibNEqgYcMBWB65s0DfDboJqaG11i7PMlaeQtjl32RE+W4HS
	 vUarTLY1LLsdrFcm8tqRtv5UTHGt4GDOX6/mn3gV2ldk8pG0V2pLBLdDSadwFC9SLUdl9
	 JVzS6a3KmBVNpy7wCv+A3pQ89nuHc0l2w68WYTjv2deJZsjvqTRDatW3agt96eUvMFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795056341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:In-Reply-To:References:
	 Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
	b=1wGp8TJ1QmM4qYY3RX67qd2yvQrO1fJD8bz+U2ZPSLWlzkRAy4gSUf1Vih+nH4rJOYkr
	 YDJxepZ0jMYk0gu9Prk0TJUK1LxGDKV+rrOCh2LPXjXCf9SVMpClkqNACZ1fOjqYz3P6S
	 +UneiOs9txTYycYKZbdVE6IkYkK1ikHNphleeDbw0RYx/keHPzwSLj4M4iOlNaSj5zytY
	 c1VZ7xd88sqNOEuRIOsjgUC0C7bIbIwhQsQhd9HTcCbz2WvANkFNVpY2WSYKUauFs63ou
	 tUyJeVhHO3uLU4Xn/2/wsFYrt75VuruPH14JIV1fmrAgvz6mzgyepNzeReDLwnLFTeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpIdHj8c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F30606A325
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 02:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F30606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpIdHj8c
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91eb46044c4so20530246d6.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 18:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795056339; cv=none;
        d=google.com; s=arc-20260327;
        b=bEPGw/fYWTwffvfBwKPv8wzsdfEf+mIBnJwltrXjLlgGsQdvfXzgx7W0vqSok8fF7t
         x+Vm19hlvvdiJwAke314ccmYgNKrdIhGmMqoxXK3mTPCG3b+KRKlPN0/So7TdyIyGlK+
         oxfc3GoTIeZpSvoyzSStbE8BN6zjosDgQ/j1VBGJMbRmpFQthMLb2TsgmZnDW6apMZea
         DFOM23jqVAd38yLGras7RpQ+LJ+gAh+eVQ6zWov7tzj+Lupk6b+FiQHtamrh27XXND/E
         mBZSfJK8vOCF/RBSU+ASSxPjAHWd75C5EkcphB12nFaTU31p3/4jjBnvvsIN9M3MAvYR
         qBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        fh=kreoLWC2gISZac6W5JKCnKELKx1+8pwNE55s+T8Drrc=;
        b=RDWtkbgGBcv6YhSadaEvt6AzpfYwD3Qswp0AjnoESXdQ6SMHXHYPkEFkxy+kG9hxBw
         53okwIX/2v7t75ABUVs/PyaEw2Eyu81R+jkaao25qUve5ZJV7UAdFLWIx4Mwxi6MGzQb
         KZMBXfDV+cYt8oUevlca202w8JOQvxF1zqGXqvqUoMcqssoVHDD7wSy9IwRmc273QD8g
         aGnLgioMhuCJmOZRbF6WofufuXNTFuKtqSs4qj+yx9MKg1MjJcLg2hUsZkZSn/wohL3N
         +X/XWujXqk1bM4jcbdIyqfN3wugDFxcV/YkD1RoGp8r6x5fvaqM302lNqdP/T+ibCEDW
         M83w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795056339; x=1795661139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        b=lpIdHj8cethl8NZ04UEbRz+LsiWFLHUwPBYl72U+VxoSD8U4CYn0fPfmuEd9AkKC/k
         1NYK0u//7vksQCDLPGAeqS50HlO4npB38ANnEGJIWroZI8qUSOoUtCNHSA8PTWPQ7nN3
         uecm3J5PG4//VoSP9XZ2aff+uy+HdLV3heFUfHst57h2mO5E/gNDiOisfFv9g/liPIUf
         znuejl6YqNLdGFeC1/6/HKaAAs/qgKPdkg1/Eiyq/tzsNvMuZqDlDNqh9a6UE/KCct0z
         oLVgqeSNP7Y/yGgDk+rKt+VF0gLkneUdnS8JQ1vnb/we4OLqgPIBBKRmJ7YSN29NoqTc
         Is2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056339; x=1795661139;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHE4K0vpamVM1it9uzuLpZzTtHZ4wN8e10RDqi3C1Ys=;
        b=jpjYFnhdRZVutG4MQKWeomq10S6gHrYdlyMsIyHwt5MQNNLofnKwx+4jxCKjrQi74w
         JLrIFAUUD6i7takTchwIOm95CF+sqoe86TyUXYY+aydsITaQqRWgfCdESuPxmGM5e7ah
         qyNCPFJ9zrWegGDNWQLzrkrvaE5S0Vqu4YlDQDWr8sUTS0OhbIcqeizKhu2+6ckaeT9o
         Q5GEY0NFeH+LL7Pah52xGbfawZNfSZnGUsAcQUYfHUo9r3am7UHYZ8UqMaGxBufYXJ7J
         Xd9nBFvEvFJ0Hq70kPc0avRlq4JBd5Tz4zep7/XsFqmkpYXQ4b4mwSr4KWgAwmeUJNtZ
         Lxag==
X-Forwarded-Encrypted: i=1; AL+hErFuYBvhna4XDs8uvzlOWm4Wd6ZtdDhzWOtOufQSDJzIsABcT9/xD3hlOU5KmfQe7rnGWludoaa/Bzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pToTM7j7omkk7zZ3zFHGQeWlgRdZP7JK5ytSWU5XAW8EC4VCV
	0qMvhD9k38xRk3BhCGj8P/D0SC4uNbgj5MNrVyk6F0SsUdYujHGf7ydREGs4wmFHUHNe6X6HsBL
	F3WuZbFe4tU6mCUetdvTRNS7yPs6QBVk=
X-Gm-Gg: AZFdTZfyO561i2ysG8EOaEX4s30h0TrLlzcfSC/e/dBRHeOwmrdSsf+loTj8DRk/mQU
	XU/dlTkSrRFNbJRuaeeWnd7N3VIiz8F5MfoAjsdvem1qjjh+aVJ8MGMXKd6SAQm1lggGglymamV
	Ji3H4LlwFX6dYoLxrn57CWI4zMlmRATpf+GijW2OG0JRMb11oc6klmmAVIKSdw43TA8leamq9IO
	gpaT7v8lD/bYfOUF+nunxX+5fqTfz3satTttCfdNL3MjSzfnN4M0HbTA2Hx5+xTIN9ngwLriIbL
	za+GkQSTkX6EHIe37ekV7ziOCOGWtLF6kaAkpiG+P4EneVOOZ8/T4T/jro0EyL2u/bSHvqQlI9S
	6T9gSCltbC4+UxaMR++TBEuJvNrnaIUsEyxq0
X-Received: by 2002:a05:6214:4509:b0:91e:93bd:17d4 with SMTP id
 6a1803df08f44-92114f234d9mr68688036d6.31.1795056338595; Wed, 18 Nov 2026
 18:45:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 18:45:38 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 18:44:56 -0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 18 Nov 2026 18:43:28 -0800
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 18 Nov 2026 18:42:52 -0800
From: lianux.mm@gmail.com
In-Reply-To: <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
Date: Wed, 18 Nov 2026 18:45:38 -0800
X-Gm-Features: Aa3M54oczcrQgnIKIdlWRyAqAv-8pL4r_8Eu0gOG26vA4iWYOD9SKwZ3124B0Ic
Message-ID: <CAD1ZK4Zo_qQf5aJkVLtoc-LXM9XbyZd2Vy6rFvK_fih-6FE_EA@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] mm/mglru: rename the generation offset in lru_gen_folio_seq()
To: kasong@tencent.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	muchun.song@linux.dev, qi.zheng@linux.dev, ying.huang@linux.alibaba.com, 
	chrisl@kernel.org, baoquan.he@linux.dev, nico.pache@linux.dev, 
	usama.arif@linux.dev, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, vbabka@kernel.org, surenb@google.com, nphamcs@gmail.com, 
	youngjun.park@lge.com, ziy@nvidia.com, gourry@gourry.net, willy@infradead.org, 
	baolin.wang@linux.alibaba.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, hughd@google.com, sj@kernel.org, rientjes@google.com, 
	yuzhao@google.com, vernon2gm@gmail.com, wangzicheng@honor.com, 
	chenridong@xiaomi.com, tz2294@columbia.edu, ryncsn@gmail.com, 
	liuxiang.277@bytedance.com, ehab.ababneh@intel.com, 
	zhaozhengzhuo@uniontech.com, joannelkoong@gmail.com, kunwu.chan@gmail.com, 
	hui.zhu@linux.dev, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
