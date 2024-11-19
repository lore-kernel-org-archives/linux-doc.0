Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F01B145FE8
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 06:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731999243; cv=none; b=Z6YxAa/JU7qWqAmRADjyojlzMs5xaDw7az8M1dEVPoTPx1dNscJi8/CIwrpn9Xl7kSNzRTA26DtMN1mCOnlvg/PIGKckWDjfdvP+CREaIcv8L0o8Ei5v1KlCOC4EerWlVsgDg2S8+5Nydxam5mxx5SUx5kowy721lCvMQV13Cfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731999243; c=relaxed/simple;
	bh=Je2NIDFQgc4fqKAf0CTt2K4VOqjbiErRQuOoHhPr1yE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qK+xlP60/ZdtHielXP8NP/6+5j69NCSaVDcNFVGbN7BqQWQ7YDwr2ALgoIrHpsV0mE104EIbtLNQj4frfuXclSE/7XuY4iYJRbx4gUNw2FGRB4v7Y1wGabSfg3N8sLaBvfUNxSTmfk16dHD8cVojOoqdCcahlnR+0f6aipYu3UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=g2gNzhwE; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="g2gNzhwE"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72483f6e2f3so2170836b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 22:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1731999241; x=1732604041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0MK2ZZbNRTSnFf6mDYAT1AUItf075doEb65NCpj4NE=;
        b=g2gNzhwEo2/xpj7mIcHbSPrJ/VJZkeGbN7+cQj+HZ+EjhBYeZlB0y0L6OlanDYJ4ei
         xBUYzHcW6JupTsdG7IbDeu2TN5Gqcscd0E2YzR4/2C+9JcmGUzdyeCpG3njFBCWJ2Uwh
         Smv4nJ70x+1T6RIl3Q7jlzkIwiALMfjXSzn0FExjglDxGwsFGxHje3M6VJ1T/uIVmqAy
         qGNC+AvFdJpl02G7EBrHCi2+Dk2zlGi7uKGMAZ43Kjc31NpJhR8dXtDt+p30t2a1CalL
         J1JPqWGKBqhdg3PPngTV1TZhIevgO6v0ZhPao8R4Ik07sk+CnjBKxMnfOS9eDR0V2Jon
         fNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731999241; x=1732604041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0MK2ZZbNRTSnFf6mDYAT1AUItf075doEb65NCpj4NE=;
        b=S2BSCo+EcfguBVgg8etSPxBwtujmCv2AwMYJuux98ulLL7Y9ayb8v6OQ18fpReitKh
         pfZo+TqIGo4Wk5jJwiFl2WTOMcNU3OVmT3XGheaLP9CkydFk1S8NfSJ7NkJqWmDlSluo
         ch778nVImIubQL9i17pQkkZY+egYRf00IIylQ1kpNzSx3BJMN5uN81b3wWuJ2v6Q3LeF
         2pBsJOy85bvsOOkp+UrXL9hgPUlqMEr7ZXZ3QF0N5qrGGkfDPPsDvRhl6H/qrvjIF3Zd
         mkPxFLuyHc8+u0aVhJnbtvQ4pKW/bzCy3CPjCwKguRUgM2QGuqnTsLrvyPFmQEaN6G4g
         hEZw==
X-Forwarded-Encrypted: i=1; AJvYcCUZkD2jpyc7ZqFCQJY8yB/VJNWo6ZTJtd4NddDgJ0uhcNXQOnbnPIQ1SlgLmYsyb/fRCCH4axgyAOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Lm4pQTNAafv72lhkXAQC7DPnoatIrLTa7mVl6buTbXaTUwYM
	TmP+rh2DGysZzyBK3JhfeJMsBgCWHq+JTUE9TUfEpWK/koKf7jsbmiYac7wT/Y0=
X-Google-Smtp-Source: AGHT+IHfZRlZ8R2nO4xU50Ru5p5Gp0v1FYpibD2q1Y3+p7G14fuKNvzXcu2cpcp/DsRLb1th9cZOGw==
X-Received: by 2002:a05:6a00:3285:b0:724:6abf:b63e with SMTP id d2e1a72fcca58-724af8eaad2mr4231511b3a.5.1731999241414;
        Mon, 18 Nov 2024 22:54:01 -0800 (PST)
Received: from [10.84.149.95] ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fb9bb066easm336579a12.45.2024.11.18.22.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 22:54:00 -0800 (PST)
Message-ID: <21195425-53d9-4007-a020-8106f94158dc@bytedance.com>
Date: Tue, 19 Nov 2024 14:53:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/mm: add more warnings around page table access
Content-Language: en-US
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>,
 Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Hillf Danton <hdanton@sina.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 SeongJae Park <sj@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matteo Rizzo <matteorizzo@google.com>
References: <20241118-vma-docs-addition1-onv3-v2-1-c9d5395b72ee@google.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20241118-vma-docs-addition1-onv3-v2-1-c9d5395b72ee@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/11/19 00:47, Jann Horn wrote:
> Make it clearer that holding the mmap lock in read mode is not enough
> to traverse page tables, and that just having a stable VMA is not enough
> to read PTEs.
> 
> Suggested-by: Matteo Rizzo <matteorizzo@google.com>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Jann Horn <jannh@google.com>

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

> +
> +* On 32-bit architectures, they may be in high memory (meaning they need to be
> +  mapped into kernel memory to be accessible).
> +* When empty, they can be unlinked and RCU-freed while holding an mmap lock or
> +  rmap lock for reading in combination with the PTE and PMD page table locks.
> +  In particular, this happens in :c:func:`!retract_page_tables` when handling
> +  :c:macro:`!MADV_COLLAPSE`.
> +  So accessing PTE-level page tables requires at least holding an RCU read lock;
> +  but that only suffices for readers that can tolerate racing with concurrent
> +  page table updates such that an empty PTE is observed (in a page table that
> +  has actually already been detached and marked for RCU freeing) while another
> +  new page table has been installed in the same location and filled with
> +  entries. Writers normally need to take the PTE lock and revalidate that the
> +  PMD entry still refers to the same PTE-level page table.
> +

In practice, this also happens in the retract_page_tables(). Maybe can
add a note about this after my patch[1] is merged. ;)

[1]. 
https://lore.kernel.org/lkml/e5b321ffc3ebfcc46e53830e917ad246f7d2825f.1731566457.git.zhengqi.arch@bytedance.com/

Thanks!

> 
