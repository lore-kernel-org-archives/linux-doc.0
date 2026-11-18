Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014796;
	b=WIhUbhV/mX4cbkjYcQUAnug71uMWJrnK6Qlgcgxt9EtT9oEitPTCteoWuoNqk/1fLmf7
	 enTiK7SKz5y/XDZqP/tySjIOWCdnhJL3Wj/1ZhEWg2CeHdo9hJpXKa/kQ/Xsz8RoKpjqe
	 RdWZE27SDAa2lo3O60K0zI2eqjBZHHSUyzSX2c72lfChikqcDiKGYYwKOCysaATxjCnCU
	 4PkBdaM05T49eYLpmLvgdc47p6qs2fmaSefvjr+LF0G6uoXmQ7jcS7Vudl+A49Q4QMoRZ
	 u58TbCXieNk4zKEkfa2UTR5PhN9UP8n3X0g2QBWQvOCP1xDZTo475i0+OJr9B5///PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
	b=g1ZWym+JxNp2xC0ET4p4tP9bwXI2I0TmUt8jdNs/jWOH2upvQ6QvJfGTUoYs67FAZD3R
	 58PiZIzHiB+n4DbGUE+SQp/zvkVVU2FTv3iLFlnVFmHt3e0hQQ4+msss2EovSgySPx357
	 otdufSdm/yNUgQT/513qyIbbXbPImaMLbzNagp1WIxtXEa3h6uU0Wem98q25mmpzSfaNI
	 V6+nm0sqH0LtGf4juT5CuV1fBXUzPeJXO8J8OrwMf7GwtfYRZkkDhcY5a7QAwCCM4OcDp
	 VPENgg8QBgZ1paGvmYxvQJ/7/geXol6+WK6Ex1SY1L45RyexOFBz+EKOAa17ApPRQvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EaNntw86;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC0606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12AC0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=EaNntw86
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91eb46044c4so13003046d6.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795014795; x=1795619595; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
        b=EaNntw86OliWenC+AEw8YZaqX/CpkEbuj/R83uxmt0euRu7q4F2m0octKXwFVihjk8
         dg9+4SMbEuteeVIYXzzmNfX/GhJAD2I5TAVlrjYtVKgH9HZf3H9sOEWDi6erVJGPVQR2
         MOUDAtFaOSguVvmB6Aeyd+dyvpdoItqLgrfZkjmHPTZWLIi47UtkzxoGuplmxuiUXO0v
         tyGF3tjz3s4yV7eQvQapqnqBjZtdFZe/FW+VRXsn3qhQN1hGCbekIeZCld143MCK2+pP
         fZ/U2FUvwPZemSkqE/IxMsmjkki3bWHrx43vsMaI4rDk0WQbZdG7s4De/itz35E+w/xw
         0AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014795; x=1795619595;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
        b=f97BN2F4YDlX43dIGeT5or2EGMCiwsumfqAyaGUT4cZFUTgLNLVGm0bPnDQZ3iUOU9
         pVCBYnfiAB62SBezoy/cqULsac1nRBfRFwrhBmfI+QvjjskuHppM+30Vk2wTwbBtwwZQ
         4OCG32ODATS/kq2sIWQJHdZ+RS9MUAKogE5fJxCXKmMqJfKJOINMHz/c3NtLVWmebP3+
         TtMdkLjJaRZPTcmdmlxn3LBatqHuLYVCyheNrFb5oomMLliXNfkiROwLNjAsNEYSPTrN
         T2tGYQ39YmcYbIUnUwGSIUHYHKjSpiPl+4sgHLqKcdAP2B5OFg7lDeRn/WUium0DDE5J
         RqmQ==
X-Forwarded-Encrypted: i=1; AL+hErFMTM/5bp9otP3z4BPRcseNwq7VzvnG3biOkxuuCgkn2nUX40IVEiO+A6bBaPxGJlbo0Bka+MX88go=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZThIEH5TVidloRApRfpSLkpqqFHyttGnybN146ngS/PfSJtDg
	ZfLjNo9/zF5pBJpggJUuLKbT7ILGcMMAJKfIvoHMqisH+zAUroE3GREKsopwq9t4+Rg=
X-Gm-Gg: AYBFou3Z5uxFJZP34qyuhl6fUrS4e4+YkxLEmlnLMeJ2tqnCPeWBQsVb7q9DEyjGPm4
	WIEH9nGlj5TjFtoNCLV8HMdHa91+5eDFk+PaVWnaeG0dKDveVUDVmxbXNMkM4mo3oMWxVEkzhm3
	rnrZ2BbWQMyjU5LDs1Xth9IIiqBMK86yrM+p3jdW/x1ndaOJhKQcSzZy98k/iOCNiuJ/p5XS9vy
	Bg24wRYRjP5kVMN2fpxWXH79R966VSd+Ha6M2VhR6tCIXV2LfKw9clzqSNoCj1BcpVKVUU+QTPW
	lMLWTmU68v0+rvRMy8IyUSKyzLkachuNOoTuIQHWJhz37QcxLKeVPVHcJQ9SnSnRuZQxKlbdwdX
	gc9cExe+69CqKyqi8Yedh6pib/tsLS5A23XWC5APwT6MXkBRnIEvR9ap8xO32rBL/cS8gGTPDN3
	CQEi9WtrMnOk9TQcmAj0eKYGBESlo4k3LrsXx6trnQKvdttC4TvuSLCwlGsDO2h9rkbKqBVi2Ap
	fYF2VMUg3mKl2QThunUQaGaxOC7unkUOayG820RaIqY2zt+xqm354/atXwcJfjU9+dJ4wjEq6KD
	/8Ajveft/4P93R8XRBnD6JpxiM3HwQCR5mCt0RHPk6eJH1lQFXbcywr2gjDeKXk34BUrDlcnZgZ
	+FuXRsU0=
X-Received: by 2002:a05:620a:444b:b0:949:6d95:f63a with SMTP id af79cd13be357-94999810096mr508584985a.78.1795014794676;
        Wed, 18 Nov 2026 07:13:14 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70a8fsm23976506d6.30.2026.11.18.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:13:14 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 00/22] mm: introduce N_MEMORY_COMMON
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1DvCQd_OvkGgLU@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <av1DvCQd_OvkGgLU@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:13:12 -0500
Message-Id: <179501479267.1206716.268867271510310543.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:01 +0800, Richard Cheng wrote:
> Hi Gregory,
> 
> I've browsed through the serie, I'll go into detail in each patch
> in the following days, for now I have one general question.
>

Thank you for the read and the feedback!

> I wonder how the "common memory only" rule is enforced ?
> 
> As far as I read it, there're 2 ways:
> 1. The zonelist, you build them from N_MEMORY_COMMON, so non-common
>    node isn't in any zonelist.
> 2. A check at the call site, e.g. node_state(nid, N_MEMORY_COMMON) or
>    folio_is_common_memory()
> 

Those are essentially the two cases, which are already present in the
code in one shape or another in the existing shape:

   node_state(nid, N_MEMORY);
        or
   folio_is_zone_device(folio)

With the exception of one or two places, the series largely modifies
these locations to use N_MEMORY_COMMON instead (or in addition, in the
case of zone device).  There are a few places we add common checks where
zone device checks were not already present (because they were missing
or did not apply, usually PMD scenarios).

> 
> Code reaches a node's memory in 3 ways: zonelist, node id, or by folio.
> I couldn't find a statement of which mechanism is responsible for which
> kind of path.
>

Being a bit more precise: How do we reach a node's folios/pages?

 1) through some kernel structure, obvious examples:
    - page tables
    - VMAs / pagemaps / xarrays
    - LRUs

 2) pfn walks
    - memory hot-unplug
    - contiguous allocation
    - DAMON

 3) page allocator
    - freelists (page allocator)
    Sort of its own category since you ask it for folios from a node

> I see some consistent issues,
> 1. zonelist paths are covered by way number 1. Some of them also carry
>    way number 2, some don't
> 2. node id and folio paths can only be covered by way number 2. Some entry
>    points have the check, and some do not.
> 
> I can't tell when a call site has no check is deliberate or missed.
> This matters once non-common node gets its own zonelist, as patch 4 metioned I think?
>
> Could you clarify the rule ? e.g. which zonelist users must filter on N_MEMORY_COMMON
> themselves? and why the zonelist alone is not enough for them ?

Some of this is obfuscated by the fact that the existing code already
does this filtering for you.

I suppose I have some premature changes to add additional filtering
where it isn't needed yet to reduce the complexity of later patches,
but I can see why this is confusing when introduced by itself.

Consider this:

-       for_each_zone_zonelist_nodemask(zone, z, zonelist,
-                                       gfp_zone(gfp_mask), nodemask) {
+       for_each_zone_node_state(zone, z, zonelist, gfp_zone(gfp_mask),
+                                nodemask, N_MEMORY_COMMON) {

This is a bit of a preparatory change to later convert this to:

+       for_each_zone_node_state(zone, z, zonelist, gfp_zone(gfp_mask),
+                                nodemask, N_MEMORY_RECLAIM) {

It looks like we're filtering by N_MEMORY_COMMON, but we're actually
iterating the fallback zonelist (constructed from N_MEMORY_COMMON)

  struct zonelist *zonelist = node_zonelist(numa_node_id(), sc.gfp_mask);

Later we update this node_zonelist() call to determine whether the
private nodelist should be walked, at which point you do have to filter
for service support.

> Whether every path that takes a node id or a folio must check N_MEMORY_COMMON, and
> which ones are left for the feature bits in phase 3 ?
> 
> Let's get the rule settled down and make it as the foundation as well as phase 2 and
> phase 3 ?

So:
  1) If you're walking the normal zonelists, you're already filtered

  2) If you're walking nodelists, you need to filter on N_MEMORY_COMMON

  3) If you're operating on folios, you need to check common_memory()

  4) If you're walking the private zonelist, filter on N_MEMORY_COMMON


So let me do this:
  1) i'll restructure this phase to omit premature changes like above
     (they'll move into N_MEMORY_PRIVATE and N_MEMORY_<FEATURE> commits).

  2) I'll restructure N_MEMORY_COMMON commits here to handle cases 1-3
     above in that order, and that'll hopefully clear up the confusion.

-- 
~Gregory

