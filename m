Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46F38737C
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768242445; cv=none; b=cigWsiZfRtUxeTcz15sYdPUKtjZT/9Av7IVPrHIl5NTtGvwqYtEuyxa5yms2cTUdkxQMU7ZJS0dJrBO7PzyxclN4m5b0kXvebITX4nA1FLBSTika9ZS3DoFYrfnBQlds6irzmI+YyDsq3g4EFTrf1V3KOFtDlY6cMOh7RsLssEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768242445; c=relaxed/simple;
	bh=shf+2pFJKpTQXDUXGMMTyC3s2OFfrjtsyGwPASB1HGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/wTLW0VArqmm+lv1iXoOvOq8CE9H32Ug/GZ+QkuRChi7tBC/x4b60zcav4SbRVFo9Q2ixIVG3YT0mmejfT8kzPoDBVabkWDWFfzfV6rH2rphGW7/ohNFK+PlwfHpFFu/90duEztjwB/b/dIqfH8i9LqSLAqEXdWyGFnif/O2YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=UR4BHGHo; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="UR4BHGHo"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4eda26a04bfso81648621cf.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 10:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768242443; x=1768847243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5cR4YX7Hi9OUrcU/fLtOMjymyJE7wlwEn/EL+XWyumw=;
        b=UR4BHGHobLLbEf1L5CwXd3u9Ac9NF7LzZmzRN07pOBF/oQXaoClGkoVxs51ApijxcV
         5jTkh700IsMFMBnF82WujaUPliQF/Q3vPWd0v2HX49eTirmEiXndwc4kdpvGOVeXxJYY
         fmWSpbK+RDTOzP6dvIWNiP3VlmXhDtZBmcrlZSU9+BstgwKiBzZs64Fe2wSUiG0+zDK5
         jlsV8Ly6qxS59jNKVmVm/pF8/25s3ktDJ+PqXImGzVfj5VvefEx92OK9A3APV0JoZv8E
         n1yA6u+0pEgveV3rGM5ryj2K/vQUwySlwQyj5gAjpFyJsHzuKoggsdS4/Fc4n8NVOrIQ
         IWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242443; x=1768847243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5cR4YX7Hi9OUrcU/fLtOMjymyJE7wlwEn/EL+XWyumw=;
        b=BUOalOc+5VYoRgJAuJzzzvi19M2M2cs5tq0KftvNp6qQGXZfJZ+79R32qgJzVxzyCU
         CNdDvzSErhxppnOrXUQeIC231vFD/susqLMni60bkbOI3GUv+nQzis1SLORDD1VCBv9l
         f6o5J/G0CZGWodVTINlINJeR6SuVOpgIXpvIZgHjz+m4k3Ip1LC2j0HjaI7ZGcTgl4rj
         P8NoylCvei+/+WRtsvhv35IpyOMM+b1t3AKec1EAPmDHEpC8C0USGNIE1rrGQYEYSAwv
         FdCdxZKFmeUgjhnDFzghsVEyX9MwYucy6KEA/ZcTSUk2XVHnxAmD7kCBOE9Z4xUipYoj
         zAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXez4E0wnIQ7HeqgwYnmtg5YwQG+lhQN3EfGJEioyIRfyhkLhb1i/VApNQRu/VSvmNHDhCQPFR4wlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJC1yM0r+zumjwXHdRPLaFArc1XJwQNtb4M26t0Q1vNJkvGtD4
	uUpicmiaHr+veEu+MHzrIZnjq4/xEqH4dVEBRJ+sEqN5FLg+/6lQj0wZ7xEfcxmzLY4=
X-Gm-Gg: AY/fxX4ok7wl5RSJ/m89faJf4lNkWtN+HFRExUVR8ftzjQyxqbMkioVfqHIS/kIuSAr
	Erj4PPxTxcDvDAqymjl7LBAdk0BgU/7wuFk0+XHGa2W2aCEVTLLRSElszoiPFCfscouTjO9uLEI
	pskzhUisVIiNY9vIVXex4r88sCbhu48vbmwfOBBsGunqX6HI3RzRJUrV++dk0uhL3+s5Yg2pyXe
	F/iPVVOqom+WexYDxhkFzkQEYvwNLb7dyqoGv49jwv5HhewE9cnrdNG24BatgxLpdwj7muh0l8X
	IesfZBWyKoBTD/UuuO1DuC81E7gs8niV3cZkHjuUUJgIFWPbpsjgB629qJN9LQ16/TcADbxYc3v
	2W6tNJWdfDx2gPm80m1vcUFP6CuupAQ1VJsn/s01SIvbg/7VY9dNV2FETFmOJgQIAu0SNxU6nCe
	7BXGAdoak7MRw+FDlwxBaBwpake/E4sJ6TvlidnvBTpd3spKF++avv3r4dfi8b2/Mpc8Y=
X-Google-Smtp-Source: AGHT+IGVmZqeY1PHuUlU2eCkElvqVfhg5QPHXOe+taJKVCxnMmnVYd9cOiuxymw5goLJl6+Yj9TZrw==
X-Received: by 2002:ac8:5f8d:0:b0:4ff:c680:1076 with SMTP id d75a77b69052e-4ffc6801d70mr196421351cf.7.1768242443368;
        Mon, 12 Jan 2026 10:27:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e6ce5asm130263131cf.33.2026.01.12.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:27:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfMdO-00000003Sgx-1Vjy;
	Mon, 12 Jan 2026 14:27:22 -0400
Date: Mon, 12 Jan 2026 14:27:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <20260112182722.GJ745888@ziepe.ca>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
 <20260109195111.GQ545276@ziepe.ca>
 <CAFgf54r_au6isA10Nrve=MHL455X=tKhNsSwH1ej-TX08J3xLA@mail.gmail.com>
 <20260112133256.GB745888@ziepe.ca>
 <CAFgf54psxPrsvujStPNtrzxiKOsJF+aVrN7BcNxxmAF4wDmRXA@mail.gmail.com>
 <20260112135208.GD745888@ziepe.ca>
 <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFgf54q+9Y5TtGJDB=8q_BW-0F=TM7zBbCcMzvtvr_N2WMnd-w@mail.gmail.com>

On Mon, Jan 12, 2026 at 02:58:47PM +0000, Mostafa Saleh wrote:
> On Mon, Jan 12, 2026 at 1:52 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Jan 12, 2026 at 01:43:41PM +0000, Mostafa Saleh wrote:
> > > But I don’t see why not. from the documentation:
> > > /**
> > >  * pfn_valid - check if there is a valid memory map entry for a PFN
> > >  * @pfn: the page frame number to check
> > >  *
> > >  * Check if there is a valid memory map entry aka struct page for the @pfn.
> > >  * Note, that availability of the memory map entry does not imply that
> > >  * there is actual usable memory at that @pfn. The struct page may
> > >  * represent a hole or an unusable page frame.
> > > …
> > >
> > > That means that struct page exists, which is all what we need here.
> >
> > A struct page that has never been initialize shouldn't ever be read. I
> > don't know how that relates to page_ext, but are you really sure that
> > is all you need?
> >
> 
> AFAIU, if pfn_valid() returns true, it means the struct page is valid,
> and lookup_page_ext() will check that a valid page_ext exists for this
> entry.
> So, what is missing is the NULL check for the page_ext returned, as it
> can be NULL even if pfn_valid() was true.
> 
> But I can't see why we shouldn't use pfn_valid() at all in that path.
> I don't like the approach of using the prot to check that, as the
> driver can be buggy which is what the santizer is defending against.
> If we find some CONFIGs conflicting with it, we can just express that
> in Kconfig and disable the santaizer in that case.

That's a fair point.

How about adding a page_ext_from_phys() kind of function that could
use pfn_valid internally and has documented semantics for what it even
does for "holes" in the page map?

I'd be happier to see such a well defined API than randomly adding
pfn_valid() and phys_to_page() when we are trying hard to not have
those things in these paths.

> > That's sure looks sketchy to me.. Eg if CONFIG_WANT_PAGE_VIRTUAL is
> > set and you try to feed a MMIO through through that kmap() it will
> > explode.
> >
> > KVM can argue that it doesn't work with CONFIG_WANT_PAGE_VIRTUAL but
> > iommu cannot.
> 
> WANT_PAGE_VIRTUAL seems possible in loongarch which supports KVM.

Yikes, maybe that configuration doesn't run KVM?

Jason
