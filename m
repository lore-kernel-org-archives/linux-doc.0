Received: from mail-qv2-f20.google.com (mail-qv2-f20.google.com [74.125.230.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21239B971
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 03:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.148
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701706; cv=pass; b=nqxuMreSgvf8QOLEiXKncEGE9uzzZWBOVsMhTZ2DcEFx/n7OtueNMhiTjgPd860dGCgWGKhcuf3LtoiTPrYKIzMBWQIVibBmdRQjJDEnnlyRoFqgy9acLmeY2LtPtTvnIfYn0IwuTYrnHE4jgDrweaKp8b5tUg3fOReQSF4EWZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701706; c=relaxed/simple;
	bh=rmTCDex/Z766FtnBu7Ba4CV3FoVdwmvovlkUigV94mw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+jTR0fNPfLlHCbmRIey9SRLbnwsKV0fsRGfM7kh+pVgRZVtritcHxlDoc6VdL93Ee7jaTL+9IwjdjT/qd8tnSSLjL7qbHe23dVyuzBqKrkNORWUAiyTFPKw/14XlXhbjBnt//H23r2g7vYoyGgbMyh+saI1NLEYCg+SMydnRJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k0QJYxs6; arc=pass smtp.client-ip=74.125.230.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k0QJYxs6"
Received: by mail-qv2-f20.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so3553716d6.3
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 20:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789701704; cv=none;
        d=google.com; s=arc-20260327;
        b=iNTEIaiHjrpwXAN38q9sJWnuRM0nuU0VHUGzQ4KGDzmcQui7zQbfNgHCWRVamk226c
         n9RS5wjUNsvq0uxOhOvbCY3jsFQJyyJ78+n7K+Jb5XN1kWZVmmv46gW+m/jx35KW/Nyg
         ZPGzrZ7uCzjBe47pGCKKnyc7mpqHJgnRlPXcJ056K1Z9zSgxva+keXLKaO8H5EQ6in8X
         r3A2nSAO/dYT5sm02znE8E9gvjCoiqj3LHv0RvMWGiKuDV6DLTEhO1l2q4dvljWCLESw
         jVY29ZoD3LNVC8NjmwZhpXfX4ekw6K+r6lp1YUdh29FwlU8b6NMUiTbjoeWEQX5Qzc0Y
         6Q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        fh=gyth3zFzg5lnTP1nCmEX9KgrWyUqLU0XMKIBV9hgwTY=;
        b=PJcIlnd8/1P1O92PsIzg8SM9ySOa74B7J7dFFBlgtdFywu1T8KrilasanGmoc+lOlG
         BJUvZeH9cyYTdfCujng/8Qj3zcgPD2EW2BzqD5fJrrSufrqksEkuJJKyeg5uX8P90t8V
         YiqX9tru9B0eSqOkD2zSDK0yqtcVgjc29piVayy4g8kRyfvYgpTD3pPsYrx1XT9DMDRG
         xQvpATOhoXI/Agevwpxn+8UWhnMXdL1qZnSmce0EXs8l6ag4wnmEH/x8TnryGzFdhm/b
         ZY9V5i5gonoCVqzIi6zAqF7DWSb6TadV8v9VeZE8cvhv6laeK5RNgDVdMQTmJ5GYd6po
         8FZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789701704; x=1790306504; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        b=k0QJYxs6KuzAjvp9mY+SBJKxff1R2KzdiUnWvh1kxAlAbqsJAMq3PJybQDLhDqKqnZ
         8rDeQOqi3l1B/WPwN6C/8R/VMd6kcpXGsC9IcEX2RF/Y4C+KwA3DJd7WenAvBAGkc7NP
         MUZEdOqb1VBz7dSpOQ/EeybiMDfpwPT9LwsQu2sUV4ciyd98WeuwWQx1k26/ZBrwoS/J
         6GMFnvWvBMjCW7LQwc5UJBkwh1drAnZuAwKqWvEYbuKGGpIUgWpiV3DhT1PlkYRu1ES5
         E6Fy01MPxuPGApNVDAWhX2WRCHUGGP7r9HR2N1YvD/i+IPogvozPnBOrH5jwoIQUTLZj
         nAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701704; x=1790306504;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AKLDi2InWGreAxz5T4V5Lg4sL/lYAuzfpcW1EZWy0TQ=;
        b=qeNmlDCdxSSR0dUt/NcRfQY/KE53QTpZVsn8Vmc7ra0a2FVuMSC+WLv6D6VKaj+Mx7
         HeLPw1Y6c/BPlbsDS5FEBL5T5ysv3MQRj1s7EzZfuuXV1gSYcqYQhamAj0Gz0Ws52pxK
         xqKrc+knqIE1X33OhqYD76NF9kdgBn53Q/5sYSH7Hfgdi6q6gqIW9uH9Gy0TV+hXCNaA
         B6Q+/fw0NYUIocBQiN3L56gnV1eOvMcqnDOkTRk/6Lki84/DZklOmxT0u6uUZHF3T3a1
         YITQ3XKyclWHv2Ue/Cq8RQ8ky0xh46vGqvaLVfOguA6nPJxtV3x/wtk0OaOfCRNUv86y
         rVAw==
X-Forwarded-Encrypted: i=1; AKwUvBzfa0Uv415R79JshlvaUQvmy3fcuDanvvV4AcTsooxR3vopOO4zfJAUQxlHi0ASejW09mXiKfQcO9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mBgKsKk0Iljvg6mxJ5l4XGC3+ue21ymHeiPb4NamPWrMfJwY7X
	NqIpyNS5n7xQ9vKGo1MSXSHxiLKXlXl1Od4m0pfvvFMAA8mxmWhf1q69wKlLhnvn1c0x4/GKpvw
	AGPHXLxK7xhRD8UR4vkMOAxL6cyRBKFPEwxkaRqUZ
X-Gm-Gg: AYBFou1KmWNZvBBzM1NC91JOdJM8KwWo6yCzc6B2qVvG+xi2HsyaFwEwwUiA0rKrEQY
	dMJhf4jyQxtAdVxhkMII86X5qA8CgzWm1oTZDXvdRcu0qN8y8yZC9O2CUyiNCvfw11QjEUG84lC
	4kvhKOSTL9AZ3FzO21EJZYIRxYGByR732fVqajQTFQcXV9Q5UOhbF7alaM6kko6XaMv/wPYOY1U
	SlPeytDTXDtRGlZpvuBI095hopDVnjf/oPSyVTnW85CTLBSal9ADbxmMUSskscnAFzICmCeauES
	HXLxzUZ++aoSrTeocwwOPIfkdPTyRqYl8bWxGZCie+csRNkoJ5eQqsZawdIKi9UHgZHCiOPBmLz
	MlK/inqQIRkM=
X-Received: by 2002:a05:6214:2f03:b0:8f0:d59d:78d2 with SMTP id
 6a1803df08f44-91254b085edmr20535346d6.5.1789701703240; Thu, 17 Sep 2026
 20:21:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:21:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 20:21:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
References: <20260916-hugetlb-subpool-always-track-used-v3-0-38aae9b5ccdd@google.com>
 <20260916201307.5618114cbac4af52d98aecfa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 20:21:42 -0700
X-Gm-Features: AcwNN1UmZTajHstBlVwK_8w-qiRF_BNJfwUwN_LNEwXV7xnF5kJXV5qm-KLh0ag
Message-ID: <CAEvNRgGDOG03=faAE_ZA1aHQ7Za8gShUUd=h+J0xZ2f2FaWF0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix HugeTLB subpool used_hpages tracking
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, Alex Shi <alexs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hongxiang Lou <louhongxiang@huawei.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Nhat Pham <nphamcs@gmail.com>, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>, 
	Yanteng Si <si.yanteng@linux.dev>, Naoya Horiguchi <nao.horiguchi@gmail.com>, fvdl@google.com, 
	jthoughton@google.com, rientjes@google.com, vannapurve@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Andrew Morton <akpm@linux-foundation.org> writes:

>
> [...snip...]
>

Missed out replying to this!

> So if downstream people (-stable maintainers, others) follow our
> recommendations, some kernels will get two of these patches, other
> kernel versions will get three and some lucky kernels might get all
> four.  Are you confident that the patches can be split apart in this
> fashion and still produce a good result?

Would it be better to add Fixes tags such that if one patch is applied,
all 4 are applied? How do I set that up?

Patch 1 is kind of a fundamental fix in subpool accounting, which allows
other fixes/simplifications in different places.

> After all, we're sending
> downstream some patch combinations which we didn't test.
>

I think patches 2, 3, 4 would kind of depend on 1. Without 1, the others
would probably do the wrong thing.

Or would it be better to just squash all into 1 patch?

Each patch does fix a different part, and also I didn't want too big a
patch, which would make it hard to review.

In terms of bisecting, even with patch 1, the bugs fixed in patches 2, 3
and 4 would still be buggy.

>
> [...snip...]
>
