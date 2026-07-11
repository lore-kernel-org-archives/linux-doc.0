Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1922D6E66
	for <linux-doc@vger.kernel.org>; Sat, 11 Jul 2026 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739699; cv=none; b=qPqPKANQKEssBgEgthNe2f5wtgdIwU2HR+VHfk78BsFGJNZCbLzDm/jDdDTobL8z56VaTpceQeb6P29pvBfUvvI/JKzj3IT8MY9x8nRlOArC4/t/KZtjAzGYRs5yupWOXWBH6DnjdetBvRekoeR0gCA2yi9p+bhdnDuD6nlby5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739699; c=relaxed/simple;
	bh=qqBMc1pIZ4OwB1WOwiQC+Ffr8ykArNIN3N1czmLBQLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ts0NyNru6PS/9XnzTf0VHr0L4fr7DW7iKAve5UOmz0NDVJjxaKSecdsLGtkdbQ/63pI90U4T4CD5ol14s09FWT1Dws1wsCDoUZYH0ODDvII53ZT8wXqG0ON8glAN0pYwq+yFUVHKJozLvsyBAKFfTje65J8g/3zy8lpcNt8eAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9usNja3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9usNja3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so2006766a91.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739697; x=1784344497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=j9usNja3Rw5jRvVQMhlvbBICaZdQiWUjddeAsYDi9fiyL8Joamdn0JxMIZ5dk38bIQ
         /dornZxQMlIROVUjVoRhbGHUKuukf6Og8glDQTCDAJbg4K0QgRqqm/1/PM97bWK8yUzb
         cDMHXHbpXI7+NZzaaVzeYzRIphjIJgazuYXMlodgbRGw9iEFgEltoznH76c8Y5kiH7/l
         sCjepKEumOcKyeYvn7JtRE9U0wehywpYEDvMG7zDQKECSL9yoKlNaJvg3/R2NRKxJ/aE
         FTNW2+vTGF6P2K39qMI8aKDaAcI8+pI9elzMZpeldCoY2Ji70VUFBU9h7WkHDCr1dQob
         ZG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739697; x=1784344497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=Dj3TqVSIhJxNvaW8ArirS4bFf3pQCg5sKkYBkYvpwolRNdN+Fe3oJd6wQSgvZK0+nB
         ix9rOTAQ3A7ZcgbPWeFr6IAZUMuY/iPR3+zqPL3yUP9syrfHPdg0SCuunAgNNPpdRdWr
         205UweSiCpt/Y1+bRzimw+0JMrJVwW25VJDTHyYCvOiTbAsm7mmVZHdx7aytQl++NJtg
         ldQ1qL7buBgaUjeXhABZ46TMpSFHFrFQfDGnahwhRRAXjyIMhWJAELJIsXPk65/I5GR0
         luimwlQC3OrRZ0jprekBgqmQw6H1T5XEUy9N+YaZl2Iw4L1dlIevVi8Knj1Lo3b4sA2E
         E+xQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzYGYr/N2WF5qmpkRflVbC0cf/JubM3XO0v+1d4uK/EH3yI+HpXjwevMUWmS/WovITyNoMZyiLZyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFI71zMNMbvkEGK6PVK/prqkV8b5p0FhrC5IITWB5ZKApGis/o
	PYhl5pFohMtFBx+F6+NRPZhhzL8RziUJovVglV05mJNmOPo7kcSmtCaM
X-Gm-Gg: AfdE7cn2/jh50Yx3cLpEWY1WtqF3ZcvR3U1JnsC7+vBDNtvAksjrCB9G3iufqz0bsUO
	Vdnr7mbEY4EoXITR4vkDLAQdkIkZwSGS2cAvbafCUwwaoXc3gKyTjrDLO2WJSimnqxJjbL/RNLO
	Gka4OjNaHByqGp/GCBfzwZwp5JcrEu2j9qHaObciIkkOjoOmpPs4pthKsIlPiTu0VSUh4kU7mGO
	pR+3KTFo4dyxDhygIzVJ1rrl5TipWAznxSNWhY3uV1P3d+ZlJclw7P1grcBg7SuYPTvLedcDJm5
	MUDW938Ip8ublKfdyIzPZZo4Gal4ywPHtKexVv7L+dEC1tcy2gu56/XWjZd2U9C4v9ROOW89RIf
	AdsVaJxrNJk7CebmCpp9kJeItfpax2cf1rb9uRtJ1vQ9lCJviKxFSTG/zaVFNi5/VLjnOWNZMxY
	1dw0fb66BQKFmXRXvAv5dHPkAQ17r2yVV60TBJgE5G/1EmoLl+qFLFv/c=
X-Received: by 2002:a17:90b:5688:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-38dc74cbe73mr1405854a91.11.1783739697430;
        Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm3463061a91.10.2026.07.10.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:14:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:14:47 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <alG1JwgUK44dCiN4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:16PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:50 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > MSHV currently faults movable memory regions by taking mmap_read_lock()
> > around hmm_range_fault(). That prevents the fault path from handling VMAs
> > whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
> > mappings.
> > 
> > Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
> > preserves MSHV's existing unbounded retry behavior while letting the HMM
> > helper own mmap_lock acquisition and refresh range->notifier_seq internally
> > before walking the range. After the fault succeeds, MSHV still takes
> > mreg_mutex and checks mmu_interval_read_retry() before installing the pages
> > into the region, so the existing invalidation synchronization is preserved.
> > 
> > Fold the small fault-and-lock helper into mshv_region_range_fault(), since
> > the remaining retry path is just the standard "fault, take the driver lock,
> > check the interval notifier sequence" pattern.
> > 
> > ...
> >
> > @@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
> >  	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
> >  	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
> >  
> > -	do {
> > -		ret = mshv_region_hmm_fault_and_lock(region, &range);
> > -	} while (ret == -EBUSY);
> > -
> > +again:
> > +	ret = hmm_range_fault_unlocked_timeout(&range, 0);
> >  	if (ret)
> >  		goto out;
> >  
> > +	mutex_lock(&region->mreg_mutex);
> > +
> > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > +		mutex_unlock(&region->mreg_mutex);
> > +		cond_resched();
> > +		goto again;
> > +	}
> > +
> 
> If the calling process has realtime scheduling policy and either a)
> we're uniprocessor or b) this process and the holder of
> interval_sub->invalidate_seq are both pinned to the same CPU then
> cond_resched() won't do anything, and this might be an infinite loop?

Yes, looks like it might.
What can be done to prevent this?

Thanks,
Stanislav

