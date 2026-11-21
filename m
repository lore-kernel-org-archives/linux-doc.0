Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292018;
	b=4pVBewnw1T2vCoHlctwAz5pjQ8h/1Hr0ZMpqbUPx40XUvmtHZocHNIFXZZ6vw23qvAfK
	 TJgjTSHO+t0c30eA4UTTlPT/abTkQ7fRsua2Uv8VjrTWVIs9sUvL3ox9kH/JaDtYVxPRK
	 iGTFdGEvtmUE1G7JDzoXaTcVR+jvtyNc91lI3/+XiX3n3xxQjEtFOJvdD8BaMRttrXsau
	 HrSvpG7nm0ltxr1kGRyvV3lltLQKC3/CMvi9lK/Z/Nm7Lb7r0dr6x13J11aoBgUDNc1m0
	 UGE5aquIqezu5GnDvlBfnF2iFxnl8iS4+NXaFKRxT2q8266eY7qj5k7QSooG5C8RmTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
	b=KMcnD+dn0llnmf3x2I4JUtYlpwtuAmgFVQdkbBJQGBTRHxJHeVQFlbONzno4MdH20ohA
	 y4PyYfNqcNWx58k4t8MpX6WelUlfswj1MLHqahNXShK9WPkozSiXYgaHEKJvWpFL1V3ZN
	 iVwQIKWz3xzhHrOKMA69w6wypyoTOdTGhzZG7PTs8F0vvPRRIqX9UiERZLdFMjeTBCjnX
	 LxaeN8y/efQkpFlbsbXzz4e2LMQFyawkC6i9bYoU0NnCjb7CHc1M/Rhx+l+FaMEM4qqSK
	 IQ+nP0/7HZABy0h/+mVah1Oc5K2sy+0D7i+T5HA52r+RNtl2Zqxnt7q+eUH3sJyHlnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyKoletg;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E8606A320
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 20:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59E8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyKoletg
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab938dc83so885896a12.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795292017; x=1795896817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
        b=SyKoletgjjjVyRpNHJLuOuD8rrmsr9nr1u7FImFvA5DOj1lcPvFvf69t0GFBFO3hRM
         46mdUjMj12QED3jxWtJpi6B3ZkzvpJMphpSUIyKzHpa3JeL+zLXbyvXFH7Hs9hNjYVlk
         1OUEm0zVKxhQqNfzQkl8AI86DwEUNyKQiTluOoV7Op/03AJwPI/5lNarL38hIgI3Qj4a
         OIbYGkYqRZy6Be07EdbGcqJVHJGCz5LOPzcO7t7VQ64slFU71TGbC2Ha/j+TVYguQts7
         hgCX8vwQkL9KdSsbozdSKtVGQtH2JOC+m3uK1bTL5U4sRcP3wqNufrGAJZeqaHCm3jYI
         8L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795292017; x=1795896817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LtZDpCvLJ0VvtED3yvRJczLNhRGhJEw9NB2kLqULBmg=;
        b=uz8yuftHNsnp+P6hVqIJ2E8EXEQvfyKT8Dwd6d+YQfBVuOdRSZ0G4X052gCK6/hOy6
         adZ3yM0GGe8Tc3/jkpyupEgocvefCzukH974TLjg7t6o2JEuGEvM3IP5HCTKpZ/8uxvJ
         w9TJtDCUfrduY3pCD08R47+nfOYzxEgMI4Vn+Ki1i7d45vv0zRxv8aj7Gi+Ej+2b41hx
         yWH6/qOm9Johj6x15u/tppeNCV4vzlj10hPB/YicfAuSyGZnUgjz2pVm5fAkI52P9RLp
         WMKV10Pnh20rfP1GLTlc4YROTpz8qG9nz1B1vtEoYVjMqtT81IYWUWlLgVEnS385Okhk
         Qfiw==
X-Forwarded-Encrypted: i=1; AL+hErHUY3XlCivfIv0hENLnlVyyuMf2XN1xnBAavyiM+5z9zuHLRDKNR7pZS21veVZVlQmEiiw6Ev1iiuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jElNvsAPkMLLCwwLd/4crpcuznU1Vz4pmTCQi62wLT/TuV09+
	eoR5nhuXA2jX3aqAoYzGDgtwqLKMPB+d9nk0p6ERCFg7Uj/sR5BzhE9z
X-Gm-Gg: AZFdTZfgsxV5x2HVgcjPRBTux01pSBIK1mXy1DaThb5z29lxaUPCxA0cprqBnzTN1Fu
	3JawaG5K/2BugIET8YRCD5NFER1ZZBATUq13YzGfSJPa3e13W3B20eDjkoec7EIvxf85JBmD4W1
	VeN9wq22g/LURsXVOARaRmnvh0Jawf1HY4Nnqxfh03QmBPWKEmUIezFXv5MR/GY2gO8z3un2DUu
	7YNJELpVc8jT+iZ8dxu/33/0cctRGCBb8hmUgW6o2b7pnMntoce3CWA4sm00otljAcT5s6/f/NM
	y80GqW+YoCZf3NEc9ul9MhZF8Ab+tHpbojPZaZxc1QgRlKx2lw9ysioxE+PwYeumYE7hce/qWZn
	tcNXW9W0qE3SbzQpYwee3wTqdw/GkrpSRKgfYgxkFRaRHmJMO/PZtlRvB0LyTOSyr9f9H1u1b0D
	koeo+tfm85Iol3PQE8DsX9P/ao2wAzmuWvxjSaX81YBVTzSYsIQ+CRRUorCm9hvL0ubYNDxRb9c
	dWQhGBZNcBJ8wLhgxArPrHfCTEy/epHe3vV3vWByFxQ7vuyS19FWSv0yxgWq9JlSCmAPNGC7MD+
	8WTsMznK2+bz2K5EHVmUoyBdjimW3PyB9Ji9Fq1Rn2kJQHvbMjctb/ZExnlD/PVg4qfvLg==
X-Received: by 2002:a17:90b:5346:b0:3b0:9976:c1c6 with SMTP id 98e67ed59e1d1-3b41c9bbe00mr6148779a91.66.1795292017156;
        Sat, 21 Nov 2026 12:13:37 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm2771809a91.1.2026.11.21.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:13:35 -0800 (PST)
Date: Sun, 22 Nov 2026 04:13:19 +0800
From: Kairui Song <ryncsn@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: kasong@tencent.com, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
	Hugh Dickins <hughd@google.com>, SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
	Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
	Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
	Tal Zussman <tz2294@columbia.edu>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 17/17] mm/mglru: make folio_test_workingset() work
 based on folio LRU refs
Message-ID: <awFbU_VGf0hotbyR@KASONG-MC4>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
 <20261119-mglru-fg-v5-17-9eee2fe97a2d@tencent.com>
 <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN_Opa9APLNic4cnohrtZ4-HcdoNvSFvnAKiC6nn+C=thbTAAA@mail.gmail.com>

On Fri, Nov 20, 2026 at 05:53:36PM +0800, KunWu Chan wrote:
> On Thu, Nov 19, 2026 at 5:04 AM Kairui Song via B4 Relay
> <devnull+kasong.tencent.com@kernel.org> wrote:
> >
> > From: Kairui Song <kasong@tencent.com>
> >
> > folio_test_workingset() currently tests the PG_workingset bit, which
> > is only the second lowest access bit of the folio LRU refs count now.
> > Folios with refs 4 or 5 carry it in the LRU_REFS_MASK field
> > and no longer have PG_workingset set, so the bit test misses them.
> >
> > folio_set_workingset() currently sets the PG_workingset bit with a
> > plain set_bit(), which also over-promotes folios at a higher refs
> > count: e.g. a folio at refs 4 is bumped to refs 6, advancing it
> > toward LRU_REFS_MAX and an earlier generation promotion.
> >
> > Move the test into mm_inline.h as an inline helper based on
> > folio_lru_refs(), checking refs >= LRU_REFS_WORKINGSET.  The set
> > stays a plain PG_workingset bit operation reserved for the
> > classical LRU: under MGLRU the refs count is maintained by
> > folio_inc_lru_refs(), and now triggers a debug WARN when called
> > while MGLRU is fully on (the switching window is exempt, as the
> > classical paths legitimately run alongside MGLRU then).  The one
> > PageWorkingset() user in erofs is converted to the folio helper.
> >
> > Under the classical LRU the refs count is not maintained, so the
> > test is equivalent to the PG_workingset bit test, which is the old
> > behavior.
> >
> > Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---

...

> > +/*
> > + * For the classical LRU only: with MGLRU the PG_workingset bit is
> > + * part of the folio refs count maintained by folio_inc_lru_refs(),
> > + * and a raw set would corrupt it.  The switching window is exempt
> > + * because the classical paths legitimately run alongside MGLRU then.
> > + */
> > +static __always_inline void folio_set_workingset(struct folio *folio)
> > +{
> > +       VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
> 
> Could shrink_active_list() still hit this WARN after the switch
> to MGLRU completes? It can reschedule after isolating folios and
> reach this setter after lru_switch is cleared.

Hi Kunwu, thanks for the very careful review!

Right I thought a lot about it after your reply, first your concern
is right, thanks! I should just remove and replace this WARN with
something else.

And in theory, we should only call this for isolated folio (for CLRU
it means a folio moving out of active workingset, isolation is always
the first step), so this helper is fine - except, for the MADV cold
case, it will call it on for a on-list folio, and will could skew
the counter and if it raced with switching. Switching is so painful
I hope we can get rid of it soon :/

But, good thing is it's easy to fix, we just need (part of this belong
to another patch, a trimmed diff just for reference):

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 4f65867446dc..c936d1fadfbd 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -261,8 +262,9 @@ static inline void __folio_set_lru_refs(struct folio *folio, unsigned int refs)
 
 	do {
 		new_flags = old_flags;
-		VM_WARN_ON_ONCE(lru_get_gen_flags(old_flags) != -1);
 		lru_set_refs_flags(&new_flags, refs);
+		if (lru_get_gen_flags(old_flags) != -1)
+			break;
 		if (new_flags == old_flags)
 			break;
 	} while (!try_cmpxchg(folio_flags(folio, 0), &old_flags, new_flags));
@@ -569,16 +571,16 @@ static inline void folio_clear_lru_refs(struct folio *folio)
  */
 static __always_inline void folio_set_workingset(struct folio *folio)
 {
-	VM_WARN_ON_ONCE(lru_gen_enabled() && !lru_gen_switching());
-	set_bit(PG_workingset, folio_flags(folio, FOLIO_HEAD_PAGE));
+	unsigned long flags;
+
+	flags = set_mask_bits(folio_flags(folio, 0), BIT(PG_workingset),
+			      BIT(PG_workingset));
+	VM_WARN_ON_ONCE(lru_get_gen_flags(flags) != -1);
 }
 
 static __always_inline
diff --git a/mm/madvise.c b/mm/madvise.c
index bbbb729ed647..a73d89a2ecca 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -374,11 +374,12 @@ static void madvise_cold_prep_folio(struct folio *folio)
 	 * as a workingset refault, and the referenced bit always needs to
 	 * be cleared even for inactive folios. For MGLRU, MADV_COLD clears
 	 * refs in folio_deactivate(); MADV_PAGEOUT handles refs after isolation.
 	 */
 	if (!lru_gen_enabled()) {
 		folio_clear_lru_refs(folio);
 		if (folio_test_active(folio))
-			folio_set_workingset(folio);
+			__folio_set_lru_refs(folio, LRU_REFS_WORKINGSET);
 	}
 }
