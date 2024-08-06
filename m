Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D392481B7
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965318; cv=none; b=rOcs+VNyrAZQ71tUP7YhisC8VzTJmupp7Mi4eLNU4l24QE1XL+/I6fXQj+cK+tyyybHbJW24ius9AUIwwynDSimWHYMoQxF5L4tu2pjUvCVB7jaBkD2WIe+p7BWuSWHdrxfN/W5a8o85MVauuB+ypgtYkW/AI8ws1xltj7oEh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965318; c=relaxed/simple;
	bh=CMdCGpnpB5DtRAjVfmvBk5vYaOmVs69vYT7EPaLyuGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqvYRBHfeERXDYeVOgA5M3iXXjDdMsAmxhviRMXHssN2841A6mRoWfNXmTLipr1p5QOIiG6Vjxv3NRdc2M5kOBjmIs9668G6AN5/9nqHjEzPUzmXR5wQazQVmd8n4oiti47UjP/dP/t9UomU5uGoGJkAEwkIw14Era+GeGC2CWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=xG9LQTtm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="xG9LQTtm"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-66526e430e0so7245787b3.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1722965315; x=1723570115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjljyosPAZ7fSFa2kkPBPoToHoCOQPJRAdwnUNgGi1U=;
        b=xG9LQTtmcPngA810s428o7RkjcdCg7YguleepswfjLtoOiV5DVIntFUZwItU4Vu5YI
         PfStcw27Jxw4tLWAjfB9MTDLh5RPF+RnUvuyLGNspKX2D2e2WfEoifR0+/3dIVWqhdmN
         1TC/Kk1vGkTRS9/fGt/v29AYus133kbPbGXUpFomO1M5NUkCgzeFBZaLB90+OuYZZntY
         8x0GVmBUFkAElln+eF1ofBRKL9GTCp9gTJWiyR3xIa3Q3TlLzD6uzSDGHv2KXEbRM7vJ
         MzNE6o7+5GSaRZoB0n7IPODz7/WmUXxrpTvvds2hZZbkMkOaiJth6D5tG9Ag5I5r2bEF
         TCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722965315; x=1723570115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjljyosPAZ7fSFa2kkPBPoToHoCOQPJRAdwnUNgGi1U=;
        b=FjcJ6R8ZYzec7uTlbqO+1LjZ0AkXiRU2Pa94Um+QpYkcLuEXT9/UtiP1QHO74G13rb
         kq2zftObQJtUQxFr6bJSrPKopY0V/6Ufz0FImGV/rDzz943mxhMtbDXQ3aRX6vkcXt/t
         4Z5T2QtUk31NI8RxhrvCgFXO6qmqYlEZuAZNyk3vBgvg0x7V9vzjWQrCaS3Jns/6Q1Kw
         TyKhy2mE4Dn32l7O7FeJmID/d7JsXvo0x/EI4AcjmTdkBa4P7mRYa6AJZPwJhQnWaIHo
         FGGe+wKEFZWqrywnOIxNw89HPkNKXOPNB+jcldhz3VlYKkHwo8hru5azk+KpdT7VFC0t
         0H6w==
X-Forwarded-Encrypted: i=1; AJvYcCWYeGkSDEjIPvqKGVtD9toNhrR0r12Dr6G7agpQpOUEC6CQkfv4BORWquZXmcRkYIZ9wwPbhcabxk8GkAfXCU3jkRzQacSBH8tw
X-Gm-Message-State: AOJu0Yz0gzWYzjB+8gSFSooKET6mrrtkh1kRcB++EKdh1UYC0ZtkqZB4
	l3h7ORUP17CIenA+p4McYCEUQ7upFUaXjuPkSmUHWmWWpjatHL1oeSEe8s/xD5I=
X-Google-Smtp-Source: AGHT+IE5yQrzHeTUKXSSCIgGpDJ9JVkB51z02PE93hN7JzChXv6zuyx4GP08AmneFbuyXeQdtH+HGQ==
X-Received: by 2002:a0d:d107:0:b0:665:3394:c068 with SMTP id 00721157ae682-68964390e70mr169273227b3.37.1722965315536;
        Tue, 06 Aug 2024 10:28:35 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c839d65sm48454276d6.82.2024.08.06.10.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:28:35 -0700 (PDT)
Date: Tue, 6 Aug 2024 13:28:30 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, riel@surriel.com, shakeel.butt@linux.dev,
	roman.gushchin@linux.dev, yuzhao@google.com, baohua@kernel.org,
	ryan.roberts@arm.com, rppt@kernel.org, willy@infradead.org,
	cerasuolodomenico@gmail.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 0/6] mm: split underutilized THPs
Message-ID: <20240806172830.GD322282@cmpxchg.org>
References: <dc00a32f-e4aa-4f48-b82a-176c9f615f3e@redhat.com>
 <3cd1b07d-7b02-4d37-918a-5759b23291fb@gmail.com>
 <73b97a03-3742-472f-9a36-26ba9009d715@gmail.com>
 <95ed1631-ff62-4627-8dc6-332096e673b4@redhat.com>
 <01899bc3-1920-4ff2-a470-decd1c282e38@gmail.com>
 <4b9a9546-e97b-4210-979b-262d8cf37ba0@redhat.com>
 <64c3746a-7b44-4dd6-a51b-e5b90557a30a@gmail.com>
 <fc63e14d-8269-4db8-9ed2-feb2c5b38c6c@redhat.com>
 <204af83b-57ec-40d0-98c0-038bfeb393a3@gmail.com>
 <58025293-c70f-4377-b8be-39994136af83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58025293-c70f-4377-b8be-39994136af83@redhat.com>

On Thu, Aug 01, 2024 at 08:36:32AM +0200, David Hildenbrand wrote:
> I just added another printf to postcopy_ram_supported_by_host(), where 
> we temporarily do a UFFDIO_REGISTER on some test area.
> 
> Sensing UFFD support # postcopy_ram_supported_by_host()
> Sensing UFFD support
> Writing received pages during precopy # ram_load_precopy()
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Writing received pages during precopy
> Disabling THP: MADV_NOHUGEPAGE # postcopy_ram_prepare_discard()
> Discarding pages # loadvm_postcopy_ram_handle_discard()
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Discarding pages
> Registering UFFD # postcopy_ram_incoming_setup()
> 
> We could think about using this "ever user uffd" to avoid the shared 
> zeropage in most processes.
> 
> Of course, there might be other applications where that wouldn't work, 
> but I think this behavior (write to area before enabling uffd) might be 
> fairly QEMU specific already.

It makes me a bit uneasy to hardcode this into the kernel. It's fairly
specific to qemu/criu, and won't protect usecases that behave slightly
differently.

It would also give userfaultfd users that aren't susceptible to this
particular scenario a different code path.

> Avoiding the shared zeropage has the benefit that a later write fault 
> won't have to do a TLB flush and can simply install a fresh anon page.

That's true - although if that happens frequently, it's something we
might want to tune the shrinker for anyway. If subpages do get used
later, we probably shouldn't have split the THP to begin with.

IMO the safest bet would be to use the zero page unconditionally.

> > 		return false;
> > 
> > 	newpte = pte_mkspecial(pfn_pte(page_to_pfn(ZERO_PAGE(pvmw->address)),
> > 					pvmw->vma->vm_page_prot));
> > 
> > 	set_pte_at(pvmw->vma->vm_mm, pvmw->address, pvmw->pte, newpte);
> 
> We're replacing a present page by another present page without doing a 
> TLB flush in between. I *think* this should be fine because the new 
> present page is R/O and cannot possibly be written to.

It's safe because it's replacing a migration entry. The TLB was
flushed when that was installed, and since the migration pte is not
marked present it couldn't have re-established a TLB entry.
