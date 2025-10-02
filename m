Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F92248B8
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443260; cv=none; b=O9OEJfCu1A103w2zlS/TSbhzVl8sa8wZbJ+9bzix08K4cyUKLGU4hzqHxe3cpayDEZy8N1WE8EHASTLyUinAnA0R1J3LfSY+an3EL2+8q9SYuToIPtsxZqWxc2ZL3A2LwbuvlKTZsEKq6BqYfCAveLJEuHjtsPvpTgPocLgNTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443260; c=relaxed/simple;
	bh=bJqxID90rzeZQW6x4VioAiM9HO5SSBRl9HBk2YS5H4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWFM3FmhNw80zn9Oo32DbEllpXtu5DJQWwBwIItyoo1ULXYh+MVNHBTDj8d2ZP6Hbl5NrJXVzO9qLqXe+cZa2XeW9AEjwvdBCnFmbi+ghcsdpnOsQsWlnHG1Es0y9Igg8N+OSjkFmPGNjocrMBHDUGyLCOIvNKaT0+VQJLsxwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRssk/Hh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRssk/Hh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2698e4795ebso14759345ad.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 15:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759443257; x=1760048057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3afLalH6Ixhx5uorw5x+fuC8TSKfvIs8t48zMbaAbA=;
        b=KRssk/HhYlk35ehaI0gpGlh9LYbeb2RurGBEnSf4DyrH6KZqkDs7PdwhtTiQ2du+eQ
         C4UwFbmMBk7UjEOaxS786ftH0b5GYx9FU1km0nXmfjuXcjs7Gw67WFKsdwDqxXuD3fsF
         FuRY18ILEzo/cYlmwFw34KKKo6buuuhbMm2LsQbW1jXEw/YTza3XsWk3vbssAs/VH1yX
         5/nSXipMMKAoRB0vBs6JcbJHacaYdgx5tb+3KW8LM7uVmdo5qEy0p83Z3l/232YqqkvD
         0WzP4A3GjHNNxBQpcbA8R5orfhwkF3q92akMxSQBSlj6CQQBekFsiCnv85P1oR/BbKKr
         dA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443257; x=1760048057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3afLalH6Ixhx5uorw5x+fuC8TSKfvIs8t48zMbaAbA=;
        b=xCHVDPJBuyAeE+dhyLb/3i5Nn59iGjPybIR0Z2Nw7kAf7zNm5pX42ITbhiDBOSMUju
         +xbIkj1HuMomXU/q/fYlArocugOMz61SCRCJ9T+Opdckj4jkRvnBJJSEtEecVn6ItTVU
         MO7jRmSJ+Uf/TNcfBIZGlDkG4Ogd/pxCFj+eeC/tLjqWRV4AqD0bTeEeBcnopIUylqSb
         VpLfsgj45qXboj9pKdXoEFVfE8UemT7VRFb/skYRgC3Q+ZRrWZg12ScdMe8sktnNjRxZ
         kqr/H7NIZG4Y2l4TjFG28U3n90sG6uS2DU/cHHZIyKiQAHE+c4oA8rYQTMYI56UcFp9L
         D7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVE3gEF8/HmV8K4xsijuUyLHxMgyZtE/cIbP1Z2odl54FjLQCXh43mka78lTsfrxm69TSDKC7lRNhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyetBezBOe1j0Ch3jlMXMB1Nktm6d1xOdVW6VFmhxIdmwgLpJby
	plEdeqKUfb/4lEqipO4R6xT0yZLTVgKCZPduoPOeqyFg6QAv08Qji7pg
X-Gm-Gg: ASbGnctCr+jELg0EZ1zYoXvhjyUuzQkefGqvmx8zrCFylOfJnk+Ke9IZCpdbJYfvpT7
	vFxeLWbg1kXYPHIFfnVHkFPI/i7iytz/kdxFeEkLC3msVaiEuEebcUzeRa+9iHUiHT1JqhiCOlg
	BOzr21XFvl/8NxZ6oyEmM4FGNvLSgbWfy1pdy3A2bPgv3NkDYRzi4cZjFIRrOBTodAv11cPHGYL
	zU5N3kevkDJGiN27o2tdgwWschgbthE5OcfLZwpx2lOkVRLy+tlGqXN4QCj3u3L0Y3oeNI5kEc5
	4kTeLZex4foDBAV3HWoFzA1MU/dnwS2Ns7Rrbh8hFQKJxbrwPBBKT9wJBdP+wGvJw45glUyGvz0
	m2auw+Dp5pvVsj7GlYHfvbDAPX3vEBhk5tSHzXbZlPNOQw5xoLKqcruA=
X-Google-Smtp-Source: AGHT+IENBul3bFqweSZ0dwqDKMkxMEi9ojWTa2JsfjOjJH/8VekQN37yrh4kPtbRCy3N115vb7fIgw==
X-Received: by 2002:a17:903:1b4f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-28e9a6be1bbmr9153845ad.43.1759443257422;
        Thu, 02 Oct 2025 15:14:17 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-28e8d1127a3sm30497785ad.20.2025.10.02.15.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 15:14:16 -0700 (PDT)
Date: Thu, 2 Oct 2025 19:15:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max17616
Message-ID: <aN75bfJINa3nV57Y@debian-BULLSEYE-live-builder-AMD64>
References: <20250930-upstream-max17616-v1-0-1525a85f126c@analog.com>
 <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>

Hi Kim,

For completeness, the dt doc could also have the SMBALERT interrupt.
Though, I see the patch has been accepted and I don't want to make upstreaming
take longer than needed. Maybe the comment below can be taken as follow up 
patch suggestion. Though, if you end up doing a v2 for any reason, you can add
my review tag.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

On 09/30, Kim Seer Paller wrote:
> Add device tree documentation for MAX17616/MAX17616A current-limiter
> with overvoltage/surge, undervoltage, reverse polarity, loss of ground
> protection with PMBus interface.
>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,max17616.yaml         | 48 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++
...
> +properties:
> +  compatible:
> +    const: adi,max17616
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply: true

  interrupts:
    description: Fault condition signal provided on SMBALERT pin.
    maxItems: 1

> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +

Best regards,
Marcelo
