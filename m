Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EACB2F0C7A
	for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734916; cv=none; b=lpyS45AUzS9NHzytQuhWl9yzlOXuERrvJ1TVEcGLYM+2kYd1Qdbmp95pZFKw/ygl8TydxJxlW2tz7L7MG037gN/dK167wPCT8oXVHOAN1bRxUwYg4C5vdqdblBRH/59Or9Jjogk1cIVGZrgePhJkjChZe5oa3ha2vG7Wtnep97s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734916; c=relaxed/simple;
	bh=83zse538fD8u03mzTPAEQCydwR/D/5YHsoWIx4X+It4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oleHKrW4KRZLl3ZxM+5hJSbVELLgsg1SkTT0G3snr121k6AoNoT0HLBA0MZvmAAuQAlwXW3D5DjVTv/nLqD/A+UB7J3HpqnlJOUBQ1j/4rblAkqcx1YM2QmijycFgK15XkfCz5oUIkwMsgwK3OcKCqapD7paTib47SBYrB9Tq/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR+6Oj1/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR+6Oj1/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c902f6845so244608a91.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734914; x=1766339714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLDlN6OqM1rrufBfPttMo4blrCkCx8Wc1Mra3LYz6sA=;
        b=NR+6Oj1/8mlLD2Q0ZY9oTG1IDsLiBiLl2Er41jeTwrCIYqTNZQw0zM7UTxWHcuUuhp
         ZFk9t3jKycUHFtqpoBKXHowIgNrQXZy74oZD/mKLROALYKSNB7xcenz3KcI9cCSXTqQ9
         jX+ySk2GAZW4u0plFiOJHSi7FtvSAhakFaDiG+RKLrXcKZvViCBOVDoFVjkydx3mbvUv
         vtQAihXaPmadV6P15QzrqiPel3zl2VZ/ybab/tfUdGmkHXo2BLtZ7dLMF2wyhH1Nn0aZ
         T8jCBU/WMiKl8hJt6x8hXsY2y0KdNyrljwX7BBMe5gxEpc9+n+8U0x+m8a7JgwLt1Zkn
         QjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734914; x=1766339714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLDlN6OqM1rrufBfPttMo4blrCkCx8Wc1Mra3LYz6sA=;
        b=Vxm/bCE9UfFafQ9pP4Lipxi/0a6jweK9w9JZkACNLUweAvQ1jxO9UDORJa2wvQ9pQ8
         ec32dem0xl1/Vomn3/anqNmDlJDNDn1Qxpn1ioEUgbt/Ip5cAHq+O/sQ1CHfQ+3jbAum
         J4yGJ2KcOhRvl5clIpsvnqvco9TYelN5791Ib928h0XYTP3JUctUdlMpN5UUFjXvV69R
         +OJAnbso90t1oQ1Z9Hm9h5EbsHTwHpKW4g9fUp1VBarw1nET9vFlDWHVcgtZFEbxr9ly
         VhcGexpIh5foFUium0Tt4PsiOzFKWZnJ6j0Y2cO3S53SafgoCz+id5/fepL0xI3OIizs
         aTjw==
X-Forwarded-Encrypted: i=1; AJvYcCXt95dEK3uLjA7q7iFOkkCSpctrI1ccfiw+eDLJo4yZLqYi0iFM2R6k3HHQ8a9yB6dOwB5E1aEEzVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHfxcBC4MMJIqa+2gnIFB+6EC4uOKVrod6WAuu4/nbhbnZPoG
	Vgy4Q5u2rgdMu4L1AqBRKHMTsi42mX6bCnXgtuMnFFYqcy0N6Tv5Bm7ht0xa8Q==
X-Gm-Gg: AY/fxX75Ux6nHWAYM0tU3WmrC09gwd1HnCzqVaXsSB4ZOjCAhytaq1T3ekuX7uzeSCK
	jxgyw27BzhobqXeV+QsdR545l+huOR4vLrgf7ttwyBpDLpWqC+G7vVBYWtrue8mRM/wBuLvwbjo
	P69koXiO7k1Xq0CTDXfX3XB2JHRyst+PVoYBO4DfGc5sIxjFScVlx5wA0suALYmS5Ln4yJH2NRd
	mHf4jgKElEeliGaPtlboMikPZFcR39gWdhThyLqcQKQBX3iGNETtWKIPiR8lN6VW1y/QXze3gGv
	Vi3bOVaoAi/mS3OFPj4CTgxWJEBMNh7lLl8NNpBW566i9v8eSZVfnMl8lTTnNaYiExIzhKqEl2G
	YWPj5yRp9OtR0C58NTFSvPqi5+ZyTEJBhdFfHjxnLSUb5X5Y7k63D8bJfsyoFHb1sc+MRx5YHmN
	C3nekNEA0iHK8ykN6WlSx8Nls=
X-Google-Smtp-Source: AGHT+IFZwI5FLozBbnp1DSYRjP3PIPgTxtIX/z2f0jfZMZB9XghTtVjggLeWnozUACDLZM/xGv4O9Q==
X-Received: by 2002:a05:701b:2309:b0:11b:8278:9f3a with SMTP id a92af1059eb24-11f34ac5418mr6270136c88.8.1765734914531;
        Sun, 14 Dec 2025 09:55:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm3220338c88.6.2025.12.14.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:55:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:55:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (sht3x) add support for SHT85
Message-ID: <736f83e3-2578-44fb-95aa-fe7ed520a627@roeck-us.net>
References: <20251211185842.66084-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211185842.66084-1-apokusinski01@gmail.com>

On Thu, Dec 11, 2025 at 07:58:42PM +0100, Antoni Pokusinski wrote:
> SHT85 is a temperature and humidity sensor with the same interface
> as SHT3x.
> 
> Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>

Applied.

Thanks,
Guenter
