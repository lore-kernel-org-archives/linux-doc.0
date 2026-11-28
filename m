Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795870049;
	b=JKPLRp/tCinL+977BtWN2IuRI8DrFANxMQLb8Ml7i0l3FLkymuDn/Rq21MLC5Jdgjv+9
	 gsfib0dWIBoHGi3vdVc2eL54nDr4LmZaT+yu7dHc9l65DGdbH+NUcMPDOIsFWKuQJY0Sa
	 lo/aYBa9yK2/z3ktF5WwjbBJZyy7bCHpfM5Sc5AWzuAd3aRN8eOhVbwaIxITEXK3yaCfX
	 gXGm+UzPsSkkT+9SILE2q3Bo2NcGwDoq+GGR9uC76w/zOO5IO07VQADvEgKHn4LHcIaD+
	 kwlZG8r0U+oqr3JeVpNrX9hIRgdMfcyTwDz8HAkkcjNVfmwoHeb29dLSI291A/d2F2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
	b=yPAHWGT4QhX+Fqx5PPG1MpClmSKGW/sHhNpoR3RWLLg7eyZVuV/ftVSsMAnpWCeQJv89
	 UYpwtoOEJPZl476hkG5APQbgvh05u59PDHPUr29Jq1UDiHJXmfDNuO6HpsUPMIAYivzCD
	 GUD780FGxLJBZPYuVd57M9g1u+GbpbKtsJlfxfkCBwb2dR1vR4ZIHcAAOrgbsxVh9R4KN
	 0FDaMniFC2ydkiDZLeMfSZqlgP5GCSqwi6x2petvKyff7DESI8LTyV5PA3OkN0OLQwPmz
	 dCzLaYbRnsF4dUHwDht+1ir9VmsgNXHXzqzcjvM962hi8622uYI1tY3INByKXngwmlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWTHYpLR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4CA606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 12:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4CA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IWTHYpLR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso82839745e9.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 04:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795870048; cv=none;
        d=google.com; s=arc-20260327;
        b=UfUfdyBsPBQLP3FKeUQEPiDCiTKnXongJ6rjJb2EgjMz0FfXzKmrqyFJlUiyLhk6aO
         b8hFNoUeYyqLWio9aeJ+veu84z+l0W1qoLnzXI5pqgfI9LNU2TkdecTemDmWbt4cZ8Q+
         tPekt/I9DaCDgy7PcQZLL5+XLX8Mpr8HciB2eWNS4LA9xAefyscXVjwXKgWknbh+b8tt
         eu1hgA5f55f4/d24igWWWHIb25lq2VWP3FwWPFpDki4ylXnOv8KVI5sKK/YDJB58o0zU
         sIIwm7i7MdaeuxhMvuzySOgBXU23rXDAI0NNOK+y2KrLhmsVMgOw4J9Re+DtSgOLzZLZ
         4qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        fh=xEf9V5kDYWY1k3xYoJxZidtXwJRIRWbbV7G6EqaMrjo=;
        b=efLSebbO1wTOQanmhx5XlUkLHGNsi53hlzaZuG4awKjYImeRhcboCqPBd/e/XUMdP1
         +rv8OaedoHhbusL+upcoh+2b3kbBd6vze0w/jua7F4tcdtREGllXAjiA5b3AxWQjGHUV
         L1Vfk2uNx96cscJDfWLZKi81dGy52nOd/FyiQtwz8WKMLNEyV0wLu6SUom3HnhT1di4n
         oXqMKZEQnl8mcgIgZx4SrQ39LwNVC3v07vLLC2YjQe5uTUNzs9V9Ko2sxAkZJDVNfcFB
         5zbez5Nsz2VEKShkzFfjjzdzkJFLXn2AxWTgtUT4IB6rxxpWr9KlsWSPjMad9OsSxYFq
         Kmnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795870048; x=1796474848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        b=IWTHYpLRVilbZbTG6IWjaAeWqjgP+sIuMzicPDehF2Wq5ifxICQvgjljBm8aZsWWu5
         P1q8lKSZZ+QzG675XjXJfggQKDEueR72g6RudWpuixtEeQZw1LXddzEnj6SQ8n2BH7iB
         9IwGSfvyQzfs18CQQg1fwaPXLb9YvFHO4LhDP0wsIPcHPfDXlJ8B0dkg6X1O/mmnPbeA
         BbNcH5SUZezaJyVEFk5BiFxs6Wd2DNbE3olZsiu8CWmqOzjeSSH9+jYRi0I1V+aWXNeW
         MgqAY996GuJs1ONySZ6+Uc4vhosEiZ6vU+6xgLhoy5iOGx2+an5sUBNpf9lj+1snfvM2
         UQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795870048; x=1796474848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Neleil5nC8s9bt0MpU40WqwbR7w+O9HixUWBXPDe1yo=;
        b=is3wZf0R2riZeQgfHArWjZjPaeyvz/njjzXXyCW0mLPuSSe0OBjm1jGm3/Yj1lzJHL
         HZgIXQXHtjnNYKV/eTtucJPq2jhz4KMQlSGpI4UANCeLK51HFYZxc9QQ4A0AfnEtgcCF
         cI9B7A3RvUwoc5HapfKMVmyXvZGecsM1J4bJfC6PGr1jQAkpohA3TNcWnRSg6nT3pSrx
         pumfkG5t1o3bJZaLtRiitR7p+20xF1IFuiUS2cQMftRQrHJmQyJqPEBnMVt5A3G09XmE
         Q2YKwxaySOwON6yoCog8tP6+Cud2dgC48aX1zZZN7BTEHw+6kQxD1g+4DaYZ4Gv2H9IR
         dk1A==
X-Forwarded-Encrypted: i=1; AL+hErGfYBJBbMqdCyGM3q8AagPxTH0435ZISjrncaMKpb682HNvQBzVVTf6Ii40bjeRxC28wGHI9Y4rezU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CLdq0bge7BJKq8r3dl35W7LoGOF3j/azBWEZR2enGeojR1XfO
	bwOeUl6AV3NV03G4wmmbYgBAgkPLbzf2mEUUFdriXkHOzV3tPHUWUuC9KZYjZy842bYMEcE991W
	5wjocPQq0/yBuYw9zFGgj7sMD4NRjqa8=
X-Gm-Gg: AZFdTZcaJ5p9f0JzWE/nEdvDM4Xr2+aj5QMWmmO+bZryUG43I7LHmBbxJQ3TJder9Y+
	r9p7tZZgRINJpelWVJgb+3HUJn4lFZFuwM1AizNeVk1uKn8CaugbDoLHHsBrn8zAS0eF8em1oHf
	eeMaWPMWo4/eQp+QJJehRjVMLymDwgunYn4tBg71NFlCRYtlq16phbFIhT5l1M9qK0rtXOHtDAK
	fIx/ILepgAv9tnD8FGDc6actYKtBpw9Dluvf8zE9KCIuOvJqRAk1IcjFq4LoY2ObofHawFn8Mue
	b+lWapbkqaI75Tu93yugYRACpCAofeNFP42/P33f0WFd62J/vqQcN7F19Lk040u6vnibvh5qquu
	fnzzw850eEEcyIEzf93pRbMBVRNsCHVWRBuJhrkIUt+Gs8DiTnzdkpDWs4BKZ9mkxu8BpSeuiNK
	Gu0fW8AoboMwEEFV4i9paaPtImGJktWQQaQ3Is8zpa
X-Received: by 2002:a05:600c:45d4:b0:4bb:6994:abf0 with SMTP id
 5b1f17b1804b1-4bb88817d91mr585296145e9.23.1795870047116; Sat, 28 Nov 2026
 04:47:27 -0800 (PST)
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
 <CAMgjq7DwCNbke2G25Bxfj3bi5aRp3_qkGeYmCTGVGv+Y5XzKTw@mail.gmail.com>
 <60e890bf-d5c4-44db-9f90-ae7970b5de32@linux.dev> <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
In-Reply-To: <CAMgjq7B9r17gQrOfxffRBiTSepitThjLAUbnraFFjze35t2P6w@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 28 Nov 2026 20:47:14 +0800
X-Gm-Features: Aa3M54oCldtT2Qc6Xyokk6e6N_BkN7eNxmqD5B8ZoTIPwfqT_iCVOdBBMSKp3p8
Message-ID: <CAN_Opa-fUhr5cFDP8vr_47Zb3WOUnSX03LQyNo5c1uQtpyfBHw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] mm/mglru: make folio lru referenced times count
 a generic API
To: Kairui Song <ryncsn@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
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
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, Maxim Muzafarov <maxmuzaf@gmail.com>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	Tianyi Chen <hi@tychen.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 3:41=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Fri, Nov 27, 2026 at 11:33=E2=80=AFAM Ridong Chen <ridong.chen@linux.d=
ev> wrote:
> > Thinking about it more, the header move is not urgent, while this
> > series has been iterated for a long time and fixes real problems, e.g.
> > the swappiness 200 regression you mentioned. Making it depend on a
> > code shuffle would only delay it.
>
> I also prefer to land the FG series first. It's not just a feature &
> optimization, it covers several "bug"-level issues for MGLRU and fixes
> regressions, which are hard to solve without a rework like this.
>

I'd also like to see FG go in first, with the header split as a
follow-up.

Thanks,
Kunwu

> > So if David doesn't object, I would suggest landing MGLRU-FG first,
> > and doing the mm_inline.h split as a follow-up on top of it. That also
> > avoids rebasing this large series onto a moving header. I am happy to
> > work on the follow-up then, keeping the folio refs helpers in a public
> > header for the fs users as you said.
>
> Let's see how others think about this :)
>
> > David, would that work for you?
> >
> > --
> > Best regards
> > Ridong
> >
