Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795808514;
	b=3tJROrwRIFZIJEcGCuIvVqe5wY8glvgyjDdnWQihhPx/HYAkkes5d/3VMmJpR/BRSxt3
	 T6l+rnvDmSSiySE221Pgs9qdQoN5gixe+Ofvj56RRY5upFfvSRWFnqAohev5E9Ziqbr60
	 /fX9XKFz6dfTen1Hy0XEhOQ4i7cPt6t/op5tVAgLJxRKpyKAJoTxwDnI56zT2E5Xu3LQj
	 93cx5QDZ7xJ+DB0CTrAOQmShdXBIATAOgwUfIoCeXKwZh4ju2OgtcGbfj2ZVAx0y28LU1
	 PL2EUDxczo5XD319nqZFm1qtfRR+5If8iU8Olr4seaYeuvmZqIeUVxKZvGtE16fJkSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
	b=NCCC5wtvVazW/owEijXOGChB7j4mGkDOfOIeB7Ix6NL8eBHbIXf0ibZXsoWHvF8vyw1o
	 p0h/mVyOyoUxOE1ig3VOU2pRNFeFwNA4ozzWCSHLK5bH3i+izfF0OyxuL5/gj2GQzSARz
	 URxSEiATh1xgJ2TiKxvT2hCpFmARTyeN0/QDHI5MwMlWFt2K1/Nb2HfTOkYKlN8X5c1U2
	 4FTJdfzU8p/cTXIfLU+NjdW+Zi+uxC5wcNbqwClBU+g3vewhQDzzHeFYLsrD82887JKA2
	 GIe1dHADa1qOp9H4NVt3OeJBADjkWBsjHtOAZaY5pm/1tUHqSlbYc+iqs1pOB3RS5Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQeZQVwz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246E606A321
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 19:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7246E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQeZQVwz
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c51bf011392so357420566b.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 11:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795808512; cv=none;
        d=google.com; s=arc-20260327;
        b=IjRM1RNdBaBo+BXBZNPLk8eDf8gyos3+OMA3gjpwuLyfAhN5NOJrKoMmRlu5CJf8py
         bwO6LsjT7ucIebXCw4BdOsra+SqwG5njxzx8VIY5rhGnuAl1zFvY6fbrQdZvuzElNYMs
         fDzlzVR3dvhszPHUx7yKPv5wPiG+AbUN61a1ZY5vsJuhnDFqI7dSVP/hVzX/OwhpN5f2
         Yg8ai/ALBj4Q707YBTUr1jLzOqO2MJcO0EG7qckoNfoQKu8GwOFT+UrtDJXNecsm8aCC
         Gkp9EVhFRYy8jykH0DxYd4VJcj/ig1eC8UASXAjzkb7hh0vGsXityVeMTlCeqzZQKj9L
         gD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        fh=FmKo8yjgbeW6OkoamDyZofbWDLtstF34QekOrhorSKo=;
        b=KhYAWZtlwyZFOo5i++DtB+GmUwr8+i2x8nlOo5Kw16RNQLETR64W6kvmwBvc220sMP
         4luGwLncTqQE7v/laTNzG+0LKhFkQ1EmxfQJj8cPZCsKEJI+enqMeM6lxsfBo/34tdn6
         ykk3Wey01qWgyOcy3G0MqkEG+1UC0HEakSPRw5pPmB58B8FCZ/e+EoHnuY8JdpB7MkrS
         TcBEoves67Hw65wj6Bb1dNNMsw3RKixZMpJLPUTuGSTRKinbTj16PzlYZulOqejbomq6
         thRfG0QoUpEtLmH8oD/d9gKzOAQC2D8W2C0C+BaX3b+wP/cueKi9JPvwkOVCNmE2S111
         YJSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795808512; x=1796413312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        b=nQeZQVwzoNwIOmsp7E8zNRbM/ov7Ad5OI5Yt0HPNQ0Nw4Yp/NH3tyj+hDmKisTquOj
         TiY/3N8KLBj2wdz+up69Y1jrIcK4u5FKwuyGbKNd2oqGJ54Wa58TConqwqf04aL5pIs+
         xnpaJ3GxWqeJBlygJxol5O9UaE6qWhFw+brwykOBnLcW4ulte5apcPVRiyqmtzzVz2hW
         ikTDzjABQw0ss6jFdwcwSSnWkt5JC0ukU1SsibCM1einr2k1tym+q0j5t4dhzNJKFuCb
         y81x0qsycwIJ3QTl5addiAW/7hj8qWsA0IVd3kstpQ0qjg5nsNjN2qM2hgBIfBfPvCOh
         Ynpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808512; x=1796413312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hh8eaml/yBFyozdjvUyyf0twA7kkmRnJygaFP+0NC2E=;
        b=vH/63Pv7HwVHwAjrzYRtHgq8+pxpivpQeKrnTRbVDzEJ9Lty9XV21SiJYEOwaqGkyM
         OtHHi72q5PaTfz7KjVwrWRckZ/SgJEAvEPipf8jZdOK52rO3uu1ehBt5QAIlcntsm2hC
         or8+eGLSQcr5IUc7ghVQyq2XXHysTRxzOYty/p9t9D5yYbBLoXL/51w6DV+dwkI3nqob
         xkQm8xpyyt0dGtzv43OXURCnYVqM19nmG7VCDdESz0T/BJ8YmdxqRGimwVgcV1WZd7we
         Y8ERpsWkW3qLgaWla2F4vt8uT05WdtGl04QkIEckH0Ep9gYgy398G+98qWYUeevPb4kE
         BqDw==
X-Forwarded-Encrypted: i=1; AL+hErG0OjQVU31eFSiY4GtlIehuspTgLJF/ktRnvN+qtudp3KLZ499LYBgSk6xd4BqN17vWBrkbSDDR3DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z++JVGuWpA0i3SvXVRn09DEOpG949F1LO9LhY9bSfkkvMF56zAb
	fjciYD4/dZNk10a+zrzLWgkHZDMbY7tWRgJkf+NGoPzOKDqG6sh4dZruBhCNASAHKeI2gEd7HTt
	zCZxF0WnBCP/k0FA+lb7jNY699n9AXDQ=
X-Gm-Gg: AZFdTZdLEn8JSUSRqQk+h1rXPM+svK0qd0MWU6bsxjCwUDsTcL9EE6865tJX4jBTqiF
	PFsrSdhD3I+mM2+8mokKuUBf0wx+xXgYCwMbjAJR/NjHl9qUuCHYXJOuj32QHWqkCMySdS6Ul18
	GzhUVPz5qus8RzHSpgn6ZOIU00t/qiFVUAnpY/wxsZg+GclLQqF9l8vOFORhG3xk7aH602ZuxQ0
	vXtCiID2MoZ2XR0ymD18+RuoCLvfx4KW4ge4YSHuUKC5mCesNOlg4/Ngp+RTP4DlKxzQoXit3RX
	jbh1oUTUrUC5ncs4XSU7gYM39Hl8jB5/vGp7haplZayyhm7ZRk2yhMPKPVbtdUG3NHb7y1HhDRD
	FjCyrsAF6e9sjOQkl8EJflipqH8pTrZ4+1uNzQ2oiJgs5tBiGDwb1uZXoULuzCaIRcvwG3g==
X-Received: by 2002:a17:907:7b9b:b0:c4d:3208:5781 with SMTP id
 a640c23a62f3a-c513a4b1c1fmr2320437166b.1.1795808512384; Fri, 27 Nov 2026
 11:41:52 -0800 (PST)
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
 <20261124-mglru-fg-v6-8-8ffea39934a6@tencent.com> <e85a2666-9722-420b-9a60-9d4251fc3d4c@kernel.org>
 <awa30hwg6x82REoo@KASONG-MC4> <8ec3f3e2-5d3a-4bed-a571-88f7ba473b00@linux.dev>
 <CAMgjq7Ayu9H85wurRAUdmXEPWYi9BdLJW13BhK+LMYoBX_7fuw@mail.gmail.com>
 <CAMgjq7DwCNbke2G25Bxfj3bi5aRp3_qkGeYmCTGVGv+Y5XzKTw@mail.gmail.com> <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev>
In-Reply-To: <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 28 Nov 2026 03:41:16 +0800
X-Gm-Features: Aa3M54q0GwKlgENV-fDrHnc1e8ZIFsqPaG2vdLKK-3H09a0TbqTlTAM4SzLkpj0
Message-ID: <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: "David Hildenbrand (Arm)" <david@kernel.org>, Ridong Chen <ridong.chen@linux.dev>
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
	damon@lists.linux.dev, linux-doc@vger.kernel.org, Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 11:33=E2=80=AFAM Ridong Chen <ridong.chen@linux.dev=
> wrote:
> Thinking about it more, the header move is not urgent, while this
> series has been iterated for a long time and fixes real problems, e.g.
> the swappiness 200 regression you mentioned. Making it depend on a
> code shuffle would only delay it.

I also prefer to land the FG series first. It's not just a feature &
optimization, it covers several "bug"-level issues for MGLRU and fixes
regressions, which are hard to solve without a rework like this.

> So if David doesn't object, I would suggest landing MGLRU-FG first,
> and doing the mm_inline.h split as a follow-up on top of it. That also
> avoids rebasing this large series onto a moving header. I am happy to
> work on the follow-up then, keeping the folio refs helpers in a public
> header for the fs users as you said.

Let's see how others think about this :)

> David, would that work for you?
>
> --
> Best regards
> Ridong
>
