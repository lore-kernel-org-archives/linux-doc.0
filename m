Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE047FB19
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 16:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403452; cv=pass; b=ZrR8mo1EmXyHUOhucOIwoR3nHEsu2r0uGSpXyvd0HvGPTh604ZeyHS1gJdW3EKr/1dzCbSf/1lIp5HIrjTxusRZK7+PruTl6gvPlkiO+wPHFxzE61hMZfsHlOsEOsifU5JP60MtKl7EyHdTlQH37geUvKATXbLqxt+UsRSTY1SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403452; c=relaxed/simple;
	bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYRqh78ShEGndTLkE5J28cWEGmWmZzVxc4FrJqjt/jfvpWYEA+kgWbJbGbn9dHu9b9JSL2AVcDsB6KAMpgHSWPt5MYE4GOka6HBqf+pj/5bc2UNn8trgO+i37Clv8ixWVANJbr+HdMd6KZXhsaLncD2wCC6yda+jUAzcfQoTSG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkJef4Iv; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkJef4Iv"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7935ecb5d8fso616981137.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 09:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789403450; cv=none;
        d=google.com; s=arc-20260327;
        b=Hf7Vu5bk7jNeszv7kibyQu0h4Y6Gdi85sUBubKqfoC7IVCzhQOWe1bIz0eGu0/8Vlt
         rFQQhLHIJP89EBEglY/vv7mVrdiIrCq7XhJUKHjptheHKEaXWKplijOnqo7eqaVUFKJQ
         UQX/e92JJL8aGP/fsD8Sjf6KkN89/sWtSdK5zoHC9vXdhzaWXB2u9Xenc/yRIWz+pEgN
         /NrMH+qs5pWlJE6WRk3KyKvp0sn5xuTF8/mCHcTVqdgeYpA3yfQ4XBgEMUpP/vA+ADr9
         JtW+XblE8rEIUFlw/vgSMfUrFmasNQdeaQ2nitT0oFaaexUapKmoWpl5DcvQMz+euRf4
         rxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        fh=pilc/HnPef3dqHbajdy/+V7z+zxDuFJS3oXUwadha3U=;
        b=gF+w9sGntSILWkzEzNv7JJnPG3RBIOELgbFlO+isqGUwczrP0cRv8mCwupI1slg6Vk
         jci0/EJtlKzmdvYk+fopsba+4pskahIk/VqBTwMw8dp5//Q4Dai2ZiuHHJ3lMNcNa47X
         ZjEe6/wFlehR1Xoj5aWR4aY5SLyeNMka5x6umdmShcYq8e5kPZI6FG/gwx3ZWJohh9iF
         W/hgroPy4T+0+1gs7T97SwmxUmL+4jCi0ihB9NAIBF+3x0TuxAbnhYp6+s6mdHH9OHiD
         TnBVlp4uvDb/FsPKt5U1gQaKoq9st/lcsnMXfY3P9QnAs/sxihrIxrSQwlm5FSCQRMMF
         /uUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789403450; x=1790008250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        b=QkJef4Ivs6iY3syqkU/t38p7D+wTwdUbU8t1xmm/eQm99eHLgDtK2CmSnuksIIFK59
         ZV+NQVIGYwtPwi3NTjGeIzuxlmVGudaEysd1VCg3kBoSCi86mxGhd6MIZeu7sGeD3SE9
         rw2XkiUFQKgl0nOCl6Vp/o0odSnDa9ErlWimnlF7NeJ/9wmiNDotmPGEYOLMeZn4bl9J
         HYqgh6o0H6370UJqhu8ieJglt2VaHzMnqsAZnoePtknhQUAzZNiJFNI7Gk/4VC5HSq5Y
         zcPrCSnB23FF5QmUwxtFfAXzSb+7GNFQRefFXTlfRyPUA1l2iVqtuFyzu1zLh5MFqHpJ
         7NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403450; x=1790008250;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSenOVdio0MTk3GC6131u10bA8proRI6SzfxE3M5VwI=;
        b=Q9Y7xt8xFvzyTHqZCXBPdD5SVRs3qkm9b29HgnBa5hpIFloWcW2nvIDf0h4OABmKrh
         cHPvNUhHiGOOMXLbnO7DhwX+w/EZ6m5ktpmThLDEyTbmObJ+dz2E2DVipiPXa/isKirk
         N5F2Fg3OV07S1WYD5w+z79CTm873QA9h6JHFj2WKViuY9zX9oQFQClzynU8xd5y5BHaM
         pBlpVqof6clkRkkunQgD5mTMHWBmIcKiZmskviyUWu5MC3T0HytQlpwNNqzU3yxrbdGY
         R5mjuvJ1XsRM3hd9egA+chSM9qlTvyW9Y/2VNcPsEdcKtks3wGQF8z0swoGcRX0PB4M3
         I72g==
X-Forwarded-Encrypted: i=1; AKwUvBxvO8lubd4RYW+vs4Rmlk6yeMgw4rwBE2HRBiyzHYLrGIr57NWnsNNV4uaO12g63YFzagajGVR+8SU=@vger.kernel.org
X-Gm-Message-State: AFuF++mPI8eXiIcG24aEmbaI9YyT1pOI1VbmNPMtQMMzMLLaQTrkks3T
	F+gX6bq0fYsccjjUFeJR5q5bmHYPcTVOahTLk6kqAw3Sb98vX4m6qKFEaagj0vbYpoYIxsnnmIa
	L/XhlKPlIqM5tSCUJU0s36/tD77Wcy17jnGTWKZ0v
X-Gm-Gg: AYBFou2kkcbEMsapIdrXIa/Ts68ZbuM6E5ovrRB32HOlkMeQkJqHVirys6Jy5UapSqg
	gVRF3fZxSXHrNbwZhPwEGuhEXUT9KLEVBAezLBNr63ig2WiviT7fVPjy47UJcjRbTGC3oJHigCd
	S6nl7pgJa01h/WK3cnjOh4rgQW3soaeRF7Ig8+BLrRCqMq1rc/OZB+Qim+GORNBI3BwdQw5D/b5
	UsG7qdFDIx8viQfUcqZxRAd5RlC4WRhBCTLQErVs4gsNDhM2gfm4k3ZSclrLjaBmHzud3pwdqtm
	yeGf7OEmGodemkQQCI5lVQhOS75HD6aXQuWD2g3LBam4GA6JZjKK33Af2wKNPEHRak+qg/Pe49d
	Ax3L24WBhKP2xbIFAO9W6Kw==
X-Received: by 2002:a05:6102:511f:b0:785:d308:cc0a with SMTP id
 ada2fe7eead31-79b5b2909fbmr3656947137.9.1789403448800; Mon, 14 Sep 2026
 09:30:48 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:30:47 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 09:30:47 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
References: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
 <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org> <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 09:30:47 -0700
X-Gm-Features: AcwNN1XXPLdtIsXucpy4FdPGkhqMrtzwEGfBrz_XeIOSoKwnvb1TbO6LQoI4Y4A
Message-ID: <CAEvNRgHPGzfyr5Uuir2QoLqSNTkspkn3yJ5CTz7rAQmREe2Apw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Fix HugeTLB subpool used_hpages tracking
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
	Yanteng Si <si.yanteng@linux.dev>, fvdl@google.com, jthoughton@google.com, 
	rientjes@google.com, vannapurve@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Andrew Morton <akpm@linux-foundation.org> writes:
>
>> On Wed, 09 Sep 2026 14:49:25 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>>
>>> HugeTLB subpools currently only track used_hpages when the user configures
>>> a size limit.
>>>
>>> This is buggy since when there are existing allocations from the subpool
>>> that would have satisfied the minimum reservations,
>>> hugepage_subpool_put_pages() will still restore a reservation to the
>>> subpool. See below for an example of a false reservation.
>
> "false reservation" should have read "false reservation
> restoration". Will fix in the next revision.
>
>>
>> That sounds annoying, although isn't clear how this affects end-users.
>>
>
> I'll also add this to next revision:
>
> hugepage_subpool_put_pages() falsely absorbing reservations (aka
> reservations being falsely restored to the subpool) means
> hugepage_subpool_put_pages() will return 0, and h->resv_huge_pages won't
> be decremented. The page(s) still being reserved in h->resv_huge_pages
> means fewer HugeTLB page(s) for use in the entire host.
>
>>> In addition, the subpool is considered free prematurely, is freed, and this
>>> ends up causing a use-after-free.
>>
>> That sounds alarming.
>>
>> Do you think it's best for us to submit [1-3] for -stable backporting?
>>
>> Is it feasible to come up with a set of small little fixes to get
>> -stable out of trouble and then to prepare broader updates for our
>> ongoing mainline development?
>
> Please see [1]. I don't think it'll be easy to come up with a complete
> set of small fixes to fix all the issues that are fixed here.
>

I'm hoping this will make it to 7.4 and it's 7.3-rc3 now, so I'll respin
perhaps tomorrow or so if people are ok with the suggestions on the 4
patches or if there are no objections!

>>
>> If it's "shut up Andrew you're always saying that" then OK, I can take
>> that :)
>
> [1] https://lore.kernel.org/all/CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com/
