Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52AE22A4FC
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 17:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759772788; cv=none; b=i+G3TxtQdXBE8Yk9g24INaZrI43RxHMzLTjsKFaZxKNariyifDDYCmNK8O5CAqvczWDObwUtyp3lvXFee7n0a0XThq5xoTlP+iY2BebfJ6gjj4cgB1S6ByE0b45kYaFsxpf/FiGFG0wTV4fcVtNu+9RTEkvWi2vuLAquzOpyBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759772788; c=relaxed/simple;
	bh=BGtlhNEOznmLiP8Td9R6UOdRpHKv83zIL/Fw14yz6Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqBOwv0KIE8fy0mdrreFf4lpu7aqAVxqjJ/N5C2HRzou5cZFY1Z+gdUUcnzTF0j/eIhwVDEihimITtBoWI7xFJrQJ+B9DZIthmWR1rddjuYmFcdoOY1xiVcimkj/i72wjkkx7UVgf5lQ7RieqOgjfvxMu6U+7l0EEMibHTejKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Azr4PsSJ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Azr4PsSJ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-856222505eeso578794585a.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 10:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759772786; x=1760377586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mV5BjCFzof/sFlEEwNlSlREaw9vi7GsMBGBoLtecLf0=;
        b=Azr4PsSJmwu73Gq7Q6Wypi5cfiPLOiVgHe62iNVFQIT2UeiPtoxrSH8FoKrDTsbNEw
         mDkG8AU/tCr0NBQaJn1zHy7eAxy/PCApRKyDMvQ0eOP6Od4zmwZN7KumzY+jdJBKGS4o
         /Ra74Jk5lMSuRpb9tNSDhTDbae1CXonczD3KAjtmweekGaR5WhuPqU/8zumVRK4aln4k
         vGTsqUM/RlU72NWhH3yJHqDKsNBakxrQAMKNgsGhy28aVa7eCKROl4Lv8fBLFAsM7U6E
         5ymnH62eP7+rBviiuIetXZLc1lJWfgZfpFGZd+2dm87edorWLYDCnqT9L57IGOUnk0Dp
         vi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759772786; x=1760377586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV5BjCFzof/sFlEEwNlSlREaw9vi7GsMBGBoLtecLf0=;
        b=fnBVY2BBEm1EcKvJSNHOGVUceC4edoS8D7VTr3UXloq4E3HME6lJYGD//gPhNP/Jop
         W7qsiyyaOuk7zzVCdD2LsBr50mAk6tZGvPdgO1Skj2PV5uW8S0U83U2/29I1ojSit8Zp
         SkOjU9kA/0ZwWkgscVZpomxY2zM/g+NozrLDbvZaHJCxeoZU8GaxSnvEQJhbRxjenRar
         jgloCqTnDu12WRwvXIU5pBHwNS86Nk/S/+ty2BYKVc99gpZNV1E1X2pyxFOB8t18T6bC
         fjWC9kME92KXI+lpj3d5ysPocOo4XqRp8I15B3OUw7103FSWAJ4Y7jNFOsczujE7hPs9
         k+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW/9Z8Eyjp2rtpe95UsYjZO4giXUsgOBXYExBQOU03vX47Xkidho4qc8dEg6nDkIlbo/hmBOmwNsRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAg046CfPKAlQsf8X2YehKhGiqVg7J691ZTm9v+yXsZL+6QJQ3
	3KhBZA385HpTq/687g2sKubSm0OHWeXh7Ca+S9cOO8u2kSiq4ECtyqewjmbwNx2l1/0=
X-Gm-Gg: ASbGncuPGfRVx5Ullnc55qZ6A/A/SYL9KRi3b8JrhpFunYn1Rx3hgGDRmDzqNrAwOLu
	ST8CqIKIG7S8xSXwQkaKEh7uOQ34n6DEga4CFthDUCr/wIgmkm7Yasgdbsb8FQv6eBQyj1AU/5R
	UjtewwIl1VRRTSBE4zEboJ46oO9nvlouMmm9NSQzsbk+g9TdeJmeE5MVPZ5nogpOlJURlH7g2er
	KqUURyz6uBvJEAjrXec/y9auyd1PUNoyuow2k4zyM+V0eXaY7dx37kdO03+OQ9JMy7rBFzFr4tf
	brFP5XUJahSMjr3pCBupL6sBIqVONeh8nXqlvfWGBZQQrVTMGL7JN5TONsOgwYKappyLYt22sFz
	yk5qR9wo+3WpzBG87RbU9B3WyacJvkQGcFeVc4wIO+sUZi94iWESszRgNe2jwP3R9po2HwpuEeX
	5/htkIxAAYUjoTh5KCpQz5JtRcSobhBhY1cGhe3mUy
X-Google-Smtp-Source: AGHT+IF/GPa4ozi9y7BOzBQqoUumY05J+0iFBW4qq7MNJrp4XZQ1zNaIlGSXGXlJSe7DbRBRRQjNVA==
X-Received: by 2002:a05:620a:4709:b0:85f:82c1:c8ed with SMTP id af79cd13be357-87a37cb2f16mr1907191185a.37.1759772785714;
        Mon, 06 Oct 2025 10:46:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877796a1de6sm1267593985a.49.2025.10.06.10.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:46:24 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:46:23 -0400
From: Gregory Price <gourry@gourry.net>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: linux-cxl@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Robert Richter <rrichter@amd.com>,
	Cheatham Benjamin <benjamin.cheatham@amd.com>
Subject: Re: [PATCH 3/4 v5] cxl/core: Enable Region creation on x86 with LMH
Message-ID: <aOQAb9H-wIxc6j31@gourry-fedora-PF4VCD3F>
References: <20251006155836.791418-1-fabio.m.de.francesco@linux.intel.com>
 <20251006155836.791418-4-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006155836.791418-4-fabio.m.de.francesco@linux.intel.com>

On Mon, Oct 06, 2025 at 05:58:06PM +0200, Fabio M. De Francesco wrote:
> The CXL Fixed Memory Window Structure (CFMWS) describes zero or more
> Host Physical Address (HPA) windows that are associated with each CXL
> Host Bridge. Each window represents a contiguous HPA that may be
> interleaved with one or more targets (CXL v3.2 - 9.18.1.3).
> 
...
> 
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Couple inlines but just nits

Reviewed-by: Gregory Price <gourry@gourry.net>

> @@ -1770,6 +1778,7 @@ static int match_cxlsd_to_cxled_by_range(struct device *dev, const void *data)
>  {
>  	const struct cxl_endpoint_decoder *cxled = data;
>  	struct cxl_switch_decoder *cxlsd;
> +	struct cxl_root_decoder *cxlrd;
>  	const struct range *r1, *r2;
>  
>  	if (!is_switch_decoder(dev))
> @@ -1779,8 +1788,13 @@ static int match_cxlsd_to_cxled_by_range(struct device *dev, const void *data)
>  	r1 = &cxlsd->cxld.hpa_range;
>  	r2 = &cxled->cxld.hpa_range;
>  
> -	if (is_root_decoder(dev))
> -		return range_contains(r1, r2);
> +	if (is_root_decoder(dev)) {
> +		if (range_contains(r1, r2))
> +			return 1;
> +		cxlrd = to_cxl_root_decoder(dev);
> +		if (platform_cxlrd_matches_cxled(cxlrd, cxled))
> +			return 1;
> +	}

Is there any concern for longer term maintainability if addition
match_*() functions are added?  Or is this upkeep just the unfortunate
maintenance cost of supportering the quirk?

>  
>  static struct cxl_decoder *
> @@ -3406,8 +3421,12 @@ static int match_region_to_cxled_by_range(struct device *dev, const void *data)
>  	p = &cxlr->params;
>  
>  	guard(rwsem_read)(&cxl_rwsem.region);
> -	if (p->res && p->res->start == r->start && p->res->end == r->end)
> -		return 1;
> +	if (p->res) {
> +		if (p->res->start == r->start && p->res->end == r->end)
> +			return 1;
> +		if (platform_region_matches_cxld(p, &cxled->cxld))
> +			return 1;
> +	}


if (!p->res)
	return 0;
if (p->res->start == r->start && p->res->end == r->end)
	return 1;
if (platform_region_matches_cxld(p, &cxled->cxld))
	return 1;
return 0;

?

I like flat, but I also dislike not-logic.  Style choice here, unless
others have a strong feeling this is fine.

~Gregory
