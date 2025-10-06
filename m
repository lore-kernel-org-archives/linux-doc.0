Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3B5241696
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759772148; cv=none; b=m7vkDFBwqxQ70kvbT8NGJRyjJ+bllg6IG+mk66ZSPRWsRVg1nrdqMWGd36ngcsdu/8PJIPFWx8nGO8pzr2am1JW64ZL97dtB8+yDVrT5xcOjW1fUSB7pyZO8sY6gPjWbPh2IHoGLGZg11oOpKImBNjLstzHOAwSe7OgidPt3aQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759772148; c=relaxed/simple;
	bh=W195a0snK2qbMlgwvRIrKSLXzC/gj1N8SicfYvXdfZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3UWZsIlTTqdnU0HdT+wk3gNDV+llu57g2w9GoRpfjpNKk7Tjy/DfGgPniM+D7Fg79Pd5wMQO0DJg3uIT+qQ+VfSPk6VvM58Yw0Tw8rFJVP6f1GZqcBzofi1D5UbQ05OsP/DPc8eYepVW87Ow6UgJbBoNyxJHzVknQcMSIzP1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Z4ZPlCwt; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Z4ZPlCwt"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-87808473c3bso685585685a.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759772145; x=1760376945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kR53Dw5KXmac3PH9uOCTXtwUd6vhGp4REIph22KJFUU=;
        b=Z4ZPlCwtMh0xurcLXNb/8qEC0lQS3m6nbc7H/qFd/DjHCAUgtB/ni5p8xXMqjl3qzV
         7SBVVuBSzceOTzvDSnhGl4MFbiqqMOivpTQdBYR4TtqAm46EpSsknaurxjAj9FCFr0/j
         C0vTgisGf4SLsrzTO/fzOYipz5SQM7J3xClyEHjc2kep2Vqy8dKz95qv3MKSxYzVU92s
         p56E3NTYMVAv7e6lBH8NhYgvMA3XBYDM2sGEHsFgzxYt4i1NwKapup/0sfGObM9GeNEt
         34fc/8LaaHkRCxt3xeLGOZyU23Upg1gSVpVe1R5jBCQeADPqhv+4Pu92Yg4RrqEgYEDu
         mK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759772145; x=1760376945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR53Dw5KXmac3PH9uOCTXtwUd6vhGp4REIph22KJFUU=;
        b=nqZzS/dugrcFKh6r0+fzpzYi/3ccpPs2ih96hnhNVq6rzni6c00OrJIwUXmkC1k+/c
         1gdR/WuzccDLp5PDPEBn8ki0brtYd9AQssX2MK075jLAkaXbE6JxT64aHOmJgd3UWgO2
         GV1kqkwWE1A8SIm7pc3K2obGESVNm2ysvnAON3disa6XaC9tYDkNK+77hU6qW/7i7icT
         hDQ0ZslG60mpZReA7iICLoC0ApASW4aHc5ZtrOmkf6Gc4BluzgL6dhHtwd7y7Ondeq1y
         3H1Pn27qhdo8vQ8gNu8VUNVqdLczMuObuzkpLCpMJuAgQXhhKH2iL98CtNV24p0pU772
         Za1g==
X-Forwarded-Encrypted: i=1; AJvYcCU/QNv0gYlUUS+E/tmNcQjvvmrBf7PFB7TukvV9F4OgC3XmcpC/DndsaS0xvcPROQA2EfsAJUDJIYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyGaTfPH2cg7za68t81guP7P/O1QsF+iYt6kt37G+rojZcebSx
	0pvSc9YQIp70WdxjEN08s6WbVLiB4urooKDtAxa8u3MfOvRyI5t7MLpEwSE7pFBCr4IkIvc233K
	ut/M5
X-Gm-Gg: ASbGncuvJfb8hQLA3CoISf/MZO0shKxg4pKE0UupMwBhkqjeF4I9Kh85tkUo0iJ0gZv
	Is/G+GcIAlvQWidozWMuxDARkdomhN9O/RctHNWUyVkF/+GV33PZr0eW8u8WZsmFZiylo+z28WD
	Px3hV3kzbl4mzVTq+Bx+BOCYfcMT379vcclMieZUgL805HKgwprZfbMGdEBYbaOXS6pm+j6IINn
	kGOYYmvYXdozTBLpEv9Lccwg11CHAjQlZ70jwClf9e43DxWWUG5z+VgnwMbOvz3DU7ikIpkF5il
	vv0jChou5wWYgnNMqn0bXxv1RvbRmUuh3Xeo47FNjovCk+7YEHXctFhmnTwlt5jhz5wp/yAw1NE
	9Zd4p3dDTPFTz0vfNRhfBuoXMIU4ihwtUMHEJWxi9nTTXrxxV2pZwIAD+OndoyBA9wQH0rOeSDq
	HCjn7XSR023eMA5Vo4fLAOnqj6gbPvlENmCpCmz4IYusziGDmv6RM=
X-Google-Smtp-Source: AGHT+IER8DoXpPhXVe8+Q8xupePoMW4LjKc805ivgHMRBIcpH9k3WI96ovGNcp68qp1cCNFhDqppHw==
X-Received: by 2002:a05:620a:4154:b0:85c:bb2:ad9c with SMTP id af79cd13be357-87a3a34d280mr1467487385a.53.1759772144584;
        Mon, 06 Oct 2025 10:35:44 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87772460ac0sm1375860885a.19.2025.10.06.10.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 10:35:44 -0700 (PDT)
Date: Mon, 6 Oct 2025 13:35:42 -0400
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
Subject: Re: [PATCH 1/4 v5] cxl/core: Change match_*_by_range() signatures
Message-ID: <aOP97tRkOhXmmMfk@gourry-fedora-PF4VCD3F>
References: <20251006155836.791418-1-fabio.m.de.francesco@linux.intel.com>
 <20251006155836.791418-2-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006155836.791418-2-fabio.m.de.francesco@linux.intel.com>

On Mon, Oct 06, 2025 at 05:58:04PM +0200, Fabio M. De Francesco wrote:
> Replace struct range parameter with struct cxl_endpoint_decoder of
> which range is a member in the match_*_by_range() functions and rename
> them according to their semantics.
> 
> This is in preparation for expanding these helpers to perform arch
> specific Root Decoders and Region matchings with
> cxl_endpoint_decoder(s).
> 
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

This may end up conflicting with the AMD ATL patch set, as that set also
I believe made some changes to this area.  But somewhat irrelevant for
the short term.

Reviewed-by: Gregory Price <gourry@gourry.net>
