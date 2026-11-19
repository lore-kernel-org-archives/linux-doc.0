Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109651;
	b=4UI25qJiYei1e66MoDbxcyOGK/Qba07/U+b598Tqul0faPqH6J/k1dhpjfHbb2h4e0kA
	 Yu1RwMlq0koERZA/qh56h5+X3gWe8HsPQOItNNToU5CNWO8gKgu7tdfBfwl/1ApTrguAP
	 zzykbvZ+LP0GfvFevDb2k0mqC2kB2tzdKVYcBk5KfDozc9dIcXyFQVOOd60N/v3/OSKwx
	 3T/AOLcftWMRhyaOeQpq2Pe6ilYYBsaMxpQZWKc9An3731Bo2iBQcUHBfwZzVrnrmy651
	 7AKxW0z6AxgX+Ambl2cvAIcnXSdLys73N1CaVpI3qkaS1yxfS5CVw8eXeug0wDb/K1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
	b=BEPmQr3dlIzTqVxZN/iF1jcbkTw48eEz6ab3316rENZK8T05hNZ/80spVhKx8GVgGujO
	 HyiZSeJ/lsGvOIurBv78ONrnuyDs2NxfEgQ06+UIBUihR748LuX1avi8n34+ZzqJZE0SX
	 vcBNaZNoOy0/N4FJQkSmByeQH19DYWcBjsoO2rvmE/bjCTd3A66UxbSZePBwsh4I/tshU
	 ES5FQeAkaXQ5+OR1Y7BVF6YvXf1EP8qCw+c5HwvbaGyLU9Palw7EJnOGQdaTmH0o1w+eJ
	 x+pG+MESBJVjBpxoxJePhZfwBKjvr7J2SxnRc4o74iqQ7smeJ4pKJ2QKV+8cy/euZnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+L5h3Xy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13BD606A32F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 17:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13BD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+L5h3Xy
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5123794038so3057366b.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 09:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795109649; cv=none;
        d=google.com; s=arc-20260327;
        b=WNkQT6qiDCbAPhz4PPyvUX0fJ+P53HJd8ZkBNqbmDYJBRnBsmshCxo4A2MEw/1gwyc
         YoZw/0A2t+zAnZQAALKgXQsJwidSOTdbr/DX00xvojZMUyBKVBHIqae3A4LpHPchbxfL
         qS2Pai+4WsgGyy8ADbi4BImPAWyE4vEF0PpP1BzB3Ucxs8o5bZm0TYKmVdXG93Y2WWK3
         FstW+BRdF1k6hEBROvBzwA6w9eOmt1DGqHhxQPGSB4TXqWlB+IjyLuMQet8dFzot9hdA
         BPO/srPsJ2eVmiXhyau0udtzyXJ0gz9QMMjeJKXnV7HhZiGo8sM7GltpK8QaNxhYhocu
         fRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        fh=PKp+hUob+z6OWodf7zqrj50VOynSeBWvVbVXCmcWTpY=;
        b=beS9dDz/Ii/GRHggmeCRjMyz/ZfD8LlQ74JPdubSKByWD/f/YBp3ZqcE6ml6hsnmQZ
         QyU0v7Ibl8pLBmY6ZNEjomn1MUwfTBV6tBf1cJnzg0rQyDbJW88QQJBZsRB2US+t+EvD
         JJoT3jCxOPe2Z27Qg+by9EumsbpeVaR7JJC4BxrRtDaL8YyANzC2B9IIASpxNG2EYGR6
         4T6qMfS3udO5f+FTjM5enUmmnRxWgvECtxnlX3Oo5rGE773pEWnNSd5oRK7KHto72emx
         0CaYjVLiqbB2/+nCjFWkIgvloZDSqUTyrwwusrRFWaRFF22N0wk5kTww2YOT0RV6hQjS
         Cykw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795109649; x=1795714449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        b=O+L5h3XybYIsmgG2hb8qYCFSsW2v5laMXHxWHrF13TvzQS6m9eRprosdnH9bf3Gm95
         C/3gMIoqlYuW4gmh5lN7yxzWOD5OUmkVRv5HKYVUcLyz85Nt60YHZY2g++2ZZ4kIrvd0
         7VxZ3rFOLfIBf1K0sNt8SoWzw1EXnlzJ56k36et68eNdQPBrsMJ4cCNVumCcCA5+YYpC
         Q4MAiW/mVRQWanUfBYyq4Behcvk2xN3JDaJtdM4YowIK0w2i0reveSuWkEGCZQwGqZm8
         PWWqX1LgKq2agjIlEmwwqaNNFQpM+IgBPqtdqW+X1UuE2zOo7UZpomBsraTprjdGxjkY
         v+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109649; x=1795714449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GU/DHzsJXxqhMdzOYAA9Okmyib9cC+TRn+DETm5eoNw=;
        b=rOGVXCE8Ib54k/QNS2znVhnvMuFVO1WPn5RTsKEGvghjkYBPEGbpxVMkSfqwHrUpZu
         KppvOY522QrWigsALDlWtcm5Mum9UGGiY7qCug6Hbak0ja1Ik8EiZNyeALTZ+ysXYZev
         hnx5GbL3lcdanvQRTS6xePanrot3KtlHrvhRyuN5zlFTvktrPelGmFeQduUExw9zrVXZ
         wCQvCpZwaTlNOLdzkmDhCDeepbiyJSQ0Ez8PX78wjE+yizOpwzaLxOJTVA0VUIvn/93k
         JGT6byp+539L8JHIndQhlqeWrOYRCX7KnxxMmoJ0OuL2m6W/Fy9yLFFPRHqBaz6q1d0E
         yVwQ==
X-Forwarded-Encrypted: i=1; AL+hErH/pTa5ZQzx6zlaXfCJ7Slv2d+ROh+nYj1Gu7eWzd5MiI0v+8aDx7TDxBwXukGPqbRiFO9383MCCxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2v1ecbsfC4drd9FTFUL6Gbrjck+LKVTuyGn/60aA8+e7np0lU
	jMlmKNZyTslglwBolpdsuIrNTT49fupmE2acxQixU1BrvgdraFWz2392Q2tWmaoLMnc8WME536A
	svW1N6DCibT2j35pOxVcvVxZ/9PNzmhs=
X-Gm-Gg: AYBFou0UksPLYhRWdpdBdms3MvPyTLtNXWbhtghRkNVM4f8nAYrSCoGkwQqbwrdvjvF
	kpt6HPtmbgC9IFF3vkCbaK9WrQ9/vnm/9WxAciNECmOjswKAz7Bt0iw7RgiqLtPgukGZjmucgOK
	w/F8VcOzwCzqS98NAbyCnTdi10Pjzq0CrfO9vBSbqN9jaq9c06NDaw3TckXFWoWweP2eB0vvkyh
	sL222VPa5yTgY4nwsZOUGkXrTEefDbgT8fVhWeHI9BlWxaSrBbYWJwb5uZC714WSewS5wZMnqTp
	z2uWxzVC9Y0vYaO8JLbO5tdlX5AIVCohy6zsqE8kqfA3uD/uVV9oof0+tvm+JePIUtbOoezpxbB
	/8HKPY7cFPn71ZRUKuNlaxlv8TAe7r8r8j1nV4QIxJVwyj/7KoEMXCM3SzNM6e4JstAJYKEA=
X-Received: by 2002:a17:907:9693:b0:c4d:331c:2e97 with SMTP id
 a640c23a62f3a-c513ab47f5fmr64354966b.36.1795109649032; Thu, 19 Nov 2026
 09:34:09 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119112357.275352-1-hi@tychen.cc>
In-Reply-To: <20261119112357.275352-1-hi@tychen.cc>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 20 Nov 2026 01:33:32 +0800
X-Gm-Features: AclHuK_14i71TxMIEATGAgIqE0r8tCGaC_TLqpyybte_WVRWpRVBP4hHZoQKFT8
Message-ID: <CAMgjq7Dnjsq4vid7H4usOB4f5AS8XzhG75mvf4-Y=an95gBERw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] mm/mglru: frequency guided promotion (MGLRU-FG)
To: Tianyi Chen <hi@tychen.cc>
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
	Xiang Liu <liuxiang.277@bytedance.com>, Ehab Ababneh <ehab.ababneh@intel.com>, 
	Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, Lian Wang <lianux.mm@gmail.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org, 
	Maxim Muzafarov <maxmuzaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:24=E2=80=AFPM Tianyi Chen <hi@tychen.cc> wrote:
>
> On Thu, Nov 19, 2026 at 05:03:32AM +0800, Kairui Song wrote:
> > That's because MGLRU deliberately disables hotness tracking for
> > MADV_RANDOM areas while CLRU still has refault distance.
> [...]
>
> I ran the OpenSearch k-NN test from the RFC thread [1] on this series.
> Its .vec/.vex index files are mapped with MADV_RANDOM, so from the
> paragraph above I expected no change. With FG the gap is gone in this
> test.
>
> Setup: 25fee5b1762b with and without all 17 patches (they applied
> cleanly), the same .config, and a fresh 4 vCPU / 5 GiB KVM guest per
> kernel. OpenSearch and a one-pass 96 MiB mmap scan share a 1 GiB memcg
> with no swap. 5 seeds, lru_gen enabled=3D7 vs 0. The script is unchanged
> from [1].
>
> Medians over the 5 seeds, last 1,000 queries after the scan:
>
>                   p99 (ms)   memcg file refaults   .vec resident (MiB)
>  base, MGLRU         66.18               144,387                 99.98
>  base, lru_gen=3D0      2.09                     0                117.19
>  FG, MGLRU            2.16                     0                117.19
>  FG, lru_gen=3D0        2.12                     0                117.19
>
> Right after the scan, base MGLRU had already dropped .vec from 117.2
> MiB to 54-71 MiB (median 66.3) in all 5 runs. FG kept the full 117.2
> MiB in all 5. All 5 seeds go the same way, and classic LRU is the same
> on both kernels.
>
> This is one synthetic setup and I tested the series as a whole, so I
> can't say which patch makes the difference.

Thanks! That's good news.

I think the reason is some of the hardcoded biases this series
removed: FG places purely by refs. Less hackish checks, more generic
performance :) I reproduced it locally on the base kernel too.

FG still doesn't track MADV_RANDOM accesses though, and still no
proactive workingset shift protection. Refault distance will cover the
rest including Maxim's case IIUC, as demonstrated before, it's better
to do that later as it fits much better with FG merged first.
