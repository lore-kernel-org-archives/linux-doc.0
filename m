Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4390389108
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 23:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096269; cv=none; b=ECqR4dmgWepHlOBFaiEIzsEkxWb6PBReSFTUZRP0Iv1ocpCEnrcDJAA0TZ+fTNCQpM78/QrKf/tM2VA2UmBFYpAg9/5eb1JM5zukdR6jwLfaPvFZMhPiciQ2gFGZiQO3RfkBuuKeCJQBCjwKz2rzJWksK5h2gRxU43rQhcYIA8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096269; c=relaxed/simple;
	bh=nVfFfY8A659cL7HK7LVOhl16GacAGCOHEahYhLSQ3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+ZnMqtiOVSf8LZ25OUdmJdFWGBSLvHacY+ngWqT4s4B+SxGfhRG5vEHdD4EfQgl12F9HluHzyXesl6obRATa+SnKFIz4gAicvKA14+0Uj/D5ij5QxdqPFjFkx5WgwRM7XI6fF3j2VZEvaZcprgIeon2vxjkF45RnaUwitBy2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUhuZBfu; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUhuZBfu"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso646402a91.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096267; x=1787701067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=DUhuZBfuO1KiROJdTWTNmGgwG5MngtvtL5pARztVVR1tt641D7L3cvL6mnELvF17qK
         KXKWnnJHas0SKKrVx765e3Yk70HgHF/dM3oMD9L5Mb/n5X/mj3Fz7jL7xYS5sWPLxwSt
         paHR/xHSel+6ZywfzAW0Ss1wW7kN0+OeBlla5PacDp+FMpBg268cLj8PvuKmGmpcMEMT
         rmWCrN4YSii28iTPRwpGMCuG3ZG8fRC/MMYdFxQHgGSjg1S6n4WrUYC+ZMzFEtoX0DSr
         0NVilexx2HTJHvw7s3Old1/rTEpSIYFgqIXHsg8VCMopN+fBNSHXYihebtahtZwHiLYY
         4Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096267; x=1787701067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ATRerpanZ/JU36hlqVmHVEOL595+NPyacmWceMRGF0=;
        b=TvUbXdMDwGRCu7l26+aGnsWdAdp1r2FAgVWKZnls9RIkBi6r49eKoSo/F86i/OtDCW
         7xoHPmXVtQZnoQAK1/NZ2ObphAHUHO+ugWpVW38jRxF6dhhMevLiL2GM3OnW1uXrF25T
         SUGknztuknPn7I2ygUCO87TnjDGET9hVL1Uiwg7YQIVr0AwbZorS8ie2BevW6IhNCQ5f
         Qj3AYbo68ZwsSNvS+34q7heCw9lWfRjZhpCTNaqNxoCb5NwERIwoWzRrjG6EFGBH8D6c
         axRB0uf56ULywGFcO9f/eDLD7fzeHSYuNqSgkA/JS02SKlM5SRYTWbBg0lzT4HdTvW+D
         jL/g==
X-Forwarded-Encrypted: i=1; AHgh+RoKIBry9u1Rzc42MvstNz92EqKsDi1OGKtVVptNNxxfgyTdezkWzMfas8aMYPyFBeOBdSHuilIKHl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJw/VLdwl6iGCOB1bC9PoYifbpnObfbwgcavEetoD3jUW5phLz
	e0MvjyBUBINnAmqKINw29Vk9e1qGNROTcU0PUXABgeoQVD5LkgOY3xTa
X-Gm-Gg: AR+sD12Lw0oZ+sdyFwCSVzk77U4n1PzK6LgJJRL0T2BOemnSCQw87fbkwSKooiZ7GLH
	PqIuujWlRJT13Z9WG+c4nFkpUJtc7SwZ+hFNQPgkFEftiFiUI1QGN1FH3tS9ccLrfF2ejBJkVhu
	cKcfLKXKnpTR+EU6jDWe080GqxRgxD9KWb1ASBzVvFx2C1fcKJ8YzCzqIiVXSzhMNDI8DYM477t
	vXpwLOirxC09IyTBczFLM16pmL+wQKdSCTU1hzQ/KnyHH6YnHAZFBjbSiI3jCo11B94mONYUGSZ
	2AhER03VnMApKZyYCUahDVngDzlw6kbr7jYejED4dPlTZked1zESU+mgjxdTMzm/OPMiIy9iO1m
	Yy9r+lrAIM3ffUSX7cID1T+LoUhuDhQ/vb56+UbGOmgN6rGhKb/0Vnh8YnS4ZBRgnr5T0mKLwJv
	54Vula47denQY4PBbbsykqO6hH9fwDxTkbh2BZWHPn0EfP1BtekXSwUEyNUkUThs5kEbw+i1LD9
	A==
X-Received: by 2002:a17:90b:1804:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395810b5a15mr821265a91.12.1787096266837;
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm657098eec.16.2026.08.18.16.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:37:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:37:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Message-ID: <9cab8512-94ab-4ff8-9921-31d86033ed63@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-3-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-3-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:44PM +0300, Stoyan Bogdanov wrote:
> Add device compatible support for TPS1689
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Queued for 7.4.

Thanks,
Guenter
