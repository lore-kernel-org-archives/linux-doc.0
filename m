Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157212;
	b=yv8dt/kU65UEmI5/okvhyGtf0hq7lb9rx//LGabTuQWXlda0PDwU3K0NNfTn3y4Zr/fc
	 8kDRJJEVnMd+FL+NoEpTZEdBQ+2FuyF11Zv1mmjk8R0U1hTSB3UL83ydhO4FqgT6q7LLw
	 +avvcoaTirp41hZT65C8wPz5+DxHfTA52SyudfdutvUrGHYj8w7AxfZFxTlT/ICwRTfBz
	 fQ/FGvWN7mof0illBjqe7B+/ebd6sXCP4nfkVaUuhCd9fDIQwtYxjrINAdDG+zKxP17Ln
	 hcixs+hmBMAOgVox7Cf+jE/+xUTLmd1hfXpG8iVUNOje+jE1g0monYe2TdWKkG1NSJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
	b=yqNDIuGoLV3K4dvJvL4LSoxJDLIDgLAPcQejN8HIt0VgKeOmWL17kaVuGgdgv2v5qwbn
	 Iq4mQpcRxjSRAIok50uex81sCDripX7Lm/2ZwIsaZFgvjaX/RIw64Sv4YK4REWicJx8zQ
	 ua1sOIar+tbWzSMm03aiNsbTIwMEcvO1iAX9SWeyGFiY/OAhXckuQf011WoloUg62zNia
	 x25SVPrnBTl5V4X+Y38lZLsCeys0dEHB8zprEgQFtzRiNoOcFajGYEH/pOGNnWvrp6CyO
	 ZHInJNddMmMr+/Yv/DuzQmQX1+9l+cbkyMFZcSgjiIlGHC+UG0cIV5hX1sT37o5K4cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivbYnhf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC8606A325
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFCC8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zivbYnhf
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso5581225e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 22:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157210; cv=none;
        d=google.com; s=arc-20260327;
        b=P0KR5KZrmhmaFs3eiHLBXanWbkmmpMgrxJ8nddPGijaqU3ti/ymI62HjupmduFXwJX
         EzLdt3EjjKptG7tZIBe7np6o3vdKIw7T6LX0GYIasOMbkMf1VnFZgiRZvDwzgKA83eak
         vXZtkRbu25rJ7YukaQnGqyMXnzpU5v5cq2yzAvk9zOxtHvACtwPXnlF7K7ct1ZGTSDov
         u7PeVXCKL5Bhh2dKMraSrgcfBSqukcd7c6g6TzSH/VlbE2Dc4z76mQ1UZGZHq8io66XB
         16HWpftmwgR4iwsnGVz+ANbKXFIPyTmMJ1bSFGT9Rjui8qH8KsYUoALjexHLKt6UQgzV
         U1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        fh=aiXPa9gbr7WUv5o6MaGCIOiW8ps+rTpiM0BUfjZ0/fk=;
        b=IkfhkZzDSQWcNLzaK+xzNMEgbLVEMPzdDPYe3Q8ka2PKmamUv9BTRnxcbGDYXF+qka
         2yuCgmKw8usFflespu9iqouPO2iuEF62Y6RcDQ3y29+Cd7Q5CPM4nkwzbX4Ja8L51f2X
         VYVjcIEhSjH6n6vw1ioTDZTQzsi8MjHjVWwqrM4Ph6d/GD2ubyl/+obtad28bjt5SHCR
         mPefi+5lsE2k1YUeNWINSGZlWAuZvvhhLFIqUhCpfHm7r4+Ryd983+LGv06NXdBf3yYD
         hTZIXsBRaijeB9KzDSHD/t+yxBuB+6doWNPXANwWegnL9VgnjyWRH/IR50sGFZEtu5MO
         D4aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157210; x=1795762010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        b=zivbYnhf7owyhLTE/5r/3aaw/bfE0rS6phVAheDTlD1J2Z6uqpq4g6KsP58ymMF2Zj
         TIXryv4Hy4jvD3EM5bKVHmeE60oQ0ynXdNGs9wSf7TZz2xm/1scPEl2sByeUr1TASlkt
         rhAD14HyjDHTkyeO5pjjVRBjaqf0aHqRUIXqoRdhsioFM8Emw6BpunKijQDt/PlCA8nM
         22W6PdeMWclJF1fChbGE/+yGZMH/Tu/NB/Ivty4T020IcszE7Gp7BRCMbWGz4ra9kqdX
         DK9xzcXlSv65x+g/bA97b7VzBTFz909LQr2+v/uTns0prBkmHAmY++7fqhmk0ihKVXWa
         4l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157210; x=1795762010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yh5Pw6Ns7Cwi6C95SoPvU5P8PiEbr6Awtt6kTXpPyU8=;
        b=tOf+hAFCS1d2yt913u8drlBOsgVE2S+lWKhBuP8RiIbTRly9pVxUtN/WlQD2A5Yfps
         9Im2xl1qxigPJCHQThqtpoLymVMiNj7y4I0hdllfxroJEph3TiiDYcYMBYmmtv6GQ0ag
         6p25Q34sAUm10zVxGRAzG2x/yOHXuIiwH9R553K8I4vTVx9cCQJllqPLzduxAZ3u0O+L
         8lmkDzSoNiISNM3egROUeGZvlQ5j+5kF9Ln9cIgCXFuO73wCPa12wv3WpgDfTfz9IzoU
         pAa4W8nKNZNqqensxkxKo/1326irDurZ675MoaX64PuZOgFZ4DRsj/eZCrA/S5gE/hKK
         Sdnw==
X-Forwarded-Encrypted: i=1; AL+hErF4LzIXu1TsL8q4706Sd0WGQVEJR+XEhozTpzNVJT99LgXssdhZk40SlTCS3pEt8qneG3CfheP2/mI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ulok8ilD+UTV72aReuapv9j345xz0rKc4yyols02QZE4+lbvT
	E98TAiQiTEmtaSZ10XQF116HnN/81uolBM2iQ2IVwsFHaI4MexHypKXXwUVIyGqs0YJQrNUhDhi
	0sef4JA0n3SL2XPuEvDk6e8eHjCDX4tA=
X-Gm-Gg: AYBFou2499xs2RrPSRo3UsxgwgcMCh0ATr8Y+4im2DQ7vQTL6ZcjsjIQIpuCChqXt1d
	k7ar3KeJOv65kQ47DnGpPbqkWtOHVm3hC+9eh6kztHzpN28hcvgnGSxJ3zdn0+sdu47qkaB4LEr
	oj1cupXK4tazwGOJxT0RBUCcmO3DMpgKAv4OOw5kjKkn1vsJh6rWSeLIJ9IwZLWfY8NOBVeohsb
	YFLgt+T6TXncifSmmxp+va+14alHBO/Lq01pM8LC10ZpeGbTcYWVIUow722EpRRMc+TJ6G5sHsn
	DDaXlVoZGcQcU14niOukg7viuZ5S3mOHUI1kOp8Z+mmulSTLIe194MWTm+dyysuDyqyErOv9fps
	HzamlotXZhvVntD8526GdUx7slLptpQ2boGct1ys7s37v6x+adkhoLiJgfRG7H1B5
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id
 5b1f17b1804b1-4bb88804c5fmr50882955e9.11.1795157209745; Thu, 19 Nov 2026
 22:46:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-1-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 14:46:37 +0800
X-Gm-Features: Aa3M54q6diJBPt5X49YJ4xjQARO39_f1G-0YmFpyFCjvJebbL7DyzQ2TCjNUNR8
Message-ID: <CAN_Opa9Gu56Tdx2WVrYZU95BrHdGg0+gf2mpv25gM7WCRULJ0g@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] mm/mglru: rename the generation offset in lru_gen_folio_seq()
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
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Ridong Chen <chenridong@xiaomi.com>
>
> lru_gen_folio_seq() computes how many generations below max_seq a folio
> should be added to, but stores it in a variable named "gen". Elsewhere in
> MGLRU "gen" means an index into lrugen->folios[], i.e. seq % MAX_NR_GENS,
> so reusing the name for a relative offset is confusing.
>
> Rename it to "age", which matches what the value means: the newest
> generation is age 1, and a larger age is an older generation.
>
> No functional change.
>
> [kasong: dropped the comment table part, the series rewrites it]
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f6f4bc9a704f..2395ca8ee305 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -302,7 +302,7 @@ static inline unsigned long lru_gen_folio_seq(const s=
truct lruvec *lruvec,
>                                               const struct folio *folio,
>                                               bool reclaiming)
>  {
> -       int gen;
> +       int age;
>         int type =3D folio_is_file_lru(folio);
>         const struct lru_gen_folio *lrugen =3D &lruvec->lrugen;
>
> @@ -319,17 +319,17 @@ static inline unsigned long lru_gen_folio_seq(const=
 struct lruvec *lruvec,
>          * |<---------------------------- MAX_NR_GENS -------------------=
--------->|
>          */
>         if (folio_test_active(folio))
> -               gen =3D MIN_NR_GENS - folio_test_workingset(folio);
> +               age =3D MIN_NR_GENS - folio_test_workingset(folio);
>         else if (reclaiming)
> -               gen =3D MAX_NR_GENS;
> +               age =3D MAX_NR_GENS;
>         else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(foli=
o)) ||
>                  (folio_test_reclaim(folio) &&
>                   (folio_test_dirty(folio) || folio_test_writeback(folio)=
)))
> -               gen =3D MIN_NR_GENS;
> +               age =3D MIN_NR_GENS;
>         else
> -               gen =3D MAX_NR_GENS - (folio_test_workingset(folio) || fo=
lio_test_referenced(folio));
> +               age =3D MAX_NR_GENS - (folio_test_workingset(folio) || fo=
lio_test_referenced(folio));
>
> -       return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen=
->min_seq[type]));
> +       return max(READ_ONCE(lrugen->max_seq) - age + 1, READ_ONCE(lrugen=
->min_seq[type]));
>  }
>
>  static inline bool __lru_gen_add_folio(struct lruvec *lruvec, struct fol=
io *folio,
>
> --
> 2.56.1
>
>
