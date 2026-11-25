Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795614725;
	b=VN+w+Cp/twvi3ho2dl9Um7YmnIKidBePnwogVkJ/AScSSDMhjX/g3HBjPSDdYyPddxYa
	 k0UCMKBmNux4YsMDL2Iri/r5/ZJHC0I0AfjBUGSGaArJtB+L403tIbh4p9HYuTJqHq1g0
	 kxG+AE7wPqcL1weM34At5gRdWPbCNChGQvpuTBMNMtGokh/jJdDNQSn24ir2eIqA+9z9y
	 Zjt5D1gOPE+1epdhbTnzibJxZOrd84cfDJYQO8v/mRuZzZ5+oISw5ybynadO2idTGyiZr
	 DowOFon6lhvU2sIrYJCBSeosWOUqIDEOvXKQ164/sTNDNI7+0LykobPH9FOXKM4Blfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
	b=oI+lmxLyktlr4Ld7/pPSjSs3moV22oGNcu3cfmTqc7cpFmvtWs4tIfj3PmOGojpbwqXs
	 cCdNM2kbpG5kiF75urgydHwxYH60WgNTonO9bJuCqf1xbOcxzSUoa4Q4FynZKJxNASpaX
	 iKfDl1+YzizPfao2bnYKO1G1zNYYU3fcJiUGIJfkRW4+Hs8hFH1qW5c9y9Phjdwv9Mlap
	 MD/zi2L3bkZLcoz/RwxlDvrpfnsBgFD2lXr76a1fTG6kWlQeT/RhNVV4p9uCOwKdnJ4Tp
	 a85A9j5FwMDMrtT7FgoqgFQOnpxY1HwtEoGsHHkjnqEkP/LrgXbLJpxKQbJIFFVoM3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwkFDPU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AC606A333
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88AC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwkFDPU4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso7373548a12.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 05:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795614723; cv=none;
        d=google.com; s=arc-20260327;
        b=K4OwBBVdgnAJ75rVx/2s4MOKJK+tJicj9O3h9srnCraEI9gT0wh7DLSegCYbp3mZRO
         P9nx+ekdzvuQ9sdYLwp6KVwIkNweW0RX08RUV/yO8CLaclardxT8nXtl/FEQEyCbjRDp
         gNGjOy+CDTYHYlop/0A8cuqutOpfN2kWlsf/vaii+SnutniYBIGBcmFKUT4kANgP85dl
         Mt022Z7332sDhEQwm9wI8kb3ijjpUWGpCl06IHNQKQwOVdoS8bU8kWIYAbcAkF/TL+fd
         78X7nqmyyfLf6urftDzyygtA2HNbnWqu5rUUlOcnZTM2gX5vzM4kcaC5F7y9KkykZhwC
         OJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        fh=E/hsALzf8RGtai0pYF+eOmyspuY6a7yZmHqE2VxNoaA=;
        b=jNTptWUP2lTXyx6HCsB9mx9RTcZxPwhunvfZRNHmfrW/igWOzmgfR27oV8ZaBhfJUh
         Ox3NbXt3+l1iglA0sIISAvR6J1pom1Bz0iHbQVACab5wahrvESHEaDcn7/30gzOZBs1M
         el4gdalP/QfBjiwsl1dKvTTh+YVW6fvZoHRqE/iGNA66tUMr6MPuK3jH8kDZmBXrxSla
         oV/AcT5pr0L9/gPf0UsNP9+LP4D9gUB3TScBOQBaNfjen/TGQfcfeVZq2PURD4UcKIb4
         /fhAfVO/JBRfr1HCqr1zdkHDzR5ZZZzsYcsYdx1OSv4WH2cO4fjO8mxts33wO8ed4qZJ
         rq9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614723; x=1796219523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        b=JwkFDPU45Sp3/AywUmLqgV3lywr76lk0RnG3gcP1mly4Olo3y6hY7ZegU+d/6ZQ2i3
         TtgALDD9Imyj6UufUTO48LeWksg3vbIhAWHgCJEXWJOPwz3VSHoVuU/Z9bQUzEtGp89Z
         E6X8fc6zNkv1c/xM0Z/N9I0sdHl9ISo7T63ZuvEHCYYGYpNASf2PHwafYmuJEdMr+xq1
         jlPSRB3bazLcPMifdD8NB4gxWGIJrstTwJT4mhbt0MCfSupZ3/LMJnJCYQ2WYrzeua2S
         2C5siQ32aULczJ5TJAaldRgY2hcjizrGQQbbtfWi/TvBUI8zpMZVDqLr98G91rZWdZca
         ik3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614723; x=1796219523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FkHuxjNkBWcpazSUQh3/1ocxLfgOD0ATmjtxGIbMcI=;
        b=bOu0m733HLbN46RuXBFQvrb+zzZ2Nqm5sXFDZj8if+haE4hgRyuveqTuF1fwHTJ+nm
         kZlmFV+s54VV04Es7wv0/C8FfeIMTQsavWU1fBup7C/RWtXeA9zRHbJOKmRDrdE/40b2
         POpDkLREgq6E8W/JJQa79dGjiURhuxqR/iH3DGNxp7ILkWJRlX9v0V8O/8OJ1BM3QYis
         5S0M0D+NYzo/ZToKplOL5qonyFT3W5tZs17/xoMpzz/VGGZW25PJBYDwdauCC+3fNj22
         7X0+FzC+rOnpL9LbWtQ3C2wY3QAExB8mlU6AClMmObCuyqqKMAf6K+ou+MyajwIG10P2
         SV9Q==
X-Forwarded-Encrypted: i=1; AL+hErFpJOrP+t+XRmAM2KnGVcbqRxT95T/fz+TzkyhEBO0CNZw8gv2KaO8EIYACVEDzW75O8Y5smHhBu+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rt0/vaD0r+zbZnwqq80HsP4L+QtRRvvQ6MmAlqdkq43ep9hPb
	r/hXWK5CaR0sN+V/XGGHh5n9m5jmblW8uMJpqA212jO8oK6YGRN/t2CUTfSrbcExo/1QgFQwgZp
	q6eY6gdvl3uVKqKBJ2J7r25l/CZyyvjE=
X-Gm-Gg: AZFdTZfjdU8fyOsdarVlXsCIir5jsh01xaNtvw9rRRX6AI64PlFqX4+odZYSp1dW/wu
	azvBdqrQGFVXfi20bUKcP4XCcaFVgko2CMYY639+CZG6cbnq0FsgT/zidTeOs27plxEto/f70LP
	LKfHeg/Z5sF3+4ZF/ZxyhXiMs7+EdPtGPKfPajZvJnz1oQySjHePcBPyyg+6wuj05nv+LSl647u
	wXkELtEyhEPaW0XjG84fLNBqlFUizZgE1wGktkzidwQYPAz1i7B+0rPQVCKSnDKmIAhyhWjN+Ul
	D+RX8E3WIsNNFBLgjLOWFbR7CeJiXKNODn/pfxeiS+goqBJLJI0tIhAQI2as0D3Ald3pNpUV16k
	yDuybBSrxcY70A/MWwtqfGjkSf6v8W27QRVPJxXgiSbpQsfu3x9LvQ3fcfWXyTMo6CIBcWg==
X-Received: by 2002:aa7:d355:0:b0:6ba:3867:42c8 with SMTP id
 4fb4d7f45d1cf-6ba38674444mr9425076a12.30.1795614722953; Wed, 25 Nov 2026
 05:52:02 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-mglru-fg-v6-0-8ffea39934a6@tencent.com>
 <20261124-mglru-fg-v6-13-8ffea39934a6@tencent.com> <43abc7c4-c435-48a9-8dc2-616095105d45@kernel.org>
In-Reply-To: <43abc7c4-c435-48a9-8dc2-616095105d45@kernel.org>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 25 Nov 2026 21:51:25 +0800
X-Gm-Features: Aa3M54qvnrtyAcMz5ZXrISSFgrUyQOGr2UM6VAg_EqnvxKpfk2xtM5m2ePfgGd4
Message-ID: <CAMgjq7CQkhA94QxVcdHzq=DD-6LCihA+psL1n-K05sxCffBOVg@mail.gmail.com>
Subject: Re: [PATCH v6 13/18] mm/khugepaged: convert to LRU refs based
 operations for MGLRU
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
	Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>, 
	Ridong Chen <ridong.chen@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 6:11=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 11/23/26 19:53, Kairui Song via B4 Relay wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > For MGLRU, PG_referenced is only the lowest bit of the folio LRU refs
> > count, so folios with nonzero even refs no longer have the bit set.
> > folio_pte_referenced() testing the raw bit misses hot folios at
> > refs 2, 4 or 6, under-counting the referenced folios of a candidate ran=
ge
> > and aborting otherwise good collapses with SCAN_LACK_REFERENCED_PAGE.
> >
> > Test the refs count directly when MGLRU is enabled, mirroring the
> > smaps conversion.  The classical LRU keeps the plain bit test.
> >
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
> > Tested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >  mm/khugepaged.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 2dc4245814df..5e768481ac22 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -579,7 +579,9 @@ static bool folio_pte_referenced(struct folio *foli=
o,
> >               struct vm_area_struct *vma, unsigned long addr, pte_t pte=
val)
> >  {
> >       /* The folio was referenced previously ... */
> > -     if (folio_test_young(folio) || folio_test_referenced(folio))
> > +     if (folio_test_young(folio))
> > +             return true;
> > +     if (folio_check_lru_refs(folio))
> >               return true;
>
> Why separate lines?

I thought separating them would make the git log easier to track if we
changed one of them again in the future. I can change it back if it's
not helpful.

> Also, is there some way to abstract this that core-mm has to worry less a=
bout
> the details?

Let's just move folio_test_young into folio_check_lru_refs() then,
PG_young is page idles's hint for LRU, so doing that makes sense.

And with FG, I think we will soon be able to retire PG_young
completely, page idle's feed back can just call
folio_inc_lru_refs(folio, LRU_REF_MAPPED), save one page flag. But
can't do that yet, need to cover the CLRU case.
