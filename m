Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040C15B54A
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731314405; cv=none; b=e4TM2o+NtyavLRYMCksWhPhzkgzrrl8tJgCGyUp8Mr83a3z//XuTYgTsdYSTPxKtpRByhRkZHsct7UDDodKVvyCxXutJzNNYEfrKYMDSrMve/aAzp81LSyPqps+ZXmU4KyUhd2iKCph9BclsovW7OEdqRMhE8rWrqm6AOOJCfCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731314405; c=relaxed/simple;
	bh=0TMlo/1M8pZzt8wgzxGNWdRDANNk60XXJly6Ts5W8zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pg05zss7/uYrWPDUqzHH3f8U9/Bb+WBa+WJ7gmh7aULNG4hMf3p5I6VMu2AkzmdrjUZkHMJ9aHegt31z2DQYnXwuT6nx2HSG+m3aRQvOWRezw0Sn6BuzpnMUDi0lGbNqxv6lmbP0CJD3/e6PR+fNKZW6fInEf11aiPMkwLnp/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Nd+DxHur; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Nd+DxHur"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso3418445b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1731314404; x=1731919204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmVlHwTvUCQZE9KPsrgpDC1tNLtWbhTIHRQ7dvfrGVg=;
        b=Nd+DxHur5XYgCY4nBQEdrmsAxcw26MEkZETcMaon+SUNVjEvlf2vXvZ+Ss4VDz6iXL
         LDe2tqW4GmV2G0Kx7NQ5CLKbJK2aOlNaokoJ6hrVTevDG6xdE8g3LT4BcW/Z+6IbCwZN
         +Xj1n/Lnur8MHzdsShZLMeGl7RR7F22bpNSelQ7A3/uOKwNjAzhBmeB80MyR1cWpM95F
         /zlykNPstqBa62p9Sgxto/WhvlbY0/HiGVHxNuc66mKyJa9dtuBzHx3VuUGDFxaRL8Ck
         rUH3G50W2pFBVopJCmSDjox19yrVWRoWKKzqO/gfN/cgMoEkVTZJMnTVWN/SfeGLz4qh
         ZhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314404; x=1731919204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmVlHwTvUCQZE9KPsrgpDC1tNLtWbhTIHRQ7dvfrGVg=;
        b=ZEaZkTXxM7CwkbY4Cwq6tpkftNPhuTX2wvb9PE9HNWOF0kYoHaJu6mTBoCfbj4oBMq
         FX1F01p5juvNzzgSSdhXXSwIkaTnV9BQCgYiwYmxBhlW6QbZdjuxIo6Zra3aovkwKJWz
         7yrjokdDXMcZPhKaRjJeDQ1RjEagnQpSjpaH9Pg5zJTFRti9tAO+CaQ/mPa8fNSuvdxF
         bt60T7mC2QU+KzC1r7p0wicywRWj7nc15UCTeq1LeFI7H6qaFdUBfzXcxwM8h1hdbBD1
         3wdxkRKEocQ6ONN11zQN3G6xLnFBUw7JlpQX6yTsGGoS3vfMvhK1EbjFxtT/dZYykLjM
         PpWg==
X-Forwarded-Encrypted: i=1; AJvYcCUfO6+tgNr/AY2krKwx7MR7EOelDOECC91HjnHxCZAgtbMOLmYccZYsHLQq5heGNrFG4sN4dmHyKFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YylpaIe9NnhQzA/RGiL60EAVJ0oAR9zDg4wnczIkpfneBaM1PX2
	fGBCeRAnFT8rg+f04TFB6mRx6cF9mRN0BNFYDvDyFnnbBddn0fRqf6lEmqFDEc0=
X-Google-Smtp-Source: AGHT+IEqi8Zzo53EDLQgkbshFItq7KP14ICwi1neU9DQh0SL40H9eZsefl555LkYfSNJKXXktPJHUg==
X-Received: by 2002:a05:6a00:894:b0:71e:cf8:d6fa with SMTP id d2e1a72fcca58-724132c04d3mr16972946b3a.15.1731314403597;
        Mon, 11 Nov 2024 00:40:03 -0800 (PST)
Received: from [10.84.149.95] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a571ccsm8425130b3a.196.2024.11.11.00.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 00:40:03 -0800 (PST)
Message-ID: <cfb6ef05-5ee0-4d7f-a0b1-c35826603351@bytedance.com>
Date: Mon, 11 Nov 2024 16:39:54 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/mm: add VMA locks documentation
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>, Hillf Danton <hdanton@sina.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>, SeongJae Park <sj@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20241108135708.48567-1-lorenzo.stoakes@oracle.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <20241108135708.48567-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/11/8 21:57, Lorenzo Stoakes wrote:
> Locking around VMAs is complicated and confusing. While we have a number of
> disparate comments scattered around the place, we seem to be reaching a
> level of complexity that justifies a serious effort at clearly documenting
> how locks are expected to be used when it comes to interacting with
> mm_struct and vm_area_struct objects.
> 
> This is especially pertinent as regards the efforts to find sensible
> abstractions for these fundamental objects in kernel rust code whose
> compiler strictly requires some means of expressing these rules (and
> through this expression, self-document these requirements as well as
> enforce them).
> 
> The document limits scope to mmap and VMA locks and those that are
> immediately adjacent and relevant to them - so additionally covers page
> table locking as this is so very closely tied to VMA operations (and relies
> upon us handling these correctly).
> 
> The document tries to cover some of the nastier and more confusing edge
> cases and concerns especially around lock ordering and page table teardown.
> 
> The document is split between generally useful information for users of mm
> interfaces, and separately a section intended for mm kernel developers
> providing a discussion around internal implementation details.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---

For the page table locks part:

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

> +
> +.. note:: Interestingly, :c:func:`!pte_offset_map_lock` holds an RCU read lock
> +          while the PTE page table lock is held.
> +

Yes, some paths will free PTE pages asynchronously by RCU (currently
only in collapse_pte_mapped_thp() and retract_page_tables(), and maybe
in madvise(MADV_DONTNEED) or even more places in the future), so the
RCU read lock in pte_offset_map_lock() can ensure the stability of the
PTE page. Although the spinlock can also be used as an RCU critical
section, holding the RCU read lock at the same time allows
spin_unlock(ptl) and pte_unmap(pte) to be called separately later.

Thanks!
