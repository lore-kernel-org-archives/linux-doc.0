Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DBE4DA546
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 19:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070288; cv=none; b=Bzg+wAOFkcmRbZSOKaSq9rXiaHQw7IyEuhNCmKoTClE+nr7pBjLFwc749PymvHl+iguMrDO4PTv6YocENiy7Tsa9gVij8Bmmx9Ii65+orKTtyAXMEiVKg+Aq5c2OCvFeAiRojF2Fl/x7O2Phg0obz7daH4ORgRdzuz/jKvDlwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070288; c=relaxed/simple;
	bh=MBFIA7ojoIb7ebHSTDzXkwW6fzfGgijhQ/LYfxVvct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxuBaNHIchNbMSDcSYMxvzR02E7bAxIRR+BTePgD06YrrcFN8jeWBkYCN3THVvLi2BTrE9ffNnycLSU7lXascrNlTkxaQZk+8O1fCBx4pG40gdh1wK5LC1RXG+eQS8/MPbCxHLXKWxxs41H2t4EAjm/M6RkO0QBiaKbbX7HhAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlVP4RBD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlVP4RBD"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4cc6797b7so107832a34.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 12:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070283; x=1789675083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwZeLG/lY3dlk1m8H+DGflPWf4vG9wjk2ruxseRkZqU=;
        b=FlVP4RBDkE93HjNOWTvp6BSKFl4tIQiORPG6/h58Ow6YPswC19FVxYvLeRhIc85aWm
         N+xc+rop8/yFOVYF5Om+8DBTWpmTZ0SK+qJFSH1MQUyGtbXqlD0LubvVaWDftieKNOsK
         Q2WuI+n6gdNgEpq+F1OoDpL7JAeP1G80TCNEkew128vuIAJwyI5syypCt7f/pBmWJ2ai
         uAK0lIzVayvxJWrbpqsuvk88ZlQaCgjvb+rmhZq6+/Vn7Uy/Azx3HTUMCK/0oUf5F+Fa
         N4y2jxKtBzIWDhG2pp9OeR1GAkbx6Umao46TLJD0ugYvQEmLooP6I/zvr2dyNuEZREX+
         1WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070283; x=1789675083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwZeLG/lY3dlk1m8H+DGflPWf4vG9wjk2ruxseRkZqU=;
        b=SmpVDOMvgd+M9Jn1KP6vT2CzfEeMg3RBMAytEH2ZHlWvjiLAm6ENQBXWp7I7m+QdeT
         4/nZyDtY0QGl3bxLj42ztUHL7J/MOOQ4kTZB2vTFbOT4LmR8U8IQcuqvSc+wVhJW39UQ
         00H5u6541FCzPbYM0MhbwK6+iSE+dSRiRtMQ8N001S/G1M1AxR71XQoOArIJlLHJw6ma
         TnIsL4Zry+noETzAxsaWPV3X7co7sG5PHoRt4/WmBcaLBkCTMIeZ8t9sNp7dtqQNefIT
         VkDuUJ84kaly0zptoTQmepHz+a7HiE0GpDebZ+DlyBbbaJ/iHKkFOF/kWzSTujxD2Qct
         1+gg==
X-Forwarded-Encrypted: i=1; AKwUvBwt7SswfCgMz7P6+BBh+sRJNPFWQ19VXbrgsYNsa74RRPnZRea9u4l+efp34lgrzySHgPe91W50/VQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lsAMjaSTE9a1WPMwcHrL+EtjkJ8F3v1aKELByJtR8anr3OuiaZ
	8Fk5elB5jMe/3Pt91eW+h/zSAo5fKy2Ojw6Y0f1/C1Bvj4DbhZO4CX7H
X-Gm-Gg: AYBFou3Ebfz+uMJ6HfrURHE88X2TPKhDEV2aEuGBpzGp/PvOAvbjMus6Z+ZnoP46xPA
	Pstu5DLDb8KMRhEatTINP+7clWu9qr8KuUjC4oEns+hV4WrkaVSS7uCpoHv5GGonIVqYAEOXMR3
	cNX1K+xjkID6kEjJ4JTEGH/LY4o35skUPqwoRWVcIy6aeBkwEpzNqIFMNxG15QIfs0DX9CJ01AK
	i5lHSTb1ZEdKR9KxfH3WL0p9/yJw7n/xH/6rQcwgIvzGkeaVpkQIsSiBByH6ViGuEUIzUzmWo+8
	cjgJ1f2xTqwxxRiGbc+APowjKVF3eJkhAd3JbDGyMl99SBZSoO8bODmA8aN419e2bYT+I9atxiF
	/GZG14Bbz2qLzVj3XqXlvuFBIoNdRrcY9a19dTSGdsxgfjl+nUPY1XqLierbGlejb2CKfpTvJVz
	Pti7MrfJyAv5ne+5YSFxk2MWGWvbDRfrpP3gy7WHK/IXngkrqSuwHk9D+vtihhT5b4EFVbN9B8l
	Mhlg2RSAdFwFw4rGiCeroNfBX4wbA==
X-Received: by 2002:a05:6830:3886:b0:7fa:5c68:d04c with SMTP id 46e09a7af769-80401bc5c1fmr251411a34.22.1789070283153;
        Thu, 10 Sep 2026 12:58:03 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:4d::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670db38sm485051a34.18.2026.09.10.12.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:58:02 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ackerleytng@google.com,
	Alex Shi <alexs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hongxiang Lou <louhongxiang@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Wupeng Ma <mawupeng1@huawei.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	fvdl@google.com,
	jthoughton@google.com,
	rientjes@google.com,
	vannapurve@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: Re: [PATCH v2 3/4] mm: hugetlb: Fix subpool usage leak on allocation failure
Date: Thu, 10 Sep 2026 12:57:59 -0700
Message-ID: <20260910195800.3459455-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909155459.dbf9d67ae21a72935bb863d9@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*/
On Wed, 9 Sep 2026 15:54:59 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 09 Sep 2026 14:49:28 -0700 Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org> wrote:
> 
> > From: Ackerley Tng <ackerleytng@google.com>
> > 
> > When folio allocation fails early (e.g. buddy allocation failure or
> > cgroup charging failure) and a reservation was not used (meaning an
> > unreserved global page was needed), the subpool page acquired during the
> > allocation attempt must still be returned.
> > 
> > Currently, the subpool cleanup error path only returns the page to the
> > subpool if a reservation was used. If no reservation was used, it skips
> > releasing the page back to the subpool, permanently leaking the subpool's
> > used pages counter.
> > 
> > With subpools now always tracking used pages, always release the page
> > back to the subpool whenever a subpool page was acquired.
> > 
> > Opportunistically rename the local variables tracking global reservations
> > needed and global reservations returned. This clarifies the accounting:
> > a value of zero for needed global reservations indicates an existing
> > reservation satisfies the allocation, while a non-zero value indicates
> > new global pages are required.
> > 
> > Adjust global reservations using the difference between reservations
> > needed and reservations returned to properly handle races where concurrent
> > threads interact with the same subpool.
> 
> This one conflicts with "mm/hugetlb: fix max-only subpool accounting on
> alloc_hugetlb_folio failure". 
> https://lore.kernel.org/20260428113037.88766-2-enderaoelyther@gmail.com.
> 
> 
> > @@ -3074,13 +3074,10 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
> >  	return folio;
> >  
> >  out_subpool_put:
> > -	/*
> > -	 * put page to subpool iff the quota of subpool's rsv_hpages is used
> > -	 * during hugepage_subpool_get_pages.
> > -	 */
> > -	if (map_chg && !gbl_chg) {
> > -		gbl_reserve = hugepage_subpool_put_pages(spool, 1);
> > -		hugetlb_acct_memory(h, -gbl_reserve);
> > +	if (map_chg) {
> > +		long gbl_resv_put = hugepage_subpool_put_pages(spool, 1);
> > +
> > +		hugetlb_acct_memory(h, gbl_resv_get - gbl_resv_put);
> >  	}
> >  
> >  out_end_reservation:
> 
> Here.
> 
> I presently have Zhao Li's patch staged in mm.git's
> mm-hotfixes-unstable branch, awaiting review.
> 
> What to do?

Hi Andrew, I hope you are having a good day!

Yeah, I also noticed this too [1]. There are actually 4 proposed
solutions for this in the mailing list which is a good indication that
something is wrong here : -) But unfortunately it seems like there was 
no resolution the last time I pointed this out : -(

I CC-ed all the authors previously on that chain but wasn't able to
get a response, maybe we'll give it another shot here?

Ackerley, Zhao, David, Song, hopefully we can align here.

Personally I'm partial to Ackerley's approach here since I think the
get/put semantics that he proposes is the easiest to understand for me.

It would be great if we could sort this out since I think it's been
a while since we've had all of these proposals in flight.

Thank you everyone!
Joshua

[1] https://lore.kernel.org/all/20260713144557.3845941-1-joshua.hahnjy@gmail.com/
