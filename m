Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1F2848A7
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761542862; cv=none; b=j4uKgTX6qe79i4gGmw5eBzXtJeHkjHVVyp5n/Z9xVzZ8nPRQ5IGZX466sQFzaTxmQactsFrtoT83HXp267vBjucXvms1r7khY37SdSPhctqikFYRep5VHMa9T3+XVyP9Lp8vWJNPju/RxPmdoQX5vqC43DXEDr018HtZKWAMxMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761542862; c=relaxed/simple;
	bh=qh79cjfHvrOLCxvcq4oI/lS6q5OmL9Fn6ODduBM4yG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN8vxoM6UITfeGGqhxEDkykghGYNnsAqEKp4Ol2yvsZ2EqGLLWl1DVArFwFl+u9nHChu3LPTpU6IB3XHOTgqqTS5YXmgr2Lsz4EoNcprN2FTKRkvru4Mb1keaPDIjTdGqCj3DlInxzIV/gUbJtm48qQR5w2T65ZUx7csl8ILOmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgtQPv99; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgtQPv99"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4298b865f84so2243522f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761542859; x=1762147659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMQm/qKPeH1g9CIR6f10NMelAH+jy5bqtx5lzdYvSPI=;
        b=BgtQPv991ykr+JyI16mc3aazZKz2nKl6PYyuef43uLMaE9Lcyrf+UABekbyHVgC7f5
         H0lwbIbmFVFp/s4rGvsSOqeFSftOIlbzlLmpQRZurbiYMW2nBMawSBIVf84QV0IW4FVI
         C/IPOxPeG5VGoL4KPUp6EHkINw2cOCGTB+vT0DG+fhh1oSVGrAVIq/cvqJwWeTvSc6o3
         zySvJcNWYa1D7S6xnvfR7UZ1MWCr/2xB6UODCDHdBdLx5ynu+i0tpKuu9KZBhGuGv4hl
         uwdVR7BMMXuI3+cbDwTxS0ml/w42LF8meAZuIVu0wFmTTUajmOi9Lc98fN8G9glhuKBJ
         S8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761542859; x=1762147659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMQm/qKPeH1g9CIR6f10NMelAH+jy5bqtx5lzdYvSPI=;
        b=LWcwsRIwgb4Lp0RhJrLN5OtR2lgNss23aQIdFNlco5RJkJy+6OFwj7aJNg5Dsj+vu2
         1gAw4rX9GFS0ET7yS6WwZs4IYxqcfNo0wiLFk81B1hJHAq0kdDy0cAn5jTHx4+9dmjVR
         wxZyYD0lCjOF/nuHQPfHpyAhjjN5pVeOpMAwnHFYVfYCjF3THaU1N8hSD5g4/4m6q9jl
         KB001MWM6cCP7J382zDjfSy8ey11wBKO851JfQj6S0+XDzIUs4yYG4ocbY6cDmhOTi8G
         vDhDETA9BZBrH241CM+B8wQJJZyhoFf1WI8Wy+TE+3tOrX122j5w/sQ7E2p28nI8pd9r
         0LMg==
X-Forwarded-Encrypted: i=1; AJvYcCWTkdcaGMrSLLm+VxVbRNvKFsC5jnDLG1uSifHmCpoAbU2sa2JahkDShSKXL6M7wpW12FcU3h5HECs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1//YkuYc60tXkcb50G5k0Edsce8+nIx1tmgoDKGqbrGltJu+
	IU8ZmzHcO67uQHxb6zFWL6Y9QpzKzUVRHf9mslhCFeFcc+iZR0U5o8ezZ5EqO5h5ni0=
X-Gm-Gg: ASbGncujccumiVTQtrksszI4J0F0jpIWoKmFMz31B3rdYYW/Au9fC/IH+chVi9t9Vy0
	PA5YTsdMETLTRyU2n+vidmCvzTowBdFG0Y1pjg9vrRHD4A9Hc971MB4tMmERTyuQnm6/OS2BAF3
	M5qKFalky8Kqt+EBx3u8WURCUDiyZcPZcNnn/2aUpxDAt5BNvUdjNAcSfNpU4E0mjgO9Y6D+BNp
	DNHTjkTKeAO1963jaJdT9ecnqkxxYpV/F513rSwmonq56wuW+1uQmLICtsrznsIMnU+mXNkaoq1
	byFmMIUDvL8qiGa5OQHcLCLGfzVoc169minjoNSJJEqAIWFw2Rsehy/ZE6eInuUgjhiFqPnUEcz
	0XA4FkLU3+VBVCkOJLHbPY0yIPxU3N6xUgxbWOBfwW5c+AQFcRtabqtqhzrDIShma88wCSc8Nsi
	pbUrxUpjj67bgf5XAHfxr6kbok14k=
X-Google-Smtp-Source: AGHT+IGGMWIW5dTfslm/6ukE4iyqbFwa7B8xtQ/z5FIOwZZue/OCt475nBYcheMy53fO8smuBJDifQ==
X-Received: by 2002:a05:6000:2c0b:b0:427:84a:6dc9 with SMTP id ffacd0b85a97d-427084a6ff0mr24497662f8f.59.1761542858724;
        Sun, 26 Oct 2025 22:27:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952b7b43sm12237102f8f.6.2025.10.26.22.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 22:27:38 -0700 (PDT)
Date: Mon, 27 Oct 2025 08:27:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ally heev <allyheev@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
Message-ID: <aP8CxkXYAitKB3vx@stanley.mountain>
References: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
 <aPvAm1E7CvQfOIuS@stanley.mountain>
 <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>

On Sat, Oct 25, 2025 at 11:53:56AM +0530, ally heev wrote:
> On Fri, 2025-10-24 at 21:08 +0300, Dan Carpenter wrote:
> > On Fri, Oct 24, 2025 at 10:59:16PM +0530, Ally Heev wrote:
> > > pointers with __free attribute initialized to NULL
> > > pose potential cleanup issues [1] when a function uses
> > > interdependent variables with cleanup attributes
> > > 
> > > Link: https://docs.kernel.org/core-api/cleanup.html [1]
> > > Link: https://lore.kernel.org/all/68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch/
> > > Suggested-by: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > > ---
> > 
> > I don't think this patch is a good idea...  There are two issues to
> > consider 1) The absolute number over warnings.  500+ is too high.
> > 2) The ratio of bugs to false positives and we don't have any data on
> > that but I bet it's low.  It needs to be at least 5%.  For anything
> > lower than that, you're better off just reviewing code at random
> > instead of looking through warnings.
> > 
> > regards,
> > dan carpenter
> 
> makes sense
> 
> General question about the process for my understanding:
> Is checkpatch run on full tree by CI or someone and results reported
> regularly ?

Newbies run it regularly.  Otherwise it gets run on subsystem CIs and
the zero-day bot runs it on new patches but it will report the old
warnings as well under the "Old warnings" section.

> My understanding was that we would run it only on patches
> before submitting them Or we just run it on full tree before adding
> new checks to understand if they are catching real issues

Eventually someone will look at all the warnings.  And probably it's
going to be a newbie and so we need to be careful with warning where
newbies might introduce bugs with their changes.

regards,
dan carpenter

