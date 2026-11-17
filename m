Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904458;
	b=fcEvZOE040imBjX7KQuU0aB4LT7YQnAJdPCInhV7vJJPkgjoptW3aDVqJHtNeV/e6vT6
	 lbvv+rlY7LLB3PQqAogpTzOWJbW8yKTdw4Wk8vm0h4pQIj7hx+rJJpm4S8ry2Ns4VWy0f
	 HljTOSnKZHFU5tTiazh8gEMbkLnSOh5ih1akXolslZ6iwJ72EXm6hMZgbSSVQZqrIRALI
	 DaTCRxWqrdYU1xTnVvAtVAczAW2Xf53dX7LKX5vrCPhQY1hZcZC6bARpgqlJI1pX+FBSY
	 CK0jTrPdohS+V8QqnTJa2XDWrFv8+qTvuZD3HHeqy9A1wC2nZ6tGlvc3+rZIH4/VlvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
	b=0+lta5rPMSjIRqrs5CI0Oekn03jUwfSLQGdD3OLtvMqxthue2Yatg92U0TOxOgPKow4r
	 nX7sZlz+t+GWMs+a3zYoptaRe2rfdljmc6qPAa3OITYVfRJeKDF38q5at9hmgvfe+9rg0
	 vAkOEydp3bq430HFZfBNGlVANh6uYKOcVkFpTBnMnr4PS3tX7tMmPImFFcvWvLYVYVU0K
	 /ea2Ay0/SoooNHXJgG3XKBTG53hSIZ1o0x1WeM0iz1KpUCwd75VWDS5QrDE56SquiQHmT
	 FQLDEd3E9bQoiuvq3O3PeAwC2xgzmbyVh6R1WKx3aX4tZW2S/IsAmOsAIsvffi5r9EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ajp9T7xx;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE79606A8B0
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE79606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Ajp9T7xx
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53665358476so51976031cf.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904452; x=1795509252; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
        b=Ajp9T7xxRJnckbguTgRPsP4gP7ggcnMM2Non8C+yfW5N1NAn2O0Q/Op51B10esi8KO
         cT1QYNfljSecakvsb1tR/hbp5ii+N2C1SQRO5eg/t2RsutoaVZEBO63zdqgbyDS5QRZm
         ilg7WysjeJtFO3ioc4r+QSX3DSDXEujufPRNTgaethlsDC0AKr9+o3fWAovz72E0sL8q
         Yx8yRjXW9Qm4H7uIShTpYdjiG8t/jzEAMZsJrxdGZ4Zf3udWcZX/D3Ul54fwpj6boYBy
         Fr7x5iY0EgzeW9DGxrXqMZIa3hxvoh5Ea3aHbyrHezwcgi997p7vTuXIwrmzmze6/thw
         GHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904452; x=1795509252;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GlfPsRE+i3fF5U75sAmCvXCcdyZhOwjsZrTZwssWtpI=;
        b=bUa39z0/V/AQYEjmbNlqHsm4NkuUnP2PmClhOr6srJyH7AVVv9Rx2O0ezVYKCaVHVd
         juoBNw/T/3UpyOCpSowysuL9jTla1BuU1UjTay8aIsnQ46yX1igFj6m0gD9NM5nDHm0I
         qbhZf3AX97HFQV5H1tKnXBZwsLqRTG9cPUjaGu0EiGxMAHFdC47WfGPjuRjddgMbBPo/
         1cVNmD2FbDGZKI3m7LnEo7za/FK8OUNdtfAbEkWqQf1hMljBK9ib7bQCfD5uxHmGX2ia
         IDQ+/0OCkc1+VPbSWZEA7SfLNANvy6k84M+5lM/r6jgESwNY8U/IVVBuS+PZPHOOD5kq
         1kvw==
X-Forwarded-Encrypted: i=1; AL+hErEaTip43AyM+ud6TVECZL1leceP0KKM5HaHOF0kvsW2Im5nTjXOCcSQbbi+aj9viHc/84JmIyHTB88=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YI9EtfhTnfTidhy9DvWmfDf9qS8KvT85eVWkazVr+bBi56mDZ
	7MoZLdMPx8r2qsCOZAdMC9Oh2w4UYjxcT9f2tfsThuUCm13nc4un91zhU/yQTSo7kcI=
X-Gm-Gg: AYBFou3U9//9HBXBhEXsl6kaxVv/CZmDTht0kbQHLKe3wXZxQFZVkiYwmwD//aCy/gl
	F5x023x0NmgEQNd8qxmLU4zyJ8gZaxw1aD7lffXDa+9IUs2ZFI3NSQUdaEzNjVK6AK59Qu3WTMd
	rDzP1LY4FLZXxLyReclCHd0klvyts6K4kPsXK8jcd8qro1iJWO7oBJ9KIgQikXmCaBryv3xmPlT
	jsHIyp0fHOrD+QjgwKR76ZSk3Q/V2qN2rexFy9oCKbFRUXXDPR4eWQJaoxtIZ/uX39c1XHn7084
	STxtWiVKoX2x8utrLAAPXWvSUidqiz9vdtjiLvIIkhm9rmn/sabQDcVrcwum33Kx/3uiEbo+E27
	Wms2rM6mOFa96hzNRJqczMWE7dGZJf7wBmLAr0FKXsuyzXx9EuShZJ5/mZ7QK0Q8KQNde6tHxLE
	oKLzV3RbQ8ixUw9GUicPvkOZcR38ETD+/RmUaRSqC1uRV9ieGKep3o/PGz8ApAto+ImxzkFqMMN
	fZa5J+Kki4+0YviHwd7YtlvS/le26dwcwZ0FCPDXbSiuvrpipiNeCAqIUFaYr6rCzih3IHYw9bZ
	eJsk9gWr5W3VnXqsM+yZCcNnAGPswMNg7fwnRlxRa+rxSaPuDbKmSleVQNaJFQlfryKzrJmFMow
	/TNy7TdQ=
X-Received: by 2002:a05:622a:654:b0:55c:b6e8:bb92 with SMTP id d75a77b69052e-55cb6e8c1e8mr144922231cf.61.1794904451796;
        Tue, 17 Nov 2026 00:34:11 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ace15ce7csm100171991cf.1.2026.11.17.00.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:34:11 -0800 (PST)
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
Subject: Re: [PATCH v2 09/15] mm/memfd: recheck the page cache before
 allocating a hugetlb folio
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
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261116-fixes_hugetlb-v2-9-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-9-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:34:09 -0500
Message-Id: <179490444979.482102.6690559604747930966.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> A concurrent fault or PIN request can populate the page cache
> after memfd_pin_folios() misses it in the page cache but before
> memfd_alloc_folio() takes the fault mutex. The latter still tries to
> allocate another folio and can return -ENOMEM even though the requested
> folio is already cached.
> 
> In particular, hugetlb_reserve_pages() finds the existing reservation-map
> entry and reserves nothing. If no global reservations remain,
> alloc_hugetlb_folio_reserve() fails even when the pool has free pages,
> effectively failing memfd_pin_folios().
> 
> Recheck the page cache before reserving or allocating. If the folio is
> present, drop the lookup reference and return -EEXIST so
> memfd_pin_folios() retries its lookup.
> 
> This is probably not worth backporting to stable.
> 
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning memfd folios")
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reproduced using udmabuf to race and generated very consistent failures.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

