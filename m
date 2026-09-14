Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385DF480962
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399765; cv=none; b=EwBdYJnKSOCE5MXpYHXjsZyIufeUFy9yv9P4LhznyusEkaZ3zoxmNqnDFd7ZdxWJrFbQn5w2suZ4YrhN/Is5IW7X22UqmwmoN5Cid/k7H3fhBHmrKdRrfjnT+rMsQwB48tB7XEWOr293NxajZEK8C/3ASqBnwpAUBHTbxre7KZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399765; c=relaxed/simple;
	bh=8P1Uav40Y8kXsjX0HdETGS4JMl9Qk6D8B70bUav+hDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9dkOWBcNXnbYegiXmjSSCXBUDdhLSDcpDHBWDuXiykJdtX5UasLXIvfxDuzXbo0Vnl2H9gChgQWMhEXZBh2GWmtzQ+CXUWCFQFAN1ZwtpHIX2WQHsWMETk8WHGw1bvFnyxqjROqnFLspJbgYeaw4sqrv4CW2lWacYY2vxufuZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykh5rSQB; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykh5rSQB"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3587638a91.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399763; x=1790004563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=Ykh5rSQBWJZoT05PgglIqa6HkClGzhc/Ykcj+r+T5KLH+kZnEfR9S9+5dFb1ImvUL1
         HMSMDrM/DXr7bnvf5OYateicGIAvQqkBLOUpQhfUc/TF3vxQ4qNU4zi2tRabUNnw1Rjg
         f4zv/jVJJN8FNYcxlMm3da/e9SbzXeP1XAluzseSnprHrbYnlcosy5UX3QzBPfEiG82b
         tqfaO5PHXxCJKbJtQV1vJlmUMJ+1EysFOojWbccC8qYsvltGdal3WYHZAQyrXLxAXjdV
         mRNiHEo+MKfkEA2OOPoTtdrbmiSwr5zZ5Oo9XSBYReCeCiwL+vBCaHPOnxbAsdHkP3pB
         n1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399763; x=1790004563;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JGSgbnEFbfQWmMwF+znkBzTBmF0OUyT85pZqVYf5AE=;
        b=CRI63FuHwe6lwHaabFvo/dOnQeT5Ik2UYaEZglccn8kG+WnmtRqPH4sQrRjrykgn2G
         UfYJBf1N2xpoxYoN5pMgLNT2kuo30Uyqnq5K6t1ZHov1pZ5Hpne9hoBO407TUrwY/mJE
         +khbgiYaRanFkg2QgPJaDu25DdP4ynD3apDJmxGI9Umcg52Oa5F0hfdToSB3qmBVbYqp
         kSKfxLFj18GZHbD5Tm3oFy0a7xi/ODBowoJM+hV1SNCT29zck25lLXAYRQoi7BoufBGR
         w2FR4i4BX+MGtawiFusibH/3q+W+Z4/X0UxXEzwoKgPDUhJjLzUTUGuDoQOCXWH5YRBr
         xq1A==
X-Forwarded-Encrypted: i=1; AKwUvBx6GhUcTjrbyMqptyQWLChXEo1HojwIjZEll0/7HBNFgIBcY/6SHbzPVJh6ajtV129lof/+DjUlQi4=@vger.kernel.org
X-Gm-Message-State: AFuF++n9CCsELdwRYduuNN94HRoNOi6IBvvPQxYAltS0HNnlQMKNI6Yt
	2W2UoGgV3LxzeexNZgqbeDKqRejzG6XtHii/ABvJadW5FLgJV294HAws
X-Gm-Gg: AYBFou1mNJlBXpqEjQO6gNtbfjhO1RKmnkq8iCYHVtesyZHab2mjWwMw8VXntSdxXge
	aaiOftBY3eqnvAqBWoA5q+w++S6Axjb8YC2rSIcTPVPOeRzRdhjC4JjO8JlD9PY3AQsaJBc7C9s
	ApZHoFLXPh9p17nkmPCY7v4Vc8WehTLOhWQ8D/E2sqiCGx1DPhUWRo/Q4CQM7Vri7HdvL9mDWhw
	L9pTeC0EnLMZCiOLmA1dA7Nekn0fktQ8X4LrewJ2j5VcKMFtEa8lZ0G93Lq9n9bhrQjbZJqZDwz
	JonDThi3u35JPaGR4LvoXzv8owMd3fLmr7ZreLQ5HXgdDGjn69j4afwY+bPYODVMWY9kiI12J9w
	uNeFtqFWOmC3Hs2tLe/JgMs/zSJwyCyCycSuYImU8/ZQq1JEZ//VdtN3poUkmNwiI8igqr8p5fo
	bRqI2DdKW9Hi85Ebksc4ZGVsTZaL/y4T/DjKvAWOBw4LvLCCOG0nJ/U5CH8b8AMR4Yi+gj/bYh0
	t9TcnXI6MjmfMI5+BQHmr0=
X-Received: by 2002:a17:90b:5886:b0:39d:f253:ed66 with SMTP id 98e67ed59e1d1-39df253ee28mr4127241a91.22.1789399763401;
        Mon, 14 Sep 2026 08:29:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfb6e82dbsm417472a91.0.2026.09.14.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:29:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:29:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Add support for ADPM12300
Message-ID: <4f87ffd5-fefb-4301-a550-28518bc2faf1@roeck-us.net>
References: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dev_adpm12300-v1-1-15fc8143d457@analog.com>

On Mon, Sep 14, 2026 at 03:45:17PM +0800, Alexis Czezar Torreno wrote:
> ADPM12300 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 3000W. Uses PMBus.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
