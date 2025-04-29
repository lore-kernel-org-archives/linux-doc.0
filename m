Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E387A26E17A
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 21:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962521; cv=none; b=bJPHgai3gKfY6AXmppQtvDw/spG+HAbfuELtZmrMVXl7pDwRsjIZTjGIQO3pMJujuEe2pEgHyO2n9V924PwxX1U8nldc5csu4SSYJlDFruCjZaZYVnuE2WEImlYkr9LH2ybZj5Hr9RnWQPTBSUb34AQXXjtm+1Ln32q/mzKt4Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962521; c=relaxed/simple;
	bh=JFtp/04AN6971ALn40g4bC8CVWUHKgt3AbR5wojCJVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3LNrHe4+EcV4Qrsj1L7ijwAjZVFMqu3b4jdvJ7h2+DA0GAf/Ss5VT6oPrlLyZ4rJ/JLUjbgE24w0xydArRysWxyFcy/9KV6jDnOCcO9eJeaUbyALbsRqYtUOjnUcOvc4cQ88Xq6uHA7aLWGnq46nxKKHwkwJs1zRlNQHqViKwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z+Q9eO8x; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z+Q9eO8x"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240aad70f2so240365ad.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745962519; x=1746567319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mpYoUff4tpb7ZnYnv11tnvX2uEPBYr9ascXUqkCwOTE=;
        b=Z+Q9eO8xeLCUuo/zkudd1dLWzxcNVjezyNiWJnWo5t2NBqP2/gndruzvGck4whmIpf
         3F7EWJq3FFBl9hBOUZ6HKWb/W5eYowm7m9AfwjHzAIjH8J7WYRkOf8ga8xJEJ1B48knM
         2oBZ4gSsPJkWa2hDYd/D6lHKh+M6zVIiPBOQAyFMM2Ckqjg0vonp0JuxudO6qK064UmE
         rrDC29NTut3AJvmXvbOdvOxVwz2dwZkVaim0E6I5vqI4ORZjMVeeN3Su0AMd/XreXuc9
         33o0z31VlRCe1zcCHkLbgmelIsrI17mvFsQmbkFTH/8lfJzaJvs8i3jS6DFXNGR9vG9/
         /9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962519; x=1746567319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpYoUff4tpb7ZnYnv11tnvX2uEPBYr9ascXUqkCwOTE=;
        b=s8CCNpG5lvVVV7r4soQf45v/kXcdXvATMAcqU88pl8nBSMGfmYXRmEFbCg61fuSLC1
         0Cit1D2OGL/Bh2hU0afvJIPidCa22oqwaTktziMYFPAZlw2qoJepX+XMbdW3NvhmYep7
         U0NLt/S+Bm5R6U+8zP9/v2XmgHa9X3t7WtGxjmZJLe4YxyVpQX2Lf3WokfAR/LUkfkN/
         VzkUd/dBOzeiH6OIqO09+Ip+mq8WbrOcWnf7TAmEs+DARcnvMIBfFVsmLscepW7WXHg9
         EMILVQKP66mXf/2OLQGPhzKK9ivVXZiAOE0bHR3iRIf9w4wzu1Kp5PB7Ed5/9x+lO2ES
         iHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Jys5WiPgEGZb0d79cT3HzoTOnYWdLP8VJx8KJ/QLthqc8x5IoZ57KXJnYM3D5Cgfnx9wHdgkTTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3bcAHanSdZ1OLTuK4poi7Xu30xYEHAUjVIqLzqm32YnGcnGJK
	WM7qoGygU3cnSVSeGt/HbCecjMgurKxQMkmmr1LMHxLkChSroLyqt8sgoZJjiQ==
X-Gm-Gg: ASbGncvKedIPveb1RJMhUdnPd7zo4IrAvp/Bkw8IDqBGKuQyMw/bSZO4/o7pQg6ItaP
	pvyKDmiUM9/fEoIF+fhsOlWfCm4Z+rVGzliAllXwuFBWM5N4mxna7BZ9d8zgOm0eJj5GriBNhPp
	HWwzQ1aIbuo0o1RDKdjRJeFnWRtirR9hpubXYoIBxeW1ER1HmgomMg4h8uD+fPpni3mvnjCMMdO
	K+FBi3DVUpwurNZ4s0iSAiqg6FQopJYgE4dgmPpV3M5V+9EtCeekw430yzJA7opVnyQ25vIjRfp
	BS4np7h6f71jBdVImYRUcBhKOHJhPOzfjtMzkp0TV1oGcwiSH2d+K0NZf10dwbVdnElt0uqJ
X-Google-Smtp-Source: AGHT+IEiAc8Ows6C4iR4kgPCFAlWxuerupIBpLK64UuYqayp18C/qOLe733Vqo0YiAcQG8JFaBI7KQ==
X-Received: by 2002:a17:902:f681:b0:200:97b5:dc2b with SMTP id d9443c01a7336-22df54469b2mr228275ad.15.1745962518918;
        Tue, 29 Apr 2025 14:35:18 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f08csm42489a91.39.2025.04.29.14.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:35:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:35:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <aBFGCxcTh54pecsk@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBE/CD4Ilbydnmud@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 02:05:12PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 08:55:47PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> > > On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > > > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > > > +	struct iommufd_mmap *immap;
> > > > > > +	int rc;
> > > > > > +
> > > > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > > > +		return -EINVAL;
> > > > > > +	if (base & ~PAGE_MASK)
> > > > > > +		return -EINVAL;
> > > > > > +	if (!size || size & ~PAGE_MASK)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > > > +	if (!immap)
> > > > > > +		return -ENOMEM;
> > > > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > > > +
> > > > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > > > 
> > > > > I believe this should be sizeof(*immap) ?
> > > > 
> > > > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> > > 
> > > mtree_load() returns a "struct iommufd_map *" pointer.
> > 
> > I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
> > "size" parameter, which is being passed as sizeof(imap) in this patch.
> > IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
> > sufficient for the given "size". 
> > 
> > Now in this case, "size" would be the no. of pfns which are mmap-able.
> > By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
> > for a 64-bit machine. Whereas we really, just want to reserve a range
> > for size >> PAGE_SHIFT pfns.
> 
> But we are not storing pfns but the immap pointer..

Ohh... so we are storing the raw pointer in the mtree.. I got confused
with the `LONG_MAX >> PAGE_SHIFT`.. Sorry about the confusion!

> 
> Nicolin
