Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9870429992A
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571627; cv=none; b=iPgFYyytjYcz+j1reBvIZHPPC8j1klIDQpgSCqC/u07SUJ0G2bkxosbFFuN0VOGm2BoTYQ5ZJv1WlV3oDwgb1GfCHd2BYvUQ+Nj3gAnTjG8zO04aB6LLFt5Nm8InTEGzK+7PRmGBIHSb4EHond+mn5MEiwtihoBxkiF4tFfzSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571627; c=relaxed/simple;
	bh=wjAihhlgIFoKBph/30BdSuaRV45zLLu2FTAyTGC63U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKcuyT7CGaWB7clSocJmXXX+mCzdn9FFDmsNkDYyQ0nU15YCsN3y3HWl8O7YvpAHj/y52EofspU+gz07lLFLCFBP1uTLpapa6o5IzKMKMn/cJWJ60NNBdhaMOrXnJQ+7gXY1fiEkYG4LG7O4mAT+p+EhK86Y9BbcAh1QO6M1WI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tIwK+dhj; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tIwK+dhj"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fae04a3795so3024566d6.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1751571624; x=1752176424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5JiRVjpCDIQ2FImaZDAlexoOFjZvW0CINutA6RTJCI=;
        b=tIwK+dhjNysjyhsEaEO+QTBWm9yc/pmUIcdB5wWstIq0vtM6QzFiINXLWi5BD2ZsjY
         PuYwFGL/Rg7b38rDWLx1dTyX4fiPz4OLv7lZ5pnTcKG+aLjnjhcwvtCnyi/51ES7/7KK
         KT6ol/9XNPXtm1Ue6nk1zb82RiQxknwW9eSYFEk0vHxTKTaMD1AEBYTtir+5kEyrieCm
         SRdo+gPGK5hNQzI5PPrsncNDUNoH9uIc3s/9vUhOYk1wku/dQ3i9yobIeiCwab8kvPIp
         TeGeHYt3uiG9MhSHFpl+QYEhP4Wb1TbvC8NahY5AAvwvos/oQPzam1kTrsvEzbQMPwLn
         oUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571624; x=1752176424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5JiRVjpCDIQ2FImaZDAlexoOFjZvW0CINutA6RTJCI=;
        b=k0loQbVFwQDIh/mFkkxC3L/R8IhqTY84K36abOsFkxaxtYHKKzasPICVECIeqvy+RI
         SYj0HMwADDfYqxireUG2pOcM+LC6hUIgk5HFLSM8ePPUetmSHkhuNNgUDwJMkrYKLE3b
         PLgZycSur9na12A5V4lhq3a/wI2rb9m2TcKo5mxv2gEE+etgni+9fGQY6Saotldd1Uqo
         mxRGj83G/vddqdaVjjwIhJBq1o1fg+lz7duIRefj9ipewHZHQJuyMuAV44OxdFLyEYqK
         QCJQ4ir2i3v0Ofmph6Bod/tDRedYtuFBwhQO72WLx0Be/07QOTu/ml8428EHhf2tDfWE
         3M5g==
X-Forwarded-Encrypted: i=1; AJvYcCVmAzHCmA0+OAXUhnVyadHIxMs0d4IutNUySYNdWNaKViU0TJ5SEZYxKyNUujRBsioKqjSld+4+l1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHB/M1mjEdV+b+CA180yppoaOb75DLwY80ksYFSs6h+sxeQcii
	Snu3nNX030JWIFKGUgw1pXaxcAYIWUF+jDlALJo7APIhncDbL6mcINwt7t4WvhN7Fqs=
X-Gm-Gg: ASbGnctj+jXTyqP+httvmQGmOdO7V66iL4f5N7QiRE+KuEtQhayR3BXf9HuURRHL4OA
	oiYRua5PJ7uSuXfWvTcql0TNKWUTrnA9ykS4HsT2zQ3PnC8LH/hBVeyXqZRxIdNTC618n0Fsj6a
	xHeSs2xJGAYN9Z8AXDmkz0pWoHl+5dEVBcDBII9GNBz5GELwwuiuT/UBU39vmiQ/OlMw3Xz60Hf
	A1CTRLVV+M2JdXf+Qnc7Qet7vnFch5lSk2LlcRMvdfDVvb4LJty/o8tzUbdZMBXhe7cdlGlpdjr
	eOsPKP6arQi0VQcZitsLTdyKpEYUCyCx6GmZREU/rcz7LIqw2GF+Zm3vTtECA5aIwtjRTFW4jV1
	X1P/t91CHyp2tzHA0qIOQNItm+LP0j7GtQnrytW89bA==
X-Google-Smtp-Source: AGHT+IHtokJzW6Y7SnAkO7fHIQj00qi7TbnLaOfijw/VLKAWWQHbBebWsqlSHWpM0Ffk/Tm8g67+Iw==
X-Received: by 2002:a05:6214:dcd:b0:6f5:3cae:920f with SMTP id 6a1803df08f44-702b1b376ffmr133762066d6.27.1751571624342;
        Thu, 03 Jul 2025 12:40:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ad73sm2155396d6.92.2025.07.03.12.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:40:23 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:40:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	linux-cxl@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] cxl: docs/driver-api/conventions resolve conflicts
 btw CFMWS, LMH, ED
Message-ID: <aGbcpac1pma1od40@gourry-fedora-PF4VCD3F>
References: <20250623152923.1048525-1-fabio.m.de.francesco@linux.intel.com>
 <aFmo18OEZGMA2HU8@gourry-fedora-PF4VCD3F>
 <c32cede0-643c-47bb-bfde-93adbcf16155@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c32cede0-643c-47bb-bfde-93adbcf16155@intel.com>

On Tue, Jul 01, 2025 at 08:23:57AM -0700, Dave Jiang wrote:
> 
> 
> On 6/23/25 12:19 PM, Gregory Price wrote:
> > On Mon, Jun 23, 2025 at 05:29:02PM +0200, Fabio M. De Francesco wrote:
> >> Add documentation on how to resolve conflicts between CXL Fixed Memory
> >> Windows, Platform Memory Holes, and Endpoint Decoders.
> >>
> >> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> > 
> > I won't block a doc update on a suggestion so
> > 
> > Reviewed-by: Gregory Price <gourry@gourry.net>
> > 
> >> +Platform Firmware (BIOS) might reserve part of physical addresses below
> >> +4 GB (e.g., the Low Memory Hole that describes PCIe memory space for MMIO
> >> +or a requirement for the greater than 8 way interleave CXL regions starting
> >> +at address 0). In that case the Window Size value cannot be anymore
> >> +constrained to the NIW * 256 MB above-mentioned rule.
> > 
> > It might be nice to have a diagram that explains this visually, as it's
> > difficult for me to understand the implications through words alone...
> 
> +1 on request for diagram to explain. We should try to document this issue as clearly as possible. Thank you.
>

At the very least, it would be nice to have an explicitly example that
explains the expected cfmws/decoder configurations that are valid but
"technically" violate the spec

I *think* this basically boils down to "CFMWS size is not aligned, but
all the decoders it targets are"?  If I understand this correctly?

> > 
> > which is likely why the conflict exists in the first place :]
> > 
> > ~Gregory
> 
