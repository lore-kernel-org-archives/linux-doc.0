Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891034;
	b=B67gz5VW3iPYKNzeUv2h87/1DRMFS+9NVrc1RRrcgcOsUUGc+fsAuViNC508BsinESGL
	 jgIEPz6k6QkGScK0vMYfvF4dfIihJJQpdldIhZdpIMQKybHwXRgVchQQepYOG2/9DT/NR
	 krt0ipTKMUqotXLCg4Qkrh2CGc4Vz6QTZot1DTj94UskQfz2jfpvsH05qiyx3ToVche4d
	 5L27oSTZ63QfwCuAVOjtSIOkcH6qwKOIadeD/o8prpRfie5eBxGfQUAjUntOYPqurCYbG
	 nyVCf4R4OgwSTblZSf2mNQkPbSTGHvY64Ds+2Jyca7GeC/t/59tRAdNxE9orcI717wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
	b=gon49ZOAAnSGg/t+SBmq0BcXmEfLKbGeHw1pGLc0dmU6CfnupJYo4qdgWsr7qJ+QrfBA
	 IGNDZw9v0fvKIH13gPGWpmTUld4PjJO7ocYf1JG8L27hi3pZzc2XVXQnqDC+Ne05a58ta
	 NATDNUsWg2znrHktI6RnkmGwht1pskSW6VC0wDiQHgEEveldZTPv7cmZ5FCnRE2o1eVE0
	 w43RGgCFB10vmFvTQEDZkc7NHuuv1SVixe14brmq9PjkD+Rsu8y+uiM+N60PsB38p17+i
	 7bLpLEN/pdRsdG1aiBYuqY5EMEkt2YWQkgRpB2IQyp/jmyIPemsFkPSzGvZDBvi7J0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57510606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57510606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=xGusYjGi
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so5018745c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 20:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891033; x=1795495833; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=xGusYjGiAdnGxncVaBVneIpjK1Ph9eHqEeeWt7lnJOkMFdfkTt1BtipRJ++rtd7axm
         TNY7mXokRzpdPDScm4nkTWyZVHSDCLj45TjHq4Sbviprep7R07QzTsdMPDa4KrXp2Rvn
         8lsnvqGG1oEchDAwidDM03GPkgBCly20w/qqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891033; x=1795495833;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yUYUZ2LlOsiIpdrbhk1wJZRY3ayR3Noi9TQPGtDKtP8=;
        b=gnV+YnZRuNZ5dNaCKb3/jRdRLreFFS3Iw64C0YQcakstEn2C2Nf3w1p8m0G1amE6WO
         cWiR/mJxCpj7IecTLLIKtuohvaSfzSglUrkQe9Bqk0MyF5HEnw39kfbNViIXf8c6y9jJ
         R2bwQVaiV0IK8y/Eq/htC+L7zgZuNBUSjPxiums6l1Mc5ikede0NKQ1UxAxIBfPIIVrE
         JY/sjQPA5Z5k7BBDFmVPswprVDXAXz16eD2fYAlVfCEOFzH4rBHMYvcv4+zoiAxdpf1x
         nqAGBCyqJAW00EKH7OjXZHOp6M/x0oFz3wWGcy+UHk4A8lr18ROqCEStrEZmlCvalKOb
         9m8A==
X-Forwarded-Encrypted: i=1; AL+hErFWpptxcyRZKroIvNdmTF4eWM76xnjLp38X8v8azjVQmAPp7Ux+nha6L2gXhnOYuuIyvm759Rbb8IQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n6lXf1/NzLllfjPad/OJnwIvnNjxl2RnDNCUkYu0A1U6d9DyP
	5N67nEuK0cIG+fZs/+exzGvKgroTGBbT2pa7EVDNvWO+Tt9imyoPThUXe3+n1Bqyopw=
X-Gm-Gg: AYBFou0ANf4mwlQbEu5vq0l13sCFwaXVg0+7l1X+uAEUg2JUPQ3nvENRHglnrulf85H
	N1t5oJEJrGO7ZAAIOswJBhwDijhD5CUQg0YoFFuQxdSweCWo0cd6m1W6LIWy0FGoc4HUto12xvX
	HJP6+Q0KlCLhYPw5ZgQu1SncQRKO/GJ/3tbolvlJENR9/yGcE48XcxibAB8jFgG+j1LG3ugg/gq
	afsygpOvFhW4MLwclD159tM8z3ZTrkFd8hMVda5QlkjrvyyM3OG0H5BSryfgJ1lRhvtKMqTUQmR
	D6R+FBjXVV4Npxs8ZBgrbhsWZU6rHBEMdkoDsdvBmU4uSHCY0FePAIBoMmQP+qF/DnYntWNj5Y9
	R3kDU28yWXDRfR9PFVfrXidxLV8PmS87GadAUNGO4Bq49hAcyg4Y2Gd5tzlwvAbYVq46dyUqfn2
	HQhsaMoLh+5P4iFPqw5+Oaht/F1Wj5GhV1VbDOrnXoDQLueHAK6Vd+ElWWRElNfO3TOyoOPZNbU
	MpY52XIlNjURGnVNZT9Km8oPylhCi64ZYDATKIUXXVzwFwwkeoz0WJimEFazokKBsn2THgQ7rS2
	aBX+2i7d10vOILsMc/PXftL2az28oqVjdGzpu0lGNcK6hKJIaemnm/D5CGbZT+iJb0VYz+xOz1h
	s/xirfnQx67mKMSA4PF+OEtyVUWVSVKymT/Q2m3mtyPTv46Ccr4UbdxrH66Vq0NE32jm0PYPHul
	hNRkj4k9d9FO88c+EVQqH/dYFodJ4C/zVPftJpd0pnif5+sOPRTaF5JOsDHPfkhFZz
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr13989391c88.14.1794891033256;
        Mon, 16 Nov 2026 20:50:33 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm43375533c88.5.2026.11.16.20.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:32 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:28 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mm: memfd/hugetlb: memfd-based userspace HugeTLB
	MFR policy
In-Reply-To: <20261115160105.2507650-2-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-2-jiaqiyan@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avvdFHtnw2BlE5Vq@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

This generally looks reasonable in principle, but some comments.

Jiaqi Yan writes:
>+			if (!mapping_mf_keep_ue_mapped(mapping)) {
>+				ret = VM_FAULT_HWPOISON_LARGE |
>+				      VM_FAULT_SET_HINDEX(hstate_index(h));
>+				goto backout_unlocked;
>+			}

This doesn't look right to me. For example, hugetlb_mfill_atomic_pte() also
checks folio_test_hwpoison(), so UFFDIO_CONTINUE on such a folio still fails
with -EIO. Also, do_migrate_range() calls unmap_poisoned_folio() on any
mapped folio with HWPoison set, so offlining the memory block unmaps the
hugepage after all.

>+	folio_put(folio);
>+
>+	/* Refcount now should be zero and ready to dissolve folio. */
>+	ret = dissolve_free_hugetlb_folio(folio);
>+	if (ret)
>+		pr_err("failed to dissolve hugetlb folio: %d\n", ret);

This isn't a good idea when somebody else still holds a reference, such as
a long term pin from io_uring or iommufd (Jason was asking about the latter
in [1]). dissolve_free_hugetlb_folio() returns -EBUSY, and when that last
reference goes away later, free_huge_folio() puts the folio on the free list
with HWPoison still set. Now, while this sketchy page may well never be
handed out again, it is nevertheless counted in free_huge_pages, so a later
mmap() can end up getting its reservation against it, and as a result, a
SIGBUS when it faults. That seems like a real problem for a VMM with
passthrough devices.

I didn't check in detail, but since the folio has to be dissolved when its
last reference goes, wherever that happens, perhaps one way to fix this
would be to do it from free_huge_folio() instead, and treat a HWPoison folio
there much like a surplus one? That would cover the pinned case, and I think
it would also let you drop filemap_offline_hwpoison_folio() and the
folio_batch changes in remove_inode_hugepages() entirely.

>+		if (hugetlb_should_keep_hwpoison_mapped(folio, mapping))
>+			/* A new raw HWPoison page in a still mapped hugepage. */
>+			ret = MF_HUGETLB_IN_USED;

This also looks a little wrong, because a 2nd error now gets past here and
reaches the hwpoison_filter() check in try_memory_failure_hugetlb(), which
calls folio_clear_hugetlb_hwpoison() when the page is filtered. That clears
HWPoison for the whole folio, earlier errors included. I'd suggest instead
that it only undoes what this call added.

Thanks!

Chris

[1] https://lore.kernel.org/r/20250120172626.GO5556@nvidia.com
