Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B021ABC8
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 18:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949807; cv=none; b=pZ7csLmwEgAzSA0qX7B0lpg7am9C2/FK9v09lWbz3e53AIkzsqswVWoZLAV8rIi1cBnhE96WHX4YD9SF7gAI8HBc5YXbbin0sxRjO+mXy/H0D7Zy7l2bOJQ4vn0OabLNBsWEJCxdIK6zP1pmm+HLPDpz25EsipLuKXrAKVRYjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949807; c=relaxed/simple;
	bh=/jKxrEccc/rxDV9flEdrkcq0R1bjej/EwSVckgQxFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIzxRr0eM+OSCKqA8bXwlNSC5IvpFxk+t+7ehBxRVauzJenuOqR090k3KRxCq0J/Hx7N7gbfoLdWjlXzH6CzhkY99J8D6Q0WQpzNaKtpPkOneGRSsuR6/WeJFiLjm28hp4X2V1+Z598HA/TASXSVK7SnBZsxpz+EHu1myYwCqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XJyFIw0W; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XJyFIw0W"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2264c9d0295so199275ad.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745949805; x=1746554605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=XJyFIw0WqXVVAB5105nnJ5HTLB/7M1krQYJt2wmsl61Cd9y0y7gQJ+hc266kTjRd98
         GA0dZUH8IPjFpB3xeQrXG8DlIKm2Bw9OCVzJKXC3xUC2sF9mKKgmHjkvGtoTaNHjcg+o
         gSN7JV2qfCr2sxAiJwbWozNlOYk41EazpNghNO+h1mbf55TfrJ8RNWzqPoGaMQV1LQpA
         FcEvAAErdi7el76+xtKu1MHu0Qa9UY/flgM19bDvr2zHJQc+FD7FqwUraTOX71XrE4NJ
         mOZF0ISLWI7ZXbywlj1Aq76hGnErag9DgkrRj//koa3ZvJvW50bCF6WxbfK+6kFnaeNq
         Yb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949805; x=1746554605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gO38QVftzp7foJd8AqWRzdImXv3oAewp8XDWFfWfG4=;
        b=hxXk7fyFFKsim9Wzn0+4aiYjfct2TOrSewWbf5QS5yZ35Zd7j84OpKPozzNQQnEMnZ
         j2X+SR3CrWvGZNU1Xs2XZ1isn5Eheu+epKe6RI3e7nGEYj2/exFYyGyAbB0hqN7isH41
         FAugXuK0vSQh5Ron12Wq4sBHLt44Fsyz13aEZVJrnc9t42WiX4bxO6Jpfb0Z3y3NMbIb
         MSqqbFGAxfeZAGZy64So9WY9OcENOZOJaZFniKh6BOkV3i4yNVRCz9QL58teJHjWeqJI
         2Y4G7mCyqKHVg9S9HIZOHgBRdtoJrd0bRD9SHiRKQRL3YMhCG7SvYPpjnQeTMs14qHJD
         Z7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNwkCvrlo1FrBUjMKtNG40aPuFyXVzzkVN3pwG9HoBTpXx21r+aWHHKIgVjqYOwJ9Nx36YF51Mg4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQXxtCKLVEwLZ2WInnmll1vxs15gYKuLVDgI1TfWIkqmUkzRS
	rbLPnUFIlJONz1bho7hvz68VyCpmi+Lf5MS5WUxgbYde4UPp4CYj39oljNa4ww==
X-Gm-Gg: ASbGnct8Xnp13FLAvoajiWF9oFoql7JGyCm5aYOUlw6rGYBH/AW8/jw8NQ2SyAYqdyd
	syUeheAMpEZscF51ZU6Dgz1A18i+hylvmbh7fcMOYvBFDKfFVzT8oitk0lG7bOqGDpr8hhCYxuq
	H+ATbwy8Ei/X0f3eAb4EPtYM0GZb5yryr059Gh/M3uLI/IMJVdbBBjkT7OCtK+7sk6HYfZDbj7e
	Anu1LJsv3nBY0NMHFNG5IyJRXJBIY8vrROI3rCGvag9MLiVFsI/9a3ueQV8c5WyrlR0XeJr84UB
	hm0J61zjHGIX6qz/nO3LNajqUJXdtlNRcCevxxWUMYXI24YXFIB/WTyp3UM5qnLvL955Fvla
X-Google-Smtp-Source: AGHT+IHcbHv78LbKHTcjYARgVuVMIU3PlvzwcFa5Mynrm4iDVnN6pnPgBf3EmKTpPOmaL66ic8Z84Q==
X-Received: by 2002:a17:902:f60a:b0:215:9ab0:402 with SMTP id d9443c01a7336-22df40757bemr145535ad.18.1745949804669;
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded711sm9272213a12.66.2025.04.29.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:03:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:03:13 +0000
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
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aBEUYdlCLcH70UlT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
 <aA_hm_AD4Xzm3qJZ@google.com>
 <aA/9TZq99TF+MRYv@Asurada-Nvidia>
 <aBAQdq0jeoCdKdsC@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAQdq0jeoCdKdsC@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 04:34:14PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 03:12:33PM -0700, Nicolin Chen wrote:
> > On Mon, Apr 28, 2025 at 08:14:19PM +0000, Pranjal Shrivastava wrote:
> > > On Fri, Apr 25, 2025 at 10:58:03PM -0700, Nicolin Chen wrote:
> > > > +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> > > > +		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> > > > +		unsigned long last_index = iopt_area_iova_to_index(area, last);
> > > > +		unsigned long index =
> > > > +			iopt_area_iova_to_index(area, iter.cur_iova);
> > > > +
> > > > +		if (area->prevent_access ||
> > > 
> > > Nit:
> > > Shouldn't we return -EBUSY or something if (area->prevent_access == 1) ?
> > > IIUC, this just means that an unmap attempt is in progress, hence avoid
> > > accessing the area.
> > 
> > Maybe. But this is what it was. So we need a different patch to
> > change that.
> 
> Rereading the code. The prevent_access is set by an unmap(), which
> means there shouldn't be any pin() and rw() as the caller should
> finish unmap() first.
> 
> In the newer use case of vCMDQ, it's similar. If VMM is unmapping
> the stage-2 mapping, it shouldn't try to allocate a vCMDQ.
> 
> -EBUSY makes some sense, but -EINVAL could still stand.
> 
> So, I am leaving it as is, since this patch is just about moving
> the functions for sharing.

Ack. I don't have a strong preference too. This should be fine, we can
re-visit this if needed in the future.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> 
> Nicolin

Thanks!
