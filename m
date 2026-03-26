Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56468330B3B
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774562699; cv=none; b=XZVWEB06PE4kO1EgSOjDpf3FhBz8v9znI3JR9hFJf+VFPDbZD97BZGmB5gRqIcR/oIsWa1PtrHSZXiNcBK/hcbuwBypEFdNPvUU8TcjiMXSXssxPnCi3Kn9LSjFajdlzI2mZoPxjhXjpd/n6+Tu8P1dZ+6SZ4INBt4r2zulCaAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774562699; c=relaxed/simple;
	bh=GBY4i+7n97Blol+zZDLhEwkVkvlwAP0FnHiMpSo+3uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCVRar8CxxiPRL6TJW6/Fr330WQnwc/vg8c2dBfLiQRIyrC/Ost3gsSGcPnwLu/LbrzIp27fok0tFdPUBxLjQb391n1Y11NyViPyObzJgfYyEw0MgC84cv3OzLi5VLkbOk/89OQdvhjikt4xySB5ms/EX7Gg8ej9vgGA5wC6J8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDhSiVDp; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDhSiVDp"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506251815a3so13107971cf.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774562697; x=1775167497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RrKHhCFI1+fxT243Y633zvQyWdh9GMd1zgxuWpoC3M=;
        b=GDhSiVDpiYWK1JY6gSIOea8QanGOiHJaeDQhXmLuNTljg9Q5gO5xe8y+uHogeo8lD8
         mEvdQ+0TIAaGW+gZVm8dokt+eMNaE7zPU2CRqTeA8+6tXypZkeemywyOgbizyB3U2Z6d
         m1NFUuFVmGgMNLtEtyi86K9eaebECvXL4cBLW8J8YlEtPflpEZ0BCDmQwr48OGxVU/Hy
         77Nlc7zCF2cgy2jzWR+RBnf18ye1NRn3m2SG6XaAOKpXJgxuZQ8JGzRoZvXTNeEV1MSX
         ty3i6GDNhRK8TuKIUGX3+Ng+h2BclM/0yZKf1Rvj1UOZ3JNZpu+XMb+esgEVr5/NT1Ud
         QIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774562697; x=1775167497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6RrKHhCFI1+fxT243Y633zvQyWdh9GMd1zgxuWpoC3M=;
        b=X1M0VTyLrqTY6jdB6+KgIBSgA7kerx4e65VnrvXlV/Foxf3X67YpLDsfpZNqwOq2iH
         YvmKXiTEB6vVI9galGC3L+cMj9Bzl/2i7B7pd88bU9gWzs51FN7UWehmpjXivaa4KDC3
         OfzI3wZKfX+Zw+FRN7Bx2jEcHjMGPtrGG+9TOeSpZzjlelre+QrZNW2PGa8d5og7EzB2
         K9xwJ00mp+CyD5o8L5z6LUDByyplWRZf/Ymqqs5vHcukgkyM+zAzNj62rEY7AEIVKVAM
         pOtdcHfT10cV1C+ASnwbHt4tYehllvadxifAxxtNPuxEjqc8hHQs64zq/iPZbJz0wwSh
         pi7A==
X-Forwarded-Encrypted: i=1; AJvYcCVeH8SaFBibscqURHrtzU0tJMIIfbIQW09nqks70DI1vJwBz5TYBAL6a0nXSO2OinMbj3FRHhhqZ6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKQNmDeUU57GAk3CdsSq7Wsdo3Xy+uDb1FMzhqHY+eYnM5HCC
	FG8ZwzaI9M8vUsGIwXlvMwpWRmEaPzbmBgtLMTGA/WgNYXWukRJRH89h
X-Gm-Gg: ATEYQzwXslqEmma+OEdV0xPzd+VN/NPeD57vBS8ZN0rgNrDoq6svxQVzqQGJbEJVm/T
	3RBR5INK4KLDGYK47dbd25Tz/G4eCZRjogiTr5r4fdWttpOHXFQawdAOMaz8EHITAvwI5etSqYm
	Ah/FMYpeHgdBmjPOyUAIBofQHcoz98vQH1LZtZ7pVBdTdwmv9z1Dw76MvRJvABZWGNMdwpqYjZH
	Yu7Dq2f7PNLx9KzvkLMvgac346w7OjOD60N/tKUK8FNm5rG4CjPPaT3Fp+X0D7l7+AFg4xYg1P+
	60qx7//4GV/WTR6KbatHQbdUC9IRtwLk80OACZvcjsjq8a1pwovjD01ICkURWVkm2ryInt6hA3k
	aUxCMU+4i/M/SCmT86Cq4WXf4vLVXwF+z1CQL3+5+/P1XQ1Qf2qeJZbtm1hTJoEi7yLoGII4yV3
	uGvIA11H5LJRudwk47+eQUwX21KzKJiqjgzb2oKNFbem3Hm9JuONtP8zyhftrWCysWZPEcMAVu0
	Huz6kiJR4BZ4bdpFlyCGijX/5/67ltca2SRYdfeyXvpSYAeKJ6Z
X-Received: by 2002:a05:622a:99b:b0:509:34df:4f03 with SMTP id d75a77b69052e-50ba380a874mr3457191cf.15.1774562697200;
        Thu, 26 Mar 2026 15:04:57 -0700 (PDT)
Received: from TARS ([207.219.48.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5aaf0cesm36120126d6.47.2026.03.26.15.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 15:04:56 -0700 (PDT)
Date: Thu, 26 Mar 2026 18:04:53 -0400
From: Ammar Mustafa <ammarmustafa34@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Alisa-Dariana Roman <alisa.roman@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Docs: iio: ad7191 Correct clock configuration
Message-ID: <acWthfEL_HGtVykN@TARS>
References: <aaHrsTS9iG-PEfue@ammar-VM2>
 <aaLIhgJjrNlp3oTy@ashevche-desk.local>
 <20260322121314.0143bda3@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322121314.0143bda3@jic23-huawei>

On Sun, Mar 22, 2026 at 12:13:14PM +0000, Jonathan Cameron wrote:
> On Sat, 28 Feb 2026 12:50:46 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Fri, Feb 27, 2026 at 02:08:33PM -0500, Ammar Mustafa wrote:
> > > Correct the ad7191 documentation to match the datasheet:
> > > - Fix inverted CLKSEL pin logic: device uses external clock when pin is
> > >   inactive, and internal CMOS/crystal when high.  
> > 
> > high --> active
> > 
> > Thanks, this part looks good in the below documentation update.
> > 
> > > - Correct CMOS-compatible clock pin from MCLK2 to MCLK1.  
> > 
> > I haven't checked driver yet, but is it only for a single component?
> > Can you double check that _all_ supported by the driver have the same
> > in their datasheet(s)?
> > 
> > ...
> 
> Hi Ammar,
> 
> Just a quick note to say I'm going to mark this one in patchwork
> as needing a new version given Andy's questions have been here a while.
> 
> Thanks,
> 
> Jonathan
> 
> > 
> > > +- When CLKSEL pin is ACTIVE: Uses internal 4.92MHz clock (no clock property
> > >    needed)
> > > -- When CLKSEL pin is tied HIGH: Requires external clock source
> > > +- When CLKSEL pin is INACTIVE: Requires external clock source
> > >    - Can be a crystal between MCLK1 and MCLK2 pins
> > > -  - Or a CMOS-compatible clock driving MCLK2 pin
> > > +  - Or a CMOS-compatible clock driving MCLK1 pin and MCLK2 left unconnected
> > >    - Must specify the "clocks" property in device tree when using external clock  
> > 
> 

Hi Jonathon, 

I replied to Andy's questionm not sure if I can attach it in mutt for you,
but we found that this driver only supports the AD7191 so no other 
documentation needs to be updated or check for this issue. 
Let me know if I need to do anything else to have this patch merged.

Thank you,

Ammar Mustafa
