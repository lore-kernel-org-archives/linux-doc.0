Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510E31715D
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154252; cv=none; b=bkLTADycdMJ0xdSAIEXidTla4amYR4dfYTK4+5y+VGNlZzzWKBQ9jiaHY9ohwgyKfhfgvuY2tFb9GJ5jcabRvmds5Ce/675r3xBe7bgDjfFa1rW7ExHrL9TtLmiCOAmRoZYMoLw2YGuaL7mdqBEPUp6dpltt5JzGv1OGWYc487k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154252; c=relaxed/simple;
	bh=z5AMCbTCJKiKwhdeueVhwArRsGJl7LsXJxyw2+s69h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0zXjVYS9qMHcNpWP2gNsMbnsmQf1IXqZF9P3Afn4tKouzW0aYYtdB+reKLaR3/cE0d+SN4rID54SAv1A63U+NgNXHjRb7+3wgLrzKwWcf0OFGb9TNKkYM+sjgOWB+d9Hu4At+LMEQjwRexRdZ3nvmYQmZXWsmG9C2o4zXExxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5Wd7qUb; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5Wd7qUb"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1583357a91.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154243; x=1789759043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=n5Wd7qUbXBb52MIPy9zOsuTen8ubkv6bp6Pi48hWIJn8Z1qNhctuUM2Oj7bIG4y8f/
         70N/78FcKN1xKbIA6cWus/VxbyyxnEmrnCmzG0SiVc6Gv1Cs7AEb9akpyFDblB0iiC7F
         sX0LSupbCOzYLnRRYHiq/Rp0sZtsAWDRu2fKObHySRggJ6vlkXS+0S+LDg4FLOXnydx5
         9o+rZX4fAzVGFeJ9vPMV+vmKaBrLlH2+MFeEN4WqJX+yQ4pY1FuKpAWQnZ/UeX3X+WK6
         k5d2wEDI0RyRB5H+wD0XbNA1rD2zp8TqcxRuSMKDkBhULvb9EekiRjwgqe8N02XMuXjP
         6/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154243; x=1789759043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=GM8264OSE0tm283eBdMge6xxG2WSth3XGlJHQ31uTAHnExICdT/bzSvAcpplT+9GMQ
         BDmb5ksAV5ShNDk1qhD/y1jfWXt0hQMaCcOvp6XQtBk6mYnE+cpL/U54qxdVThXryT9+
         70inXs0u01fnFdhEQALyIlk1HQmp1D6ePHbYhFS4Y9v0r+X18602jIiB5DsU5IKDsRd1
         4ThlKdtBgqd6n9rmTfh/ZsPLSRBi4H55jLkzgZFd2jDkMEd1NF9jCriPv55gWq2iifkI
         AckS87yRcR7OvX1Jkb7CtL/b56HkzSKsATNhr2/yRlf9KQfw+KMP1jeH1ugbiPMg1dlv
         Hc3g==
X-Forwarded-Encrypted: i=1; AKwUvBym42xIk0P/z62Qfxl12Tnn3nSuY4Ix2dez+g2AxXedB4cUbV3bKLBOEqkfAD9PqFwpJwU8DdN9p4w=@vger.kernel.org
X-Gm-Message-State: AFuF++lOzGGfl7YNNuIynQFjPlr0HHgHOmtxO4j96cdJoRMxO04mX3Pt
	gd6p891XTS+fy3/LH8yF9UgPQrgELAIKM8vObbr7qERhTmbg7d9yet4T
X-Gm-Gg: AYBFou2YEhniUCAsJmed7Dyd/2dAbgCLaDtBv07kVVX9ypYTX/NBBzmzclYJlD4BJ0A
	L/rmcBowBheE384+cgT6lLbWgIFBJ5LupW1NjvyPa8xuarBvzCEM6ts441RiWeO4Gj71EGnkPcL
	/fCJlA4r00JZDTeRJ9GwvxxeZN3ZhkhbB6ReCEpqX0QlXIir9M4UfmKjJl9zS3oi1o3GLQav0De
	f1u0kE4GLVLLAbrb6RoBv/Dp8U2j/9+RC+ZDUZT6PBTFA8PNf1UsYE68fG7EMA6sOQFMCCLoDDJ
	tk1sPhGKeRXLqRSetMXVhPPWWFOiex5K1eMvCW1O/dWxStg/vMKzRtKUGltb2WRA5xe5Ds8DP3v
	N/6X63044hrMyaGy3R4REkOXoJ2nIeuprDsU10xeFCuXCpFZSIYgzbzn/tdrTkfRldYyyU7yK3q
	yO03XaOjtmYs4e8MkoWB2coBH07knzFkKjyXX0RdJkgBW5FpI6sPSslGBeL9DJhfx8oXWuL85Nv
	7ce4lrpH1V07A==
X-Received: by 2002:a17:90b:1b05:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39d9bd9515amr8974372a91.9.1789154243279;
        Fri, 11 Sep 2026 12:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm6689115a91.0.2026.09.11.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <8b822b80-8d5b-403a-8bee-c288fde6cbc6@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:58PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
