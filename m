Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679203;
	b=FWcFJ/jW0zFhCcEhssruB+VYfhe14b97Zxhdjy+RJk6FOZLrFvSO7sUSFOncfiWPU4bM
	 Wo8sVorC9fIdBV007vy/FNor2kYzMNfSbnC731NQHumyIkdyCIj2aTPrCgy8LZjHeG2TB
	 Mj7hKUtecue+2/YlSBks/ev+bG70v4u9PBzFbGzQ/OFos0LztMGDW/gwec+AQYxCyctHH
	 9MdBl1dzc5RiUPIvOgAypxhSU9OBIMOrkMYios02IdBpNPGrQePV1KMR1Tkmskl9+q8Tr
	 V2bshG0y7ThysDFmev31vB8BGRE2kPelGoWNABJUCh2wtcTOXj2r0SnqODAokHzv3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
	b=mjXPIkx/U46B+D/AeMWH3DIZx4r7+XBzrOMt4yQy+CQIu80LOWEawJwmaaXVMpStNOSj
	 gxsnW3RX7GcnMsjqdgQyCciyLvGhV2AsAu24x4g84pCezByrXLBmXh0kTo5Jq8Y2cPQlM
	 yXujzBDc0qC/PZ3gnh7RtI5KwuxS/bqFuMeREqU5UgLj+eFP7BK2RGP49Oinj8KB1TNOt
	 BFbucyR+k4DYhvRgLBCARpX9CKIZrh8rsUsyNbpxHEOojosJ+oACy9cs0UtMAdCKMl7s5
	 MH9VaXizLAv9akVXFwkcZlzMLeHST5Bwydyhj9xNQsg1r7lGqvGK05826YIinSWDWug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eFKbHIse;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A499A606A337
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A499A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=eFKbHIse
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-536c8f958d7so13233291cf.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794679201; x=1795284001; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
        b=eFKbHIse9b3So+Vb3z6hrfoJA1N2APapW8mJ7i2EFoMQRcCmR+NEEgUdKI9HHlj6g6
         Lva+HFJGVODnzNDRNQ+kDEtaU7zXTePFpo7lP+deuTueXmIt+iXaC6tkikE3WZqSyD4/
         s39ceJW0dwEtp3SE2Cf69EpD8SYIs20fFyDyUgK80HH1ohgJY9z7DyatSQKVEei4Xx/d
         X+tZ1YmB2pwLKGkFEIsQFc1hTkqCMc+47X3aKK7sXdz8cOg8BO+SGJspPb4MLlbIxd88
         tXYXZsOosNho23tqr7Cnv55MLiM4vDx5E/RqMitrGguCOVxxzjwXmoyF2uzTPb2VmuTv
         KQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679201; x=1795284001;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/31rYS+RTknGml0ZJpQj3HlEE/4E8Z8X4z83aN0X9Bw=;
        b=baKiFSDW7JFLZ7EWmegO48RkDitbIQcA0LPzPA4sfNvK+9i1zXvXuM/XBzXGqARJGT
         B54iI+NFNCCrT7iqt3CUrZZnRZ495YOmvJQRrl5lgB8In/TcEJypO4qU8tkGUzOhue0j
         mXRQhEI0OtYAxtFb+EbZNBDkuxSQvc6KAmKmHhm5SIVVmDwBHkXa14qfkNKfHVMSOSFJ
         aQwdrmt+m5gB8SVOuseHvUKjwyu6KI0bp/4ZyK7PJWf0rfnADUGgNlrXwx87RhmBlXem
         gw06+ymilc4XGtiAyF4p1+3wFdBYvq3AdNenAmICYlPN9nfnA3RyboH/thZaiqPBl613
         Eatg==
X-Forwarded-Encrypted: i=1; AL+hErF0SDT3mlx9y8pfEtY/CunMa7lmktzffcT5aKOYk7GDH2ReQvwHe2uxwfdOciQu/LE6huAQtefRGV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z90XWBgaXKYZ5cVdnxkrIn8g3whID1de3n/kGzmuCNmAnesP/T0
	HPhiAXlLSEndt2cmxaWVFmKAg5F48I8lvQUzn1BlG+W0oD8d8DTQ80g+GXg8g77GwdI=
X-Gm-Gg: AYBFou2LzCIxTDVrFkcaXFR6gUQBmguQe9e5A9Hll+80cGWgiIHMMm5HGH5MvcrOwVr
	3ppbu877HLwTLgYUmBKM9fdr9lJejxKk04U6ZlNv54H5R2uXeJn/ZQdEH4TrNjTU2LDYVACCNHk
	EJnZhcgX4MOmlmG/BoitZPR6aqNfPyrMKUI99kRgmHQ9baOoxHfPS6xNut0TEBgABQ4G8gnWKzR
	VqExKGN+j1cmXuNFba6tbVgK1Oc2Lritb2hixf94LZJi1S2T5KmpEFFoR9DhWgwvVbNlsU7GT6d
	AtvWueMPD4g43jbnm3tTbZcYjeAxmc3KLevkSCTm5V/pIizxvtoi88fjCqD5On3gWE2SGQ0wRZ3
	NMKT58TxzA5PY/fAd3RSliEP8PIyOvUGAM2ByN92Xej+yzGRyZZNcQJnkdomFNbjZdHdQxr1WLS
	JFrKSg7Gy+i058qQtiyxl5niXfDhise4PbjnXtOKzMLn6OOIz9RQ+0Vr0dgpEIjZd4PYuP5F0P1
	zK65Jpc0sWtZPAQm65Ii7+3exI6nTWAEVeRmksmV+mccdO2ilOALT+B76TbEdnUcOlMiQBAGBuo
	4W68znWDN+LzaDwvxbCBC51LyDeyA9u1QAmIwee+lkw0s1z+PnEcnNfvrqHy0dMZ0m7jR6pT7z+
	fxIlSQI0=
X-Received: by 2002:a05:622a:349:b0:55c:abad:a72c with SMTP id d75a77b69052e-55cc6d16ad3mr26820281cf.56.1794679201165;
        Sat, 14 Nov 2026 10:00:01 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d614b4sm47945926d6.18.2026.11.14.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:00:00 -0800 (PST)
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
Subject: Re: [PATCH 13/15] mm/hugetlb: fix reservation leak on min_size=
 mounts
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
 Chris Mason <mason@kernel.org>, stable@vger.kernel.org
In-Reply-To: <20261028-fixes_hugetlb-v1-13-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org>
 <20261028-fixes_hugetlb-v1-13-a0a033db180f@kernel.org>
Date: Sat, 14 Nov 2026 12:59:59 -0500
Message-Id: <179467919954.482102.5381456550239958011.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 21:13 +0100, David Hildenbrand (Arm) wrote:
> From: Chris Mason <mason@kernel.org>
> 
> Failed allocations for CoW mappings can leak reservations on hugetlbfs
> mounts with min_size= and no size=. The leaked reservations survive
> unmount.
> 
> HPG_restore_reserve makes free_huge_folio() restore the global
> reservation without returning it to the subpool. This assumes the
> reserve map holds the reservation. However, a CoW mapping may have no
> reserve map, or the map may already account for another folio at the
> same index.
> 
> Commit 58db7c5fbe7d ("mm/hugetlb: fix avoid_reserve to allow taking
> folio from subpool") allowed owner CoW allocations to consume subpool
> reservations. Commit 51e1de00acdb ("mm/hugetlb: simplify
> vma_has_reserves()") later extended this to CoW mappings without a
> reserve map.
> 
> For example, with a subpool minimum of one page and a
> MAP_PRIVATE|MAP_NORESERVE mapping:
> 
>                                       subpool       global
>                                       rsv_hpages    resv_huge_pages
>   1. Mount                             1             1
>   2. Allocate using subpool reserve    0             0
>   3. Free on error with flag set       0             1
>   4. Allocate without a reservation    0             1
>   5. Free and return to subpool        1             2
> 
> Call folio_clear_hugetlb_restore_reserve() for CoW mappings when
> map_chg != MAP_CHG_REUSE, meaning no reserve-map reservation was consumed.
> This lets free_huge_folio() return subpool reservations to the subpool
> on error.
> 
> Do not set the flag again if region-cache allocation fails during
> rollback: that would undo the flag clearing and skip returning the
> reservation to the subpool. This also fixes the older case where setting
> the flag invents a reservation for an unreserved allocation for a CoW
> mapping.
> 
> The doc still mentions PagePrivate at various places: future work should
> clean that up.
> 
> Fix generated by an LLM and sent by Chris Mason in private.
> 
> Fixes: 846be08578ed ("mm/hugetlb: expand restore_reserve_on_error functionality")
> Fixes: 58db7c5fbe7d ("mm/hugetlb: fix avoid_reserve to allow taking folio from subpool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Mason <mason@kernel.org>
> [ david: simplify comments and improve description; updated Fixes ]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Commit message is still hard to read :| (or maybe HugeTLB is just awful
and no amount of massaging the message will ever help this).

Maybe note - this is an accounting error only, the pages do not leak.

Was able to reproduce the issue with a UFFDIO_COPY the provides an invalid
invalid source address (src=0).

1. Create the pool and mapping (hugetlbfs w/ pagesize=2M,min_size=2M)
2. invalid UFFDIO_COPY  (kernel allocates, fails the, rolls back)
3. Close uffd, cause a normal fault
4. Unmap and truncate the file
5. Remove the file and unmount

                  Base                    Patch
step 2:  total=2 free=2 rsvd=1     total=2 free=2 rsvd=1
step 3:	 total=2 free=2 rsvd=2     total=2 free=2 rsvd=1*
step 5:  total=2 free=2 rsvd=1     total=2 free=2 rsvd=0*

Result looks correct to me.
The code hurts my brain but looks reasonable.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

