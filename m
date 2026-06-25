Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C694380FC7
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372615; cv=none; b=bIh5hqewtDOlW2XponzcKNpPHCUF9ofEaJsMmkcmY4UektpTdoK0eBNCaDtZTfXEgUkQ8lYKIOQX95gJ9BIorFydu7oZZEmz6Kae3N0UUyUDcUqQxa1CCnPrOLoPJrLCUcqjte9chN8kC9lt58dqGj5GxZc2iv86MvXQV422Ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372615; c=relaxed/simple;
	bh=tcB1rds/uzzj4nfKHTALU46dqA5+55+NV76XtXupaQE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW5cBLt0xsZ0M1h1ZqP6ERWWdJRm5LLY1SIPvUyVi2ZMFIWgndI8wmixpyc5HzC/Uby/ZygoKaozpZjZtxenMBM7OL2L2O1WyBJx8d0SNfCy8WPldCGH09Uaar7jKpBEtbAICROP287kIvzojqcWNLyMeRyAXzp7OwEQ7QPWBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOGKFqeD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOGKFqeD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4924593f45dso21890005e9.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782372612; x=1782977412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTCS/VbEwbVfOVp9Z3suxyrpmFmcGl/hr2a+SPTASFs=;
        b=DOGKFqeDZdfgryQh5cqzce+e/VkUFql6nuqLuUM/unH/FHWTJcf2ACw3pXk7U5CBUz
         zCdtgrLUaryT/egHs4XPqBElXBSqoCDY5XTxxbP/6bdq9UpQuGjNyod72aqwP4I96IQ3
         9HQOMSXWaSgeD2WsdMdVamZDvGfGZOcK8FL67sYstE/sSIODiKVA+knTnyjEVJzbcM2j
         n/i2c7LYCO7vwWPCdAnGwSBgB/nJys+B2JLonNOvqPOGrhqdyoA6SOVEeb9W9ZGRO0b0
         JPG8HBAN8lM/eolUPVEVza+zJI2S+2r14x+Ly0yCL6+Mg26M/aX7noaNTTWm1vwdnB6J
         6naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782372612; x=1782977412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTCS/VbEwbVfOVp9Z3suxyrpmFmcGl/hr2a+SPTASFs=;
        b=V8y4fvj8jKtR3W5zZvrkc8KrYP9Wtvpbjr8m5W2y8GRsaj3oAOtObFzHr8larameyP
         9Oaybb7AH4R0MytgPHJfWO/6PujQ1pwx+uAdyCKmlMJ9j5ZOOO6+pl3LRRt9Q86PAX7/
         fEd40q4MqhWJ3m8IskOoCm3GRJC0F4c6cOBD5Cm8VQLXrhJ+ciBRvOHFJ5AFToMijyjK
         RAbCASNmRqjRNpXAVrM0g68kLjW1W/PJjuOGtSl+U9FQel8QPwk8B3KoTA/YnOAV2LII
         S/yNZJvUXNXkKKZcW6eBLCoJdJCADqLAQT7TMv/XecBDpdpC28p1XLUsQMMlgJiOXr6o
         bzXg==
X-Forwarded-Encrypted: i=1; AFNElJ8QxAUrLCRwVaR9qyIhZwiec19e93+HGOkAiEM+UV8VLxA/ZZ2HB5oQbaX2LjsQ39Kq98DO+FK0SXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXq+ZxcOaAQ2I51/6dWfzlJUI1IDc8BK5gy2py6rXQKCmhgmU
	fMQG707aUqEg3Zg/2UQs0opiV6Y0TGeG4Nwc9+U1D3LMquB+k1CS8RQ1
X-Gm-Gg: AfdE7cmNErcCYnXCFtFNmQMdcDhLuT/JHVwyBvwyl07LOS+BHO4MYIvQsHo/st+fRkO
	oHtxMHUYIynoUYN+ujHeH2Gm/xZ+EWDaT2qtAw0y9o3Z16X0l8V/ROEUkyOZHow4ebo3joEgb6Y
	5uHjXif0liFLEj2HmSV2X6zhGl4bVhM1WA8YNjmVhoQbSls01pHEfXMmfMI5yOttfPsmNmmRNct
	JwjTEYtW2f+DSiGc9gf83AXaomkpTeuA6TMoYgN+iFww+pVfPdDFGaTYDZ+ahXxQ2K+DqRmCo0w
	mI96qUr3m1pcOM166/KqieKxxvoGZ1Q3HkBaZLXIuuQkT26/o+49NBPW+UFpDG67Xj0+XZV4sjW
	YemLH+3wkhSrbKCuImvstbGm2OHyJi526SfUfr44syPpYsYAsEIIbN5jhSkxfDM1rlvbDYfm4HV
	ZUY1NQv0hIyc5kgiyhDljIWCezRKaoNnPkRITd7KgNNNT7WPUyGDkJ4pF7dHf+I+B/5loz0oZFC
	iWS5sSF24llI6nNvZ5ZFNzWzoTd
X-Received: by 2002:a05:600c:4e94:b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492668933e5mr14101565e9.35.1782372611740;
        Thu, 25 Jun 2026 00:30:11 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660e9f0esm32574495e9.9.2026.06.25.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:30:10 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 25 Jun 2026 08:30:07 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux@analog.com, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v16 04/14] lib: kstrtox: add initial value to
 _parse_integer_limit()
Message-ID: <ssrckqgv3rqpfgxwpx4ca3m5m2mp3frxs6sd673chvsorhsjiq@63t3eosivg3a>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
 <20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>
 <rvx36i2ydmwhbbkdgbvh26uqchyoptzuu7tleuyarqn2skzkxz@owzwp62mzkdo>
 <20260614210044.19dfc8df@jic23-huawei>
 <20260624155414.61755e9a@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624155414.61755e9a@jic23-huawei>

On 24/06/26 15:54, Jonathan Cameron wrote:
> On Sun, 14 Jun 2026 21:00:44 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Thu, 4 Jun 2026 11:09:33 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/06/04 10:58AM, Rodrigo Alencar via B4 Relay wrote:  
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > Add init parameter to _parse_integer_limit() that defines an initial
> > > > value for the accumulated result when parsing an 64-bit integer. The
> > > > new function prototype is adjusted so that the _parse_integer() macros
> > > > stay consistent allowing for one more argument, which defaults to 0.    
> > > 
> > > ...
> > >   
> > > >  noinline
> > > >  unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> > > > -				  size_t max_chars)
> > > > +				  size_t max_chars, unsigned long long init)
> > > >  {
> > > >  	unsigned long long res;
> > > >  	unsigned int rv;
> > > >  
> > > > -	res = 0;
> > > > +	res = init;    
> > > 
> > > This might generate conflict, as the code around have changed in linux-next.
> > > It is an easy fix though.
> > >   
> > Thanks for the heads up. Hopefully that will all fall out when I rebase testing
> > on rc1 once that is out.
> I've done a mid merge cycle rebase as the char-misc branches have merged.
> So this should be resolve on my testing branch now.

https://lore.kernel.org/oe-kbuild-all/202606250230.etPGuolf-lkp@intel.com/

Apparently, the documentation header now includes parameter descriptions.
The new one is missing.
 
-- 
Kind regards,

Rodrigo Alencar
