Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786EE16F29A
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460329; cv=none; b=F0scAE1FFxtD/cohCkS95aPjrbmztbfyM0M9aNbR4sZdW9L1FujcKfdORGMk/2fw4cvcixDfPszNweTR76kYbUus6j7k5EdJkFLkBPnK7OMrJ9Jg8LZ9/cjFhRotg0j7t/nPow4OCC72BVPdZt2/fE+V7maJGKccM0tPhHQ73ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460329; c=relaxed/simple;
	bh=V4bD0JhlT+UQ1ATauOhPA9TteDqpGdm2KZM8d041ViM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPBqhnNXS7RuMv28V8tRzgZK0WjLDGbhoA+t+KHYwgWQkeVq71sCJnNS/tt8ucM6pkm1C+qCb+RHQTs/hx226hPaIVtXUMXT4ySsiKJkqnKaJiUp8/9qBYNfw+rCjQSAb4EQhtBgwq6EGBh1Yz1eaad5pk1L2Ec0IjAa71YrOpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c2/2f+K3; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c2/2f+K3"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e5715a9ebdso9651255ad.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713460328; x=1714065128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Srcc8GSfebZLoUs5UEqC/Q5n1RryFdWaKvCpiJ/RKN0=;
        b=c2/2f+K3iNgmz9NGLiIrElX2rcXto28Q773Y5I2zC2/ext9ebHLiBn5t/R7eJnJaRj
         /PoD3mqROt5aFHFxPXdY/RNO5VXF4g1gU6wj4lJmrP7QYIgdl3wh2eubW19wUGf6vMnL
         ewaGuVjAHJV+LMZDbF2X2g7fhHEqOP43wPm+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713460328; x=1714065128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Srcc8GSfebZLoUs5UEqC/Q5n1RryFdWaKvCpiJ/RKN0=;
        b=U1p6a6PSbo21AQUn1kOkAt7W/sTTAqRGrn0/BRfS+kT7NzMetJaSAgYUd0SzzPzFSM
         /6F7Ca/BUOfMRtj7Pd4AQOsK0q7a75gZkgRe4C/5U98+Ox8IiM6ZpfBZuVO18spHAZGJ
         3/mgpYfznehRX7Pk/UsbdHsXmZBIXsshaVr+G11Y034mTZIznljyjn04j5TN9K58p7lM
         Q2Z1dcag+f75iv+5aN7zeOSLD45+8b6XvpiElefJofAgJlbyrt6P0XuTzynnRbp/SZ/5
         vMRxSFslguhR1ZDY201YyewoIhVFlz69RrG3Xnl4+ghv/dVDp9JtMNvN/RqYCf9GXpDf
         3GjA==
X-Forwarded-Encrypted: i=1; AJvYcCVtGSZzGWVulqUc0ptzFySG20852l78DibYZ1FuZ6GrWspYjZy72FF3gVYSnLuavcxZTntxqurFXBm9OfpHtrE8BQLGSasQc8eu
X-Gm-Message-State: AOJu0YyCbFATvGZRXFRQSaAtq5TWp1w9jPYbNtOtndpNepVbwkQ4V1k2
	pE2owvHjq1MQvgvz5lVvAFzoaTikbXODKHcUsFcks0JOV1DqtLyKjsheFodKNw==
X-Google-Smtp-Source: AGHT+IGXRsPSakc8glvVR0fVaanCDT0iQFBXasCGzm9NwhaKMLnvjPABcG55nXEozQZ+YUznpYVeKA==
X-Received: by 2002:a17:903:493:b0:1e2:6165:8086 with SMTP id jj19-20020a170903049300b001e261658086mr3335872plb.61.1713460327781;
        Thu, 18 Apr 2024 10:12:07 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x7-20020a1709027c0700b001e2c8bc6bebsm1765424pll.81.2024.04.18.10.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 10:12:07 -0700 (PDT)
Date: Thu, 18 Apr 2024 10:12:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Elder <elder@linaro.org>, corbet@lwn.net,
	gregkh@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-style: don't encourage WARN*()
Message-ID: <202404181010.5C27FE82D@keescook>
References: <20240414170850.148122-1-elder@linaro.org>
 <20240418161430.GB2410@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418161430.GB2410@sol.localdomain>

On Thu, Apr 18, 2024 at 09:14:30AM -0700, Eric Biggers wrote:
> Also, it's not true that "Android" sets this option.  It might be the case that
> some individual Android OEMs have decided to use it for some reason (they do
> have the ability to customize their kernel command line, after all).  It's
> certainly not used by default or even recommended.

Ah yes, you are right. I had misremembered; last I looked Android uses
of CONFIG_UBSAN_TRAP=y, which has a similar affect (effectively promoting
warning into bug) for UBSAN checks.

-- 
Kees Cook
