Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28844DB85
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625896; cv=none; b=EDSWSu8j391YdOhGIl8qlbFc7k+izabjiBNp/Tujf+aO4/xk5qzuZ46FA91XTPmEdrhD6xkf5CWzzIBhne9K1nFGss5F9J8BBPVvIKePmfDvmguP7K+QM7puzsyVL1FNP7I2mxmVX6Ho/nSno+8g7G/IAYHF+0KQ1nBClte4iyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625896; c=relaxed/simple;
	bh=JTt1BMASzO//6s0s3UfTfNPQ0ZPG1KOklgGV1NBlrY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+pZoM8F4mD3fcxtRwEdQ+L2E7oPRDXNkiAzfICERwVbrIN/y7AHYNvVo6RsyfuerjBj2BUFZIzErAQYhbEeve+Q9rVTopVvYZQHFcPs/hasj6WrT6kf+xuoukcERWAArk5+o5+Qor0zPkMEIxeQbAWM76eWV0EMcPV4cMUu7/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4+k8NkB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4+k8NkB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so3128308a91.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 09:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625895; x=1782230695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5o8E4nnwz23oQMChItrPyRSqtcUPm5+4qrteQjtd8Y=;
        b=o4+k8NkBF9BBDH5L/o9pOUnIJqW3hTSSTgue1TtfZbVchwl0dAyeA2/vzyPL//4CHN
         9ZM9Eo2QVCBVO7YchNwFEtjVkNiVkaZUi5XkcSFvQHNXm5fth4KjW1iaRoas7dp999Rr
         2jtXsn9jYjgpsWOhOW/VMWrTnfr5lPtjtgYisNVu4027L6glaPxgU1r/5NN2O/A1Gd5J
         j2LwTYCQl0SdKWhI0QVpWxH5oVBO0xkPpUbk6eT2LKUfCavv8XXn3dmAgKP0DzShVqRx
         TfJwjd3sjCkyOn0+neH/LX+KfQQ+06bOllsar6OkXAK9K2tgDXadYzByBf/tdgP2ybZX
         OHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625895; x=1782230695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5o8E4nnwz23oQMChItrPyRSqtcUPm5+4qrteQjtd8Y=;
        b=B1qCxdjkwR2YR8XQb8lt9NLR1UN+WA3EEOV6fIc6nVZWW+BP9jRXlz1b/3VoU95ueT
         S6fDC2IyMXrawQn15ct8H2zgtImsTyvUQK7QL17wxVPKwe6K7AgHRXXKJ9S6w4N7um9F
         1SkgUOjQLROVY7eFqbJt5lB/+YbhTGXGYOmLlbYFtaFhWEUT5H+bRN5xb1qCiI76Alox
         +xa7xUl4rHva5HsvkIlEO6IWaxCM0u4xCrnUpB5WEtXogbvtQFNknYuOO5Ep2Kcew+QA
         fmG5JIMUt4RkF3K06pJimyyc1P+QTKvpkvhtP1uhjlBdQcJyVqKSV9sFCLrNlOIGHDV9
         xegg==
X-Forwarded-Encrypted: i=1; AFNElJ/chRzgVwUD6w7JKQty9/POp4GgmCvASQEiHHMMrZm1qtGunOemvY+MGeZ+JznWqwwcIgzerk0++5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+ps2jk4MIa0qgkmxkFJStV+cqMnA1AYnE0a2UwoRbwF6q4Tk
	No76x3qLJSNLt6MY4+cZ36OAgIP5UvZS/zhMyDOi9OfJahqXnkxCrn6l
X-Gm-Gg: Acq92OHDFrHHsedLQFOZ6Id/cI8rsQNTaSHS9x/+nRqs9O+bHSHwiN9ogFT7tLe1U8E
	dB+mxBR77tWZS1yOmg/C7rTuFa0qBRH2ZPnXJMI6ntOYfqTuMuU30cGU3WotQt87l2PV0dYhpsx
	CPBkbzTtZXz5Wunh+y3+JfYzgXeuBtIB8CUHohXDSNTpYcZWIpPdEiRK0YQt+mAhh7PQs7z594e
	PKiHOf3vXefKJ/gd8QregDUBNIMNZQB/FPJddPMgTsO8ZA+6+7ntv1a19jX3HdGydUX7S+15GQj
	wvVIaVWYgD8uXsDFfVwSEIFezV6qYMoPXIWpQo2M3ox0w3GxLTKjOizrL/cGA+n6wyniQXLa366
	GJaNjWw2uu+1h126avH8U/qo8VshZ02j3gkTu6GjDg4ULJTeNFryf0n+eBEBev0KD7T0qCF3qxa
	s3J6S1SEO9HFan5Weemnnq/Q9l7oA8JmcZJffW24HJHMyZkV4=
X-Received: by 2002:a17:90b:3b86:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-37c930ac615mr128203a91.3.1781625894719;
        Tue, 16 Jun 2026 09:04:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521aa16fsm3366290a91.4.2026.06.16.09.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:04:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:04:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ziming Zhu <zmzhu0630@163.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Ziming Zhu <ziming.zhu@silergycorp.com>
Subject: Re: [PATCH v4 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Message-ID: <0b3e63c8-1249-48ef-8f96-2309d7177c59@roeck-us.net>
References: <20260612030304.5165-1-zmzhu0630@163.com>
 <20260612030304.5165-3-zmzhu0630@163.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612030304.5165-3-zmzhu0630@163.com>

On Fri, Jun 12, 2026 at 11:03:03AM +0800, Ziming Zhu wrote:
> From: Ziming Zhu <ziming.zhu@silergycorp.com>
> 
> Add PMBus hwmon support for the Silergy SQ24860 eFuse.
> 
> The driver reports input voltage, output voltage, auxiliary voltage,
> input current, input power, and temperature. It also exposes peak,
> average, and minimum history attributes, sample count configuration,
> and maps the manufacturer-specific VIREF register to the generic input
> over-current fault limit attribute.
> 
> The IMON resistor value is read from the silergy,rimon-micro-ohms device
> property and used to configure the input current calibration gain.
> 
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Applied to hwmon-next.

Thanks,
Guenter
