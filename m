Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD11501296
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016967; cv=pass; b=csj3XY1jis9RlJw3p1CjlTiMLFbc2qfHmckg1UAPRSRSUvf9uFnG8NxOKvaiSQfOSNKGC+zVw2Pn6s4Vmj7QEr52VJO2oFHpDdkBurYNzozUmb+xA9auqP5YH1xbg2s2pExlgKUjXl4BRCv+7j9PYDMjGBkUMy8afHR839bWirQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016967; c=relaxed/simple;
	bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kONVjdD/zSfIn+1tlWVWUwa8xkChEiTGUZNNrAa5Pt7+Yd36lNtK44XPOvRxWG8Gse3Jpb2e1bKlQC4USDT1UoQ8WkzFDdvNDegce8aYQMUBR9aynWc/8ahLrB8cux037i2a8k1MyfKC1TNTL6EqpIJ3ISjcK7pdEluX/8ME4f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPU9tOsC; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPU9tOsC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so2289339f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 11:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790016962; cv=none;
        d=google.com; s=arc-20260327;
        b=FaqOj8C6Oqn5/Tifgow7IG9zdwwdSeH2amSBIJQuAS1D2BD6jE6P5ZBO9rOg2Uit42
         +PXSHHvIMwTh4OiexhyyUwJzWlpv1etZ0CY/NfRmYh7wc6PruLdjSsP81twon4f1zVxi
         hXWTxqs6eLCIev6mgGxRsTbtreKr874ehrKeDsr3cb/nFJlYYE4od5y2MIeXZyYcagPC
         9fqPgqlsMyG4fUr3ROSkep8rY9aoZ0Og6N2z8fR3ZdA/KWhV71D4k0X9TSF/KrPEpv0q
         V3iw/FpIG8ME22Iga3RZLgxZRNH84ZYSdbms19X2WxTruoVlg79zgDgkvYLMAoQKZiRc
         0W3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        fh=8oUQW20GelcEiMW5mkv0aEK3P6jZal21/ZCUWviZSd8=;
        b=I+SXJcacAEaXz5pfsDPRNwq+uZObSlqmkSNeXDgnFVWFQDvkAxK1QyH980lfToFaV+
         mKGCUnfnJl4numhWZGo5sTUIkxMbWw1rdQ+ZQhqe+CMGgTlTdsOh5lgK6f0GOSL9JzxI
         GpkrXzpsa7q4NZoSms1tT3aqTUcSMIhUOf8gBdQ+cBk3OCC6u/y2YshFxgndcuE1nJEj
         5iiY1X//ZrjrMNRBbfzwHbdm6qmZmbthdUPpdq9i6vCl6GY5V/7B/q044XAlGVw2Qanr
         fInjkd0ZUTn1Kdvk5QzKbJdtGiWjFuyhmTG+9W5OJRUwmd/tDAyYTpq7Xw+zUjtRJ0NL
         TAwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790016962; x=1790621762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        b=DPU9tOsCqXqbBraOPxqWp1o9AB/EkHB2jwVYQ+lTlX8ZwJwyTT/Jxfkyr/a9Jlix+/
         dpAkD68t+y0gstZ2/HTRyEKwrmnXYSunHLpU28k40cqc+WV2A25u4isPw9wXMdlOVr0u
         fa7E/jVP3lTeNARJK7pnVVac1vULG8qRUbSi2XHrJZf5MglCbwkqeMlXHNDb5I6TP7iZ
         ZWQakQ0kQkWtw0nyAZImz5h15i+uE9YTTxu9C5oMFGQZywoEKi0BTiGilZp2K4AK3OvV
         99ePtEkCEyqqX3/vXozgEnL95Lk4I+91InnHCOLgf/GpOwWmVmTOHyJ8rWP3ML1uB0jC
         v9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016962; x=1790621762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfFXpLin8UbdB73DGs4mouTnFh5xNjHoAQbr3ky7Ets=;
        b=z44BkE+0TW9IISpMIYXNvAYrEeFSf9vQ6iilOQuBVIu3XbyqkLv8oYJoggA/E6495M
         nu3mm1aq/xVInZoZkNC2HQ4eBcl/m4Kjigxju8sQcc7LPQogpXnvOuSMJCZNUXf1yPwi
         tqMLNk31uybzwdxE6QSPNPp+NEZ/VtUN6m1A9SWKOvBeCENCHY8PydcgC598pQqYW3qd
         l3esntSG5UJUXNYfIxTo8B9/INqqkQPwBbY8WH0lEseAjT0WUEfFkzvAHqHuoCx1HZr0
         8imCYvpIyYmpif4gc1SvRGXwxi34CnxN363Bp00B/u8I/JR0Sl0N+cjLZ0QVQ+rk19ES
         P75Q==
X-Forwarded-Encrypted: i=1; AKwUvBy1orTOJbAr3+sLrQzeWZJM6Tj49JllcUovqH3SiGOHxBDxICpPbQ5tZucOgUfNINz2QmjvcGcYcRY=@vger.kernel.org
X-Gm-Message-State: AFuF++kBBLY3TlNBuWczCMWwhiVAMFmvGoZp07l7lutpL3W1+a/Nenjz
	SNQmaYPsMVM7V5V0b0xYB7ofO9i7dhyb7tPndHxQ4RB6FblaEOMarU1UeOcuq7VtrTgYIGU/3O5
	QhjFsu9LLhyFtX7Qqf7NPrO5Q82VyqQI=
X-Gm-Gg: AYBFou1/DIYSFmmC9RcpwUJeTsKQJIZdkx7U0fAQK30zOwDFJJYZ0JfNtZwSQlHpBQW
	rVuJep0chXQFlQdMWX//gFTunvztL0i/PzGlgp9JC2p4RtgsfWrBEKo0J+y0FqOnNpTAb9zjYry
	9haNGwLDs3uMA2RzXuqxeOD5VY4JU6sB2QSKUjCScL+CtiSpgD15oI1Nt07IgBoAADyy5DAkVaP
	6RodX3b4BLtWhG7cZTSTD1kR8GV94XOyWVzLk98g14GKSp/UVMjewYonO7KCZJy0cebm/hQyAmk
	zKZRFRSarS+3mzQandqiNu0zXIylUXOIYzBVOvVOAgdsz9pXmwhlVEiP5Mm8iv+TlUSiTRxAc/k
	cVgv6XyDheFg=
X-Received: by 2002:a05:6000:26c6:b0:487:fa6:d7e5 with SMTP id
 ffacd0b85a97d-4871e386ffdmr22164283f8f.25.1790016962241; Mon, 21 Sep 2026
 11:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
In-Reply-To: <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 21 Sep 2026 11:55:50 -0700
X-Gm-Features: AcwNN1X9C9t6jZ1elLcVhCMK8X-LC57IMfgOb3DvTZPE3O0yZGqwzYORodlnY9A
Message-ID: <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:50=E2=80=AFPM Chris Li <chrisl@kernel.org> wrote=
:
>
> On Mon, Sep 14, 2026 at 10:00=E2=80=AFAM Baoquan He <baoquan.he@linux.dev=
> wrote:
> >
> > >
> > > Is 9AM PDT fixed, or can it be adjusted? 9AM PDT is midnight for the
> > > UTC+8 folks.
> > >
> > > The time is still fine for me, though, I tend to stay up quite late
> > > anyway ;) so that time works fine on my end if the slot is fixed.
> > >
> > > Is there a calendar invite or something, please send me one, I'm happ=
y
> > > to do a swap sync discussion there.
> >
> > Thanks for opening this up for discussion. While the time slot is a
> > little late for me, I am not very sure if I can attend, will see.
>
> No that time slot is too late for Asia developers. I don't think we
> should use that time slot for swap alignment.
>
> We should find a time slot more friendly to Asia.

Any time slot would have that kind of problem. We're spread out across
the globe.

Let's just use a standardized time slot we have for MM alignment sessions.
