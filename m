Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085724315A
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 00:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262528; cv=none; b=GMogcO/QvWFE5+qgT1wWqARJwOgXX8Yhj1BSi2CDoS3OBDtHIaiwNtGrVHxzj5f3QLmBljn0DvH1iAKBuJlSIm24liB9kbabuwxS8kRy2lKyEzbuRfag8y4QqsBaQEO8yH0n/1VtaKvzbX01EdLPyiZoWsBNrUx8NY9AhDYXJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262528; c=relaxed/simple;
	bh=6Mg75/GsSNFskJG+FXgyTIlJ09ZbQVnhv4ijaYTIhwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYvzglzd+++3msLU6d0VDKOOhJAes+iX5wQhHGZEdmcoOPZLYOu9HD9IrloBxqJ54ahvGtwPhQGlTh+DiOIDpraKx87xq2BHyD+RfoM2gJUbGGdgdvj8UFXVgt9GL42Ke7+Rm29TPTdch3yb1jHfDeNriNmXRUrCCgk9ir1vq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHnZDvIl; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHnZDvIl"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so478547eec.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 16:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262526; x=1768867326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWJYpsY08Cfl7o0QEf0/I7NxwELdeIHRf1DXdyZsXM4=;
        b=VHnZDvIlOsPsWcH10VlzgFDVKTnTIHDBDslcZp8SMWOLHS853ORMFQUwpnaUwFYoM8
         4CqIm7AntFjcCkbOSR8dvat1rte2zf8INsURx6ygjr/IJpnrWlG7RZG72+JFktyaVJqn
         USLf7iuv/iutTKV4oolwY1NvylSJxPYgxVkZZbFCj0FVSculCKN9GX7R7ir6rtyxZ7Zb
         hsVrE58Mcufypk1CkLhq9hs5mk+ld7c7CezghUWxySCqOv8mpXkGpxL0+qsYOnLZCX8f
         Uk5FnqVIxZN0cv6dfkT8c4yzrbBW/mavfzzMi1L1kIiNOEFC/Ny6DrCh4qChonXcUtNN
         z/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262526; x=1768867326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tWJYpsY08Cfl7o0QEf0/I7NxwELdeIHRf1DXdyZsXM4=;
        b=ACKOvEPzLmJpmNNbrd6Fvi08Fc22NA6NzCNPJFcD6jjuk02ky7e7u9lD+II0IHDuJd
         m45ceTH25aoXNtZs2GQudB+rSz3vU732HlJbpfeMLnEoTaNM8x3wrcIEJiTTjjrUTxo/
         OaMI4u8DRy6yDVyt5FD0RdfdkClAhiZ8tyQ/ikboyeQE8emNbFO0x+uobYJMpeQuONXn
         eqpxcJUaEqo7SSGE4Xm5jATn/BzQauvNi9skNU1NkfIMH1/RihKOwX+EfQ5INSDWPjIX
         ncRR7Sbsz2VLmxMaCxhoF1zIrx1zk58wDDwykGRf3/zFHu7Za8PoHzSklJCb6PQDYiHJ
         xNDA==
X-Forwarded-Encrypted: i=1; AJvYcCWSWffhV9b1WhWdAF8AIMHyktOMS8++bRXudHkQLrQNzXVQ6Zjw1V+u9jeC3JsCe7vYnL4z4RBj7I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyubuULi7+EIzD9ZSs5C7zkP48LpkQBdq6tTpOgXzmjYCtPCp6n
	E84Cx7SfCRgZzZVNrEs0IM5hhDqnsyM6w8mW5Ue/bkDx+hU34q9UFj332EuA9A==
X-Gm-Gg: AY/fxX6p83DmijwR8U8dpuBwGpNw+se6yr48alVk+QZBg11r8uQBz65hCVyobhmKxZr
	BmBvek9NP8gFBhJd21uAaDIhzCzcZ0dyePfcqJujDsVmG/+pljm6AJYwqC2oVUyT8GIByfJfUG7
	MDBUhdKtDb3wGSUlLxUlUZFbMC12L8Ioi5QrWKfKP9pRvVpI9/jeNQ5OqRoLStMtx6croK5xZnL
	vbMVnEkbuRpX478QmAWb5oOuPdtIYRWKJK/+gQaFOWcvdIRwjiTZmVO4ZUY2LmR1YYFQ/wrypUk
	W58L2R/Q8ft5D6i7hwxt2yj03HZ4ctMoXrmyY2aRcr6mNE7yIC09orNXtpkTBetEjgV5yzQ3mGM
	of6uAXgJ3CwH4lGOgACwZILrmeznPfLt7BfDOyjHsIinC69p9qCxCXBvwgp+kLfx8VUCBigIzjX
	YEXzDh/wfOO9Ocrb+lCvwMvoTV
X-Google-Smtp-Source: AGHT+IEUqdzwGoghTXcoEKp8rntqfE2E1B+5Bq5gyxLHAiW0nQrzylNwYjYPn6h9KO8SnlXLSGjX0w==
X-Received: by 2002:a05:7301:1116:b0:2ae:554a:64c1 with SMTP id 5a478bee46e88-2b17d30f664mr13390705eec.31.1768262525850;
        Mon, 12 Jan 2026 16:02:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm20136130eec.15.2026.01.12.16.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:02:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:02:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (coretemp) Add TjMax for Silvermont through
 Tremont Atoms
Message-ID: <b2c19a52-3795-457e-a9f3-b23d86164802@roeck-us.net>
References: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
 <20260106155426.547872-3-laveeshb@laveeshbansal.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106155426.547872-3-laveeshb@laveeshbansal.com>

On Tue, Jan 06, 2026 at 03:54:26PM +0000, Laveesh Bansal wrote:
> Add fallback TjMax values for Intel Atom processors based on Silvermont,
> Airmont, Goldmont, and Tremont microarchitectures. These processors
> support MSR_IA32_TEMPERATURE_TARGET for reading TjMax directly, so these
> table entries serve as fallback values only when the MSR read fails
> (e.g., in some virtualization scenarios).
> 
> Added processors and TjMax values:
> 
> - INTEL_ATOM_SILVERMONT (0x37, Bay Trail):
>   - Stepping 9 (E38xx embedded): 110C
>   - Other steppings (Z37xx tablet): 90C
>   Stepping identified from Intel E3800 Specification Update.
> 
> - INTEL_ATOM_SILVERMONT_MID (0x4a, Merrifield): 90C
> 
> - INTEL_ATOM_SILVERMONT_MID2 (0x5a, Moorefield): 90C
> 
> - INTEL_ATOM_AIRMONT (0x4c, Cherry Trail): 90C
> 
> - INTEL_ATOM_GOLDMONT (0x5c, Apollo Lake): 105C
> 
> - INTEL_ATOM_GOLDMONT_PLUS (0x7a, Gemini Lake): 105C
> 
> - INTEL_ATOM_TREMONT (0x96, Elkhart Lake): 105C
> 
> - INTEL_ATOM_TREMONT_L (0x9c, Jasper Lake): 105C
> 
> Not included (MSR reads work reliably, server/specialized chips):
> - INTEL_ATOM_SILVERMONT_D (Avoton): Server, Tcase 97C
> - INTEL_ATOM_GOLDMONT_D (Denverton): Server, Tcase 82C
> - INTEL_ATOM_AIRMONT_NP (Lightning Mountain): Network processor
> - INTEL_ATOM_TREMONT_D (Jacobsville): Server
> - INTEL_ATOM_GRACEMONT (Alder Lake-N): Very new, MSR works
> 
> Reference: Intel datasheets and ARK processor specifications
> - Z3600/Z3700 datasheet: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
> - E3845 ARK: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
> - E3800 Spec Update: https://community.intel.com/cipcp26785/attachments/cipcp26785/embedded-atom-processors/4708/1/600834-329901-intel-atom-processor-e3800-product-family-su-rev015.pdf
> 
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>

Applied.

Thanks,
Guenter
