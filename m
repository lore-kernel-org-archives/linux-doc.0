Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCC2E266C
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722625; cv=none; b=euTFxOM714mRXko3fVoTWwa7aKbz6igm3pLK6Q8pLf9c+2JQOpT4X4BI1MPlwaqDGNd4rqwBgK2OGRM/ypICv0bEniceafV/id7GY5aUzAguCEpWoUeW1/rlytLTglxSbUFvA55PeTApgl0dQ5kMUz2tSdIj4ngmAudXX2IU3tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722625; c=relaxed/simple;
	bh=EUT6xo+7c4fR9AjpRdk73GGw88Txx/5nWXpuxkERzDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7lQHwHqHwkK869OkhcP9HZFUALduUJBXSRfgrExju3vUjsBG59jyRFMv+4FKgoUZ/Q2fuXZk8XhPeGBZJimow1Fi4PQ0qNF0C5ftYqulJm6hvLNVE7A19awjnlmZCSKi+C+S/4Bu+FhCUk0sdtrHXX9eZfh2ZyNQd72ilWpOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=J4e8ehjd; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="J4e8ehjd"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92f03daaa97so985154485a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784722622; x=1785327422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mNAYCNl+PvzQVOY++arp3TkG6k570KzmUdhkjTUZ24=;
        b=J4e8ehjdkG8PhCbD4a9R5pp1+Yj6H7EkvNahqfwFzKS41ukJAzqr7cuep2PE/pBg9p
         l7+KsUyXNAbTuqZjbm6yToeKKtTWYFESilmqxJ3Qjigw1wlmK2G1kYo+iwgyMcSvr1/o
         YoI65CN0MFyy4DiF9b3jxFmRy9N6maeTA8HAIzh1jPILs0FPUlV5h4Ffaf/hxA3VmdnI
         oX1vZaMZ4sIo2eYIW1aSLaDFZ/LzKO3se+eV5cYlkYsMPIeqa4Zz0x6q86VRVXPjPua+
         q41JmadsIb7Oml+N56HtrVTAGdVOkxa4DXokMkBhx3N1yz/hobYgQJFJyBPkn3W3iLtZ
         4dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722622; x=1785327422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mNAYCNl+PvzQVOY++arp3TkG6k570KzmUdhkjTUZ24=;
        b=Ah52zgnYWOkp/u4wAMHJu0KsKmAXO6UHocvNf/eFZ0aCG9wdXCG/5gy5WhmqR+ht5I
         EBTZzeJjbZhosgWYDTvHdxGfDiBmr9iBqIL0XC8mrgLSYbtdbwiNL1PeY81uryKyOuY/
         lvpglsZzsTMYhqZFD6NUz642lsep/Vx+/2PkrTGHBINOzU1GZ4nOOjX6xYIAPCMlnysC
         Iel8Q2iekrt79nRK8mnuoLvJVMBmVfRXVqG/50zS0pxay2uHCe+Wk9cfn9gmusXNWhHl
         uKmM8jthOw6IfJ9MYIf/+1za5XPYf9AkjQleX9qdtjeG3mKA08FJl/OzvDd10P8yaG2y
         wvoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJWXonDM0FPUfehFDIhc+xtNRZmY/sHprk2ULysOv7h7F5UhfMfKUjMlwArBeG1NyhNVdbi7oYHLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mAG8gZ1XJzzCx/YfFFPHjwC/Q5WYQp7ZkruVk3m+E2txC3ZL
	2FMCr87QfNq07o5rwExSQ4uy5WMltXFkV/T2ns36GQCN9WcqiFyVZA0Iun/GDofR4fk=
X-Gm-Gg: AR+sD13rimtgsXuV1zIyloVsgwSQMZA/iAG6w/fjG19ruICBUep5Slrusl6Ico86rJX
	ff9qRL/pWqKNNpFufT1tr3OzdINbZFRXqisozeuE5Fw3NWxn8gcaQd0t2KVubQTQmWslIFxTrtd
	AhadjLe/UKl50D4hN0RfG1+OxcdusvhbYqA5+T73ucgSD8xl1quAt7uI+jjWlJ7N4B+Wv8kNEnJ
	PFkKu5rGn/pyucmrSJ2aHPr//hoitwbGwZVNscM48Kgo7GVUq/nBg6By4YFR6XVX3aKxRnq5auh
	sAv02gr5o/WRXWe42EMPC4w0eB/GQwAD84G1FlTeNVmBhkkEiiBkmhNJ6qHGB/U1uDdMjCTPNQ4
	fF+8xxHaJL1+xJExlnonotB4lYHM92DAPywlXdj4f6s3TMjR4AhN9Ov8St3/QYVpv1qrDEryuny
	pf4iZ7W/CapvDKjlI0CqqfQkieA27pEgrO4o+yo0lAf73CUEtqo1OOrF3Z0A==
X-Received: by 2002:a05:620a:700a:b0:92e:72c4:152b with SMTP id af79cd13be357-930b43155bcmr2298496985a.71.1784722622381;
        Wed, 22 Jul 2026 05:17:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a03834sm149477885a.30.2026.07.22.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:17:01 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:16:56 -0400
From: Gregory Price <gourry@gourry.net>
To: SJ Park <sj@kernel.org>
Cc: linux-mm@kvack.org, arun.george@samsung.com, balbirs@nvidia.com, 
	brendan.jackman@linux.dev, yuzenghui@huawei.com, apopple@nvidia.com, alucerop@amd.com, 
	matthew.brost@intel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, 
	vishal.l.verma@intel.com, dave.jiang@intel.com, alison.schofield@intel.com, 
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, usama.arif@linux.dev, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 14/36] mm/damon: skip private node memory in DAMON
 migration and pageout
Message-ID: <amCzmkdOr6AFv_kQ@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-15-gourry@gourry.net>
 <20260721234644.149401-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721234644.149401-1-sj@kernel.org>

On Tue, Jul 21, 2026 at 04:46:43PM -0700, SJ Park wrote:
> On Mon, 20 Jul 2026 15:34:08 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > DAMON operates on physical address ranges, which can cover private
> > node memory. Skip private-node folios in both DAMON's migration
> > and reclaim paths.
> > 
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> > ---
> >  mm/damon/paddr.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> > index e4f98d67461f5..c741a94319750 100644
> > --- a/mm/damon/paddr.c
> > +++ b/mm/damon/paddr.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/swap.h>
> >  #include <linux/memory-tiers.h>
> >  #include <linux/mm_inline.h>
> > +#include <linux/node_private.h>
> >  
> >  #include "../internal.h"
> >  #include "ops-common.h"
> > @@ -250,6 +251,10 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
> >  			continue;
> >  		}
> >  
> > +		/* private node memory is not reclaimable by default */
> > +		if (folio_is_private_node(folio))
> > +			goto put_folio;
> > +
> 
> "by default".  Does that mean it could be reclaimable in some situations?  If
> so, could we check if it is reclaimable?
> 

See the damon changes in:

https://lore.kernel.org/linux-mm/al-pkvmgIxGu3LzM@gourry-fedora-PF4VCD3F/T/#mfb99303c85dd9d4c3f58832dc28fc55583a7217a

> Also, what happens if we just try paging out the private node memory?  Will it
> simply fail?  Or, make some problems?
> 

user controls for MADV_ commands that affect private node folios would
skip those folios - exactly same as ZONE_DEVICE folios.

Which I'm not sure damon actually handles correctly presently (zone
device).  I remember looking around damon and thinking to myself "what
if this is a zone device page?" and not being able to find a satisfying
answer.

> >  		if (damos_pa_filter_out(s, folio))
> >  			goto put_folio;
> >  		else
> > @@ -344,6 +349,10 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
> >  		else
> >  			*sz_filter_passed += folio_size(folio) / addr_unit;
> >  
> > +		/* private nodes do not support migration by default */
> > +		if (folio_is_private_node(folio))
> > +			goto put_folio;
> > +
> 
> Same questions.
> 

Technically there is nothing in migration core to prevent migration
operations, it's done on a service basis - hotunplug, reclaim/demotion,
user numa (mbind, migrate/move_pages) etc.

Operations on private nodes/private node folioes are refused if the
capability bit is not set.

~Gregory
