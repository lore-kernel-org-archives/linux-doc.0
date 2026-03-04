Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C46394781
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624509; cv=none; b=O2Dxsd0oamOArB1nQRtE24K0TzOGMvBKtZQm8XNHzLl1Hw4lm61EpJZMOvWxZEFrKJwO0p/NTEmwemIDXyQ69Oua08Co82zEXsReV92iMQqgGpm0nF3do6PFdiDBMJ1TjudkIM+MCCvgkopCAHrxkpaJxFknb0nOodZNKQryA74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624509; c=relaxed/simple;
	bh=4H52RiUgfh21ZFPsHyoianCiAR34V0Nkw/EF+33bfDc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVygBwDlQZHEB3M8dSWrdpL1oO2DpgCnPjZ4XqVYfMmrSLWnCs+nWaLjtKUbTwmNsiwPhoEvhy2njPOzPq9koE+j+jSoqy0vfWYbGILceVFwKM8AUqYwwa7cuC6rIqkmna8VMvYRN5+ZD22OdDR7kfDl3C7eMedpm5VTvpXwSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqi5hMbx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqi5hMbx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-827307b12dfso3598445b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772624507; x=1773229307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcdRETdlDQ9rJqwe5hebX3Cr0LcEt1jHyO8LM3OIebI=;
        b=jqi5hMbxNpHad1IIlLjUddUd3GhGB3jpQhsx+itjLrz05ii4OEvXaL63ROZemRhEZc
         DVsTK2M17aRy0srwahqnkX078oYykq3hHdo8DgSWXsRInt63UK0E9d+pWp4fQAX3iAzW
         T+QMlh1x8uJVPS1Zd2JxUf1fgAoeq6d603Xtq6GnSvJ7YhUAPITAE6xgHcOtB3YLkahl
         oHGxfalRcdh17h4JVni/dUAJmEbuFxnhjKRthjd4cugNNdFfB51e3w8c49vn6UBumneR
         v9Q07ZDOzBQJznY4mrpq9C5p3mMBPfl99axSzXAmACWZDuQfRX3uQaJ/PAgiwh6nYlXX
         7Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624507; x=1773229307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcdRETdlDQ9rJqwe5hebX3Cr0LcEt1jHyO8LM3OIebI=;
        b=cYCec4PIv30xoHOWSVcfAa4UJSlxZnYWSsbbD8jArVxkQTgkcU31TbjNrTa1o4B08h
         x0i+EPxJSqRPaU4iP2YkFf9nWdONiLujXbyfSZxRSIez17oCCB56FoigP8Id7b/ZW+c3
         3Bzf1nJyeUfrWxfZJZUv8WlbBo9mu3qr+ysxBASBDIPXd+N+z4B62Oz6RPCCxfkDO+6Y
         iCEaSUDgtVx6wrsktvv/ys16W6TlGtKBQobEisk3UO6jbtITUscrrUfOM4mgG7hVtjy/
         tZFE74TA0+vkm4WGB0R/v5PPANshF2hXwPOro0jTYoQbihXU3Hj3sf0sAIefydMqIOT+
         I/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCZ4P4Ew2DUkn3hgmgYijBnz2aAmEnoD1+DJEsb1KhwjiRe/ud2qFbXeMXsnD6Oq9Kgj4LqDLKLRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCaZtUiDLvIuQxBo+pYcdflkaqibNBXcFU2sHrSUwJqEexkOl4
	vZVOJK6kiJbH7vCkcLmez5/qTJwx4dfXI31MsHjukjAfTSH/8MfBQajE
X-Gm-Gg: ATEYQzxG+nArO3sp+vzmobFzMNY/OrBA1yaGPM1FPHoyULhcTssOedA7icN9GOmcwZ/
	Nq/dLRqp8haZaDvqyTXX1cXJRTIH7jQwRA2asRF7xaHgfrxDx4eppxWIbiwARlT+yVa6vY39KbM
	fKLXhUFArn8zsVe3OZ24sXKJLXwWlTXbqrd7c83fXdsg9qy5uJXnLIlyVQp8RJOltrFYk5aK/0J
	I4JZHMGWCOCS1MZYs3M+yWzrYNtKjQINIqpCpSkue4KfO/Q0lIhyehfJ32Be88Uvd2piILJOQek
	pShXotySzJBuaUueLbSiBILjkgf+WZ1EAB5X3d3U61ATpTo7QAy0NAdVRkOP97S4TP38IlqOZ+y
	QyQseiFpuGxUUwXOCsoH9dflywNy8IXAxV/pSn462j2Gse8BIkZ7Ghy43kW3NJK6Svs82KmYyB6
	kEbBM284prcIEy4PKqu6VN1WZ4QIXN2vgq+MdEhmu6nL1pieZ2aGHbfjOYnWIsO7R2v6aHlr6N8
	E7ppgFyinDQCPYrcgjEVK2mfTPD3Ji9/FHC5mUTv2zqPTykAydDQiF6j/osDw==
X-Received: by 2002:a05:6a20:549c:b0:394:62e0:1b98 with SMTP id adf61e73a8af0-3982d2821b8mr1657671637.9.1772624507474;
        Wed, 04 Mar 2026 03:41:47 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73790f881esm1449862a12.10.2026.03.04.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:41:46 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 4 Mar 2026 11:41:29 +0000
To: David Laight <david.laight.linux@gmail.com>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <6et7t3o6fjiinpkvpsmoxjhp6edn23dgclbulaxg5paccdotgp@amtf33da5dhf>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
 <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
 <20260304101655.620df7ee@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304101655.620df7ee@pumpkin>

On 26/03/04 10:16AM, David Laight wrote:
> On Tue, 03 Mar 2026 13:27:07 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add kstrntoull() function, which converts a string to an ULL with a max
> > character limit. The function is an alternative integer parsing function
> > that does not require a null-terminated string. It becomes a better option
> > over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> > with custom delimiters without having to create temporary copies.
> > The function is consumed inside the implementation _kstrtoull(),
> > promoting reuse.
> 
> If you've got custom delimiters use a function that returns a pointer
> to the character that terminated the conversion.
> They save you having to find the delimiter as well as taking a copy.

understood, how about this prototype then:

const char __must_check *kstrntoull(const char *s, unsigned int base,
				    unsigned long long *res, size_t max_chars); 

to be used like:

	end = kstrntoull(s, base, &res, INT_MAX);
	if (IS_ERR(end)) {
		/* return or handle error */
		return PTR_ERR(end);
	}

the name itself is still under discussion.

-- 
Kind regards,

Rodrigo Alencar
