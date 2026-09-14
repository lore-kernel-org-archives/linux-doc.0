Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0FC470457
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402335; cv=pass; b=OJoQJIc1fWZE3dVV85FCYnxtvBjD92I33oys5PoAQmJndIjlVMyrMWW97Wsoi+l/vBxaBOSDWrg6qHf2u1pldbK66VkzV99izNSPMu7yymmzUIieJs01lJKJdENaladlCDDErkogXjhiKKvvTDFEL16NxUUW9rYFz01dbujQerY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402335; c=relaxed/simple;
	bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBreda+fcKPPRYg1q7Rq8WzF8zCc78nYE9ep9iA+vSgDpzED9iUJmpgy2D28+wIkEUiSpf5ZiaYJ8ej80iEs4cMevUnNMCP2lkdULqII1V6txGu3KQjgUcELafYBr9ehB5qlXwmpxIYT3SK5lWc6CQjkPtmWlxwzBXT83onU/aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iPxS2JBl; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iPxS2JBl"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso24704696d6.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789402332; cv=none;
        d=google.com; s=arc-20260327;
        b=sTMDI0m8XbGhTFEzLtjWdGqXecHVGpnQ2NH6Lcq8difaW2DNk5VdzPmDCchovcYxT/
         Ysd0D6Y5D7Gk37GbrwFCW07ZGL5luYPzeV0Od6TgTh/vyzWjmcQ0SjS6ts8tuy8TBiC2
         LBBVcA4+jEGYwG6lImiBFXiT/KB+PQ8+iPuDU8Blqoegud6fMvj0PI6MkcJ5JIeXrtNk
         8n9/O+aMC6i6GRr48pBh0HLfFhsKSn93UJdixrSfLF167zEOnDDuboPteWeuUg9xqhgH
         s2h8CTlY8g8MVs9qD9QDVXK77SBp4K/sjhhrEf7wIcn+0K+5/IA5O6mHZQaMiNpas8PO
         QNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        fh=ihLrsonzxj7tS1qUDCz/zkzZMSBRAOkjfBuMXbQqewY=;
        b=M9MveJcWnxX6GF5QeDh1Aja35z5mi8mx1JkhDzGP/2EDdjDIhBHR5DX7NvmK+rBTqn
         ACZF/ulxNhnJd4WJtjGTl+8BTlMLu8Y4WRFfMa7h8y1zIvEi6WUaTm8U23NLWQDfsY2L
         kPs3EXmhh8SfYS444yBSkNIR6TWu4mnMhrj2et+Fp7kSdl9TLqrOLT5HlTdJXLHAcCHL
         yLfOnuynrxEqUWVWmiKDwyd0SZgyjdzjIcDI82WuOOKlmVP8usqws3xRXdcmAUZcTiXc
         /oufZaTKULyPlJOMOg7LxyqxRkgPQpRSrrsELMoXFRUkYbQiYKWtkrcfsJ4ToJ+PePVp
         DG3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789402332; x=1790007132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        b=iPxS2JBlCWjKkwI6vuyC+p9d0cFDovSdjWkqcQV34zbE3g9Qfs1+kZC2wXrxn4qPpb
         rKZvPsICkvKF7gbP2B0iNQezKfzeEWT03p7YNUJEgksiYi4/mEP0lAJ1lag3N8GztxnE
         RureO3rxrhakhZb3pXE2RiAncPW60A4Fo/sC+CRaL0DPjcU+hZNvDmxhTYVXVykiNrrF
         YwKNrSUZ5lRm7dA2AT2TfTxos5QZ6R/nXB0ltE8FFAHyMHMDq1fKtbHVuMZye5hWP4tK
         S+QObWjW1fAl88bR/tJKhCXpOYZppcazqEikoOtnNvF5uZWw+V4auwALmLALL87RH3cg
         Cdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402332; x=1790007132;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIrwzndTIJn+zc3gui4wMdEbuLT5FkETFxZVrQW961I=;
        b=SuOZKz5dL70EbbJBoScySsPH8uY5rEZ8H+ooUBKD34LHQEI+nHvXEgUwGqt02mdMk+
         pNBYdBr2oGDmHXhwYr3qXy9Y3J0dj7yg8gNCHpmo6zCX0udfVwoJiSbTZwCRyFo1LGxV
         vWfWlI91SBjbyu4Rj+DTC7PcpWaUtQPy5D35iB/V+v2wbT48rdi5KR5sp26XbfcItJ2G
         n0rxZY+q0+mJnQLxtOsXjgLqWIANs5qs1qXrQFM0Bwp71o4wQb1Z5RxYSlPdMbaap7JV
         bIdk8SsHOhMY4lHR83oQIhy/odhJ3OEkLJLDnKe3CZFUPr80J8LEexpdmtsYCgfzlnOF
         +xbA==
X-Forwarded-Encrypted: i=1; AKwUvBynJbYNNfS/FbBndKCWbTpKGiTKBQrxylcCZsy83GzbyCVART3kLFvc8kX7inU3ntEy9r7Z1k8Xp2A=@vger.kernel.org
X-Gm-Message-State: AFuF++k3PCcX1Aka2Fcu6RO9593LaqTu2fcSF3MuJ/OHYuI6/EVyfet3
	FE4HES6kc2RJLuti6+qD832QmPS9FauiOAjn/AzPJyANL4Z7+PZLYcFDw9LZiLyWUM5vU1shWsP
	8KkkdVRq9dXHTn3a9Mp+yebMK0aQFVO15EHa4vdUo
X-Gm-Gg: AYBFou2ppsnE7OYbLZdtU78smIK5yHiCJuwWGUiV/pyLMZRjlhr2Gm6433YWRX8hWWD
	56ARH8u5zJ1bPeTKGLCasIGwTXlmbDOpZzhznzeaYI5ZvcC773P64M+SsfZKjNoEszRdrZxSJre
	zRVtXZJ9FxlQay9I8t7YgJ7wNPbkPXmeOBtjOcbqLiPVvTF57ubZHbYUU9rLw36K2F+zatsqGNu
	2+myQsPYigRe8qoGV1glQ66PG0cwpTRPb7UYjvKoIUPL4L/0O0QryFlPrdPxa0bjOtsSCQhbKN/
	0XsnIAj7fB5bUPSO5eRS+aPceDq/hfeGS7CJps95GQp9KU6ybUoiZbnsDs6NHVbsgBn0RJVt7Oo
	n91REw00LJQ==
X-Received: by 2002:a05:6214:4188:b0:910:3453:7d8d with SMTP id
 6a1803df08f44-9122e68cb26mr52724686d6.34.1789402330683; Mon, 14 Sep 2026
 09:12:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:12:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:12:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260911140816.3236725-1-joshua.hahnjy@gmail.com>
References: <20260911140816.3236725-1-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:12:09 -0700
X-Gm-Features: AcwNN1WUbkCX1sstQv0ZWJuvqOHMzCSyd9_UN_yhDwBAx0uKe7xefyFjGTdT2Vg
Message-ID: <CAEvNRgFme=qjw+T8NoKwLuhVLBGYeXGFaNM_jB9tR3WkgPLjHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Track used_hpages when
 getting/putting pages from subpool
To: Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Hongxiang Lou <louhongxiang@huawei.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Joshua Hahn <joshua.hahnjy@gmail.com> writes:

> On Wed, 09 Sep 2026 14:49:26 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> From: Ackerley Tng <ackerleytng@google.com>
> Hi Ackerley,
>
> Thank you for working on this fix / simplification!
>
>> HugeTLB subpools currently only track used_hpages when the user
>> configures a size limit.
>>
>> This is buggy since when there are existing allocations from the
>> subpool that would have satisfied the minimum reservations,
>> hugepage_subpool_put_pages() will still restore a reservation to the
>> subpool. See below for an example of a false reservation.
>
> I'm not sure if I see the false reservation example, could I be
> missing something here : -)
>

My bad, I copypasted from the cover letter to this commit message. Will
fix in the next revision.

See more at [1].

[1] https://lore.kernel.org/all/CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com/

>>
>> [...snip...]
>>
