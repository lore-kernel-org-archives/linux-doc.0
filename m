Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE59734FF5D
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936467; cv=none; b=ERD91+XR1UR8HBdOdsAyi3XHVJyqi+L0WMUGf0nH5PXiU/JQGTeJ7zJdA1gohIyGSrYKS5T6YpwNNyoe878bX2Mj2QrYgMOjorJ4tHo6KIHMCgVIa9KJyO+KqTu//FoapfEM/d7Blo+qebbjOhqJhmy/skxt5nmO24Uu2876pAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936467; c=relaxed/simple;
	bh=6aboxZNTHmGRlVVTElDaIhAgkk+pkJbOucCA+q+fG88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlSOZhvBXPZZnbEvS6yR5G8f/nP5HEtMNn2RME6DWX2lPpZPkoUne4y+c8mBp8acRN4er5GEbT9qZgJ0nyi3b63tMA6TlGuTbZqQL4ywgw2Hv1PEbZdPlJ5Z/HypYnUqgJtvP0WbEvKORhI1Vw2lt486dIds3JNKKIPx57IKPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWp4KC5c; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWp4KC5c"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3045c195251so4192851eec.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780936465; x=1781541265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+2qeA95DLaZ9BgMbSdRs9Zeos2A7MyNzkJXZ9cO6hM=;
        b=lWp4KC5ccM/uqEPJrSh9vH7+0YrIUk/gS2IWSbrEOBKuXtGH5Ykz1Aq7QygQvJawpG
         mTQ16ZSayKA5xoGEHDuIV/44cvdk6vUN8IJ/Y4pBmYeYOYjFRIfQIwa0lgf9ogHJAq7L
         0iB5mL4OUdiIeaUIqfIBfAG05GfbV2/nrZpWRlXAsJ3tmQvky3Pzp3TQe2/A86KqZF9s
         Es1n6hqiyIvphUiHVPOg6TbKE4c/+At77ih0NGoLWAUnlwLjCgDzOa/KYOdiVTY48A8q
         OFEwLIwbkinyuZuT8d+aoh6Gr1KzAfylMtxMFPROYeAo1Q+gIf/0ldOxpRoZ7EOCWqQ/
         BbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936465; x=1781541265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+2qeA95DLaZ9BgMbSdRs9Zeos2A7MyNzkJXZ9cO6hM=;
        b=a7Gzv8LjH6+tkQKGp95KfADbgDIOLt+Fc/LO/VS2yZkO5h2otvNDUpE0yb1vdR84t2
         J+Z5/SWL6zGrZ9kDaB2yHK8fHtENVlZLnDIyX/EP8PIBAjlRUKY+z20bTNDCmajo5JkN
         ZMP7kecMxlGUEmTzobIjnRoc0u2uB7ft+JI4A7odzcDpwa85D741KfAhnvdKF+DO+Wyw
         hAc3I0sJorxt7pIcAYvhysRG7es7wcVmAGWQdMmhC/Q+h7aQCWwA13bPpgHNUAK4cTiS
         zssdcohsvUwZabHN2mnFJxzP9n/+v5DHAH5S6McNc6ePkARJHo+XzM/8lazYIkz3hDu7
         naIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hpQnytzoBeLfWTFB8SMCtIUMXa7aCorTdQCn9mJx9FwPTkXtuWTZQolT+/I1d/WPtPt75AZwNZwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaa9IN+yz5qmU3Ou5wnRWqSOA5HONZn1fpxng1eKyggD7/kA9
	wxaBjy1YMVIiR91HyJNl4qAzVUgx9wBO+E27MBw57ql6c85wYNOlGlb3j5Gv4ZJ2
X-Gm-Gg: Acq92OF9+JZICSiOyYVB30zLowekso0NfakifbRSnz/veo4yH0U+a6DZShOtg1U35Yn
	O0nxY10HR/Zc9ewxVhFgUywqX/lsyLVvUSTz+L8DkaZEsz8wcRsJiYT+YYl8Uyz1S3qtlhTMB5/
	M8Y01gcDSw/FrxfyLkzD+CimsFlVUyFIylIKOtsyCIMzpWfJTKxV7wNvvUQRIF+1AoBqC/056w4
	cBfp2xvXzDKALl9tDCI4U8E6UETkgJx5WzFR7cQGJZMm9q2sThYRbq+pKEQ4Dgh2iZ9CpG3iACu
	kO0g6WX8yDxBaaSYWYZpTmEM3cD+9M8ssVgTFH6IsGaze/381DtCDBbTuQjTY7w0U2GuAkDtNqf
	qFUV9O8qR2IiYIiIytXM5mCYFPSIDZ4r1VXxbtOoyB6d0YPgoojIJ1CCW3ZrhY0SB7a41BehzH3
	/eIZiiU4j4YlJXsB5llHGvIn9bbxsWUKDmyCDGfhlYauNpZyfqM9InFkPPng==
X-Received: by 2002:a05:7300:8cac:b0:306:f474:738c with SMTP id 5a478bee46e88-3077b084d97mr8582773eec.13.1780936465006;
        Mon, 08 Jun 2026 09:34:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm17075287eec.7.2026.06.08.09.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:34:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 09:34:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v2 2/3] hwmon: Add update_interval_us chip attribute
Message-ID: <01f74dc7-c923-4d1e-9ded-129d17508587@roeck-us.net>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com>
 <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>

On Mon, Jun 08, 2026 at 03:03:55PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> Some hardware monitoring chips support update intervals below one
> millisecond. The existing update_interval attribute uses millisecond
> granularity, which causes sub-millisecond steps to round to the same
> value and become inaccessible from userspace.
> 
> Introduce update_interval_us, a companion chip-level attribute that
> expresses the same update interval in microseconds. Drivers
> implementing this attribute should also implement update_interval for
> compatibility with millisecond-based userspace interfaces.

Unfortunately, Signed-off-by: is missing. Otherwise looks good.

This also affects the other patches of the series.

Guenter
