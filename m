Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0502C229B36
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764861592; cv=none; b=FHhK1vK489rHswBljdJYezyeE3ATYHKSFn6kLgnt3gEo0lCbzgVa+8054NLdo8niexKqGP9DBl7AeFDjh/opkYxzcB/zknMkbbGHTbvrJ+UAuFSLkQ1kQRgWOw1kxWclyUa9R8L6pRa5FsJaxQI3k7kvThr1ZYLWX2OQVFUEgV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764861592; c=relaxed/simple;
	bh=rONpveAiXkJi8CgvoIrkJrwMKiFhZefbNLyemOBsYng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDPLZwvvxa1J1mOeYb7tnE45lBOBiS19Jj//RDKG/1zIgWZ118Zslg4Ke4j4gGZA7LrQ8iZIV3sU5rTdjcVlP7qNHlxvUwrbNLJt2l2kHD0w+50C1t26Xli2tm75tDcvF/UoVKNePZJGlm6N4MiNM3QuasIEj8MCyf25IreWnLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1bL5yyE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YaQGBM9b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1bL5yyE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaQGBM9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764861589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiOfEEXvCCotAmgC8KaiTgZUJrgAulq2O8EihiUvjps=;
	b=D1bL5yyEWbRP+30z7cQriR+Zcv02q/yRofLDCDbi+yVT+1EuXP07Y76S7UGLHgoR9AyyTM
	TlDP7jeHAoWfiOULArqiHiYM7RPa0p4jqtWgKrJs1jWOndpr/3/XAozasNw3bEvtcnm3Cm
	dBORwhZ4GUYZvQayg48DBiV5c389boQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-GyVpudd7NAOB6AEIB0oDxg-1; Thu, 04 Dec 2025 10:19:48 -0500
X-MC-Unique: GyVpudd7NAOB6AEIB0oDxg-1
X-Mimecast-MFC-AGG-ID: GyVpudd7NAOB6AEIB0oDxg_1764861588
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6e701d26so22804571cf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764861588; x=1765466388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wiOfEEXvCCotAmgC8KaiTgZUJrgAulq2O8EihiUvjps=;
        b=YaQGBM9bcpY/naMuM0RZ0qjz0Kz+4xgEfOJhkjdzLI5Eo0h7eu1UNgFxrJSkaWYv27
         +ej4DuGZoFsxHC0m0HCzdH7xc6Cc52gm6msY9PISSTZU9TOf+IXiPQYVrn1LzHosc4Sq
         j2/2t6ciC3BlsM/6BS2kOUTK1lO8oJVwHOaFgu+1kABNQnUJozwTkh2mDhTY08JH1S/8
         Mqjc0lig5QJM9QD7vt7PxfCTCyX5WSb5DpXFjOx24Vwunw2Sbjv/W7QhQ4TCfppAxpcu
         00WoGdAf19KjVFEPbDHkb3sT2oMLggTiGDLMlQMTjFMVbcm92gtTMDqkkjcV8sLUs+yC
         gDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764861588; x=1765466388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiOfEEXvCCotAmgC8KaiTgZUJrgAulq2O8EihiUvjps=;
        b=eXB2wVDvH263YHmxSKAZmR3NFHX5I72t9jxYjS4DTotgY/SXovwfdZ7itJFtFehQaZ
         LEY7Z2tbkxjFlWnZX7SjnHHG3xd+rbP/qhUKBJxu3hOH2Z2JR364naD/xAwBTEkvs/lI
         9eQLDXM7ASOvmv4+POD0MHZNaMjftKNeK7LstATLFf1o5LLjQAAh6Vnen2ERlDbCWWna
         Ol6ay9N0GuCQt7Aqs/7QCYHEdHaUSLT7RHe3ChpEpsy2e1NgOzy3WRSX4M8IhsHCx1Xb
         cOQVacDFnwa1hUkVJ/5W3zjwzSuzluMiMjCFOWnWTVhFVZeIigXbUiYZnWdfupRq6Uhf
         OhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtzMaBfZOhlWdp3PhHg9+jY32bQlDSkhrx7Modfeu6u/LvROuWzSX/TtrlFh50KjeVCVsy0ziI6EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoWVHpgJ/Z2NEhVGRoIgQdk5ELURWAdD34rIuHVGMVLCoCcn+O
	pd/IhAzfuPsF9rI5sPCy+urz+tGYUrt4ZyXrLhhGdtGoj/Z415P/g0jjXf5KxZZE9ST7m3iwbPc
	b03JyjyDdieNKtWgH+/cbUpcdCxvEiRuSxIFXeskID+Emafn8tcY7tqoPKL2DcA==
X-Gm-Gg: ASbGnctZd4LxZBpe8mO2Yqfz/9iGcZoL+mfIHYHpkA61VmsTiBdlu0UvNcAVaoULq4f
	H4ZhVJ++zOlRgy4kLQ4Uw0lKwlAYgEFBjtOmgW5e4rMkkXWHNnd53VyCBAb1CTkH62LYUgT38j0
	0XvoHcb/LDF07eTI++osTdz8cGCarYnx1cgwP02ccCqQxXXXsa9/FdgTTgUzATIHkZCpOhJkx9s
	fBI8MZhwgF/9RCxIa5vb0huq2VgexTdo4JGH9OBNBn7UZAg4fYQ4sCF0VDjdGZ9Qqt4Mw1juwSK
	a91kUymDugBMnmV/LMiONI1rAJxkEo8xZc3b4x7SIRiWsVVYsORZ+sOYrl73khp6Eny3mJ9yIx6
	Ny24=
X-Received: by 2002:a05:622a:19a7:b0:4ed:6831:56bf with SMTP id d75a77b69052e-4f017506180mr83114891cf.13.1764861587822;
        Thu, 04 Dec 2025 07:19:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDTQQzmp0P2GzLYzoOuzd5XiTJUMbQ9wDiRy2GwNjmSgFIr2k4OGOJR0lcg/JspoRQXCmtBg==
X-Received: by 2002:a05:622a:19a7:b0:4ed:6831:56bf with SMTP id d75a77b69052e-4f017506180mr83114131cf.13.1764861587171;
        Thu, 04 Dec 2025 07:19:47 -0800 (PST)
Received: from x1.local ([142.188.210.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f0276b04b8sm10255141cf.11.2025.12.04.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:19:46 -0800 (PST)
Date: Thu, 4 Dec 2025 10:19:44 -0500
From: Peter Xu <peterx@redhat.com>
To: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>, Nico Pache <npache@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
	David Laight <david.laight.linux@gmail.com>,
	Yi Liu <yi.l.liu@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2 2/4] mm: Add file_operations.get_mapping_order()
Message-ID: <aTGmkHsRSsnneW0G@x1.local>
References: <20251204151003.171039-1-peterx@redhat.com>
 <20251204151003.171039-3-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204151003.171039-3-peterx@redhat.com>

I forgot to copy mm/fs maintainers for the 1st/2nd patches in this series,
my apologies.  Whole series can be found here:

https://lore.kernel.org/r/20251204151003.171039-1-peterx@redhat.com

I'll modify the cc list when repost.

Thanks,

On Thu, Dec 04, 2025 at 10:10:01AM -0500, Peter Xu wrote:
> Add one new file operation, get_mapping_order().  It can be used by file
> backends to report mapping order hints.
> 
> By default, Linux assumed we will map in PAGE_SIZE chunks.  With this hint,
> the driver can report the possibility of mapping chunks that are larger
> than PAGE_SIZE.  Then, the VA allocator will try to use that as alignment
> when allocating the VA ranges.
> 
> This is useful because when chunks to be mapped are larger than PAGE_SIZE,
> VA alignment matters and it needs to be aligned with the size of the chunk
> to be mapped.
> 
> Said that, no matter what is the alignment used for the VA allocation, the
> driver can still decide which size to map the chunks.  It is also not an
> issue if it keeps mapping in PAGE_SIZE.
> 
> get_mapping_order() is defined to take three parameters.  Besides the 1st
> parameter which will be the file object pointer, the 2nd + 3rd parameters
> being the pgoff + size of the mmap() request.  Its retval is defined as the
> order, which must be non-negative to enable the alignment.  When zero is
> returned, it should behave like when the hint is not provided, IOW,
> alignment will still be PAGE_SIZE.
> 
> When the order is too big, ignore the hint.  Normally drivers are trusted,
> so it's more of an extra layer of safety measure.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  Documentation/filesystems/vfs.rst |  4 +++
>  include/linux/fs.h                |  1 +
>  mm/mmap.c                         | 59 +++++++++++++++++++++++++++----
>  3 files changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 4f13b01e42eb5..b707ddbebbf52 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -1069,6 +1069,7 @@ This describes how the VFS can manipulate an open file.  As of kernel
>  		int (*fasync) (int, struct file *, int);
>  		int (*lock) (struct file *, int, struct file_lock *);
>  		unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
> +		int (*get_mapping_order)(struct file *, unsigned long, size_t);
>  		int (*check_flags)(int);
>  		int (*flock) (struct file *, int, struct file_lock *);
>  		ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int);
> @@ -1165,6 +1166,9 @@ otherwise noted.
>  ``get_unmapped_area``
>  	called by the mmap(2) system call
>  
> +``get_mapping_order``
> +	called by the mmap(2) system call to get mapping order hint
> +
>  ``check_flags``
>  	called by the fcntl(2) system call for F_SETFL command
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index dd3b57cfadeeb..5ba373576bfe5 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2287,6 +2287,7 @@ struct file_operations {
>  	int (*fasync) (int, struct file *, int);
>  	int (*lock) (struct file *, int, struct file_lock *);
>  	unsigned long (*get_unmapped_area)(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
> +	int (*get_mapping_order)(struct file *file, unsigned long pgoff, size_t len);
>  	int (*check_flags)(int);
>  	int (*flock) (struct file *, int, struct file_lock *);
>  	ssize_t (*splice_write)(struct pipe_inode_info *, struct file *, loff_t *, size_t, unsigned int);
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 8fa397a18252e..be3dd0623f00c 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -808,6 +808,33 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm, struct file *fi
>  	return arch_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
>  }
>  
> +static inline bool file_has_mmap_order_hint(struct file *file)
> +{
> +	return file && file->f_op && file->f_op->get_mapping_order;
> +}
> +
> +static inline bool
> +mmap_should_align(struct file *file, unsigned long addr, unsigned long len)
> +{
> +	/* When THP not enabled at all, skip */
> +	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> +		return false;
> +
> +	/* Never try any alignment if the mmap() address hint is provided */
> +	if (addr)
> +		return false;
> +
> +	/* Anonymous THP could use some better alignment when len aligned */
> +	if (!file)
> +		return IS_ALIGNED(len, PMD_SIZE);
> +
> +	/*
> +	 * It's a file mapping, no address hint provided by caller, try any
> +	 * alignment if the file backend would provide a hint
> +	 */
> +	return file_has_mmap_order_hint(file);
> +}
> +
>  unsigned long
>  __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>  		unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
> @@ -815,8 +842,9 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>  	unsigned long (*get_area)(struct file *, unsigned long,
>  				  unsigned long, unsigned long, unsigned long)
>  				  = NULL;
> -
>  	unsigned long error = arch_mmap_check(addr, len, flags);
> +	unsigned long align;
> +
>  	if (error)
>  		return error;
>  
> @@ -841,13 +869,30 @@ __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
>  
>  	if (get_area) {
>  		addr = get_area(file, addr, len, pgoff, flags);
> -	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -		   && !addr /* no hint */
> -		   && IS_ALIGNED(len, PMD_SIZE)) {
> -		/* Ensures that larger anonymous mappings are THP aligned. */
> +	} else if (mmap_should_align(file, addr, len)) {
> +		if (file_has_mmap_order_hint(file)) {
> +			int order;
> +			/*
> +			 * Allow driver to opt-in on the order hint.
> +			 *
> +			 * Sanity check on the order returned. Treating
> +			 * either negative or too big order to be invalid,
> +			 * where alignment will be skipped.
> +			 */
> +			order = file->f_op->get_mapping_order(file, pgoff, len);
> +			if (order < 0)
> +				order = 0;
> +			if (check_shl_overflow(PAGE_SIZE, order, &align))
> +				/* No alignment applied */
> +				align = PAGE_SIZE;
> +		} else {
> +			/* Default alignment for anonymous THPs */
> +			align = PMD_SIZE;
> +		}
> +
>  		addr = thp_get_unmapped_area_vmflags(file, addr, len,
> -						     pgoff, flags, PMD_SIZE,
> -						     vm_flags);
> +						     pgoff, flags,
> +						     align, vm_flags);
>  	} else {
>  		addr = mm_get_unmapped_area_vmflags(current->mm, file, addr, len,
>  						    pgoff, flags, vm_flags);
> -- 
> 2.50.1
> 

-- 
Peter Xu

