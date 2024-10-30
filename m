Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975D41C4609
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730313056; cv=none; b=d+eY0PM4YwQsgps7hMnwupnAOZum0SFE3UT8DFWqCB3Ps83s+3H8xUIuV1SFu0CIFJBB8X1z2+c0oTADykU9pKqxAPS5CZwIfDut2tOsi4RlCm5S2GWljtkdGIP4WHGgQLiaypiQQhqp4E3Y/oRxniwINVJGweu7Eq905s/j8fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730313056; c=relaxed/simple;
	bh=GnnDat3QvnrXqEoFk6xpze7bEpG/u62miW9QnQi8ldw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eS1fyr7+ckAEDc4yfFRnpUXHLYmkJVsxukVoUw9mDEKmSF/1AwkYCswMUDm55PF3ZC7HGW/OSawInwouQw8F6fm9hJ+rPo8vhSKUNkLAUCQHeduTYM+FR747ZK8hhXNWgGkUeoWBzg4rQEk411sr8A3h7s+sY+4eJIyX/l9cJOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=sk0crNhO; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="sk0crNhO"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6cbcd49b833so999746d6.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 11:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1730313051; x=1730917851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+BQyFvetyfEonBkCQfY0fCLeQcMCAqYlLQEbyNnwUY8=;
        b=sk0crNhO/N0WY9ZOVgJHiC01NiunYxmY9ZYb2WzSkTcIWw8rTTs+Hpaz6Xk2V/s2aL
         mHgIckPnvnUCCmLUFXGyPwRJoBcg1iV/IRveNKP40/c3OMiD3xAemCr6LjK+YKTQz6aP
         Nsag7RxBYptS4Buwburm8Yerh5VN2PeNAzkybBM9XIBFVF5E/bT6LRNTCc79lGNu4K5o
         FElod3L1noofhELhrii7ms/+PbI3/tlpqtGhFth8zoRnBh5BW6ZnTLW+0Gh9UQRoG5yo
         Dni7kdxfrVjtJ4k5gsgmSM6QRzNbvuGge1i9qx3zin+cMiL3OxnMjS401S5DYtgiv7D0
         /zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730313051; x=1730917851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BQyFvetyfEonBkCQfY0fCLeQcMCAqYlLQEbyNnwUY8=;
        b=pGKpD403VpiUoPDmCsrdWr3aH6Y/pibIsOMSYeiXwEwTA5AMIJnuQLPO/NdIvurpPn
         Ce495fwM6B/rKGXQ9R4TwvTkc45FqnmOt0Xxx5ZGEjvy903APyr/n/Jcwa84hIBqVhRu
         +66iQpKv+js09XZV5icR2FIU+WI0IbhtkiXWqbM3ggEYC2uPos9tHSVOL7H9MhJL3B5V
         LCGRa3GyGwn/PAatqOGiZKEYCP97oTHFXWL/iLye0d+GYP4+tUt+EaiRjbxtNSOTbKGb
         6uHr84VY+gHX71tiR9LEnaV8PBxqa3Dx9Q1oVawNTnnrKH02nFZRM/yso/zU4MSEo+Ya
         hziw==
X-Forwarded-Encrypted: i=1; AJvYcCUo0Xzj8PMAIcAs9sj5AXaPUZboPKo7zrMhVGoJNvs6HBYQGV9U8KgUGg3NA0d1eNKdFG0H4q+AJW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRhS6EarcgjigVcuiDOuvh5yzGa2vrKL89fhBuv3Ac2O7RpuXm
	HElKp0ZCzMiYi6omI6jjyKpP+AK318Sa7+e8ilWUxil44HSfZs07lIEQ5sLMUSs=
X-Google-Smtp-Source: AGHT+IFZKq2rPrctMfcx/ODZimdpPiE5Sd/oXmeAfoYjzVnlrEmEOTepjdE4Eu92d40qrV5Ks/x7Ag==
X-Received: by 2002:a05:6214:5b01:b0:6d3:5187:bcf8 with SMTP id 6a1803df08f44-6d35187be34mr12861026d6.17.1730313049656;
        Wed, 30 Oct 2024 11:30:49 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a2c829sm54520496d6.121.2024.10.30.11.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:30:48 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:30:44 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@suse.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, nphamcs@gmail.com,
	shakeel.butt@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, tj@kernel.org, lizefan.x@bytedance.com,
	mkoutny@suse.com, corbet@lwn.net, lnyng@meta.com,
	akpm@linux-foundation.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3 1/1] memcg/hugetlb: Adding hugeTLB counters to memcg
Message-ID: <20241030183044.GA706387@cmpxchg.org>
References: <20241028210505.1950884-1-joshua.hahnjy@gmail.com>
 <ZyIZ_Sq9D_v5v43l@tiehlicka>
 <20241030150102.GA706616@cmpxchg.org>
 <ZyJQaXAZSMKkFVQ2@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyJQaXAZSMKkFVQ2@tiehlicka>

On Wed, Oct 30, 2024 at 04:27:37PM +0100, Michal Hocko wrote:
> On Wed 30-10-24 11:01:02, Johannes Weiner wrote:
> > On Wed, Oct 30, 2024 at 12:35:25PM +0100, Michal Hocko wrote:
> > > On Mon 28-10-24 14:05:05, Joshua Hahn wrote:
> > > [...]
> > > > Changelog
> > > > v3:
> > > >   * Removed check for whether CGRP_ROOT_HUGETLB_ACCOUNTING is on, since
> > > >     this check is already handled by lruvec_stat_mod (and doing the
> > > >     check in hugetlb.c actually breaks the build if MEMCG is not
> > > >     enabled.
> > > [...]
> > > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > > index 190fa05635f4..fbb10e52d7ea 100644
> > > > --- a/mm/hugetlb.c
> > > > +++ b/mm/hugetlb.c
> > > > @@ -1925,6 +1925,7 @@ void free_huge_folio(struct folio *folio)
> > > >  				     pages_per_huge_page(h), folio);
> > > >  	hugetlb_cgroup_uncharge_folio_rsvd(hstate_index(h),
> > > >  					  pages_per_huge_page(h), folio);
> > > > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, -pages_per_huge_page(h));
> > > >  	mem_cgroup_uncharge(folio);
> > > >  	if (restore_reserve)
> > > >  		h->resv_huge_pages++;
> > > > @@ -3093,6 +3094,7 @@ struct folio *alloc_hugetlb_folio(struct vm_area_struct *vma,
> > > >  
> > > >  	if (!memcg_charge_ret)
> > > >  		mem_cgroup_commit_charge(folio, memcg);
> > > > +	lruvec_stat_mod_folio(folio, NR_HUGETLB, pages_per_huge_page(h));
> > > >  	mem_cgroup_put(memcg);
> > > >  
> > > >  	return folio;
> > > 
> > > I do not see any specific checks for CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING
> > > in these paths. I guess you wanted to say that you rely on
> > > mem_cgroup_commit_charge setting memcg pointer which then __lruvec_stat_mod_folio
> > > relies on when updating stats.
> > 
> > Yes, this is what Shakeel pointed out here:
> > 
> > https://lore.kernel.org/lkml/il346o3nahawquum3t5rzcuuntkdpyahidpm2ctmdibj3td7pm@2aqirlm5hrdh/
> 
> It belongs to the changelog.

Joshua, can you please include something like this at the end:

lruvec_stat_mod_folio() keys off of folio->memcg linkage, which is
only set up if CGRP_ROOT_MEMORY_HUGETLB_ACCOUNTING is switched
on. This ensures that memory.stat::hugetlb is in sync with the hugetlb
share of memory.current.
