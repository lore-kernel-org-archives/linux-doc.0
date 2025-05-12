Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4C25179C
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067932; cv=none; b=HW0V2K671xDc4FHsJAZsQomtMMAbxEdoPLjt3YT1EWuY2deo6awpocfKl5CUtiRaHiMQBCXlFVzAs0Fxu/GcntZprMiv9pklqqp9fIFdkr/rbooX7ZE8hg3/JwPttHDsHrcBZgrmeafwf2u2S0VQK0VbPK2f/X5dDFplTDfuONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067932; c=relaxed/simple;
	bh=Yehlnc4ZkWKIJwXXxMMs5cwKVop6FmBrsGoE123p7sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hETZQKGjcnlLucBCojryv3Fd/kVnnbcry++q5ogLYkisD865AvTEjGc6MogkXKi1K68wzviT6ASk+XTcVfIDlzbYW4ktHpuO7G6cSR6Pg27CPRCKZslJWW63cBOswl2bvqeizZozIYXmNT8TPZ6bAx09m6oVopHVXp/lxdBR1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xm8vpCNp; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xm8vpCNp"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c96759d9dfso770462885a.3
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 09:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747067929; x=1747672729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1julnBD5+GcSaXU+eTIdcuLbn0p5bHzSEbl/z4yoEN0=;
        b=Xm8vpCNpFOh21VbbJXb5ohXssAScKGNIOsMZmLyI3oxETyYNV37N+q66z/aS2xHC+o
         /oyEKGkg8svFA9a8bvw5+7smp9Wyg+ch3Vb61GkXs6UoTX6y70/D+x8CZwGoQ7FxqJlb
         AYDqJa5RvRQ+yzYCnifCTclasQIQqhVftHeBW6gf5+6tzvqMXUymcPdZ33KNxXLlUHvQ
         gaPD/THBnQVMEHdbI8nLjsmLTdKtG0xrN72msZI5cHU0rotfnM7MlMJON8sBbf6fVbFR
         j/1xNs33VRfeMW5R6x7/QymSzZgOMQ3u1YtQg31akTqS4pNkGFfUMY0V9sEq74kL0H5x
         SfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067929; x=1747672729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1julnBD5+GcSaXU+eTIdcuLbn0p5bHzSEbl/z4yoEN0=;
        b=iJiQU6ahNj9C7oKEPSEjtMsPo8tTq5J6p1RI/hrsS8j/FVpVQ+IyHNIss7mLfpUgV7
         un8cUQ9tjUGM4En5dxKtunxGKRFc0bLuG6ZyVlqGQcCX6WCYxcec+Kz+18dk8j5iNATS
         7rMhOT/9BWoZ/UR/ECW5T0G8QRRXRE6jQlSfZOjUlftovgrHLlXvHujeKWE0Oi2eWZ2A
         DrwQgHw7mu99vvad+kUYChT8cPbvo+mxh7FdPkUOuxOqNK7GIpYyg+QZyDnKtV2tx5/b
         s0Sr3oWjDrbflsrog4aoT73AcFCp3DV638yyQI0H9v8LXIRtPyhfpNh/vl+YGH9T373h
         hDVg==
X-Forwarded-Encrypted: i=1; AJvYcCVWblYNMyFQX5sFdDNrBXZ6C4jCoj+6vKfK6N77bh6R4H06xSK4uGGktcBlPk3SMRG3QNZ3GPCeR3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKHeP+ZbDrRJUWokPZN4tlFW1t5jec1M1qSm1ewH/QtCDldax
	QqInbXzhSVGqWQlUzDZf9YNoBGzrzdQ9X5uJOHToNGH/zQ605zzrHVSJ5EKGY9g=
X-Gm-Gg: ASbGnctQJzDgeY/IDjY+2i8pk54NX3BNXkUfOnJmqiYaOT0NWsE1EDualMZCiNWyJeL
	2LoNjeBKiQI/g6ZVh/NhQrTplqYXmGTtN56ytfsNNvX+ph0wXyIl7AnBi+nii1SQlF63IG9+fPd
	WtVY8FhdfepBMX3QdIFIBdVxMt/04bXS2ktQ23d6xNOyGpwfrnVwMFvH26rqW1l/ZT7QzhxNg8l
	CasyteSCcxkdUpXvBD3sWrcxctG8qA3cyHcFI1x1C5TpGjDVGhOOG3sAhuaHAhWo1dvrS0Tpe6S
	sZRE2MhEBNuZtoOAqaEFXLKOdZbZnDfdVnz3Tj3kLUPIYQSyjDf7o84qOTZste5Nd1rMWzJjoFZ
	2m8EdzZvMqxE1pps8j4VyxHgI9VqFEee3S+q/zOnvSg==
X-Google-Smtp-Source: AGHT+IHHMUdqgvopOB3bvhxDrzkGlwPiAUOBbIhdmlc5mYj64PucOzKQfQk92T4hzK7H4RQ84n8s7g==
X-Received: by 2002:a05:620a:2a09:b0:7ca:d53d:af75 with SMTP id af79cd13be357-7cd01155c4bmr2207761385a.56.1747067929639;
        Mon, 12 May 2025 09:38:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e093sm568092885a.8.2025.05.12.09.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:38:49 -0700 (PDT)
Date: Mon, 12 May 2025 12:38:47 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, corbet@lwn.net
Subject: Re: [PATCH v3 14/17] cxl: docs/allocation/page-allocator
Message-ID: <aCIkF6RZJtU0m3Ia@gourry-fedora-PF4VCD3F>
References: <20250512162134.3596150-1-gourry@gourry.net>
 <20250512162134.3596150-15-gourry@gourry.net>
 <aCIjMNooAzKaONod@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCIjMNooAzKaONod@casper.infradead.org>

On Mon, May 12, 2025 at 05:34:56PM +0100, Matthew Wilcox wrote:
> On Mon, May 12, 2025 at 12:21:31PM -0400, Gregory Price wrote:
> > Document some interesting interactions that occur when exposing CXL
> > memory capacity to page allocator.
> 
> We should not do this.  Asking the page allocator for memory (eg for
> slab) should never return memory on CXL.  There need to be special
> interfaces for clients that know they can tolerate the added latency.
> 
> NAK this concept, and NAK this specific document.  I have no comment on
> the previous documents.

This describes what presently exists, so i'm not sure of what value a
NAK here is.

Feel free to submit patches that deletes the existing code if you want
it removed from the documentation.

~Gregory
