Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62B328630
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228076; cv=none; b=cu7wNm3s2yfUPFRbXfMjwg8qcIXkkpKNhm3RGXmnBsdqggC7r1wl2xefgmqKuAl1Frl6lrZru8fPb8vBKrjXQ4JMD9hm2lipH351QbswLY0DR9FtgBJHahDkTU8Etb34m6Z6q/7OzvFtV+vGqR9Q39T5yAHoDoX9UwbfukwW09E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228076; c=relaxed/simple;
	bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsTGG2RSdvDQFn75DvQBG1GbBGkSzlFtTgpKi3/NvAaMHe+lnVnQlfP2ZHcuFA6ET9r4sI+LE/Gz0jmctkl2l08I6m53aHyqWDyodJrGyf6cf7NzBcZBIrtV5CBpEByKPPZqqoHfm4z1wQKqJHUd2ZdASq4p5fpbLioZy9C445E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bKcnDu1U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bKcnDu1U"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471075c0a18so9799305e9.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 07:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761228073; x=1761832873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
        b=bKcnDu1Ugc8m1FO2mnc9vhsm9Gt701FFuUye9pb+IQLedRuOOPZ7GH9xP2YLtnqaWA
         3VWYZdNJluPWjsWKI7bj08iE3QMIoaJnU8TwJUYPVn/0XA0XkuqAHU5BXj7LoJjjzhI+
         Jt/w+MfFqdWkbmI0HsqDr4W7tk+853JoroELlD6yHZaI6anlSaR+rYrmNHOp1jmiaWFD
         bRyN7v/bJVXOET0nkcYsGPOCnkR+dK/eo37HgXt2JobJRvmuyK6SZzZEl2gA0M2s61AR
         mECOx3QCU9G2NjOSy3w79ydxc1TC77gKKwO4rdMFp48bKYCp+HPRYn1Q4LKcTYA2ZnkS
         9wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228073; x=1761832873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnMWVm8H5Ck5TN7RGfsn5EcNXl+YklqB9zPZXCC4wAA=;
        b=HeNl2o+7hPgYOzat+0KbFmJtK1RglRbw9BQgJ+d48WeaK6aS6qr6ba6hl2neoPWbq0
         w6FgRqvu2W8ZsEAQO1qR4Zovg7zQ25cJ+l3oWE8YC4B94/3mYJta0OyLIe1n0II8UI8X
         S6osGfurcZloT8CUp71RlSN6xhefJznJN1h+alDKlhFf/vpOSn10D6SFykddc8GbLxuc
         T8qmrWkWXJXxDLrlhrfXBn/Vd5Yq4leWISLMVSxSgz1KF/iBhWrkDPU+y/Vg8vkUOYWR
         le3u3sXLuYc/OY5ibrg8/5gqPCT8LKZQZ7QBfaTt7cceWWZ80MHJisc2pO1o2V3ObRf2
         Hx3g==
X-Forwarded-Encrypted: i=1; AJvYcCV/Gtr2ODyqTOTKzp25vrh2U2+EFB9WDvxm0ZuzbKYQtJOYYMDUvJcolei+vLotlILiDeBvxPo5/UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCnFtgaXbJmQYMooVE2yts8A/DvN7bnq7e7BElpZ5+2BvOhHxX
	l6BU4ob+ppQBP8as2ilP7T5lZJlLeLFaSGeN1VUQDDtwa9/C/gGwPx32YiE1asnKD3oyndK6bvy
	NeHz2
X-Gm-Gg: ASbGncsmiLegQIh7jHBTOs5c2SCbxAM/w3HONalE23icGx830wIVFxq6mCIJct8aYjT
	QmiLZFy3OOPyAlMju2ost54q56f2iXxM4WgiMYtZhscScbJ+Wj2I7OFtBHmvd8uVEmF37fvbZ75
	NNoix2qcRsbIuI20tdKkAMN3SCZi1mpQP2oA5qownoSATX3vJVCjT9YG0enxvuvHjRamwRdSIAK
	hhRBYB3FYjzMoacxaLg4jw57PPIq9pho0CMmr/vztJIzpGM0Pp7xMNdxd67PYykk3zf8N0Ly4R4
	Wc0vWCcG4IABJChW7RxMyUotFfZ2twZvetEx2kMqGp826wrOFKUT6qtJqgo1TmBVjtk+fU4n5S+
	S1qb5Ex7GBQz5juZIx5v/2z5hP5Q/EoAkBC1XIx/vOFdQq7as4/K21gvjPlHtMtHco2C97GAowk
	v+TmJq3Q==
X-Google-Smtp-Source: AGHT+IEQurVzp77OCpHZFz2TRcOchNrP75ZwR0sZ9FlZgnu+xhnNBWaXzzz3i5vljtf/+Kejv/936A==
X-Received: by 2002:a05:600c:4688:b0:46f:b42e:ed87 with SMTP id 5b1f17b1804b1-47117925eb5mr165543035e9.40.1761228072957;
        Thu, 23 Oct 2025 07:01:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475cae924a1sm49352875e9.2.2025.10.23.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:01:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:01:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ally heev <allyheev@gmail.com>
Cc: dan.j.williams@intel.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Andy Whitcroft <apw@canonical.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Hunter <david.hunter.linux@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
Message-ID: <aPo1JU7pe-vvQzEf@stanley.mountain>
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <68f7b830ec21a_10e910070@dwillia2-mobl4.notmuch>
 <f9cabfed7b165299b8048670e548c671f300f2b2.camel@gmail.com>
 <CAMB6jUG+ES6XY7NL5TF-hFVDmz6O5rd9T-HNk7Q+pJA2_9g4Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMB6jUG+ES6XY7NL5TF-hFVDmz6O5rd9T-HNk7Q+pJA2_9g4Mw@mail.gmail.com>

On Thu, Oct 23, 2025 at 04:38:43PM +0530, ally heev wrote:
> I will take this back. Found this in `include/linux/cleanup.h`
> ```
> * Given that the "__free(...) = NULL" pattern for variables defined at
> * the top of the function poses this potential interdependency problem
> * the recommendation is to always define and assign variables in one
> * statement and not group variable definitions at the top of the
> * function when __free() is used.
> ```

Ah, right.

regards,
dan carpenter

