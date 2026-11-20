Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162905;
	b=zbqhVGQMpjE6h3PgqVLC2MH6qaHUggNk+7eaZHbuMF4f8S9wGTIqY9yCy7ZmQ+zavNg9
	 WsimDX+utCTSIWjZ2T8j85r5wlUamMjnVXlTYSgjURb6mRLrWFb+rSq499MGZgg3XB4Jw
	 6T12gvIddCldZWImYux+kDSfF7CcJnDuzyb75aysDlEscXZgn8/D/SXRew1X+eP3s68Sd
	 QEVOXWsojCbcu0BrqyONNKE31piYBFhI4rm/P+5HXn+MDNdKTys7zqVAQSICL/pM1VXK0
	 B7nYskQ3pD8vzjuXg9hTFyBDGwYc8eIz1wOVdr50TW8xDp9cHXVPPVtmI/2H5peQfHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
	b=PoYK/htNCwqEwK0PIL0Ph1yvpsUuOm8sG2eQB3CkXoL/kNwUnxYI3TWck8DLo21WyjfH
	 AvneTudxVVvfw6MY1llB5BdHnuNUVxwwGqJmK+nWEbihxc41oM28UrF0/0Tn6eHnVWNny
	 v/vXQEhnKfHwX5ibDBT3W6ToFBAOqI+MwGZigsESIyaNMdcebQKH3FGSEm4UnmsKQjGBe
	 Cvsvhoiac1UvG/Z5LOaG5qz/wZdIJhaW60XjYfctn4w8uMxBs+qJbw47pHLQIysZnHtyf
	 W0XesyJf/eDqNhxHlo07rvBR7Zk8xPRf1NoB7NnRO/ur7zSsix2ymxwvFQ7rO2rmxbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFdDRG0E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E99606A335
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 08:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E99606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZFdDRG0E
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so734133a12.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 00:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162903; cv=none;
        d=google.com; s=arc-20260327;
        b=T97W8sUhMojv5M0K6tMo3ZNgmvjZatnssaetVW7gkpm9EHD98nRzwFkRItke8WqU+O
         LRr23THOAimGooiXEHK1neYqHZLhr68ROp52TvYxMAtPVRhCdijlmpedMdCOFyozeFdD
         nx0FDWLYOF0QdvFf4wrCFuDXCa0m6RkcQTiSvVbpQsQIqvmIFWRflxnyXHFrRk6WI14S
         sWhZmUnNgbO7FcmVUxq9Bm6jRFIhAU1FZwNOt32ukTkaXsWSYQK631X+eGU79qhibjDq
         3s85kgdafwsKXpPMUfsDHrscDf4OTOFA3fHoLZh90pOh5ROXCxKudnKVBTLomaDW8ste
         lvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        fh=D7KMH7BlN5ur4f8OSQbSbsqfjiGXw1RdOhKu4+QKIvA=;
        b=sVo7rtJFH2ms+pFzLzI3YNoVHnFo6+to1B7DMjgYRCH/uf5xDoimrUl3UKj10PRk0y
         4m5hMok4E1tptzEd4xV+VbgocGWoBIYPt7MNmhp+etcWtQbg17lvHYDYazwMlEqi1WtQ
         w5JFWDRmFY5aCtgfOYV+reGSw9DOO3c3nY+18r73ZH/hxmnp/g4GlDmt/b0Ut5NIr4oL
         nppbJ1k0P9XA3N8lwO24YEVhVF8EWX1cejiMNG+GLwYEIxPgrqXS9mSYy0zh3wl1qEIQ
         ofGMTMyQHvrpFenM4X0xqNmKlnmMD0NUYfn5E6XziUUGcXlQ3rVv2S+xif9ADyEP1YwL
         kD7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162903; x=1795767703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        b=ZFdDRG0EqOKGceQ1Km4+2+47QBEfmhYNPT4A797uBI/TBR/Kkivy3g0qg8fc2N6/jp
         kLlfhSekCufAUuoBnvUkH2yH7oNLlcwolKgHqbx2JWuH14fFpC1eN0kAh3B6VcUhHV11
         JBpoJ+btwvCpN7fv66NLJ57uTS/fpCoRm17SF2C9tzwS/fMhuqwSWqyYeiJas1Ep1Jv3
         PaOLtTk1HbnuM9Mkuj1h1iEKwnA6wdDkVpFqTL8Nho8mhdoKgvJ0Dd2EWyFw1Cp7BgX9
         ABX0vXiTiYvxjQ+fRnbqU5S1yv0kn5l44sNvmXyvAhmhlfeBH5BNZAO2X/plsC9ggRXm
         wlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162903; x=1795767703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xqDAnMgRLbQDaXY5Ss9Yx0LPWinqLCRy8RnRx2MnMk=;
        b=imbD1YUn/AF6K1pNpy4xoEFNAuukoVGm/9ks5AFdUXTh4FSCOfXAI9hwvVuW5rp52C
         Fv39fn9MfgVpZDqQxkih4ftwVB185yBu/YuD9jkrQXccoDez5pAY/EHd4LrAgvZUVRa9
         mWpEcVAnZMqMSJFES4yWOOpw6ganbMBppaU2YxEAIiihgLmaCCNogLhY4AzvWiy0FPVU
         fVkTjXrPV679Sjdx1dzHpbfawz2JhWW9MyYqHd7o5XNjJ70OnV4veGAm6lyzQ8WMKH/P
         zopryTn44H633oTX1PS5KMRqzrsqbit4EI/U0+JQf3IiZdX4VvOYerdQr2jJa4lOKuxM
         ZzuA==
X-Forwarded-Encrypted: i=1; AL+hErHOR3GlpY93wyqeGM6u0oXz2Ffvn3NejnPOSolJAGDIYTlf7Eh40j36Ygamo5Lj2F60cFbfv6XaYcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KamoPG3FMXuaI2ozXvYdHibwHroi+OLNB3nsDF1v4TgFHwNMI
	+M9Pzgr7lDJ3RtpPO6J8C9QZ6aGP2lxBwxV1JPBr0KWBssEBzmdsd2rxKApugf7ROdHhSu7MM7I
	GBhhSSeSraSLYEu/UsrYj+mspFspbbas=
X-Gm-Gg: AZFdTZdero2R5VIJUeyTljL/OhmRAaXg2BPCooEXUN+KM2MB2lzJAUJdr2l53ZS3XCZ
	bdFzjcZXEGYF3FmpyHz+FI/giKJQZRil8eZ/fm9TnYo05rZPhMzbxraKmVtMw4IgiNHHo6m8h8d
	qNJgLrI+76vvDo+IQHfW7WvFZuja+ahQxMwESyHqMBinjb1W+OVQaDGMpWgoSNvTBbooyOHx1kI
	kDwC9cwkI0gFKvUeRzWVr89rYI+OepZxV/pSUJZvsoqjA5P0Y8uvSD8SUAmlUkC/JPJcxo3PljY
	PWXS65OXYECxsoVZr1zUy2xa9Dq/LsuQVBByNpO4qaPVGQnCQ75w7AYE381Yzasugjj5r0kWJMq
	CLJ4xv9ZzRQusDxO6reZMSOmrklXRqMqg+yaNHdZA6ciFMZ7p/4rtiO4ZnDaahDg=
X-Received: by 2002:aa7:c0d0:0:b0:6ba:144f:ae43 with SMTP id
 4fb4d7f45d1cf-6ba37c7b138mr1084173a12.6.1795162902503; Fri, 20 Nov 2026
 00:21:42 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-11-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-11-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 16:21:30 +0800
X-Gm-Features: Aa3M54qin3mQjFf5kqOfy-EjZ2kR5w_yWqv5wLaUrnSsLRk4SMbzaUhZRRw7xMY
Message-ID: <CAN_Opa-DxzvggsGKMXJWd2vSKjbztttBHx3uSzJawbiiEOa2bw@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] mm/damon: convert to LRU refs based operations
 for MGLRU
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

On Thu, Nov 19, 2026 at 5:04=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> damon_pa_pageout() cleared PG_referenced directly, which under MGLRU
> corrupts the folio's refs count. That flag is now
> bit 0 of the count (LRU_REFS_FLAGS).
>
> Reset the count instead under MGLRU.
>
> Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/damon/paddr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index e89cb14ee17b..411e1d557ba3 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -279,7 +279,8 @@ static unsigned long damon_pa_pageout(struct damon_re=
gion *r,
>                 else
>                         *sz_filter_passed +=3D folio_size(folio) / addr_u=
nit;
>
> -               folio_clear_referenced(folio);
> +               /* The region is cold, better drop the hotness info. */
> +               folio_clear_lru_refs(folio);
>                 folio_test_clear_young(folio);
>                 if (!folio_isolate_lru(folio))
>                         goto put_folio;
>
> --
> 2.56.1
>
>

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu
