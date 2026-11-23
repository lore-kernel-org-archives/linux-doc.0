Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451040;
	b=G9/1HgliIc8RBaaDIwpjMHECVHtYtqFdjeESsVRysf+ZuqnSVMF5/nz/WJmlDdzMUnjg
	 G6PSqs4aACf1W0G+YfIn5tLwOq65Ds/2ue+cwA1cezLSWai6LXm/Kg9PLu1T1Wzct6lah
	 RQAHwXczf0B66MlIjOyYd356ItdhomOWS43r6/T3s7D3H+Y/Ke7mhTktrHENnKkVUqBeE
	 ws1bAmnNzly/cJg7Ma465cHzxI1+ajQ92HIR9L5A/9NiyjpcbITvFhEGCo2fqZXdDMRfe
	 poJ5Qe7lTTdvHONJ/+WVzigBFoA11Vxm4Z7Z37qVBo21o3yE4+WL1co2tITCoyRARkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vsXwjKBnoZqeiXMuVVDpDy/CmbHWkBJEaAM3FjaXc2Q=;
	b=k74sm6aQBq0+IpUoR9n+NJvsdFtbG2GRYM2EIksc1PTWeY4T8Pc/8e56IkE2kmPJ9UzM
	 VeFR3eKOtDiPBhkTr3dMJYO86SQ6wEkvZ2TXwZtc1kHjZtsDQSHzBgPHh9zsOxz79PWmu
	 81WWrrrKtZE4cNwQonSNB7Rs5EkV3a80LzYdHtFriXvLBDUIDsuOONFsGuEXXJh06No7Y
	 95+Zap0WI0JNK1uJzSPekyqgM8+VcDoY9y7gs/aJBuaBgNqNV4ntGeWAj7pto7S+UKDo1
	 84sNKlgv7uynTvWVQttTkRMD3QZN9ZGp0q7RrpBV6XmfVN1z54JnifmhnWPCwExaEwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pL9e+Eda;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E06606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E06606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pL9e+Eda
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55be673e029so441621cf.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:23:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451039; cv=none;
        d=google.com; s=arc-20260327;
        b=IGlh05+KKA6/fnI/MEDxs/ubJ7QTqg2knLlPQRpmiOl60GTXqFLCbMpANo0vZAYCss
         AJ4lX+Pvx2xPsafjS5WiicUaBY6F9V1Cht0+d4Guvuad4UWhbJAyZ8W5CH1Ce9RuH63g
         atU5qx48PfhT+IKJ7bknMXv8vyO5d0KsLTvHYdPpiLRZTngcgG1SzYKxBwDtfB4K7/3y
         oD6zcQkzGdhV39JTanwTF0Hh18Elnc9jwRawusZLBsMz7cuMa6Lbu7U0OrkdHyDhVAzQ
         SiOvERmejWnFYtyG4EHlol8Ii7x5G+El4zt98yk9PVUB1yjwuQqHXSGcJufjAWW7i1Pc
         cH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsXwjKBnoZqeiXMuVVDpDy/CmbHWkBJEaAM3FjaXc2Q=;
        fh=MQ7ZBT6JMMo3I2ks0IpboTvdGPAj/ln3N6x+tc7xYgE=;
        b=NgIubuyH1Nd8KaVJJOocakaLRylevhbclcfNkJXwuubpU4HVFE73vTQxVlv8U9EVYu
         gj7AA0qiDOM/h0uA0Lu0ZTIR+Qb5urSZmj9tZE5vy8bFaFuLo3x2mMSyyM2jZOi+pSiU
         rByMW3plCFqwzuCcyCFPxkvzxDV3BDG/adgDNjxi9zphEtkdXQxhK8BdlhDFwm3cT58F
         KLzOEwrJ8ouEfjG00PWdeq9iKeMvWKI3GblchHWaLBM7Q4KSaFM9m91Y88smEd9EG6Wr
         tVGv1CFIFZBnje7UV2JE+ql+lM6zlOqOR8YOumuqokLHqgcBzjT+bEKHY4ynjSEVk7/b
         CbWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795451039; x=1796055839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsXwjKBnoZqeiXMuVVDpDy/CmbHWkBJEaAM3FjaXc2Q=;
        b=pL9e+EdaXOjVrkTOy08J6/DrGfP2NgtmMHigmWsM1Mk2V/mIItO/SEu5FbSUOReYDu
         Ic3DauxtXOsaua84S1VxhbIzcFzsAVmYH94t0yJHP3HIfREKYGx8rJ8eqq+aDbYHVYjX
         pt5xjdtHYl19yKWyZbJCJ5dXpxdR89ZhhoeGsoHh56m4HdHNDPzRgoU5yAywHZ96QXdB
         lrHVCNY2z7vSSDO8WDxN1i7lAWtSP8BpRcYpo7Rr6CAJdliRa+4lr9lq7fIk2D6AygU2
         etLIBdawoX/ZYQVaa8hiltQlXe404j472AJWOsTV+yHWR2Fo9uKCEZjwrfQEaxUvKjTn
         HdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451039; x=1796055839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsXwjKBnoZqeiXMuVVDpDy/CmbHWkBJEaAM3FjaXc2Q=;
        b=OqzDHtdj5RSw7uhxV2oRn8CEnTuUWPXHwk0YzFaiLxoCtiyJHx+B4xdm9yDtnTGJyN
         jWrPZGX8cPvP5ZBp3al/PL5QFE5/zfdlHM+Ts/B7gTp1k2z4ZLY/fY8l2HPk25N8L9aZ
         RndEyTNO6do9QXQU+IH9I4XDGoQvkauOvLWCklL/GihElJLFvVWeTWlHgMQqMRcP4y2i
         dvHKa55KuYmn0urX2JmjmO2x04gW+b8izPKdWhVYqR3wVEuHk+Y6ID4k3Sbl6h9cfikW
         YArPaUzwaTscfT2ZDtkxChBITl2qFoY+nQhPDxr/HRvSHC6pTjcvOkLkC30jc3j8coDg
         AnUg==
X-Forwarded-Encrypted: i=1; AL+hErFmasgXE2V9m1KboD+s3YmekFrvmjXuAwKlNTP6n8X+Vds4dfp3GQ/RnkLg3gZYdx2/56KSEJB3eQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+schiSPUboeQK2dgvaDrkir55GmkhpJsxa1EuC78nYUNVefLiI
	SkZK83ibflgpKg++uOhkdHd3tIA17TtVFqpFG/gEz9aJAnWCQDIJxus2VVn3Lf7C9V0QzTzKV/O
	ESjDFIXemrIGLvjwyLet33+7o6KzU74PgqZAs9JVs
X-Gm-Gg: AZFdTZf1YcFLteyAvm9TnbI80QiAwQoTQmN8NCzdWFXR/dQ1+ijv/NnH8pDMuWWKdxV
	op2svcCZFVfxTANtyew6pd+u4xCV+5NeVcAA2OJ+AvEVGF/zulj9yoORRdMN8AifSagFRwtk7wR
	tKc94pOBiCvbmJkqVq9wdablteQ/tsvOCFkeEMPmfJGg2kqPh1NmudlAi17DiHIrojIWKpKBU4k
	YM15udT403agqGGBVsXM3nuYSxmbmf8H8j+7jYCO06mXBmF477oGUsAaa2sDqU07gtn5QCRh8N+
	F84RTgpQF2Y4d7ThlH77LEU3eNkBQwXqw2iCcyTfTCBGDBD5tMmhbWA6xhrw8k4Dm1Qa7H78PxC
	EnxHN2GyuZT0305ts972ORu1X/8huk/K5IOdxd9Isj+j2URzw8mFiDeoX12d+q76inqNi+XYuch
	xeVux0KK6JRsMx1BVG
X-Received: by 2002:ac8:5cd5:0:b0:55b:d494:187f with SMTP id
 d75a77b69052e-55d881708admr36121241cf.5.1795451037939; Mon, 23 Nov 2026
 08:23:57 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
In-Reply-To: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Nov 2026 08:23:46 -0800
X-Gm-Features: Aa3M54r8I6SgrrT7SXUxZTPDg2iuNTzqihC88BGRoF_BhP_IlsfH8qQxtpUWWUs
Message-ID: <CAJuCfpFzd4kKcyUVewacpt-jxPn9tfwWzf=NdDVvaeV_AZckEg@mail.gmail.com>
Subject: Re: [PATCH v2] mm/rmap: correct VMA write lock position in lock ordering
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:10=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> The list at the top of mm/rmap.c is taken to be the canonical order in
> which locks must be taken in mm to avoid lock inversion.
>
> However, VMA write locks appear to be misplaced. These were added there b=
y
> commit 55fd6fccad31 ("mm/khugepaged: write-lock VMA while collapsing a hu=
ge
> page"), which was focused on expressing the dependency of locks after VMA
> locks in the ordering on them, disregarding those prior to it.
>
> Of course, a VMA write lock requires an mmap write lock to be held, so th=
is
> leaves three locks to consider:
>
> mapping->invalidate_lock (in filemap_fault)
> folio_lock
> hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
>
> Each of these locks is either downstream of a VMA, or is not able to
> acquire a VMA lock at all (e.g. in an rmap operation).
>
> This is because accessing a VMA's file (thus mapping), traversing page
> tables to a folio, or interacting with hugetlbfs requires the VMA to be
> stabilised in the first instance.
>
> Nothing in the kernel takes any of these 3 locks before a VMA lock, and
> indeed in each case that a VMA lock is taken it is taken before - so the
> kernel is already violating the ordering as-written.
>
> So fix it. Also add [_killable] to reflect the existence of
> vma_start_write_killable().
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
> v2:
> * Updated docs to reflect change as per Suren.
>
> v1:
> https://lore.kernel.org/r/20261121-fix-rmap-lock-ordering-vma-locks-v1-1-=
952c0dd5bc3a@kernel.org
> ---
>  Documentation/mm/process_addrs.rst | 8 ++++----
>  mm/rmap.c                          | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proces=
s_addrs.rst
> index 04b649818cc1..40be3a46a521 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -418,10 +418,10 @@ ordering of locks within memory management code:
>
>    inode->i_rwsem        (while writing or truncating, not reading or fau=
lting)
>      mm->mmap_lock
> -      mapping->invalidate_lock (in filemap_fault)
> -        folio_lock
> -          hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs b=
elow)
> -            vma_start_write
> +      vma_start_write[_killable]
> +        mapping->invalidate_lock (in filemap_fault)
> +          folio_lock
> +            hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs=
 below)
>                mapping->i_mmap_rwsem
>                  anon_vma->rwsem
>                    mm->page_table_lock or pte_lock
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 65646ed6fc45..55367e7d3eec 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -22,10 +22,10 @@
>   *
>   * inode->i_rwsem      (while writing or truncating, not reading or faul=
ting)
>   *   mm->mmap_lock
> - *     mapping->invalidate_lock (in filemap_fault)
> - *       folio_lock
> - *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs =
below)
> - *           vma_start_write
> + *     vma_start_write[_killable]
> + *       mapping->invalidate_lock (in filemap_fault)
> + *         folio_lock
> + *           hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbf=
s below)
>   *             mapping->i_mmap_rwsem
>   *               anon_vma->rwsem
>   *                 mm->page_table_lock or pte_lock
>
> ---
> base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
> change-id: 20261121-fix-rmap-lock-ordering-vma-locks-62593469bf59
>
> Cheers,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
