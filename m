Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6E225397
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 04:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777004777; cv=pass; b=DHD+Eel6sqte8uSljOXx8H2GVqazFSloifkTCiDhypbMP2khxCGS7bp32zIU1SeW+HGKC4AWaJJ87teRkTy6C9kAhjpzp7p2eQ7IVuWtOMhj438RnHNcLPyfVASvE1f5UsFPaSVtmFg38IOs/aGoY+1SjsMx7z8EZ6/SpMiD1xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777004777; c=relaxed/simple;
	bh=ik1IXjkQGe/1mCxzMlkTq7jyLpXW+ghrJTKxgI9AJXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CcCnSQG9YM2O+J3/9VuJU/DFzAhYC/DboCTu6wT9t1gCNWf6eIfBxcZd/aQlZKMxPGQhBwLMdUKHVHHY7CAlqUONb0XbCpS+08qsLzscQdChRNLdYfDw8IYk7GdHEQQnGkgwL86wAxqeLIHPUjccPlJwekJ4j4cMgAISjPpD3Wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcFiP5/A; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcFiP5/A"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671ae79e617so9554082a12.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 21:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777004775; cv=none;
        d=google.com; s=arc-20240605;
        b=WZfwbK2MTsziNT+1Im3iGmdju81eXREvegIDKYdxt7ifzBCxQJygcsLtmkyYi5ZAjt
         tUNvwtAiVGPMR/qDPbbRhyg7bkyQjcYP16AXKZrlBdQXvElpTuVedZv0xOrwgMBhnish
         qnlZm+VgBaLjD7fb7sdYwd6/0HNyX1n06AuyFFJdguhH2a3ppRTIHfX92P5zUel8IJCk
         FYYqtTVWL00MUekDyo//WOx0NiLNG/dJ8EMBF7SW1fBs1f7AsYXHHS6+5UXd9qOZk0cy
         c0a66mqQMwVTwAvI7DYS09qGImCCowgK4jOyq0zqKUHu3VK1ncwXGoHKCL46x3lYzXS3
         Fq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ik1IXjkQGe/1mCxzMlkTq7jyLpXW+ghrJTKxgI9AJXU=;
        fh=EygzN/gGjxEtU09sLczcYr/7zSAH7KMrH1gJqS/NyiA=;
        b=IMF1pznBArLXNa0tukHAfwcsaWYzoL2Ob72W3dneEaSKqr2Idydc5DDldCRp0TUCKj
         849yTghxdc4xGzYUkUqmN2OUD6lFUMJN8k0+OOIdfyj/LMJoQsC+nhiI0nwBElQXL+ye
         4GPIRlfeENKXk6PxAwu7PATqS0Iz4I5dEAY/6ZdKMYqGvQYGvmf1C4RMeRSdn4okqls9
         pI2rMfNNmyooLnv7K2CK/CnDPVSt1dU9KvuL8Wygofo3qbCTlkAGlF1Q8tMmhAe0on6u
         qlJItPX33rvEi5py3//BI4B3BSD8ijZ6hV7u0d5gk3gRccvTdjoK/IrlQ3C7aV22blrP
         ZtxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777004775; x=1777609575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik1IXjkQGe/1mCxzMlkTq7jyLpXW+ghrJTKxgI9AJXU=;
        b=jcFiP5/Al5Xwhl4JoG6NyE0iNEX4w/A4Jr+jPw5FuuwJZ4utBjLuX1V5LOpRL7mFY3
         0Sx9EEwo/SyhruXyeHuxquH5IHomvjsUpdZwJXxde/c2XpySXQvYdF80z/Wlw4cFiYb6
         v2MEy2OndyUltBh3tVo67xpwa1ubRxLF/7qRa258PV/UG8DCwVlbh1+bwnM1XtmUaOnn
         LR8shV32nK8yTJP3atNcg10KsL2ghaIFP38ZIInrYp8HXJZs9Hf6M6/POjJ1xmsYDI5X
         jtdnS58aYn7L8amLlF2n/8huquEWLPNe9ayUPlbbPZU0ruhGgCe3vO+LNtYSN5gpVj9b
         BBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777004775; x=1777609575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ik1IXjkQGe/1mCxzMlkTq7jyLpXW+ghrJTKxgI9AJXU=;
        b=Moobg8UnwHEl5KQJITZcW/aeKQbpOVHRSTq84HZy0GUulL8KGjaXm4amaHojb3TpNm
         BNfx8rBCI7iCXpFS5MgkL4KCCR+I2d8RAYyf0Dt2Tgz54x0++PkGAimi50X2WWf2OHyN
         HnABRXeLmMsj/lFcVt3Ay15cdV6I8I7G2jxmv6kbb6DPeDGa+m+PZN66uAjFvrzaSH6Z
         vhORpmP6Xn0GsWBLwHm0LxGbHR8AMnV0oGlwuw8TncgLSTsptgO4Hpwt1viwysdFmeZF
         rwlqzGK3RyTusNafUxFWdcAEVYeMjP5hAt8IZqgtsQZSp8Y77Y01avmN2Nz6fGQTopiJ
         qZOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Es+gonq+k3KyEsgSCPeNjbmsDHaZd6Nd3AvYXbr13//huMXfN+LoRxReMLSzw7ISuRLHQHIKYc2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3BCS1OJU4UkJ949stWTAJAbZ2+xBWXRqOUcVHsRwfmJ/u8s6
	PL2hDHU0X6l8kjpSfzpn/xlaz9E6kAIBizxJFD2MJi3aAreTj13ut0BBhidcYRZ/+uK/xHE+7xF
	E5i7LUDemWnmu9tD/8cPYiaxcO4gBbK0=
X-Gm-Gg: AeBDiesf3ObFW0YB/bpuj0weRyQ3C94YPTssx6N3ZzxCtmwlOKSQC3ymcZs110Cf5oI
	Pn7k2o1rMYHelGuRI/DmwgKj503mbpPvzPM6cqyJm+8ey5aacMg8fIr0BOEdKlnf8BzFjIT900E
	ZaDURVOEHHmG9MWJl4qkj4gXcuZ3yzcarNYelsk+F5bRD3Az3SrwjLG8OeOKy6m0jEG7iUCAccB
	sKCTUnJ9Mdq58RdG4kvnu/HG0DSu4H8Zc5kyo2odRKSrdmUMTa/9b+ls0TkTYCzsUcEI5XchI4u
	o31pfuWlYiYTegC+wy9DaWZGk3KeGB0Z3zVIA2YbNIwbrghCLw==
X-Received: by 2002:a17:907:7f94:b0:baa:3cf6:4f53 with SMTP id
 a640c23a62f3a-baa3d0598e6mr755922966b.5.1777004774432; Thu, 23 Apr 2026
 21:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <aegUoOiUbjUAH5aT@google.com>
 <CAMgjq7C53WRS5oYxO157mX7JxhfoPoi34k+taiKLrMah-b-iRg@mail.gmail.com>
 <aektdlD4npMVThu3@google.com> <CAMgjq7DRrz4Hdy-s4y-C=3BmPt50LKOfdWjjf2mWmCybdRaJ4w@mail.gmail.com>
 <CAO9r8zPvApgxKiVy5NhiWup_m57huF3MTuPvo=iq5kAxjRZC8Q@mail.gmail.com> <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com>
In-Reply-To: <CAMgjq7AGzBubCkmv7LubBjPLN1DzL472d4zUm+sGxo8ZptMgRw@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 24 Apr 2026 12:25:37 +0800
X-Gm-Features: AQROBzDSTb6IkbZFirEBaP59AWqfa9zcQlpgQGNGPOmXf4DwwEQvNG1RpzWB-PY
Message-ID: <CAMgjq7D-xpzWz=v5jj76vuRRBJwaEkt-gJKaviJALLY7UX76cw@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Yosry Ahmed <yosry@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	akpm@linux-foundation.org, Alistair Popple <apopple@nvidia.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Barry Song <baohua@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>, 
	Byungchul Park <byungchul@sk.com>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Chris Li <chrisl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Dev Jain <dev.jain@arm.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, Jann Horn <jannh@google.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Lance Yang <lance.yang@linux.dev>, lenb@kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Brost <matthew.brost@intel.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Mariano Pache <npache@redhat.com>, Pavel Machek <pavel@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pedro Falcato <pfalcato@suse.de>, 
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Rakie Kim <rakie.kim@sk.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Suren Baghdasaryan <surenb@google.com>, tglx@kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Xu <weixugc@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yuanchu Xie <yuanchu@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Zi Yan <ziy@nvidia.com>, 
	Meta kernel team <kernel-team@meta.com>, Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:15=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> Yosry Ahmed <yosry@kernel.org> =E4=BA=8E 2026=E5=B9=B44=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 04:48=E5=86=99=E9=81=93=EF=BC=9A
> > > Using a swapfile does have its benefits, though. For example, the
> > > virtual layer could act as an ordinary tier following YoungJun's
> > > design:
> > > https://lore.kernel.org/linux-mm/20260421055323.940344-1-youngjun.par=
k@lge.com/
> >
> > Hmm I didn't look too closely at this but I don't understand how
> > making it a swapfile helps with tiering? If anything, I think it makes
> > tiering more difficult. For tiering to work, we need an
> > abstraction/redirection layer, such that we don't need to update the
> > page tables (or shmem pagecache) if we demote/promote pages. That is
> > exactly the use case for a virtual swap layer. The page tables point
> > at a virtual swap ID and the backend could change transparently (e.g.
> > for zswap writeback, or tiering).
> >
> > If we make the virtual layer a swapfile, how do we demote/promote
> > without updating page tables?
> >
> > IOW, I think the whole reason we want a virtual layer is to separate
> > the backends, which would facilitate tiering. If the virtual layer is
> > itself a swapfile, wouldn't it become one of the tiers?
>
> That's exactly what I hoped, virtual layer being part of the tier.
> Tier could be set up per task / cgroup. So is the virtual tier.
>
> A standalone implementation of the virtual layer is more heavy than
> being a swapfile. Actually I think at this point, it is the word
> "swapfile" is misleading now. We may rename it to "swap mapping" or
> something. A swap mapping could be physical or virtual. Virtual
> mapping can realloc from physical ones (redirect), and swapoff of
> physical ones just read its data into virtual mapping's swap cache.
>
> I think it's actually functionally very similar to Nhat's design
> already from a high level, the only difference is we don't need
> standalone infra for virtual parts.
>
> For swapoff or migration you don't need to touch the page table, same
> as in this series, just update the virtual swap mapping to be cached
> or update the entry, it's identical to what this series is doing.

BTW it does look like file mapping. In the long term maybe we can
merge part of the swap mapping with file mapping again, not sure
though. Swap mapping is a bit different as it's integrated with
allocator, and previously it was reusing file mapping, but we had to
use a lot of strange techniques e.g. split the mapping to avoid lock
contention / special lookup routine / synchronization / handling
writeback in an entirely different way. Just an idea and reference
here.
