Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A59268688
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960161; cv=none; b=rQ0ZdYCfOmDiwQH71MOjKKFBsad3g2ul1n91TCxvKScISl897502VhFqN43f/rAZUWg4J3YPXDtQdA8+IEfecADFdJfRvwYnZ5KsvQi8hwwcjkzJ5gDQpv7gvqOG0LSfJUmsWCi66doiu7sYG7eAWsNP7engvUkh7g5+i7WoVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960161; c=relaxed/simple;
	bh=7mNKgw7B4gWkWk/1cFhoOBWm42l3r4EBHfns+bKE79Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhJbvx6YcvEkHLbpoXsyAKFxbrGbD1haxodnf3pY7PR2ffbyBJbGCTpQ8qMtHG/j8W0Xsg/9T8eGcoq5MZc5ouI1g8mNIGaO/SHQD9iAyF1fy2FDB/nfXbLEriNPSqfW0YveO5vr+LqlA0nWOxTmLu0bIjfBGAd5z8ACOBZYAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hVhP0LyU; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hVhP0LyU"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2263428c8baso75285ad.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745960159; x=1746564959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=hVhP0LyUibP6cW3zXWRv/u6XdVRHP6JsX/RF0qX8E+1TjZg7i/my2TfNL4JfFyR5W8
         Ll1NZAC2aSDclzNK7E0faPBF1pVTaLla5HPNPUbnfHHVAmCIpskR9UzL31DnFMOi8I+8
         Hro/jCy2oo3sZIIefpzvTF3wfMY+dAo6ejcQBkdKBxHcmTNjBYWTPRmTj3xuP2daPe9O
         p05Jdg2PcQYhRazrk0DzXm2pUq7SbV3EOks1tdO1BJnKWHa0GQ7XloMpEvXIsODKySff
         szatQaN/F74IsP0AEfjVXxkbMly2Bw6z4nBkISXoSGQHIBVLkliv6JYYdeyKmftoVgU3
         aMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960159; x=1746564959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtvWyMaXoETtgU57TiX3zqHKqBuRh1/oEuSWwfTYD+M=;
        b=NgktBoHynP81apYgQtPiDyw1rnYXEXzn6zNNKOLEHZjhU0YY1OwwwYI9D+WWJsRNkM
         emlDY6ICzyFRnScyU3rdRSXUKbFFVN8gIaClibRTbNP9l4+GT5IRAUrrOBtu4p6qmGsj
         cPYUJtkqOFK5CLX3AVbaucHPQ4AMOluGKxdL44ZEiXb2fKAypNf91NgltNi3LRd+jlyY
         HJGIiLE6LNRoblH7coebRZFb1x6spYLoGzjj8I+Nn+GSpeBAlfm8KImRfvnFeFDjwTpW
         ph1e7ajRbyDfbrTXK7S8CpFb83+oSJ8ZACJ55VVBQeT1DR5AZTn2joS9KirHaaeoCHW8
         jWzg==
X-Forwarded-Encrypted: i=1; AJvYcCXgLPVzaax867x7PAqBI1iywsaq4aglbE/a8KYB5z1lSamA6JlSA2S/kFEAUGNk4I+uqlQBSQq9Zk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyE8AAVetKyZxhes3xK8FAqfsOvxxOgpEakVOC1TpQxGbEMnY
	WRHgFhr5+EH730nJh3fZAiP0oq58ka87srAmT6Qbn+pshDAkkrYYAQhfithyuQ==
X-Gm-Gg: ASbGncuFWWA6VRGfTOoukeuiPLKfBNjzU3LNSQB/30bsTGBo+czJFsaIk5T+6x2aXBH
	HE+iCmSsfIs5nqAZX0G7BPA/XX5wTCoyKzZnxQZqC0RwvbJAUt0Oo45FoB/QsTQV4KXfvwbTUpV
	HCkekDbNplypJ4U2R4At8kYGlDui5GKN7IakWn1uykGSz1MJHX8GiUu6Pxypbfu16Yo9w4Y1lDG
	5/Aa+kEmSu5I7gZReukDAbg5Llm3pmEpfQAQxF7mdvg6irA68tky+MFbvMWJVuBjYR/Bvvf23wF
	pNII+1f4DByituzKmA2Ui7/nvjlOHtjIyAAH/LbI5AM7hX+UGqS0ozZsUOR4PQ1K3OOAShGl
X-Google-Smtp-Source: AGHT+IEDLG3SJps6W1WWtS+Z1B6wTQS34GYl+OTkQIvhX6qglLU7EkbEpqx51RkV1YpDBN8wRt1Y4A==
X-Received: by 2002:a17:902:ecc5:b0:21d:dba1:dd72 with SMTP id d9443c01a7336-22df545d1d5mr63705ad.15.1745960158589;
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52168b9sm107756155ad.226.2025.04.29.13.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:55:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:55:47 +0000
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
Message-ID: <aBE800DsAOOZ4ybv@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <7be26560c604b0cbc2fd218997b97a47e4ed11ff.1745646960.git.nicolinc@nvidia.com>
 <aBE1gUz9y415EuBQ@google.com>
 <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBE47aySzDp2lsAz@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 01:39:09PM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 08:34:56PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:24:33PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:08PM -0700, Nicolin Chen wrote:
> > > > +	struct iommufd_mmap *immap;
> > > > +	int rc;
> > > > +
> > > > +	if (WARN_ON_ONCE(!immap_id))
> > > > +		return -EINVAL;
> > > > +	if (base & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +	if (!size || size & ~PAGE_MASK)
> > > > +		return -EINVAL;
> > > > +
> > > > +	immap = kzalloc(sizeof(*immap), GFP_KERNEL);
> > > > +	if (!immap)
> > > > +		return -ENOMEM;
> > > > +	immap->pfn_start = base >> PAGE_SHIFT;
> > > > +	immap->pfn_end = immap->pfn_start + (size >> PAGE_SHIFT) - 1;
> > > > +
> > > > +	rc = mtree_alloc_range(&ictx->mt_mmap, immap_id, immap, sizeof(immap),
> > > 
> > > I believe this should be sizeof(*immap) ?
> > 
> > Ugh, Sorry, shouldn't this be size >> PAGE_SHIFT (num_indices to alloc) ?
> 
> mtree_load() returns a "struct iommufd_map *" pointer.

I'm not talking about mtree_load. I meant mtree_alloc_range takes in a
"size" parameter, which is being passed as sizeof(imap) in this patch.
IIUC, the mtree_alloc_range, via mas_empty_area, gets a range that is
sufficient for the given "size". 

Now in this case, "size" would be the no. of pfns which are mmap-able.
By passing sizeof(immap), we're simply reserving sizeof(ptr) i.e. 8 pfns
for a 64-bit machine. Whereas we really, just want to reserve a range
for size >> PAGE_SHIFT pfns.

> 
> Nicolin

Thanks,
Praan
