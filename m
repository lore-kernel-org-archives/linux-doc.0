Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB7280317
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543129; cv=none; b=FZm7bWqzblr0BU8woWHOLTP5S8fe6Dp2iNwmreshdevOPvjcVAZhH4cCBiglDvn4bLqLJuKRRno9sSnbQulKDE+rsVc/Ipmcm4yZF8dZnuV82BxG1K83b25mfp68QS/8c292NLA9aI8BcTlAn4gk7A3yU/VJ1zoKXBEqvXbyAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543129; c=relaxed/simple;
	bh=yvgWF5tnQNZRDjc0fGYDrUE1mlV0Lq+VUCZV1FeRugA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhA9Cb2K4OW9BDebvOcqAX41Yjon++/yh1iQX4FUbW82ZXZVwWSXB9DLSKlr/C1T2W7jwE/1flkoYDZqZAYQ1c6oS3i24yQP3CYkqM6+4Dpr+cWAhlpMIHAiuJ51q8Ft3KqR2TbyzlxKcmkeseC+VWDb1JGj6Ry70eB7tnz/yLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2L/6sPv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2L/6sPv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf214200so47571065e9.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543124; x=1750147924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=B2L/6sPv4hjzgzss/Y2f2WHnLWyp9sYdo19Olow9g9PDb/yXFShZzQ9piKhvc3trpC
         yhpDpBgGwdy4UBxUB4IIMIT1BvF3EH9qXOXUtw9GC0O3cksdqHKlfUdBfYam2iflpPy2
         Nojx5YbuXh99Ge7RUW1Ji8+RVNtM2M6QAzk+k6/TVIhCBKiUtUaItqAhEnaS0bYBpA4A
         h0cDAYljIHXTGUlYwoEcq3slWgVXIJ0639p0/ock22bLDGPqWtsBVep71qxQq6dxNkAn
         F06T/r3zmozbUbLo+39aYxRjckIWk7/Z1qYrRbifIYTtwjj2D9iRnsXa4NlTn2pBHIHa
         Irrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543124; x=1750147924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjgQIJ76dKbmwwjeGXopIMo/gsZHO8kBrQYsSavUt0k=;
        b=U6nAnbzT++g3etLsAbO2Kin5u28ilDECrbAHdiM7Dmk+4zTpTb8fQcf5nx2eT7EYEp
         +nNXMvaQCPD+2Cy6SvIVIbx/71VokJ7vlkZL7S6QMQzUR2K/YornDS9lxVa+vvG5vvw/
         s3oMTh6gkM4xDQc1zru/e9ldLNeCQMp1nquz5Zz0QZdBrKkmJkYqtzovlk2PxnELvdyv
         bk6EedHXxXE3PtY7zbvenfZGk7tJ7Eo55JU5oJJHo8mZ44V/pQu7Z9wgpAzprJI68MIX
         3dQlB51kQZnMc7ukOvuxWtQq7wBMt/+LKrvnJ0E2nX9pmgZbtfF9iulDVTYIUIhrWHs0
         16sQ==
X-Gm-Message-State: AOJu0Yzes6GNpkZnRRBHsLh9s3nFrXA4x6yhFZ3XDNZOyINZfK7OzeHl
	ToiFlv5wvk9qEkUtOd2PR91KY0dxi+xV8zZmkBj+M2fQolrSF7kqjFfj/yjSDQr9H2nfgVhhHMm
	oDpW2
X-Gm-Gg: ASbGncv4KiQY65dCTiNUfWdYtzK1hnoZuUHVyi5yN4R/J4XkAYQx7RT3WIg7Qt0xvud
	AYtHV3zO1IJE3oClB7RZyzNDlde2onMUghF7stexlKy2tHQs+w9sNYfDW8PKi4/uZZLTN0hCK9q
	pMI+45ckvOPXyWtg6X9/Ry4xSUxqCooR4RJfCKjoVUDBGh+Fm5Z1E3E7TpN3KwXG8eSGBByK2nI
	Ee6enTeH5DKrubwSxQultzp9Riy17zn0i2bd/htgehAi1aVkVUFz2wO18z0gfdEqcQgJjEZ6oeg
	Ap6AGbuZPF6FMBNj1c7YJO8O++D3QDj6a/FY5uhTk3J4URbaLZ7pMkBo38Pw
X-Google-Smtp-Source: AGHT+IHw7/V7r+W55JJPgOoMHWnb03kXm/kQE97NwVLeZNevpDtk4rbU8g1Mkp4wQwowMYR4Dz0aYg==
X-Received: by 2002:a05:600c:528a:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4530efe68f4mr70110725e9.12.1749543123640;
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
Date: Tue, 10 Jun 2025 10:11:51 +0200
Message-ID: <174954311123.28634.1499230964159731709.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 01 Jun 2025 00:21:37 +0300, Andy Shevchenko wrote:
> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.
> 
> Andy Shevchenko (2):
>   usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
>   gpiolib: Remove unused devm_gpio_request()
> 
> [...]

Applied, thanks!

[1/2] usb: gadget: pxa25x_udc: Switch to use devm_gpio_request_one()
      https://git.kernel.org/brgl/linux/c/32f6d31dc0401e6af7c48e5e2381997b6d957d85
[2/2] gpiolib: Remove unused devm_gpio_request()
      https://git.kernel.org/brgl/linux/c/a5589313383074c48a1b3751d592a6e084ae0573

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
