Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74718303A1D
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406054; cv=none; b=jRYU9kXSkfJvD+KrtDzAhKzgj+xj6RZwotFulDZOGoXjJsd826wyPEQiRz3nzX8IoFjmCvo/R4X1okOSkoukxASeDCr+Iwvgk5Skb1qUZVDf8/hOSHiIhWnVLsXuaym50xSXUtfilBVQOX9e3SJUNlJwWxFLQWJZorJ72tXdSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406054; c=relaxed/simple;
	bh=9LwQ8cgiBx+GR9gi4Ze2NRYHzMsmpVYF+u+bBwx5cCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBSjh8mEy+YV7055T8gGxBuXku7D4cIBHZR1UHMpIRv2du3ZHSGxNg3AtiKIZacUVK2zmN/5jwzjKMaWMqtTydd1ZeK7i8CQKAmebCc5B8+P6MlAn+gbXJyMyv+0i77gx7odKT3GASFNfrTF47TdYEwbsnvtcSQ8KOlHNPILmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb7vhjgo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb7vhjgo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2980d9b7df5so48415775ad.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406052; x=1764010852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=Bb7vhjgo8i3MdNxVG4EuzsP0kY56sHhKC0hWXy3SNDE+0Ky7g2//Vfq9gp+Z3YGBG2
         kEV2VMszuPQ4nQazsSKgdPOTiRGD1zm95jdORpTJBag6XwmEn5c2/HvrxvuQ0/2Y921F
         UvQBWH0YZMZjhyeFp2YU/N52BH0iW//+scsr+miVtegB+9hZP+42GsqTErMJdr37zFTf
         YF7gzWQjdjmNsm/SlxP/4ZKN6wnkOMpf8uEmxEjzhHoPjE0GreCvD45hd39nEQskXra/
         bg/GnRKMnZp3vn2z/u0j8s3BNDcw8sZ4BbHamAFyvnzIlSksGSxQ/4P1O7k3ELztEwXd
         9h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406052; x=1764010852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=cP7IQy9jSxuVuxeEL2CREbi0poRPoZcqfCFq4wY3SkpM4vbE5sNSnftEyrhhSRS5IA
         dNDzocP7jOPkgz/YpP1Sg5AYHwRdGbV3ZtGtbz2ShXpTASBYWiLZECwNMYsp3rwVgVCe
         3WyluimsVM/sV57JQEPa7m+ZTZkENbkK7jil8xkCchVC8a19Bu90p6nEUtUhpFKgC3yQ
         rUE8YBGFM35C+UxDwf50wUVgBgvTQ+XpiTGYThZIaGDTwp6ZJIFS37aoTJQzk/Wrv9wf
         u87KljnyHeTIh5SuxA8dZWNyjrbIRXFqZMDzAqT1raZnPAVnkY2w+wMn+RKt2OTCZzZo
         VALg==
X-Forwarded-Encrypted: i=1; AJvYcCUQkohdiLonymljp0Ndki90/oko+DYuSY95AF5UyOobHkCKyWY9v3R7gJB3E9k9HTecotZTkQF19CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rnXoUH/hLldSH2Cc0PleEgVmxvdnCxG8+chfhwrN9CHDir7L
	3UeWCo3HKfEWtGBrkeecB0tIs77tsAqeBUWzY39bwUvzXM/jwGSEkiPN
X-Gm-Gg: ASbGncvcr/5N5jbmyW+mvIPmGPomkroXe1O1/hWKEZs0P8BboVqhBmAcKCGTKf2/iOt
	iQL2znDFaoX6pr4fr5j3goqx1l6Y2IGbxwM36oZcgC8old898XcVQQZ4mkwpD3Qtr9qZY84EiDl
	Gh9zAKRDkOPukIUAZ1+cJgiRO2ibJRWz++NrTtPBiMcpP6y0NuC9Qn5aGKc4TYOT3ZKsXI+Ati5
	4QlYpW3jC9ULO1xqiljoTBhg8AOdRLTUyak/w6fXr9LIESHPuMPfyEccNiuRsyDGxg5PDOt2q/2
	8BC93wKUvvRRWAq6HUTr8MAahqnOJvv/khwNtMsRXEdhAUyQn1MhLOauqtMO34xkv+t0KmCbDDl
	1JmoLOtopH1l9DN7aoeWYIC3sNnV+MDBd+al771Z61eabEcjVhmhpx26h1ly9i7UW+7C7Fw+l5M
	aqw4MxnRMhZYkm0/723DUvCimDBmseeLduhzc9XtbRiBg9
X-Google-Smtp-Source: AGHT+IGDVNZOalPoeGLRx0StV1WyF6OuSXplI/tFFH2YjaxRb6M+ZouwxCgXlyJ+r8uHMpC01NlQdg==
X-Received: by 2002:a17:903:198d:b0:298:2af7:8d26 with SMTP id d9443c01a7336-2986a76a26dmr169206325ad.54.1763406050080;
        Mon, 17 Nov 2025 11:00:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm146281525ad.21.2025.11.17.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:00:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 11:00:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <7a445358-ce9e-4180-99dd-1a771c8ffa98@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

Applied to hwmon-next.

Note that I can not apply the devicetree patch (2/11), presumably since it depends
on the first patch of the series.

Guenter
