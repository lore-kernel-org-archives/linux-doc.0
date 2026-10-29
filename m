Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793307227;
	b=ZSDFsxHB3Decqi1Z238Bb5Pi8VCOaNMuYBOHn2qmDZ2vMdKfiy6s6KWy3IhvaigzrwPT
	 wWQSLUvHbYjMP7NA5ZMIEY5uYd303M9C0ixvG9bu1cDylykkHdKdFTOIV+M6Q5s6+Oy+H
	 uSO/K0ZkTqsBXOtTKsxrpckC7ldDV5M3qTMKaF3YTAaPhH5R/c6en/2GPGR8O97sdckkK
	 bgaSTVgcKUt9mzwVlLlmsZMMN1foUJnPppEch8Pco7B9xooP9d5BcxiwdJdU5W/kdeNbS
	 mmQAIpqpif0waqd5hFhAhs43Tqsi1S2nicfZAc4jcdDxmuyKTLZwnqJAAjbzBwl8oIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
	b=SvK5NSHmhuFIxb8bj5T0Ep3EehbA0dEqdESp99D7Gt2Kco8/EjIlGPmnGmAfsq+fJhK1
	 FPYVf80Qycgs+zyIxl6JZU1uaWNYRQ7ngXTnc7PDBRknDTcnfH7GfKrLjeiKQy3H0YhYN
	 DaBgOzcnlFM7epO7J0Zq7ZpxsSt1926Iuajmrnm3Z2HLSLRstQcLpFeLz5g0oVhhJgQP5
	 zzW0OGYl8FNQhUTzIptYiVElpdK5CFxHv7VX/PyPNUSNogkZOff6xqZAcuxBKIoYlvpTf
	 zdqGOYYgd8m/r1z9u9yMl1wgTPSa6RVcro9gZeHpxNlwzSDtqYPPWJKzxTrbDBO470Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X4ncqWDH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E4360A2609
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 20:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E4360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X4ncqWDH
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15943c9c005so2235583c88.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793307226; cv=none;
        d=google.com; s=arc-20260327;
        b=l1gCoJ+/Fhgy1nEoIHXmh7Oh0ZlxguyOeUM6wL8ftw823aKC/H1gJA1iz8W9kiDPf9
         YvvzSBMJRsKEFjLj2m9MrX3wOnz86RlQb78PYBX2BxD0Ak7nzYq+TO5gkuTR1KxHqrcw
         EJ3ddocftQk1UJfP6QGXBvkixbciNDcJfBSGHOdmVs2Kw6yzV6HbKjlTOW5dk8WVgQAT
         PUSta9UO5l2X1/+9E64crwtnr66WNhKTaUcP/bBz3NOnd4ey2xMTTCpMiA3pkGlbBKnF
         G17VFDVODX3U5viIM57T3WQJzguPN6sW/d3yDA45CwmS0X0EfPEY/6gFt1ew465lorTM
         fwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        fh=nl9mwLPvCF3d9oqr14be+8cskOf2L5j05tFSCdrwPWs=;
        b=SVMFdiRFP9u4/6eCMCtI+4+U6KAsKi5ZWdUmJpHXN2YtqUd2X9/JE5fz/69Doo9tHG
         OkUNRdpR6yP24FGQAUc31Fs4jUAjU5MvOvLRVXGUjqKO5nC11PerL6+By9kK90RwjrmM
         9arHKFyOkRsu0rKhUevmtNSOFxdSilpet0tb394wJnIKe9ysyeASDs57SrGK2HoBtv7g
         G2MnJpURJDsxRW5t4SaZKTVB7059E5tG/EX2B5veXVL2PgnOCuLrv0iwhv242L0FPgpm
         SWfgXUR16x5cr4jECA4KkX7p0et02IqVqD1sDfAT1+MjFNuIVLxNggrlpTFQUP2e4R1E
         MvVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793307226; x=1793912026; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        b=X4ncqWDHObARExJNzFicTAgGNShnnQyxHKRK/cw0fjeWbrVpO9dqNdFUtJLaHpfPe3
         3pQCYs5wPDyyeDRmHh6ZqxApAZowXImXkA1IiV80Wa+vN63OrMv6zHZ38w2Artqhj0kC
         TU5uAZwV8krucDNHMSBMsftqEv1zyLHEc4T7kkfonRf1QyhSc0K9tIEDxDosPnvHYJtU
         xrApcK1DGEJ0jC9G46yDslykO/UkCOdwNhIENzzsS6m5+HzjfiU4CekIHstdVmcDr6+w
         qoB3o1FiEmAOoeBr6eS4J+v8S4/RWAMAqqL+riJw8IsTfV7R0fo/ywFH88iTB5PhjqF0
         soEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307226; x=1793912026;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9X2/iX/Lqo173Vwu0EOcoEv3bNJRFgizimBaD4S5Pk=;
        b=kbtZX1olpptiX5NrrF9oHNHAGvaG9OKVp0PK/NDZtqK7IubrKbEeAhrPhiOisYkNr7
         2ObQhg6anYjQ+7senHgCjjiRDZ89iwxiwKnPN903HM3fhS5a2cl3esHEbyu5kZD9n9Xt
         d2d/xkz7EScOmTaHHKQ28OHu8OZfuKnntEuq37N/IpZF71ufOp1opjoG0oPJ5YZuAbuC
         ODeQvvdNJt9POLg0uBcuPjB9Mm4p9NNJ3fV55qkeY/cKRKwhfyyUu8EKppeyCQc7g5M1
         9zh6syWW1kYvtAFc70ulaTxUcjdi0dK/+u3HbKZiORj071/077BmHp9ctKbuKUlV/+gu
         tDHw==
X-Forwarded-Encrypted: i=1; AKwUvBxovG8LP+qgRgYFt3dGZDWo1awJTf/6n70oRsIjzNeLvU8QHTAJp1k/yc/y4XiZqiwnfnDBeql+i7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeD6vCWC5XEkgKfEKJci0ZOtDTqh8FZ3YOvqmBDccLoNCmjJBF
	UMSXCZpvfaLwnuqk1NOAyI62eOnQ1MN8ErJrpTCScaJG4DD4vqnNnli2krX6D9MfI72ECSlXYpA
	SL/7JF6fXWOpvhOYJv3eHs0PmtpUiCUKjKaxQ3DQx
X-Gm-Gg: AYBFou0AJAimevrdLZ3OtsUsrsEuPQ53I2Tjb8kml14Pcq6LXsT/cF1ZgFU8OTRd3cx
	RGvkH9PFbm2NNQkzyRcA2awQo5vGVKDCQv7NSIa55VmWMCJ9zTrHD+aEOYbkG2rSogq2nZJa/9+
	ppQ3CUV5EX67hqHGKAx3VAYAAzg/iYmsUf0xRh2gYvbA58K0gOrhIe8wkHCq2Xb5jWmm+6QPGFJ
	qN9/WZK3PpFo4MwJMZBt7ZNHjOuMnWZvn3istSvt6WnZmGBE7T+fexCeocFYAzjNl6m73nU0nRD
	K7ipSrIeKEe6uRSVy/NqBZeqaDuVJQEc1FLL8B2ICC68noeOsEpRBwDmFUxzVa6nCcvxo0w+BbQ
	wsd04dDCMsrzJzBiALd2T5mpMxu4zQ0nXsSLUB0w3qcdU4kPghts/m7XmKMxWWyeclTa5GmGINX
	NZZJTlKpX0fM6SPOPSlvvMpK4=
X-Received: by 2002:a05:7022:2522:b0:1a9:c9fe:12c7 with SMTP id
 a92af1059eb24-1ac5bbb4b85mr358477c88.9.1793307224406; Thu, 29 Oct 2026
 13:53:44 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 13:53:43 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
References: <20261028-fixes_hugetlb-v1-0-a0a033db180f@kernel.org> <20261028-fixes_hugetlb-v1-1-a0a033db180f@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 13:53:42 -0700
X-Gm-Features: AclHuK_vfygndkmig7dtJT75402KjRWCrBeo-qQvow0jlIneeAJCjzWqgPCqOeQ
Message-ID: <CAEvNRgEY1uNs7F+ZPpcbx4Tgg=9r+f6nYpPsnm7em0+2YMq6cQ@mail.gmail.com>
Subject: Re: [PATCH 01/15] hugetlbfs: fix integer overflow in fallocate()
To: "David Hildenbrand (Arm)" <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, 
	Andy Whitcroft <apw@canonical.com>, Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
	Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Dave Airlie <airlied@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Breno Leitao <leitao@debian.org>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gerd Hoffmann <kraxel@redhat.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-s390@vger.kernel.org, luojiajun <luojiajun3@huawei.com>, 
	Josef Bacik <josef@toxicpanda.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> hugetlbfs_fallocate() rounds the range end up by adding hpage_size - 1
> to offset + len. vfs_fallocate()'s existing overflow check only makes
> sure that offset + len does not overflow.
>
> Once we overflow for valid endpoints near LLONG_MAX, we can get a
> negative temporary result that is then converted to a very large
> huge page index.
>
> A one-byte allocation ending at LLONG_MAX can therefore consume all
> available huge pages. Pages added beyond LLONG_MAX are skipped during
> inode eviction, leaking them and triggering the BUG_ON() in clear_inode().
>
> To fix it, calculate the end index in a simpler way that cannot
> overflow. This also fixes the signed overflow reported by luojiajun in
> 2019.
>
> Backporting notes: without commit a08c7193e4f18 ("mm/filemap: remove
> hugetlb special casing in filemap.c"), remove_inode_hugepages() must
> include the final huge page during truncate and eviction.
>
> Reported-by: luojiajun <luojiajun3@huawei.com>
> Closes: https://lore.kernel.org/all/1554775226-67213-1-git-send-email-luojiajun3@huawei.com/
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Fixes: 70c3547e36f5 ("hugetlbfs: add hugetlbfs_fallocate()")
> Cc: stable@kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/hugetlbfs/inode.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 01c4d6f44ebe..5592cfc6cc8b 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -721,11 +721,13 @@ static long hugetlbfs_fallocate(struct file *file, int mode, loff_t offset,
>
>  	/*
>  	 * Default preallocate case.
> -	 * For this range, start is rounded down and end is rounded up
> -	 * as well as being converted to page offsets.
> +	 * vfs_fallocate() guarantees that offset + len is positive and does
> +	 * not overflow. Avoid overflows when calculating the end huge page
> +	 * index: set it to one past the index of the huge page containing the
> +	 * last byte.
>  	 */
>  	start = offset >> hpage_shift;
> -	end = (offset + len + hpage_size - 1) >> hpage_shift;
> +	end = ((offset + len - 1) >> hpage_shift) + 1;

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
>  	inode_lock(inode);
>
>
> --
> 2.43.0
