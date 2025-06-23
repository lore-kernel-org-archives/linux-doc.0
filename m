Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731AE1C6FF3
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706397; cv=none; b=YVm/c9Jzm0QpJanKYTsaL2nrl5i69EdOMznMiTtFRnjaeAQZvbHVn4/u9O5e46p7Gvd3gRC9bLSNrmH4tc4Ybjd5qrgkMe9x9jd6FRhrlajcqwuscizJ/ofdXxefjjM8ldaGnatGFU8or9eKoEhIzoeAlvCuRnhPU0Y5IbocPG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706397; c=relaxed/simple;
	bh=/KzjYP4jGRkOL8tv1XYhP6PhsnBHTBQpvSmWP9PLkkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4VGZQw+yzuEja0Gy6rWXZ8YO3hXJuPWfI6LIWW+K0MmsGYHe7DFRFAmqBrdnZQpOk80rF8eUx9kL4PWQbr51hQma7fgZxZWO8nNse5ViigJZvZKvFk8rvZFr78ga9qwSDPkv/FRyAa0JbDOvdwL2LvoqFB/1IXk0kuQrVT84Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bpvhanDW; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bpvhanDW"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf99dd567so57531386d6.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 12:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750706394; x=1751311194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc/yka3hfGiPDvvwtGoDtghN7JXKc2MnzeWxQ4J3bkI=;
        b=bpvhanDWrZRD4KArqodsP1nwH0JPliKlVjUo4dQFo8upKAgTyCVu5/XNHgiAutqk/A
         b2o+o8XCaA9p8OXqZVeyegeTZ6lULObDALj2vFnr5xsp1e6s5Yen9rt0AzJjCy2sBhPI
         34NO+MLFxyJplJ/MIP7sR5zAR6EeBq/VAfhEeJUNuB7z45/DWS5CiWtDQKLh2TjM7dxT
         RhxiX+7tguTY8clfb12xBKogkDhHNZ3cRiAeNUGY8nGg80z7+aH6XDF6ckXyrwkO7n5k
         SlOuGC6My5KTfOLATK2te1ZDnTixhj0n5r3RHeaoaULFzItObTutXQJdAo2Bi/TN+FvN
         InWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706394; x=1751311194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc/yka3hfGiPDvvwtGoDtghN7JXKc2MnzeWxQ4J3bkI=;
        b=BoMl/zP+0+FRbVwIsXv79GANCnpQBIuoSkyDmazVCgp6Azg0PD+ts/NC5kk4aqA8T7
         XPH9/G/hPsTOAHFYH+Gozb3k8bpzE2lDksCCOwvd1enmxXx4zrMiIHhNBhhhEUqYjTQL
         VCpdkKeP/1n7lCSwc3Tt4P1RgY6MokBsr8l6YgJpYRbbPtNIdWxKGKfhgyE6heaXTGJh
         2C5+U4vDPZGe7gUO6+yGliT5EMv6rTzEPpbC+3wX1Xuv26Fz9mIWy/zcViOtJjRRSZ6R
         ltjU5alsyEfa0chUNMX11Hq27XJ5Hop3Auhx2lQpVKQjJMaUBT9JJJKxZemNMyNHoWYc
         eGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSFha90R+Tyrapop7X/IqL58ZSGd3QwOqTtoLPCucOoYkSD0u2OMMtrW13/PKiErn0iA7reaohnP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5jnVhzsYDc3H9xcv3jpTXNANgSjPR47oa3yW9UGr/MvrTyy09
	Pe4sS+J7XkjsV2aynECJfiN2ngVoLjPSWTmu3XHCkYx412iTdGq0QsT0Kr/obXwmdok4nlsG1/m
	JJPeQ
X-Gm-Gg: ASbGncvt14fZfTw7tgIOCUNfCBrug/6U1Al1zRvMMfE6nnBn9QYSbbmOjuA8w2vhH7x
	ZnqqeTgoVuwvr1/7d9YBwgwhgCA2ZLWHHj9jgkIRzuEPs3p532RfJBagKrvcsQYs2B/iklFT8wH
	aqMH69Do7GsEeJTzuVZ5sGZHz5MmV1DHFkpgM987Rgi+Wy8450Chqcfq/Ct9c5hoOz20d802CDL
	zr/iKLnB+ghdqtoBl013Z2LmN3bfESIxvc3jeky31tH0OeBvudIjmRNIbSXdnC353Tu+WkKrZHZ
	3lSUMdgcmSeqBhNMoGSoocrUV/v3OLhKty+bFFw61tdiTU6dM8Nswf1c4Q==
X-Google-Smtp-Source: AGHT+IEJDgRZZ4nVCbDO5jD8bXYatavVeTWpCEC8bT+J/SLimj0HRJIsJlld3v5/Yfo/JKK58W+zjw==
X-Received: by 2002:a05:6214:268d:b0:6fb:4f9e:957b with SMTP id 6a1803df08f44-6fd0a600403mr207925346d6.43.1750706393967;
        Mon, 23 Jun 2025 12:19:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:e19e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd1dcf1be2sm28135296d6.71.2025.06.23.12.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:19:53 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:19:51 -0500
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cxl: docs/driver-api/conventions resolve conflicts
 btw CFMWS, LMH, ED
Message-ID: <aFmo18OEZGMA2HU8@gourry-fedora-PF4VCD3F>
References: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>

On Mon, Jun 23, 2025 at 05:29:02PM +0200, Fabio M. De Francesco wrote:
> Add documentation on how to resolve conflicts between CXL Fixed Memory
> Windows, Platform Memory Holes, and Endpoint Decoders.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

I won't block a doc update on a suggestion so

Reviewed-by: Gregory Price <gourry@gourry.net>

> +Platform Firmware (BIOS) might reserve part of physical addresses below
> +4 GB (e.g., the Low Memory Hole that describes PCIe memory space for MMIO
> +or a requirement for the greater than 8 way interleave CXL regions starting
> +at address 0). In that case the Window Size value cannot be anymore
> +constrained to the NIW * 256 MB above-mentioned rule.

It might be nice to have a diagram that explains this visually, as it's
difficult for me to understand the implications through words alone...

which is likely why the conflict exists in the first place :]

~Gregory
