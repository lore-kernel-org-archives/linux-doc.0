Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB89283CBF
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000125; cv=none; b=WL08+l7RBD+zmGkEH/ex9UEPCNvSBoxNvtRX0dtmDVgGwiZLK28OpIYvdt7BCPbDRJ7wNzDVHmrUeULkK8mpVNNOEyNuzuZMx5iBYdhozGgdawHxKQW0LRVtc3SINvkmD3gRaCSI8a2OHTHsgnyyR9t+s7/Nsr1aP02mWElL1xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000125; c=relaxed/simple;
	bh=uHrLKA9wKl7gy2YAVA3r41woIoGizB3IbJZXarj74XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzovp6zzYnKk9mcL0uHOWdnSdEGHS5eYlKZkECp02+Hf8aeH2qzrF47FGWJYAEDcWSfymErT/NFRjSCf3Yb0xQcfO74zTQgcqoHbqq8DWc0VvmkGAkfuhoKH4BQjKaVxdklNePhfan3ADKopZY6szxJvH39WUDbe1wK1B03t92U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pdXfmvmb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pdXfmvmb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a4fc916so109315e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764000122; x=1764604922; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bLdELsThxmeB5YvfJC736dRFpSpC/jFiigw/6IO1T6A=;
        b=pdXfmvmbGke7I21fnLK8wzNNxuAmLlBLgV/PRg0UsSJ8YfqWq2LB+eCFIPYRg0wiLI
         IQeyr1E39Y02sGvEY44Rff5cWgdGWcin8/ujIYgZJazILXwalBy/EoBZ9naGvtMACFcY
         eaXz8btoOMy4/VpCOjRSUNVP4ATztmZ1G4vlFblfLP1Ai7/+jSItUr3X3GmnpXRUaMCA
         1rgxVCjQvjJfEFzdcJhxrTGROUndZJnPfOkqjUSOaakFc9OmqUE4PqIQ6ofT53s4iW5W
         pX4x3jXMG7ON4rRTxiTwWQkhscF+SNIXyYSzWPqoOVkZjQUwX9dBq82ZI98P9BO3FaBD
         vhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000122; x=1764604922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLdELsThxmeB5YvfJC736dRFpSpC/jFiigw/6IO1T6A=;
        b=jUUcZ73lqDIaBF8GqAOhuia0w4w3/tMHrLpkaHTeFEDeO66IPKvjigJYQCZguJxfi7
         8YjmrxvgSjC4zjujsHCFpCLdaY1V4ftfTHQm4lvOb82GJ1cPoNpU00hPQTAyZ6PpGxEO
         reFXekRbpi/y6Yqidp0YjuA2+N95wLzd8BkhsELyVah3pWm5Lxg+UOeD0od7MR98GqBb
         QJEssr/NoeOyn56DNW6F7bWu5bsCETtavdd01vSe6b2dqB9fvlNFSg/8X//2f1NHiS7p
         xc+dQ6aJYuLm6R9KoBx2stTk0/VAw6i3O89XjjKkScuzGy+IJ8e/9JiUywLQSF2NtbTa
         ELtg==
X-Forwarded-Encrypted: i=1; AJvYcCXjytq25ut3t7++RnALoya5RX9TaVrbRKUxWmhhEOq0dSnEXARhDfwa++Duugd4zG74kfa3QpcVMIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhhz1pxL8pE8YYn7aAXUkslHKgMqb8aGgILTuSwUJLn4AOBqGn
	lDWM/8U8FCMRfa4ozsIos1n90AcmYzwSG+WL1U65LziPJTKsHOXAhNWbBX1QRWVOTA==
X-Gm-Gg: ASbGncs3ha5GlTnknt1VfNua4eYIvfJTGjJjWRB+jK/phthvg66ZsSgUSl1lK3QCNp/
	SEOvZDg1zj4ZtEoNmjd2jJ82RbFB8lc5j0xQW1njemDctgRGQMCKNl/mYhkZEHAJVyQdtWnPjsR
	DCYCyo9fwr0LTOit6APptvsu6xTHoUFmiIpXxRxoRL+HCn5KdMcmdOiaK04JT3RDEqF4TeY0dUp
	UAb/EZJXUU+jwneLElfJXC9kOS5KOUuWlCblOHDb5YVUBlzyXjDub/Yc0FADIx1FHh2qvdR/16e
	lkQHlZfGyX0lqjqx4zVsGHXkgXNMXrde+vkhGmvwH2bc8BdBguSQRheG/z4qRkOrs8mI9K6eLG5
	xb8nFZbH6jvEdfaAu+idMB7wCELn/Q4nJVhuku4Ks/SO6h/K6WddhUiD+/THL4msUGrP+t15IRH
	BScjzgQkK9BNModwF4bpLwJmxr4j0KJgxMUjMfHi2I3ej2pmyIlA==
X-Google-Smtp-Source: AGHT+IF87Of2xq3NRiXHoW9YLLU17xS9MSG7Pyejbfo/XW5RRV/9hA3ItGRGycpv5nRxS4fk6hR8OA==
X-Received: by 2002:a05:600c:888b:b0:477:73f4:26b with SMTP id 5b1f17b1804b1-477c5e8f119mr2244225e9.3.1764000122272;
        Mon, 24 Nov 2025 08:02:02 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1e86b3sm239817465e9.6.2025.11.24.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 08:02:01 -0800 (PST)
Date: Mon, 24 Nov 2025 16:01:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, Qinxin Xia <xiaqinxin@huawei.com>
Subject: Re: [PATCH v2 3/4] drivers/iommu-debug-pagealloc: Track IOMMU pages
Message-ID: <aSSBdu-P-E75-_iY@google.com>
References: <20251106163953.1971067-1-smostafa@google.com>
 <20251106163953.1971067-4-smostafa@google.com>
 <aRW6Tf_G2ObR__vE@willie-the-truck>
 <aSRRizzS39jI3BjH@google.com>
 <aSR7U4pI_mYryFzh@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aSR7U4pI_mYryFzh@willie-the-truck>

On Mon, Nov 24, 2025 at 03:35:47PM +0000, Will Deacon wrote:
> On Mon, Nov 24, 2025 at 12:37:31PM +0000, Mostafa Saleh wrote:
> > On Thu, Nov 13, 2025 at 11:00:29AM +0000, Will Deacon wrote:
> > > On Thu, Nov 06, 2025 at 04:39:52PM +0000, Mostafa Saleh wrote:
> > > > Using the new calls, use an atomic refcount to track how many times
> > > > a page is mapped in any of the IOMMUs.
> > > > 
> > > > For unmap we need to use iova_to_phys() to get the physical address
> > > > of the pages.
> > > > 
> > > > We use the smallest supported page size as the granularity of tracking
> > > > per domain.
> > > > This is important as it possible to map pages and unmap them with
> > > > larger sizes (as in map_sg()) cases.
> > > > 
> > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > Tested-by: Qinxin Xia <xiaqinxin@huawei.com>
> > > > ---
> > > >  drivers/iommu/iommu-debug-pagealloc.c | 74 +++++++++++++++++++++++++++
> > > >  1 file changed, 74 insertions(+)
> > > > 
> > > > diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> > > > index a6a2f844b09d..0e14104b971c 100644
> > > > --- a/drivers/iommu/iommu-debug-pagealloc.c
> > > > +++ b/drivers/iommu/iommu-debug-pagealloc.c
> > > > @@ -27,16 +27,90 @@ struct page_ext_operations page_iommu_debug_ops = {
> > > >  	.need = need_iommu_debug,
> > > >  };
> > > >  
> > > > +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> > > > +{
> > > > +	struct page *page = phys_to_page(phys);
> > > > +	struct page_ext *page_ext = page_ext_get(page);
> > > > +
> > > > +	return page_ext;
> > > > +}
> > > > +
> > > > +static struct iommu_debug_metadate *get_iommu_data(struct page_ext *page_ext)
> > > > +{
> > > > +	return page_ext_data(page_ext, &page_iommu_debug_ops);
> > > > +}
> > > > +
> > > > +static void iommu_debug_inc_page(phys_addr_t phys)
> > > > +{
> > > > +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> > > > +	struct iommu_debug_metadate *d = get_iommu_data(page_ext);
> > > > +
> > > > +	WARN_ON(atomic_inc_return(&d->ref) <= 0);
> > > 
> > > Is it worth dumping some information about the page in addition to the
> > > WARN_ON()? That way, you might be able to benefit from other debug
> > > options (e.g. PAGE_OWNER) if they are enabled.
> > 
> > These WARN_ON are for overflows, which should never happen.
> > I initially thought about using the refcount_t, but it didn’t seem
> > suitable as refcount_add() expects that the refcount is already “1”
> > indicating that an object was already created which doesn’t fit
> > in the semantics of what this is. Similar for refcount_dec().
> > 
> > In the next patch there is a WARN_ON for the refcount check
> > to capture the mis-behaving context, I will add a debug print with
> > the leaked physical address in that case as this is the important one.
> 
> I was thinking specifically about calling dump_page_owner().

I see, that makes sense.

Thanks,
Mostafa

> 
> Will
