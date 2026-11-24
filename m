Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795486046;
	b=Zb049rZseBIJlwmqW98h0NGdBW4gUqla7paA3YZ1kKKMYwCbhifZpFGhLl3o6Ngf1iFs
	 V4Vu9qUzN9J8cXK9THuN985nIoHz7iZomBR+bFpfQE11JkSaUQUSAG6SwmDPh+NuzXMT8
	 Vsja1onpEt735gI2S4g5p265oBm1D6Rrs4i9IIjmFtdSlB8ENOWvmQ6nzv22MkSmov3Gl
	 63oo4B1v5yTkvJUPUXaE0B9qQo2AzWzLJMr17/rWXP4D5FIpt9ARsMdAjSVo/B7KSZSIn
	 YNnFAENfRVit9AUj6DCWsF3JDD1TXNz4Wqx0sfM8lTpAaPFVELWs11ANc5hose7kLaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
	b=CybGOz3aGCaJYXK9jVk2cR5zEfjc/ATzFL/2Szi8riqc1gzhArOzT/U2G1KaGg+1kTF1
	 4q7gUZz8o8cr26f4/JKAQd6gm857lw/TbqGvW1gBoMJ0rpDqEZsas4LtD4etC1tBMe6FX
	 y6MLib1lhxEDRJpzBDrGfVwRS/KC8vYRoVpOtjaZRSBsKTJEsLp36244z0Zc5ftOKgMu7
	 ZFqJ5z9teM5ihjZxnPfUbBltC2vFMPTDCafkp+HL0fI2ksta785xThTEVLT6oK6ScHtoF
	 HEyfS+239YwFoNtRGwOkc2VSxBpnnOdZDxro1MZNfFThxgPl8EQcHkZPU8eMN/EwMhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIYDo5Uy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DE0606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 02:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIYDo5Uy
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so33972315e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 18:07:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795486045; cv=none;
        d=google.com; s=arc-20260327;
        b=kNypau2pRNcKUcgm3U9+ZH16apK9TVJ+IrktpXSUG50nBu7yqYI1exV4BSvifOqLkH
         jBYwDWYgfs+XDD1H+xyHyONbHlpKUMhOgcbkldDieOZ0us9BbCpa7BGf2CbGghsh4I64
         xfLzGqDJLtSxO0k7xR6bDxspWkVQG4HBNx1uw685uiTTp3G6XgUx4ChFyw+cSUHL0txl
         V5h0IADzAcpmutD6JjQJrVqY3zr3LLv5tWSkhQByhTksQXSVS9G+vdHSTeZXXX2G6pGF
         FbT0/f43pSqP1Y36gWTq+VChLSuxOv7weOuuDBqeVZwmo6gwUXIgHTtG0cDTE/ik59Gi
         OHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        fh=RXuH5p+Dut/J6rShGUcDYpt2afgr5Gs2d4D9Rr24CZY=;
        b=j4je44TxzYE1dvCBevJ2ueiu6m4TR9qWDuDwBiz8pIQKptiT5TEwpaZkmK+dRKPa17
         8KuJrA/6w5KqpKwOnMlGEbJ/sDz29IYvpFfDJ8/9/hxHA5VE8FrkgsmtUB1WJQyuEsT5
         sX1jzkN++/CH4DzGs2gsvqpHhr+JgV7qhTw4j6PdOw/I/SF8kjhlLaXn/FgMPdtGNbi1
         Iva8JSHlkrKCnJ5WaKG84m0CaEWUpYsIG3E6gZkZy1AE4VeU5monrNs7arVZ+3LigjG7
         KDL4Rbdl/PRueZhiqLqlIeiJIIUc8csvruTwp4qGVC1xxcf8jrdvyjT6qIl0LGSxEwes
         yfkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486045; x=1796090845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        b=SIYDo5UyPeegzFD1ViLJPRhiEjKYH1q0flElCuUlcuZEUKkw7v/HMw/ehCUJevfcGd
         mlESo1r7lcOmN1JzmR41ZthsPzPk8cGka/ZEGxAwVRgxthJRUx4gCiSKRn1AWbb4J8ud
         XHUfqwYfzHmEG3/v7GEEqGhScRWV3CSlCgk7F6pHd6NfywZSMW79SscHKI1kLs2pTy5x
         Pxr2OlQJTpZTb2xgSOLhj36CdWvOGoVRNQnPumRRs+uFHGjLkmiFPX1wjdzVaHktAl2P
         oRyIpuMjGKdY672PTaAJ7aE2HAQykghZrGVPL6kt5yJo7RVQV/72O9oVGJYmJvYiN/4t
         piMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486045; x=1796090845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nOEK6bBKHw6MpZVBmQwMq5VAH7bCtPDjb3P4ihpZ+U=;
        b=J0tDkQLUZ+cpWZMHKmTe29ubi7j28dKvTc5I6GTcw5UmQTW6G6AQyodBt53O89ybG/
         1iQzZj2k6T6J7gYpED3dy/47eMYBPtj7+qklQnA+9gKfwtAQD0/k34QfFU6OOauRfMyK
         Q/eYNlaBHAvITcNvOhUrPgsPUpY0QOulZISkfeVz62UWknN87rxY3iU53Jpf1Bb5y4PN
         MjZfbHkurhuXpNW4aMsxHu4O8FcYHfVOqHN0A9mYXKx+MOM9oW0cKmPS9W6/PDfX2Zbj
         7MCIQNCsBl8H6V8gQgKH1/d722+W0hFTJSbw9x7UDODop0bg4NLAiJ8KeiAtU+0rBom8
         oAyg==
X-Forwarded-Encrypted: i=1; AL+hErEqrS83MlKJEKyuV32i2YJSIz3MHfX4TXML7xEXk9gejx9eQ8QsDizk70TSv0XqQULHHipxUIBuntI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3h/gN1dPlz/O0upL4N7SH20MO+Gpt6ShQUTQyHc2ejov6eG2p
	H8BteKD6/Hocy9J7ZPL4v2dXhrIBaKLJi803taDytYrXGiv9X14dy38Splly01nQA4IJuepthAh
	y+/FvrlQU0cOe8gXCg++nonv9sAX7jMU=
X-Gm-Gg: AZFdTZc0j/HXa73yxenUM3HLeQqUzTC7+0HUqteFIXEDRZ6cOlWu1bjPPHS2aRh57dE
	ZbPslCmotlAsjyVl7heCxVAKYPJUlgkA5Ox72IHBcrXlhoLxsn69qFboRCmmj+pkIXHyHropNmP
	kL+4gIwBbyj6B8wBSRrGiFMXhI608K0r90DsiPkzQDp2sYMtQV5K3XS3SfYChLMlOXNoTTT7xc0
	EOnZkKBZN6AFNoXjtYiu4RbXLUcwjBUYonYGHLTSik0QFKC9BBtBPkWtt8WY9AENSibPgeKQ4Yh
	jmJO7SYYm/odbAdCi6kh9DcwMQR6gcSq27tZ6zuMu+k+rr/t7xz8tRp4G18DumRj5+SFAsLOTjd
	rnv+bvIQLdi4aISFV9HgTdBIrqPxT4ABTC6O9wndWk4NdalV7GP/ts2sHig55rzAwOPsUExd+tM
	08X7HVoWsBKKGuyRXXnUe0yCNbt3SEgHRuBCkl1D61/CEi8QC8ZoaD0FNZ8zfrkEIReIYm+w6LP
	A==
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id
 5b1f17b1804b1-4bb88812c92mr280620945e9.18.1795486044232; Mon, 23 Nov 2026
 18:07:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com> <20261124-mglru-fg-v6-3-8ffea39934a6@tencent.com>
In-Reply-To: <20261124-mglru-fg-v6-3-8ffea39934a6@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Tue, 24 Nov 2026 10:07:12 +0800
X-Gm-Features: Aa3M54oR3KlpB0bkG1vPMJxZCKqEDSLHTpf01h2UkcgR_PoelqiPBgymN4KGxg8
Message-ID: <CAN_Opa-UaAUu=dOGmDAUiaU+3-s89Y+Y2krz6zGEsNLHB3k-Wg@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] mm/memcontrol: avoid potential counter leak when
 reparenting local stats
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:53=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> lruvec_page_state_local() clamps negative values to zero on SMP.  That
> is right for readers reporting page counts, but can be wrong for
> reparenting once MGLRU updates the counters without the lruvec lock.
>
> Reparenting runs after the forced stats flush, so a negative is a real
> balance that has to move to the parent, not be discarded. We will
> introduce lockless MGLRU promotion which may cause following problem:
>
>  1. A refs CAS on a folio on the child's lruvec moves it from
>     inactive to active, and its active/inactive counter update follows
>     as a separate step.
>
>  2. A concurrent isolation of the folio reads the folio as active,
>     debits the child's NR_ACTIVE_* by delta before CSS_DYING is visible
>     to it.
>
>  3. The child is killed, and the two __update_lru_size() calls from
>     step 1 land on the parent: NR_INACTIVE_* -delta, then NR_ACTIVE_*
>     +delta.
>
> The child is left with NR_ACTIVE_* -delta while the parent holds the
> matching +delta, and reparenting the child's raw value is what cancels
> the parent's credit.  However, if the child happens to hold few enough
> folios for that counter to be negative, lruvec_page_state_local() clamps
> the child's negative to zero, which drops the debit instead, so the
> parent keeps NR_ACTIVE_* overcounted by delta, and its active + inactive
> total overcounted as well, permanently: the child's local counters are
> gone once reparenting is done.
>
> So use a raw signed helper and reparent with that.  Ordinary readers
> still keep the clamp.
>
> Reported-by: Kunwu Chan <kunwu.chan@gmail.com>
> Closes: https://lore.kernel.org/linux-mm/CAN_Opa-+nb0vxQ+HsENCG2fEEMZoxG9=
Sy_DBC4CLkWjNLzDWKw@mail.gmail.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/memcontrol.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 091401cecf39..3f551e2e3206 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -562,11 +562,10 @@ unsigned long lruvec_page_state_monotonic(const str=
uct lruvec *lruvec,
>         return (unsigned long)READ_ONCE(pn->lruvec_stats->state[i]);
>  }
>
> -unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
> +static long __lruvec_page_state_local(const struct lruvec *lruvec,
>                                       enum node_stat_item idx)
>  {
>         const struct mem_cgroup_per_node *pn;
> -       long x;
>         int i;
>
>         if (mem_cgroup_disabled())
> @@ -577,7 +576,14 @@ unsigned long lruvec_page_state_local(const struct l=
ruvec *lruvec,
>                 return 0;
>
>         pn =3D container_of_const(lruvec, struct mem_cgroup_per_node, lru=
vec);
> -       x =3D READ_ONCE(pn->lruvec_stats->state_local[i]);
> +       return READ_ONCE(pn->lruvec_stats->state_local[i]);
> +}
> +
> +unsigned long lruvec_page_state_local(const struct lruvec *lruvec,
> +                                     enum node_stat_item idx)
> +{
> +       long x =3D __lruvec_page_state_local(lruvec, idx);
> +
>  #ifdef CONFIG_SMP
>         if (x < 0)
>                 x =3D 0;
> @@ -595,7 +601,8 @@ void reparent_memcg_lruvec_state_local(struct mem_cgr=
oup *memcg,
>
>         for_each_node(nid) {
>                 struct lruvec *lruvec =3D mem_cgroup_lruvec(memcg, NODE_D=
ATA(nid));
> -               unsigned long value =3D lruvec_page_state_local(lruvec, i=
dx);
> +               /* Reparent the raw value: the clamp drops the child's de=
bit. */
> +               long value =3D __lruvec_page_state_local(lruvec, idx);
>
>                 __mod_memcg_lruvec_state(memcg, nid, idx, -value);
>                 __mod_memcg_lruvec_state(parent, nid, idx, value);
>
> --
> 2.56.1
>
>

Thanks for following up, Kairui. Reparenting the raw signed count
fixes the case I had in mind. I also checked the clear_refs and
workingset changes in v6. Both look good to me.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
