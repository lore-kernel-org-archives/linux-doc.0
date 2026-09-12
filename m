Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B934189B9
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789203682; cv=pass; b=K74T95l/W3cSQVF3gTYuWZXIk7klaJXWIrypGKmmh176Cy0VfaYVEv1l0HapnVwOV0C8iZiUSDCX91U6LF4jjiBG+xsdY2offv3URiHeDVqdtF0UiyfgwXE/Lj+F0oejnaFjVRLODJ5GeWW/fU9k2Ep0B6/0G/D91mYLUJ5ub9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789203682; c=relaxed/simple;
	bh=IPNosc/r0xfulC5WG68kmh6M6W043Uql4TTAQdGiAs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZo8nO8lSDjKrsn83i6PprKo5QTbKvZHXE+swZOn6pUdq7/jKiQ+tftrpiaNRG0cxq0DDVZBzyJu4Y0KmW+NIKSGmSy8+D1eXnEls5d/fvR9onNqS3J6xXyD5FHsxJsnPEv5NuFqZjpj5vDTVrrp96mbilLwsSo7cPOokJmpHTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cphMH7I2; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cphMH7I2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c294183384fso286201166b.1
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 02:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789203679; cv=none;
        d=google.com; s=arc-20260327;
        b=laTsL1BpIcHE2UgJZ1j8/GqEgvmWNWchXbxbDS02Iy+58r6Bx5y0zapAebWEfHT8Gm
         OC0njHTH5MF04lIoSO79l16BUEgkhCPjeJTbO+MEgXhvicCCUhzIlim1gEOV8yZsK30P
         JUkq1sZl2m0gwa9C1Fi1JaysjFt56LQG7kSmLnlz/sik1DXofpP2ugKTkyJJgMxLkqjT
         hm/+uI10or0k6ENVFVrJU7Fo2mdDH31S19UG00NZb1GKKx7SJcvUP8U7E2vwj8759FWP
         IHPptDwBBpt9KTx/zbxqs7CRoqTIhFZyOF993+5N+0gnlm6Tb/T6Z3mNY9ACL8S/rHeU
         1uQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        fh=eNYOQXUi/LfVkVCUSXNXwvc5jgCDxJuQPvC7A3RUcwE=;
        b=MQmSN4oZN8bM2iBexzdbuR9QjPERGDx8wxyRKjG20Ayh6+k+P+NSezSaUlmF5/bCON
         cVQvjcG5/LdZWZ9yMC2VayhO6uju18OzcKNUHcnwK5JzZhRUy9IfhA9/+dbvqcioKT09
         VUFyc3UuZ6KRp9SOFOCPlx68ew/h6KdJmYSwVG8YbbRrTgb3QTKtahIyFO8lHcWOJcxg
         ekx0Mx3WW0ky8jUAHFvEL9q2q1upDIICsv5FSC+47hT5Qamv2d+vmK80HAkVFq/QgIYy
         nNDpcNXiCmkL1xoDeQufAdoIMPTs1bi2Uq/hniGkPqR9UsFACHEl+rmqcx4btqxbkpIg
         6spA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789203679; x=1789808479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        b=cphMH7I2NbjgYz9Y7q4cvOIjKX5pGTY8W2/iskq9B7nGNj0k7301wz5doOVV6+aTVr
         LIo6OcxJqd/it3YEzllDVrdV+6MRbfFIJhKgiwjAwQM40YgAkJs5YRfSotp+m4AZEEO4
         tRNBQw51bNBDE+YMltcv1NIYcxldHzDQXK6MaWlhu52lLDd0lMYK0x2MN1wTUqFXB6Nj
         RtAlSwE9KgvQvze3Y/My6eAYs90PvCCc9HxZXLn8JZy3P2QX/aoYs9fT6t+xEZxhgpap
         +BDLXm9FF6AygIxv1GYhBoEg2KPJ0kYc4upched6ca/pIqohLomPB/aC1RgYAnVLX3IP
         LsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789203679; x=1789808479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emo/VHVaZMhmQcduzPD7yxfTUOKr9C1DEbaLmLBuIaI=;
        b=kM403Gv8zVtGluZtIxFDZDvvmDQxizMwTBIACgmDvfOIVydpQdi4l8UVfch37l39pS
         XmsZlA7QAhYD/M0weJebWAOdFyZpEux5qBbiYrBvE/2YilvkSmpGw831+6W4VX9KBIyC
         m3e0NZvrZ0+CJaOrEL+hYJXOr5yFXMZRm707GDrQXQzRbIu7iVS5tVSrYFpE1jEa3sKo
         c23BeP1j4Q2OIwvW3+RKjekoFIEH/KaNQ0cgSbOjpaLs3tvSE9Cxv8tfpmTUHrqSAe2j
         hbKhnqG9MDYQDHGIyPqGrf0g1+l9FBBHGOMMF7G59Y+I4ICMebXzqPjAOEVHQnEvZJFz
         Yh2Q==
X-Forwarded-Encrypted: i=1; AKwUvByluAWi06pvPkJn/gZwy6CByAjsCeF8dpM2StQuWLEoom8IY2bKJ8bKhZLPNnckYYkbehEkwEyEGZU=@vger.kernel.org
X-Gm-Message-State: AFuF++k0SFkP0dXhXtBwI4ul23x61Mfax6/6acL96Ia6JoTRCYvbHTjL
	CFt/wvaxtrvwQL/BLRoZPvDd8MB0lDM0SStDwmTORtMUGo+V17xHdG4VOh6iMGnneKiYXD831i5
	OyRlSq+yEkYkJrwTACd09yqWerc00nSw=
X-Gm-Gg: AYBFou1xE2ozO79mDBK6Tuk9B5Ex76oZYKsAi7gvLeIw2l0NXXxcDWAQXot0o22ER97
	8IF/jbocNBL4E6+x1bwKVYOerWNTnPllL8cwmcGT4TbjZzxyeY8PFr2ZqPwl3WfHsCiVIfLfmpE
	ncvxYl4K5w96H8iPek73oK5cmrHsphmy/RmBOT0vnwR/T+14wN5rMwJFtrvnRWCfjBg5zAlV6OI
	56a+qqaBcmyoxEJPiIyXMhcJDzW2ksxzbPvmCaaEzhc+PFpK23u0xGw6Qj1CYck3NQLizycQgir
	ZpEm/I1GPdr5qxjtEEd4P2nUC+eAK6Qo7y9W1IZSKhV9fVwzkM/RMScIypkX9pzfZOHljiEVOoC
	RHcFtasuy2y3j
X-Received: by 2002:a17:907:3f88:b0:c25:9102:ed with SMTP id
 a640c23a62f3a-c29665ff973mr349742666b.5.1789203678979; Sat, 12 Sep 2026
 02:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <CAMgjq7AHRzBsbmGOx0s=TQFBwcn=DEU1naR443sO6x+pJd6hAg@mail.gmail.com>
 <aqBT_35E-eSoN_zj@cmpxchg.org> <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
In-Reply-To: <CAKEwX=N4aaq_oD2agTUNrUNXhaYGeQ9vxu+dywFvEFgWFi4uQg@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 12 Sep 2026 17:00:42 +0800
X-Gm-Features: AcwNN1VTyrOeQmFG_efe2_ca4qa89c2Nr9YsCc4NghZiW0bnHUOivuHs2n-bDVs
Message-ID: <CAMgjq7AfNBUpMamcv29JFzpX=7ApNYVLtPjWT4Sm8cXjSLYL9g@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
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

On Thu, Sep 10, 2026 at 12:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Tue, Sep 8, 2026 at 11:30=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.o=
rg> wrote:
> >
> > On Mon, Sep 07, 2026 at 01:51:31PM +0800, Kairui Song wrote:
> > > Where I've ended up is that unbounded growth is a real concern. On a
> > > host with no memcg limit (root cgroup, and most desktop and embedded
> > > setups), an unlimited pool means usage can keep growing, with no
> > > admin visible ceiling at all. I'm not attached to xswap's percent of =
RAM
> > > knob specifically, but I do think some kind of bound makes sense.
> >
> > Swap space is just process virtual address space, no?
> >
> > Swap entries already have one or more page table entries pointing to
> > them, which in turn are managed by trees of vm_area_structs. That
> > means rlimits apply, overcommit protection applies, and OOM killer
> > attribution works as well (oom_badness()).
>
> I tested this theory. I spinned up a process, and let it spam 0-filled
> memory + swap these pages out continually.
>
> As you predicted, oom-killer picked it up eventually. The host was
> (and is) intact otherwise :)

Good to know the kill path works. But I think the accounting side cuts the
other way? Won't that conversely underestimate the host's ability to
handle memory alloc? Not to mention a lot of application are
swap  space aware, some built in logics like e.g. with vm_enough_memory:

On a 1G machine with vswap enabled:
[    0.241906] vswap: created virtual swap device (2199023255040 pages)

a 2G sparse anonymous allocation fails:
[   46.044002] __vm_enough_memory: pid: 1129, comm: search_agent,
bytes: 2147483648 not enough memory for the allocation.

The default "Heuristic overcommit handling" policy is meant to handle
seriously wild allocation (as documented, and it's named as
OVERCOMMIT_GUESS).
totalram_pages() + total_swap_pages

Is the limit, the heuristic exists only to make "a seriously wild
allocation fail" (as documented). But on a vswap-only machine,
reasonable allocations fail. Common swap devices, zram, or xswap don't
have this problem. One could argue that the size there is just an
optimistic guess, the compression ratio is not controllable. But that
heuristic is a guess by design, and a plausible number serves it fine.
"Unlimited" seems break that.

One can switch to strict overcommit limit, but that is limited by a
user specified ratio or number; again, we need a concrete number. A
fuzzy "unlimited" seems odd.
