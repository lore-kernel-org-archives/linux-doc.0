Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904944;
	b=yUDqJuB+zp6fJ06xVuxXU/ZegRGLwsXIsCm9VK/zD20vu7s8M5THMTkajjocdFUKFX9l
	 1ngPMi0nfFyAa/MGrI65J23x1euSYxrTor8RI5bE94zwYGTKOl25IwDqFixOggG6F9ytC
	 ita39p90Z3TcyRmwuXFp7pA70hz1v3dNNKVEynXKo6QCd9zTvFUS16nXZz4zbiDHvDj6Z
	 OQgbTrtQVLcvm+K6b/lWGIMAl3HpqSnRQ56hIfCSv+XsR6Nn8im1kSzHfhFT6OVDmXi8n
	 noeso3P9u9MJ7VKyvHTjHs7fIRbKx7RF2gfb2YnyDp0KZmAuRfYGjOUxsjXkvjLxatg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
	b=nHKmAb9nNosVyohn/lLOvkgTZ9oPnmrNF9xM+FXzQULV/oWeP7wsI2nkU2Xs/acsviuZ
	 1G/GD9fcAROkI2pb+K1dJmK9zY9gnPEHc7O7CFaUcBG6mlcbIfva/SYTskxIrQdocURNE
	 ugidMdaSe558Odm9PIDG5lYxyy3SdKlrz0TgXYZij405spjeqq7dzhpJTkZUyS+O3Ol8L
	 50y5CWFe60Nr500FE5uwhlzfkPJasEDII36D2hCE3x4fLSu84btJ/rG5xHGFEiGTXd3M6
	 ehtb+MSKu4iizRFNUzf0ymSdMvs6dagT0afwXubBzB9ZOjM+e+qCoHofpKO/FGchDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iz47Vl8v;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB843606A33F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB843606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=iz47Vl8v
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ec396c93dso76300196d6.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904943; x=1795509743; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
        b=iz47Vl8v6JkIKZg9UYfyENByJGkp8YiAPJZj5aT+ZIWJtz26JLkljfdgVeOeTUHKpi
         fD+WdtGKspa4q2AxzmQeXoGQQk32iqFWo6zZZR3yDrVQ1vK/HbB3xBejTJBvr/T16oNW
         P1H614T3EMYfwy+o6FHrygopJOeOGa1XEaxFCJNqvbCTcx8I1gaWn0iBhdTWEqp6pW7I
         k8fPNOjH1RutKyHx2SDDsKfQoQn9h0StyHhNNC2VqNR0bEmdsDQA7kQxJTrh/gxuZqR+
         kfMtR0Yh9a2YiCZc6WHAGleSyiuHDgem22R+ssBXM/t8XJBZxYGh+Byyuv/RtLwZWCxo
         W/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904943; x=1795509743;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beHv4RWKzAGXqCj9AQIheRdqq9/SqD5ToQS6bWhTNyw=;
        b=rN64A4hd7k6aH1fFjCkEdE6Yh0I7DsQgWIfESeoSY4Uf5FXG+MtdNGnkdK0/PmlN2Y
         HaS6gcQwJG+PtAJzjD9jppMwAaG73v4nHrjicl2SMEhjfze+ZQfZlL5UgTsW6ixJf0aJ
         5BDbTTd0KduivHuZ/nBhUNPumNKUZBmvrbYJSFoIEMQPyDWvhcd/8P+WshyN7z7SYx31
         o+3lqNRV0K8oLvEadRd83nG/l0Jr3UpSDaxu3kVSSLQn9SyoIJ6nnStmTY/t8Baziol8
         OAhO5z6LyS2sh5EGBuuyW9jtojembmzgmKofTPcc1TZ8JA1Fgg0j4G8g+QbTnnkn7Zxa
         8C9g==
X-Forwarded-Encrypted: i=1; AL+hErEBMEMOaDJLOL1pcsnKvUonTMDcKvm1k59fZVU02NomNfolJzzwSsNyXopwAX2GHJOHKCnHqT+dW0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VqS5HrhoD0kM1cydSBAIrMwRgOymSuZLozfrUyqeV9gzWyLN/
	jBpQszvUiYbEFdl/tJd37KsxouJCvmPP11haAGd73RKE+dYxJPNab5frgDznUf2FzBQ=
X-Gm-Gg: AYBFou0zzMGL8QQQWimPC2HAvn6PmWg9vjLms6zNZzmcDil52ENzvov98jhvzOj6npN
	3UiPz52b04KVLslilME0i0/mvaBO1sWjOFTc1LYY2WxWfh5PTFVXi5+aEScotdnVAqmODa8FeRu
	+nzwymoPkVgSbNCIHUP0wk9gK38ghkGGMhCao1IP6cUNBKRVgRgKYWDSXbEQO/lqfQe7KN0i5Ma
	Npl4zN+cWg2r0KxliwGrvZnh2mUVSVoES4DDcoKRb3FC9HuUQqB6Ex1fySfmJD+54pcQ8aE23V9
	Tstknvl2BXDh53HjkFRWuGlIvLgX/Mkt4yj7TnD/tU59jABDvG2JaWFvpNksm5iHjgxSxgLhsrG
	T3wB7XH6hyxfICmNN8ixOcFUgTEQP1EiaqNh5vPIW+lHKyy9NPIuayTr0grthI5WxdB2fFlAxGg
	z8zBYjo/eJOHy+wMZ1kD7Q++j1OQza8Bb/29pIBF9H0GLKPfUEfPkeaAKPFptNBRC+h8nEA1XJF
	4h4YN51Z0ly0akeYXFphcugp4mmCn4AXFf/HIKIft9ez1AxeBGwD+ynMugpyxb9v9FDgmslQ/GI
	hqxiLa68qB4KY2SyfhWcXycw00bmLe7FdsZstPz4QKFIftspb1giHU1RZw9ug6vWWJ6qqJD+rir
	Uku8rKG/QG1wtrxe05Vg5rZt697Ze
X-Received: by 2002:a05:622a:758e:b0:55c:5ebd:8823 with SMTP id d75a77b69052e-55c5ebd936dmr138487931cf.66.1794904942797;
        Tue, 17 Nov 2026 00:42:22 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d37daf422sm44268211cf.15.2026.11.17.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:42:22 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 06/15] mm/hugetlb: fix mremap() racing with page
 migration
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
 Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, 
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
 Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Peter Xu <peterx@redhat.com>, 
 Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, stable@kernel.org, 
 Chris Mason <mason@kernel.org>
In-Reply-To: <20261116-fixes_hugetlb-v2-6-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-6-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:42:20 -0500
Message-Id: <179490494079.482102.4618915344813254218.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> Migration of anon hugetlb folios walks the anon_vma, so the file's
> i_mmap_rwsem does not serialize it against move_hugetlb_page_tables().
> 
> There are various issues with that. Most importantly, move_huge_pte()
> releases both page table locks before the TLB is flushed. Migration can
> then find the destination entry and finish migration, reusing the old
> folio while the TLB still has entries cached.
> 
> Hold the anon_vma write lock across the move and the final TLB flush.
> This also prevents concurrent rmap walks from missing entries moved
> during rollback.
> 
> When we must allocate a destination page table, flush the TLB before
> dropping the anon_vma lock, then reacquire it after allocation.
> 
> Dropping the lock only works around lockdep: hugetlb folios are not
> reclaimed or migrated by allocation compaction, but their anon_vmas
> share the lock class used by ordinary anonymous memory. Having a
> separate lock class for hugetlb's anon_vma (like already done for
> i_mmap_rwsem via hugetlbfs_i_mmap_rwsem_key) requires more thought.
> 
> There is a concern that this can block page migration of anonymous
> folios quite a while ... which is not really different to what happens
> to page-cache folios today. If ever a problem, we can temporarily
> release the lock.
> 
> So let's keep it simple for now.
> 
> It is a shame that hugetlb has to implement everything core-mm implements
> in a different way that just screams for problems.
> 
> Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")
> Cc: stable@kernel.org
> Reported-by: Chris Mason <mason@kernel.org>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

