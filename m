Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66079243958
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759772456; cv=none; b=B9D8ERSCIxKk64m5L38UiBPZlNDys3SJdJCtqBfxspfSBj+yXjc4k0utZZVGsl94ZlMqlr5IhfXVxU/2VHvI10YVRrjMFFX3GGACg54Z7RPGttED4mowb0GJaBBBb25DGN/5F4caVTelTrc11tSpZ8ZdZVvXmB8mOEMEMP7Pp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759772456; c=relaxed/simple;
	bh=X3oGisebRlN7TGv9fnOE86D7EABh68RcxwSctp4usVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXQd9Y/u7XAUNBOgkhzdi6QYxyvLl/cKNGlAVUdOchISkUem0qLn0Szvr1ITIyk2YvoO5nPRKRvfnOVexW7+Blt5K3w45dQTay3Hu/PX/Txj4TtGBShGTIisl8O5HBN615cdRN85iP1Sv8tmfovkm5ujkUgBlG/19CERWaa4XBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sOHxDoxR; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sOHxDoxR"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-86be8a110f5so55378016d6.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759772453; x=1760377253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6zbU8nkw6qlp1oRKT9kqkgJqrXveHjdID6Q3hkDONE=;
        b=sOHxDoxRzP/MGNAS7cyvaa5yDvy3UQNZP4G5F2ZqvH0HyKUw6c4cZSsPC7VLh8j8cq
         y6yLAyMFW+zb3gb1WFzSeLhnEM9Grii/MJNbqpaBKB7+f0GZC2vIYvsdhn5fHhjnrnKD
         U94ulnK9JixQAufAmlP9+/ORWAiDDKIOY0rG5nzuuGqQ9hQD/Dc+MFBH7AO7dHWur5uk
         7GeA53NO1LYYDpRaflILstXkuPNU/zcRnBmHDdjoy1O9jWplKihsGinCuXXl1Zxst7oE
         bfLvd4CgINO3+6XYQSl5oZ0TQoB8uYk0nIcE20/7Ca9HWkGXFpqQJbElAXtioz864eDy
         9jGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759772453; x=1760377253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6zbU8nkw6qlp1oRKT9kqkgJqrXveHjdID6Q3hkDONE=;
        b=G/Yz08HISDpIhfgg3meUqUcUkctGaJe+0aAGfrAsTPYcTwS4YhslZ5X82xxehA6OiP
         RepMWLSxQqFLPC6ggy/O/O3UE6fiDN2NEQovnTot6eIuLwKmm5dP41kJecDquGPie77u
         SYcqmQ0LZ1da3GCgjoJ7uf+wwneTJKX5K8I7uakcZC0D1zZWF0si89hny+nRRd8/jFFq
         KIAaYzzaIyQrvzPMsarjYwWOfEg0H05XW/2h6u/ZIxtI+4o9eqMw1V63btm0nyUvfhb3
         mOp6idJei49NX+uLpW442oaUytTZ/F+RihwhbA7IHLxGVOBlS+7GyZ0uTyi8m9GF9ObZ
         yB3w==
X-Forwarded-Encrypted: i=1; AJvYcCXmXhnyIBUnehQLlmNm8fEkBbN9D5aoVmpzNyVfVtY29bViL9FuUn42FMdoLftS3Wxke0/Zo9mvZJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXI9t8In1rLsg2A3xNa/O8MJmGoahytZTHd8k2os8GxFmnAE50
	K4YRhDCeUgJKAQDhcsoJbgUj90QBxdQkZ3fxur3IZAJCmdSpkOWAPCsFSxWli7Rm4mo=
X-Gm-Gg: ASbGncvT8d6fpX32tch9b4pxe3honJ3zDPHIQOYVnuzIN9kLaV6g2G9kjWyTNkK+tZK
	kQ5JlyOuXqFJrlYoUh+udPilbwLQzyc1t5JoOxsmxJwOLxdlfkj6lG6G4h8qyFlX6/781ag1USJ
	VgyvIl0vUec+YQjpquyj0ZSshrnsTiJMMz5lBiZDUHbFcHTu+CjWejoQIbUTM/F+KavLdAT0Wou
	Mf1ohdjjbFCE4cF/oXQkHmbiThnkd6d45MVNts8XRlUjuQq2zxpNVKprXdPUrlWH4uLm6eKqfdO
	6MDwVyswrQVatYl88nCvttkhmx+/zg4pg3E1XKI6aZOLxgTMF8wKP7H/YjY7qJIfrmc+Ni3hd5g
	WrseyG7uWpFwbmm1fc/4wjOefjcqgJwL6kk3WJmPmptsePGO0Q6FN0URZL6t2m8T3O2SGDnw3Ys
	Gvk9yHrx+LmvYOWWbimrTul3W2MoZYMQ==
X-Google-Smtp-Source: AGHT+IHL82cO15eHplVrd1kOv7KiCQ0/gvt1t2zsTkhJijBzgWb2+lG9R/9BD16PD2C7Tq5jYtu/eA==
X-Received: by 2002:a05:6214:5f81:b0:879:dcbc:8ce4 with SMTP id 6a1803df08f44-879dcbc8e21mr144530546d6.52.1759772453210;
        Mon, 06 Oct 2025 10:40:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878be61fb91sm121659976d6.60.2025.10.06.10.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:40:52 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:40:50 -0400
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
Subject: Re: [PATCH 2/4 v5] cxl/core: Add helpers to detect Low Memory Holes
 on x86
Message-ID: <aOP_IobeHXlUPnle@gourry-fedora-PF4VCD3F>
References: <20251006155836.791418-1-fabio.m.de.francesco@linux.intel.com>
 <20251006155836.791418-3-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006155836.791418-3-fabio.m.de.francesco@linux.intel.com>

On Mon, Oct 06, 2025 at 05:58:05PM +0200, Fabio M. De Francesco wrote:
> On a x86 platform with a low memory hole (LHM), the BIOS may publish
                                        ^^^ LMH ^^^

> CFMWS that describes a system physical address (SPA) range that
> typically is only a subset of the corresponding CXL intermediate switch
> and endpoint decoder's host physical address (HPA) ranges. The CFMWS
> range never intersects the LHM and so the driver instantiates a root
> decoder whose HPA range size doesn't fully contain the matching switch
> and endpoint decoders' HPA ranges.[1]
> 
> To construct regions and attach decoders, the driver needs to match root
> decoders and regions with endpoint decoders. The process fails and
> returns errors because the driver is not designed to deal with SPA
> ranges which are smaller than the corresponding hardware decoders HPA
> ranges.
> 
> Introduce two functions that indirectly detect the presence of x86 LMH
> and allow the matching between a root decoder or an already constructed
> region with a corresponding intermediate switch or endpoint decoder to
> enable the construction of a region and the subsequent attachment of the
> same decoders to that region.
> 
> These functions return true when SPA/HPA misalignments due to LMH's are
> detected under specific conditions:
> 
> - Both the SPA and HPA ranges must start at LMH_CFMWS_RANGE_START (i.e.,
>   0x0 on x86 with LMH's).
> - The SPA range's size is less than HPA's.
> - The SPA range's size is less than 4G.
> - The HPA range's size is aligned to the NIW * 256M rule.
> 
> Also introduce a function that adjusts the range end of a region to be
> constructed and the DPA range's end of the endpoint decoders that will
> be later attached to that region.
> 
> [1] commit 7a81173f3 ("cxl: Documentation/driver-api/cxl: Describe the x86 Low Memory Hole solution")
> 
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

lgmt

Reviewed-by: Gregory Price <gourry@gourry.net>

