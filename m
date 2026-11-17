Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904310;
	b=0x6GkpqUkPGZNqKjw3QvAaI/zNlhqMwo7G/CYdzZTmZLyCKekEe+zCxOUDxshMov4ZuL
	 LtLQzTMkpIOiJyrGa2EMtb6GMWt3UadkX9oRDIqUMKH98GG112jcKVxKJp65B8jsSIFg6
	 yROsPZOJK/Cmz5iydAHGheEq7iDgI7YHlxR0BDT8fY9yWFbBOWi7+2jKLrEVvG/5+gj62
	 ZjYDqd0/fmlMWfIJJ3ixnbVPdeU8LlWS+KRAorymmJJ63uKRkoTL44SuuKAz8B+YFsS/0
	 EFeyWMz5k3zVt8rxCM4gR3EcvUzkz1O+J/KtFRhj7ZiR1wF0MCOSrc5+W4lQzEHTcfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
	b=UV0pUe9sEGw0VtBa5mQ4PT9Mafd8W8BlOStiVJHMJd7QRzctiXowxnmqE6Nep0kjMn6R
	 QTtoHOWBfR1NQ8TzTx5LdzBywmfBSwOgEK3VW7M+/BPa8aVv4Jrcpk5ZPzOHbmJ8WvsN6
	 KzhuwCZ/mHv1JFaPr7ErPLUcKg5V0IOsssFZPIQLfMZI5S8yQXz4nn9dyBc8I3XXFOlcM
	 +HipllTaa5Pv4Uc/uxTKrn46H81dF6fQnObVFhiJxKV3NCT3uJu24NXLdygG31ZarOp9W
	 Y9RKxyUYC19RgH225AzVHviYp2WurtPVxTM1n2lpFEGsqnFC+cX1nHrtS/HUFjSAOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ourL8s16;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52B0606A88F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52B0606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ourL8s16
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55d3563e50eso28006421cf.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794904305; x=1795509105; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
        b=ourL8s16qvV/ByzrXiQnYSg2kF1A4uqN/AnfqBVQNPBbatZm3DUHQ8Aj5mDYNeanQ5
         MJwxDSueO/GwOBcCYIaM2431ceTkAtIwsRppYKovBOwmv3uilo2gi3HtSlXrxM41UOrR
         nIwd/WnpWNv0lDvrSo4gxjlev3eVFrvzyvPT32/reHLN8c1iROWdTpDcqLiwSDVszKTk
         tI9wm2+3jBJNt+T7vJIMKCVa+vkQ2GH6b803gnwQfkS8l1Bx4WBOwUeysmA7sm5XbKP6
         WiMR5/pZsgjQZYxksMerIC0S6h9yq2gpH5rpRHE1RZmPl0Btw+pchgk0cibqsJOcA4N+
         ka0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904305; x=1795509105;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TmH6s81HME+/ARGnJwgL9bVR9VW6JoGP/0HNw1M8o+8=;
        b=GJfCYNi5T3udaqRk5xTCfcaxAs+ge1s13OPNDDZcRvip+kT9/+zQ4tTcy+GW2HU35b
         WN1OgrMwsNf1TqJDXgXcIEt8HIZIYJKTu9IunUW4GP3ynSt9zrhDXdQ1LDh+6wz177+I
         4gFqt+Rt/fHs8sEFbP+2RS1WmwhhcJ60NuPpYxzuLwo6dppGSzyePXDU+6Wrnvw+4ZIr
         I32P8hqzLMsm49H97ewQ3sM3OpKkG1cTGLjaWfIsKWPEAhvhY1m8Ryq/VVs40TX7S1mh
         A5fCQyySKUfUIruBfFuhJtl/zzDZn8ukkgSpRfAJfI1EZknH1c7dfWNsP8wxE4uLZCCi
         dN8A==
X-Forwarded-Encrypted: i=1; AL+hErEXIL4/lXdxGgjCRRKfFhEGsKOpW0sx5qlgJDthuOFpE5V/j21+WMLYR9ujr6ZvJrHWFmf054vpucY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gTCytie/3DT5dQdRyhKSM862UUe+NmHcQ3RnmnhY7c1DvY3xU
	7GhvP2sqN5klM4e/B/DN+QgzHkkbkM6SX0T3I8L22ZGzGjRIgtmJXHunKqggnDaL9mo=
X-Gm-Gg: AYBFou1qXrZLPpR1jTlibTGPoyE//HuFKRNvqpMIoyxWi4qXXmAQKy85NK5usDiZWYS
	wtRy4HjYGO/v2TFTZ+sD6bSnlp0BmmFNIgagyc8JXi5CNI54RHnlaKzkNzOZwWxtPsG66Jx22zt
	t338t1OkqwxGQZwmMRpgSA+ptipK3owUzhBdfK52wobkYj8X4GRTrlZu8I04uGmZOmW1eERq1Yr
	niIXLDXF1tbQOpgQrGN6o0wk+dW5Yn8CW0wlIsYJfg2rxrsyFVTluRDubrwiJx4P+7bWL6DBwyY
	Y+4175/nYERGUcwpHKww2+KpqpIrbVEbZoEUUrvDidgBiZFcBlibgPJi+tDrzQ2heyN8R3iPigz
	DRZ7JX3YDFakRiFp6B2MGsxHfyv+ToBlUmx23JyF+YWL4xopmz0jdJX/QJIsIEJhC+6eBFu9M/O
	CnvV8uPd+AySZVLBlFM/lWpOhBrCSr7+FV/kIIIi36RzwhZJSKZpT4itcB3Ue4F1l87AsreP9+n
	exqmSOaZJeDkN+hodud/H31M9w/hoiEoUv5I+Cr2xVqbK/J0vmcxjqkkqVxOWS8+sHNOhpkeB8b
	84LBVdNVsK0dFHvn7uUo77/s8QI1TRWz3K9nAlmjx/KXFJGf0WmEiRm+0sEvxpdQhMvOlAEF2Rb
	nipKU86eeOWr6NiGSII++CO4SfrMCSQ==
X-Received: by 2002:a05:622a:258a:b0:55d:30e6:8d8f with SMTP id d75a77b69052e-55d30e6a736mr108004181cf.59.1794904304803;
        Tue, 17 Nov 2026 00:31:44 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a2006csm99694361cf.10.2026.11.17.00.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:31:44 -0800 (PST)
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
Subject: Re: [PATCH v2 07/15] hugetlbfs: fix unmapping folios from private
 VMAs
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
 Josef Bacik <josef@toxicpanda.com>, stable@kernel.org, 
 Daehyeon Ko <4ncienth@gmail.com>
In-Reply-To: <20261116-fixes_hugetlb-v2-7-4dd9e94ea9ac@kernel.org>
References: <20261116-fixes_hugetlb-v2-0-4dd9e94ea9ac@kernel.org>
 <20261116-fixes_hugetlb-v2-7-4dd9e94ea9ac@kernel.org>
Date: Tue, 17 Nov 2026 03:31:43 -0500
Message-Id: <179490430300.482102.17633361840450824485.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 19:29 +0100, David Hildenbrand (Arm) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> hugetlb_unmap_file_folio() assumes vm_private_data points to a struct
> hugetlb_vma_lock when hugetlb_vma_trylock_write() fails. Since hugetlb VMA
> locking was extended to private VMAs, this can also happen when
> vm_private_data contains a resv_map pointer; treating it as a
> hugetlb_vma_lock corrupts memory and can cause crashes or hangs.
> 
> Only take the VMA lock when a shareable lock exists, as additional locking
> is only needed for PMD table sharing. The fault mutex and i_mmap_rwsem
> already provide the required protection for private VMAs.
> 
> Fix generated by an LLM and sent by Josef Bacik in private.
> 
> Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
> Cc: stable@kernel.org
> Tested-by: Daehyeon Ko <4ncienth@gmail.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ david: simplify description and comment ]
> Acked-by: Muchun Song <muchun.song@linux.dev>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Was able to reproduce a hang / RCU lockup pretty handily and verified
this resolves it.  Have not seen the relevant crash.

Regardless:

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory

