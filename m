Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96181E98F6;
	Wed, 15 Jan 2025 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736938279; cv=none; b=RJU4JC0VfuUjAwsgywRp5ZcTT681dlx9W7S9NVRilUn68lv91Z/gxHOmA6IRh0grXk9jMEO7y1/Cf3mhCm9AsEtILnXUpjPBXK/E0AmipfMMTeKK0SgFpWhBOR15Nk2HX+0PlfdoQFmjulMj7jEhmHShwmgZ+hk6SuuGh7gWP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736938279; c=relaxed/simple;
	bh=t4k8SjD1P/zrD4ydxGTGEoBfqpYW8tV+NUOrxqeQbX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAWkd8LKxnm7h612B89Bouub03lNE0RqmqEe5Rjf5pmELYnFNCYNJp762lmC4Ul/Z3PBdFSecnEOHALR7n3cUC9DZARKrtLNGqzFT/8B6KIvGzmYZI1388it6E3MiC9uKnL05fUvqRjMutXYTUUKdq7kJ6PlgKfWzeRMRax+X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fcw2s2mZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fcw2s2mZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5KoBooUs/bnKv8OEOq3cKmUwKnCPueVx0k9hiDQNgNY=; b=Fcw2s2mZ4a9bMb7rLM//a7aA+F
	IjThgjew7xPKKJ20p+xtLTk0ls+PK3BsmGTVxKYumpXM3tV4SebZMwKwBG3sz3yU9a1G+mEbBHiM7
	FSDC55UTeHHFMngjx3Oky4aQI8zu7R1kjAvTc8CV3LDFDaQ2V1sZjahhVGmY3xH5BT3RBpQQs/XyK
	SVEqNcWEPWf+U/wsALFhHL9nVAmjgWGDv6iOoiQA/xNF1aJGOUkhzfpsSL8KuhYGDbpihUNAJqUNV
	Y/7iqX0YvPdmSYZ+2fMc04ezOp/iqaV3Os6lefy8IAgqLEkSrO2PgaWN7Hi7vdKHYPEfp79Rs4Hd7
	uFRRP7Tg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0zB-0000000C0hn-29i8;
	Wed, 15 Jan 2025 10:50:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8E64D300346; Wed, 15 Jan 2025 11:50:56 +0100 (CET)
Date: Wed, 15 Jan 2025 11:50:56 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 12/17] mm: move lesser used vma_area_struct members
 into the last cacheline
Message-ID: <20250115105056.GY5388@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-13-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-13-surenb@google.com>

On Fri, Jan 10, 2025 at 08:25:59PM -0800, Suren Baghdasaryan wrote:
> Move several vma_area_struct members which are rarely or never used
> during page fault handling into the last cacheline to better pack
> vm_area_struct. As a result vm_area_struct will fit into 3 as opposed
> to 4 cachelines. New typical vm_area_struct layout:
> 
> struct vm_area_struct {
>     union {
>         struct {
>             long unsigned int vm_start;              /*     0     8 */
>             long unsigned int vm_end;                /*     8     8 */
>         };                                           /*     0    16 */
>         freeptr_t          vm_freeptr;               /*     0     8 */
>     };                                               /*     0    16 */
>     struct mm_struct *         vm_mm;                /*    16     8 */
>     pgprot_t                   vm_page_prot;         /*    24     8 */
>     union {
>         const vm_flags_t   vm_flags;                 /*    32     8 */
>         vm_flags_t         __vm_flags;               /*    32     8 */
>     };                                               /*    32     8 */
>     unsigned int               vm_lock_seq;          /*    40     4 */

Does it not make sense to move this seq field near the refcnt?

>     /* XXX 4 bytes hole, try to pack */
> 
>     struct list_head           anon_vma_chain;       /*    48    16 */
>     /* --- cacheline 1 boundary (64 bytes) --- */
>     struct anon_vma *          anon_vma;             /*    64     8 */
>     const struct vm_operations_struct  * vm_ops;     /*    72     8 */
>     long unsigned int          vm_pgoff;             /*    80     8 */
>     struct file *              vm_file;              /*    88     8 */
>     void *                     vm_private_data;      /*    96     8 */
>     atomic_long_t              swap_readahead_info;  /*   104     8 */
>     struct mempolicy *         vm_policy;            /*   112     8 */
>     struct vma_numab_state *   numab_state;          /*   120     8 */
>     /* --- cacheline 2 boundary (128 bytes) --- */
>     refcount_t          vm_refcnt (__aligned__(64)); /*   128     4 */
> 
>     /* XXX 4 bytes hole, try to pack */
> 
>     struct {
>         struct rb_node     rb (__aligned__(8));      /*   136    24 */
>         long unsigned int  rb_subtree_last;          /*   160     8 */
>     } __attribute__((__aligned__(8))) shared;        /*   136    32 */
>     struct anon_vma_name *     anon_name;            /*   168     8 */
>     struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     8 */
> 
>     /* size: 192, cachelines: 3, members: 18 */
>     /* sum members: 176, holes: 2, sum holes: 8 */
>     /* padding: 8 */
>     /* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
> } __attribute__((__aligned__(64)));


