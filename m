Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98A1E1C11
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619185; cv=none; b=Xn5l9m0klhfdfnE25kgNMJ+S2VQW3z/vgasZ52plcdBSJvfC2l+CN1I4xq7MkHMetTtxlHB1fcT0tVOLGpxBmVsxybXf+f6PkNvnnYajRn/oBsr5/Qdnr9mEwyFjVXXSAF25iR1mDUqyWDK9I+LVDVdcZzx4nYjHLK4kK67NUmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619185; c=relaxed/simple;
	bh=3LrO+3uAhEcYoNGmJx3iNjvB7cvq/qu/fv/qFBwznC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r71GxZ29lm6TlHJNRCKF8W40PbCHPShekX5nxfkBz+sirjjY9sYabZE+CFSVa3juALvcaWZjgzmCh/IJ//YnUfxR572liRZGFHlNz6sXjcJM9bv4vmMr3u8uXhDuhZ3llTaKgbFwS7gQQPai/+9u2yUgBhLhFpayso4HxK3m/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZmc7gG7; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZmc7gG7"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127380532eeso1734892c88.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771619183; x=1772223983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZUWYRoA/blMOConDb/gz4Dp4zS4A+VuBuSeP0SKMyw=;
        b=IZmc7gG7Tsyn64Cbea/WqgpZPQSsFlOwfvBY9nBg6TG5Gi6Zw6GmVX7NulXl0JHD2+
         pAHOJcP5ob/IqJ+5XU3YyNE8aUIqf+0c+ShZdXmJN4hSHV5ceBtS+LI8aRmtE016Wys9
         1ZOYbOVLqabtuyoJvE8P4liM08+O4f0OPJ4OX77BOcbTkjaM+Hs8UiSnkCFSvP8FqWxD
         ZhC5cSe/h6GN0CZpGmX10xkyfnihZgEDXlN23v/4govSr5dvIv5gfmYuXGwJ1QR2Cz5L
         ZCoNBHUSSAMJ5XHQJ2akv+HOCobdDrCrmbl6FFKAFpPk368xWaaFmoa0+URRfUXCKyoz
         PixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771619183; x=1772223983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZUWYRoA/blMOConDb/gz4Dp4zS4A+VuBuSeP0SKMyw=;
        b=RiQuDWkr2PL80LGMdJX5NQ/OZFPTE4g4F0PrCf3MXjaaWmC5NVN4Ammr7ydw8jq6mh
         nMdIWS/j/9vT1hHYNHsox2nf/MYzhOeaPMcgTNljqOpNwJ2XQMoLE6dFlqvozJAWPjU7
         vmqzhb/obEYuewCMtwr8gRKkhFR8SzF/5jmMoS7kivDFE0cLdEZiYZKYhC+3/E+0jlu/
         u/So4DCagtHjUfTHzR2RaqvZ5iDFQvepAvc9OiY6A3KcNH70lj5fmNKKNOll1M2CGFzr
         G05zDZ3yex10qLttHvaXoQfUVJDwnM3Gt39tHJoLXmniAbHGsMzmn83eBlgjIaQ/ZwTO
         L25g==
X-Forwarded-Encrypted: i=1; AJvYcCWaT3nRU0jF1WemtOjKlw6D2mkg9hpcwMlezEINDHenJ5KUz4tBccJPr7IZTLVFa0hy3UHWj98ODLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpSrV9VnKnlDzFyq08My8GSsdk6uzBBsSN9tFcYetdvSVbmyH
	dhwfuJ1kAvH4a2H0KkpjZ5N/PLben1rG+eFyqgPlHAqXD2ISsEEEdUWZ
X-Gm-Gg: AZuq6aLJ7vopWgdiPzqPJ/W74hbwwZzzTFIGK/5G1GWDxG/fOEe9DA4E10RazTfEiQN
	XXRvmgNmajBZ0QZkrOG6eUn5DSM9pLw5sIOX5XzHySIdyMiL9VakTmCmZwaRQgA/JjmR2U+AgUQ
	n83pCGfeWxfwXplYrU4LyMtgGyvBYf1HxLxfMCk4lfzaqEDTYa9mjVDI1o8tHkE+n3nNK9WMlCd
	4PRKNJN/TDXiuGvl1HejN7MJV1qIZm7F3hLduq4kii1BqSg3jLm22UCoDH+cBLCwXcCM81YKNpE
	Gevx80V3AhkNOhZJ/ve5zFbe0mRYTq3WHMAXoTNFapIIKpsJVSD1wBqiTOBfrXGB0eizupBjbwj
	LVIlT5N8OIUL3brcHme80/yqrseuo8BAkIA/kbK5fnG+hb04AZjSsE/JB7fP5jbcXU/YL1hNd4Y
	EKPqAsFr//DBO/KBQgKwsXy5Aea3295S6S0rlE0K5y3Y3RjDE=
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id a92af1059eb24-1276ad1a7e6mr475490c88.21.1771619182982;
        Fri, 20 Feb 2026 12:26:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af8ac3fsm415246c88.13.2026.02.20.12.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:26:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 12:26:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E
 EXTREME
Message-ID: <08e82cad-4482-427b-9c80-df49151c6477@roeck-us.net>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
 <20260215151743.20138-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215151743.20138-3-eugene.shalygin@gmail.com>

On Sun, Feb 15, 2026 at 04:16:18PM +0100, Eugene Shalygin wrote:
> From: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>
> 
> Adding support for ROG CROSSHAIR X670E EXTREME

Nit: Add

> 
> Signed-off-by: Timothy C. Sweeney-Fanelli <tim@zerobytellc.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
