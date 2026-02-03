Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C526367F5B
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149348; cv=none; b=NnbBrFj1mk5LCUTjQmJ3HsrrtajrONLXf6Mk2LaPUCAsBgqxk0fMQ8OVDzFIaTE4GMv0Fyklj2eS8vrx/U0V1NDAdHWPu9n+RBSwegQEzjp66UFx0bZvp2ajKJEplYOD994aCNsCL1vlgFBx9FVFPpPFM2fOqtMFcf/CMJDFaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149348; c=relaxed/simple;
	bh=KXmsqY+Yl9J6VC7C3sRoq5iSnXOF93yU2uJPTfo6GLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKX34qDfr38FyvzcoEgskh8F+hj9RsvHj3ATRkHyD8jMSMm0nNTmsViyETK6Tt7Pr77WAb7PwWOgtR0rOn09XbUpwgRarK5mZldK5HM6OXFD5kwKWcsJAM3igLl7MyEtxzf9wYI0wfzKDDXZnNJnQLLsFTzD9+0TKdfOEsPr6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKCY9pny; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKCY9pny"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-352ccc61658so14649a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770149347; x=1770754147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVQhqA97aNi4iwum9p1p2SwQkrduofkl+pPHMaPCBPM=;
        b=EKCY9pnyCnAXESn4UGgZ0nOZG3kiGfVHstEsfYvE+ptMkDRD0QcgRAvJcp+kvb1W3J
         TOrIqLUFES/nwzzvD9shzWxNQih0TBfeaikD4e5Tmxu1xq+SB999q/RMNHokk5p2DhiX
         oVqf5mpnxZiA4Pbrb9TIRo3cEeaH7+rAjdDGZQDBhUj3JETIUQtt/Log1qiMUrsOcO07
         ci3HaCooruZFdSV82+E82fB8i3rU4s5w/CpLo4afUSWBKSS/v+VBCLYkdt0Yj6nM+44C
         qTG+BfjFU6alalAY3c56cYC3Ms6taxhVZ5SMWlX8PPxWybqrQRNXGdY80gBms/Gcw5u4
         JGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149347; x=1770754147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tVQhqA97aNi4iwum9p1p2SwQkrduofkl+pPHMaPCBPM=;
        b=U30lusMM900gMweyYoXf81hPTm9jDsqtq8YOD8v5nmLP+fNW3t988njQlivtMuoX11
         paLT36BUve5R9hY9aaFEupr+pQtGB+T7iYHj810SC8Th7J58G4kS1K6Lrv8R/HG07Ao4
         Tuejw324jUeiUeN6jvBB31vR8My9INq7SMquS+cIvFonVwJdZos4D2X1m9jwTm6kUhRh
         gPyQvoWtDnPgpgiwm6qZxYPgZa+X47jnqHP9a+XTD52ChwDeGRrikveBuh6luCoU6sah
         XeK7jSybYTBTMzcEBomHp4ROlZMUHKFbUPjREE52C7PaN4LA2Ype7RnalWEt1/+6Tr7T
         bPtA==
X-Forwarded-Encrypted: i=1; AJvYcCV4QHKG3nnePJg/uXSOZ/cPl0JUpyhwl6Cbtz9oOVtxPAlMAapM4E530Qjf7F34NKHpKVtC1eXPGlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvH6r1dVOF5kjBpQg6OSUfhkbWLjf0VybelvL5jpDOvVJVof7h
	5SjYc7ZhDBgigjqaYy2slJ+oNxfZWRwLozgOhJrJhbys0KMy3Jtqbv8q
X-Gm-Gg: AZuq6aLTGihvylXJnjP2x/wTvTPgZjZMzZEH9Sqx9qq8MnSjlsDTtWiw1yvz3ES49p6
	ukNUTfLxvbJMEcmcw6r9A1iN5N3hDSSOnsqASamvh/EiIRft7eu6eneIiYNdZFV60jxOG0+lu8G
	Z3NWRxfOKDYyzRhMekgUS2WahjPw9rNu66Sz9GqePM2EHzI2jBEQF57sr+VCzGuGDVdgqqzvwtV
	UAWGOUDt65tAygkEXUecZNJJJRcy0TDVIkTGwPA4YI5XIQ7LHV/dPN9lTWHzcWAc6QnkN+7Xmnu
	jriYdfTTXyLFNJegeploAFqkKxhBPSfv1E3mJ+RzjG1odl6f3VG81HTEHmAl1eWesid0gBntYk/
	rJ4y5yn8DT+Z68R3Q6d6hpTQh13NgiH/dseNS2xsAyJDjq0WW/ktdsbJf6r0HRJulJwjmjma5yy
	ZYGIx6x/mCZYWiyG7K0BF3DA/QoaF2NRz++64=
X-Received: by 2002:a17:90b:4c51:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-354870b1e6dmr395651a91.2.1770149346689;
        Tue, 03 Feb 2026 12:09:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485b77664sm479374a91.0.2026.02.03.12.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 12:09:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Feb 2026 12:09:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Message-ID: <fb5fcb40-1cce-4de8-83a9-c8a7f308505f@roeck-us.net>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>

On Tue, Jan 27, 2026 at 05:18:22PM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---

More feedback, with compliments from Gemini :-).

[ ... ]

> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return ret = mcp9982_write_limit(priv, addr, val);

Pointless assignment to ret.

Thanks,
Guenter
