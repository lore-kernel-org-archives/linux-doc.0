Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C54119FB
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409641; cv=none; b=B+T8FD4csqeUggPjaumJkwvDGKqVXezg4p7IChpRna/TZQMp3WG49xqBvNvd3WwMpw6VieBH8R5WsSUEOOsl7MtfM7JPWWdNeJS2+4wIGTK8j/ExvhB6VA74q3cLAX6ngs6ZHRvhvWBvekMk98w5JWODzH+xhVE3vEBVfcb81Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409641; c=relaxed/simple;
	bh=eJjTVRMZVoKwofLWi3LVva7SIn7zgP+PhhVCCay9rrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoMIgh0INhSoBQqK6DXS4LV0U2QrxmejfbjQ/fe/sOn8jYkyI+gkdGkGOVNJP0ylUN6WhfXSJCrccUS7VHq+6RdaoKaXZRNgtkmEKe5aEdNEisWgywHA0oVLIGgGyIPeKFDNcknK0KBAIPnApJoHXvjRnuAyl82yLdwAe5Gk6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eho55y+C; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eho55y+C"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13025005e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409638; x=1786014438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzwQZ2FZuL5P8Gv1fpsnj5lYgdyhcN4VWRCQhBah8Ng=;
        b=eho55y+CVoDy2oye0k6Ku9EAGvlotUAm5pXldS0dS0TpZm6wwjbH21pE/g+pTmTCpX
         9nXo9TgZ54wKxUUesOrQ2ve2pkPq5S1B5oVqFlxwZT4duT4Dvi803MF75pXGZP1rKhLS
         VO13oq+RHsRRupSOpLBoLcuwSk/5ROCIsBc+eCusLIw+a5yJZ/zQ1nwdbOIDt3BLzNgT
         tAxzmd9qlhYMRI28MwKFq0X3plpYVL+7TKoLj32PnHbxYPTLBdEJowG4oaVxGCp1iMtu
         wloq3Nklh8ipNvBKEg1SwAnHUlG9kPre/3PFRDUO02hBzSlJfacuCB7FbLapn8hTeLTC
         OAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409638; x=1786014438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rzwQZ2FZuL5P8Gv1fpsnj5lYgdyhcN4VWRCQhBah8Ng=;
        b=V8I2jsKqzuZxmfOV23wdlnYU7ChguZT4FWx4FSEfh8cro0l4RgboUa4xIgh+H3fw9l
         9R/3sxC7mujOMYKUG+6LnAUCIYUzRgwRu3et8Lm5TbW6vD6v++I6/AfIpQw4skwOdFZk
         5dZIhwIcCSuMvjMEU46ClRkuTH33tc9VioAZ+qkkrSCjfPciRSlV/6tODgyh0bYV2+mr
         feFAE7qZ3xEwEw2nlJqM+Ej1CuqAkdOZvZ0H75LaHTUAwEz2IO3drkSMw1tuWuHk/ahA
         TylqGSS1be8n/68gJUStwH62TyiV0lzEfx+63CqjUWtS3ma9DTmNkdCsRZ2TjGpKtxig
         u3Og==
X-Forwarded-Encrypted: i=1; AHgh+Rp3JUsj53nDG2rVpQy5l5spJwYfrlCurz4FLG4NoVOQ2jg9FJHUpCewPUlZRiJ6MgpFBsHU6YyqhaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxp2IR+c82ZroyJo77XY5wQmrQLro80UmE+yWbfo3quffeO0K4
	r9TKNsHTEUYSIBi9Xrzjo3JQ7WuYCjxxXDVpl8zgUfUgnAypLWuJQyIg
X-Gm-Gg: AR+sD115los2bVCpH4V4JY7PJJNRS1GS5Kq4ASo/mNUwyHuddDztkKpWq30vu3i9YH3
	Ac7fBQRETO/6hQFhGheHmPPwdq3G5nZ+XidZIOusftcNCY3sC9GSfZSaNGCUMyzWaRibsTpIbjS
	R56ont6CVvI3xBukzxBvoMIenKo0OxlOUEEkqY+T9Yg9lN4IYJsMCaDFrOGVlNtM3s9HPuOyE/g
	e9CWXw0fBcAm5YakpLv3fWsq7gkE5xaZbDlYCFCzuHv2OXtNfxaCjfTaJhF5TL9BgYQknDzSR5b
	gNfcBe4CRnUWy/EVWBdz/Yvp3skk8sWVgQ4KNADXXBgCKTNSVEXL86wU3KLf91wej3/F71V+kw3
	Mt8JtKBXr5Sz3VjusbKCdFN7wF3fBCNB06FpOtRpUZvM8f3pdw5JqIh3HxEUoDvL4f3TAmj+cpS
	XCvcuLNXjKW5A482vS5uEKaiuTxXzUWPpeRzlmoj3tbs8xoqxcH0/3
X-Received: by 2002:a05:600c:19d3:b0:495:6b78:6f4 with SMTP id 5b1f17b1804b1-49800e70069mr27708485e9.8.1785409638030;
        Thu, 30 Jul 2026 04:07:18 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a0ae3sm54406785e9.9.2026.07.30.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:07:17 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:08:27 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Message-ID: <amswd7M_ROGC8VGg@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
 <amnvYB2Occ911k3B@monoceros>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amnvYB2Occ911k3B@monoceros>

On Wed, Jul 29, 2026 at 02:18:55PM +0200, Uwe Kleine-König wrote:
> On Tue, Jul 28, 2026 at 05:03:52PM +0100, Nuno Sá via B4 Relay wrote:
> > +#include <linux/i2c.h>
> > [...]
> > +#include <linux/mod_devicetable.h>
> 
> <linux/i2c.h> already makes sure that of_device_id and i2c_device_id are
> available and <linux/mod_devicetable.h> is going away soon. So please
> drop the latter.
> 

Argh! Totally forgot about it (I have seen your comments about the above
in other patches). Will do

- Nuno Sá


