Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793320085;
	b=O4jge3pt03Qc17vZ7WGEP0wb4RmQWyhgZBfR3Ew/3iePZdLjseQUi3/ikEsUnfrEPBg8
	 DP4wSZYVXN5aVpIFuXWQCJE5+LmDLoUA1yAPDM6yKq0Yv8ItWivnXKOATy8xa2y5oJhy+
	 jfnjvw54hvhkl12CC6jE9qb5p2cM2h5P6exUm5oO9EDme0Cl6LbYn1b1RXnjR8YLUxWrk
	 gByVwYcdOf1RvVU7zUssUb12ecnW3i+XkVuL+K6Stq7Dc7yCAzOP+IVC39dwAXcwlS1Lk
	 HbuzIL1q0FOAz2fofMrpt49Ec3+5ogRns0ZM3PI/OWEwLNOOcc19yswEaqHVPiMbzGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
	b=zAFOAvlCZwQTf3n7Y6XH+cDb1lYCfdlzzWxKBReonTYiXfgs7YqGJJ+n/EkFzdW13FHL
	 P0DsJccmHTHJr//P9ex7g3DoF9Smfyod0E9VBVyWcZ3zq5ManuNAfO71+H8DZDKqXu1sf
	 gq6GaSI1L71TkPWo99kheu4vo+kxZ63bAI/spm0JQzXEDjeaf3SvJxWYYRpcXB8N13Ugm
	 77u3sGQY2qcanbuQ/Y1m8DDXT2FGUwwBqhADzAjNzQ+P2yuAmTduCUuQ5EJmgLf/cKo2y
	 REOIcpsV+p71LDwd955Mc4dU1GjHes5EzXJAdCdK30/SWT20WFv+x/wWBBne2WU5geg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3+GOBRP;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B6606A31A
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 00:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3+GOBRP
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so237891eec.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320084; x=1793924884; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
        b=L3+GOBRPTYRzjFBeLhfr170NmUzssfs5NiKPaDyA7W0VzQOvDy6EneHxWu7dx5UZM6
         Vd76mGp6zpdGPMOWyytLUcjxhWAQxnc/mr88KiN2S6H9hjCLMgZQnDZbJVZsU/yPh/Wk
         Y7t3XRVlZa9QwZhlS6tRojs3JYLCO37ZRjBn48oOqwUv6R1FY149WhynsS0KISfAUKKC
         hi+iqmRBoQ6Ounxl+scBgcdvE+9BaLP5iua0pqY3ZboOVfDOxrTQIBfYqmu+0Zs/EWaW
         corrJwYSotZi8BW/t9TQ6pvXdBrXT+V6oufqTC4cDTyn/fuYuFB3Kg+RgN6OWM8aYhUE
         mEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320084; x=1793924884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux1Gd4wJ4i6CbO5kAuUr+fRClS71fFbOF44xw5i7O6M=;
        b=uoaPpMLTzP4w1gTSsypNKC8zdfF9qIUri76z0B0y9NtmjLYdMtUwbHjpagtT4CMH2x
         +JduYqbw6PR+rq1zNBuHrgYYx2Dod/eB3XROejGFP3rzdhtmOxQcxktfdAgHStENTt8m
         ljC//tHHRUAkcy+c0p6IytYKV4ixbnZhyzLutUZHN6nVgs5rOD6doMcI63dv9QkWptNU
         Orj/9ajHPUljoH40aabmQQulceKNFk7r0kZePKFweeAuDw62GI76cqKqxenNMBGrY/iQ
         IhmG/1bEJO2jl5Gx3lelOX7VSIs4Fu7sEgLxLEMzK5R/3vuqmzyiZ46hw8EVUj5wn+jm
         1u0w==
X-Forwarded-Encrypted: i=1; AKwUvBx1Rd25NIrZXnxsZN1D83PO6ksOYYqhQFwrt2nQTwvE1L0LzjvnRRpqToGOOmvVq7V+4MSPIW3fnr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImEtLZ86PbMvVcZaW/9ftc+TjrEjHmeQ1OWo3vzieXEulpCuNP
	HlFTTeTKDi9+gpl0Iq+gA7jfKk+nj7LVpWx1HopLMZzx91UJWqQOMIr4
X-Gm-Gg: AYBFou1jwyreNn+35ZCYmfafTvHNSrwerbMipS0Pe1TksRNnAxrGKc3Yr7PtXunDxTQ
	oV9knLRm/oRV9YknZtDvC6EXsmdatq0Jjvi0jvRVnyGXFuCVEuUPA4c/zCO1/JwbC89Y1i5nOIT
	ztKIEQU0VhKVJ2XRiJo/ci/nClxNtUkuDGEeuy62aqdJ8Z2UCbeumkygUVVyI2KDdnBOZID9P53
	TjtRWaM8AFpad/S/L079kK9E2jkO4P0X3OyFj4sCAhp+LWduq8fH4ku1XYikYwuABMWyXfEOzjk
	0wjze8jZaOZ/m66QykS6lzh3hUHSE8WQ0CdOVXTUq2sdN6ihBzFvvqng+oZrtqFA3qSp/2KovbL
	dF+DerEGQDmWaNmWHpNHoxprN8x22WWIwjzyp8EuZdg+Kcyh8BuPzoNIRlCld5/WRs5HXliUdFu
	ngBnLYGMcu7dg3roEvEQrYA7PQYTXuzEMKyO5FXfJKAVGPk+lL9I+rlj8oU8jf2abTtHAadDjkJ
	lALK5SIX3Bhu4ZqUw70PZ8vZge8nSo3k3px5XYvawQuSRWQ/R8kbmt/rtujgkIyEew3HEsevrhl
	5HqjE5vCTDj9IC1t7cbgerz6sfaVncT/7I0M6OK9sjB1fHpR
X-Received: by 2002:a05:7300:d20f:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-36a3002ea6amr5283586eec.13.1793320083521;
        Thu, 29 Oct 2026 17:28:03 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm1883940eec.5.2026.10.29.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:28:02 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Muchun Song <muchun.song@linux.dev>, Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH 2/4] powerpc/mm: map shared vmemmap tail pages as read-only
In-Reply-To: <20261019090830.1917657-3-songmuchun@bytedance.com>
Date: Fri, 30 Oct 2026 05:56:16 +0530
Message-ID: <fqxovxsn.ritesh.list@gmail.com>
References: <20261019090830.1917657-1-songmuchun@bytedance.com> <20261019090830.1917657-3-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

Muchun Song <songmuchun@bytedance.com> writes:

> PowerPC radix uses an architecture-specific vmemmap population path for
> shared tail mappings, so it does not inherit the read-only protection added
> to the common path.
>
> Protect these mappings as well so illegal writes fault instead of
> corrupting metadata shared by multiple tail pages.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 3 +++
>  1 file changed, 3 insertions(+)

Looks good to me. Thanks for taking care of powerpc path as well.
Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

