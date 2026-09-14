Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF17485507
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401415; cv=pass; b=mlEI5j+CST9byvyRrUzEP8BH9SNvaInL7vMhj+Y1Rjv79Bp63n8PToYs49AMGKqRTTZIq6knsFLvyKMICX6z2Oqw/8I8MBmPGoGzxyHWIry0ZyQt34GPoKh/enMeL+Q604TUYYQmaJRk2LyZf0bXjebfTF2X0ZxJhg0p9Y5V+RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401415; c=relaxed/simple;
	bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aa00/tfBcyS2g9AWYliOGuT6z5TT0d9HA25dkqL2Q7pYQh0E1jTumu4xH+h/vd75eq2i0LKnjylDsl03lkDyvw12y5KDEbJbX6+n8GW3yhiWeRGOr7tTw5GISzjnrAzBhq9Wn0CRXXf1KgRqEi0X+Mz+RwXklhICFRhxioZUGCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ORPK6RDL; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ORPK6RDL"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c80b099b4eso1887017e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401412; cv=none;
        d=google.com; s=arc-20260327;
        b=bfOCak4eHQjBCG1uUXKNJNnSi0oW+bcbE5PUP/gJVNkox6HZqnPX3Me1uvDkYdYW/H
         2f1sRHWEIEn/Xdja9IqF3FlJUi1vYckcRmRK5H3pfjsCLvbgwrk9n+MI+MuTCdIHXruE
         RIO0z8nK8wANYWCf+kyi6HX+30a3aKh7j+cgBt4wtCXySuIRcvN9uNhoKgJ3kJEJ/U+8
         OZmVYYBMXVtoaf7WH8cobupp1+DnHJu479LNfjjfcjk2JpTDzc8a+zvWEBN5d3hFbi1Y
         gdiVUx2/7yv9lymjeYjdpplFJtawJFWWGrVeAY6mSEXdOrwbvYF70cYnhTT9TiiXyGag
         9LHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        fh=ME0qvcGy2TGcwQd8DaHNNlUDYaPtJ5EOs783pNo5jj8=;
        b=liOd7b/F6tTiemW8atYOtiZn/dwy56mrFVwPmJ2B5WVz0IgU/+qkH+fOk3mul1r4IH
         CEMeJtlnJddSi/Y0VC4rKJzIcvbj5sCXqWUtXnPRjORzYxkHhU50QMciHe2dOb1AHB+7
         tbHa0/lYXEBhA2jfWqNjrse3/M638/bCqCEjPdqEJzjeCrAk083YS/EmH27+FFjQmGry
         tu1Z2wxoWTeMRCQyaG4QYzqtWLMty9lm/mkxAnB7eqdDSDk76KJwFq1CRmr8V3AhIorh
         iI5HgUivYs5TYtGOX/wPbM0gVuguUtEp0vnYr0roBWikOjDJBtDWX8KJNCTkYoT7NYxl
         VXTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789401412; x=1790006212; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        b=ORPK6RDL2qaDKA5qkerGeElEfbx9YwRujFEaZhCL0VNvY0AzCbv8fnSYrPg3qMOsb5
         aoDMPQ7OfsXtp71hbc1oEdjmS1QYAoZnI1EljL14obvc/xZxs2FGnBJT637uQ7q+ILmd
         cK1WrYxcS9kTBNsC3PnkzJJnQVfzZW/a1lwiJElk/oqbu4Homlg6pPaXmtxi5hVPzGE6
         f2iTowXyeVt1aCqoweYNjrxT1d/x2d6c6LFuCqaOpSVTRuuemI9IjS4ilIPv9KQsstJH
         /mMlGL0g39MaZrpSLmVmMiGjsqzWEQv7sbestBxHK/aIge9FaIHlETemJZLgZqIwKRo2
         8ASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401412; x=1790006212;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfklUHIPWaWmrp2t1aYWGciesvwPpwkoe+iBPGV/Vsc=;
        b=bzYaAfFb9d7qfqI5KOTJ/Yt0IeYIZFRXx6KS+Q3DiToICRmK8u6TEvc9BpZ72eOaEL
         /1ERZMBuSu3Cahg/JxE8wmH1tU/H31ZZD9blR+N8mEotI9pFGPbbkLrKyUC87u4SIkIK
         tk+e6B0vn/SKwrZgDAEUgeB/QEPWW+BdQg9+sRjdXQcScaEpN9GV/tBxG3dwXo/IXPjc
         fCg9w8XkiLUKw8zEwtkAb5M5lsAtsr3sbmzginc4q57sfvyYuJApwEI77Ne9EhHs+Y6C
         d4WPhMz4icLDcQQFhdXquetaz9KUZr+Hcj8X1pLU+6NLNiGKjJKCm8lrQqELHqLfNOPW
         PPlw==
X-Forwarded-Encrypted: i=1; AKwUvBzvNCyUty6qAMiZSbjclBRxcZmcWgKCGz/3vvBRnLZoh1lw8Q0gYzC9A0gZPaYhtHMT8GXbRJZZ524=@vger.kernel.org
X-Gm-Message-State: AFuF++msge1kudrf/PmfTcwSEAIZBeqSaaXSn8jBMuc45aUVcVfSbmOR
	wGK9KhYw4LVwyGZ0ItbSKQl8zdKWdyyH1jOjB8LmpRgYpW6SSLGfJE7Xfqnj+W5jB4tO8/ddWRL
	6fVjoxpKW25JpJWLLZ9nRtf/5SyRtrMER4u+bN61Q
X-Gm-Gg: AYBFou2dQEPQxQM8Jn8Q3M9ENGAfNOE4hdzyMXuBpAiPvtzV0dVnZx+7GyffUzfAp8B
	eOxoAyFlQcejGddpEcdtbkoCmmcKSeENYe6ka1KuTDf/U+dQbpReXxJCQx/GQF++kK18+6QK+XQ
	WIuIbBpNtA83omOzhPjDV+bUazukGUnD49VulTnTpbQHP7WqkmvU97lF1oub+Ap+a6KvaWDbBC5
	1Z14pWOU+2SQJ5VMA8xkyGAl+w3MXhlhr1z8AnjPTFahTkYN2ShY3TWx2Kny4P52trZOYCBM2tE
	It1oVdTCH7nQGmUwI4SyDrRFMq/7uj9hC9lAC1trgQ5neyhXdn3qtMFg6O/goP+RghUvjokuMoL
	Y3GW2b5ZMgg==
X-Received: by 2002:a05:6122:4b8c:b0:5c6:64ac:d6f3 with SMTP id
 71dfb90a1353d-5c981d3a2b4mr3488872e0c.3.1789401389359; Mon, 14 Sep 2026
 08:56:29 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:56:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 08:56:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org>
References: <20260909-hugetlb-subpool-always-track-used-v2-0-30c5d83b572a@google.com>
 <20260909155003.e6c2f4fe3c0bbee3b34578fd@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:56:28 -0700
X-Gm-Features: AcwNN1VbtSw2suRdJEPwwVSKB7yg54T9kxDFDisYSP9Jtt5N7Dkjunh5FrFt35g
Message-ID: <CAEvNRgEwbUXj5cVQq4A-U=AMOzP3S1mjnrOC79Li71wf-E+dDw@mail.gmail.com>
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

Andrew Morton <akpm@linux-foundation.org> writes:

> On Wed, 09 Sep 2026 14:49:25 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
>
>> HugeTLB subpools currently only track used_hpages when the user configures
>> a size limit.
>>
>> This is buggy since when there are existing allocations from the subpool
>> that would have satisfied the minimum reservations,
>> hugepage_subpool_put_pages() will still restore a reservation to the
>> subpool. See below for an example of a false reservation.

"false reservation" should have read "false reservation
restoration". Will fix in the next revision.

>
> That sounds annoying, although isn't clear how this affects end-users.
>

I'll also add this to next revision:

hugepage_subpool_put_pages() falsely absorbing reservations (aka
reservations being falsely restored to the subpool) means
hugepage_subpool_put_pages() will return 0, and h->resv_huge_pages won't
be decremented. The page(s) still being reserved in h->resv_huge_pages
means fewer HugeTLB page(s) for use in the entire host.

>> In addition, the subpool is considered free prematurely, is freed, and this
>> ends up causing a use-after-free.
>
> That sounds alarming.
>
> Do you think it's best for us to submit [1-3] for -stable backporting?
>
> Is it feasible to come up with a set of small little fixes to get
> -stable out of trouble and then to prepare broader updates for our
> ongoing mainline development?

Please see [1]. I don't think it'll be easy to come up with a complete
set of small fixes to fix all the issues that are fixed here.

>
> If it's "shut up Andrew you're always saying that" then OK, I can take
> that :)

[1] https://lore.kernel.org/all/CAEvNRgHbzY30n1hz2vv7BiBMMhci+NEv_ubP1LjQNmBuu6Kjgw@mail.gmail.com/
