Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A96346E43
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414829; cv=none; b=W5lI/vUV3m8hgU+0SVzZe/y4nXQTPiuGyAzZgdjKxyOQXshBkPy71+uiYdq8ExYeCFwzhmhc28uTmhiyzCfk9cDfdBnx3cs92gy6LX6B/vIDzVgbASMQOr3SDGNxV1vyCQSUwPBXt9OaBUNcWUGgxRuL/i4iMIbFwaIGzFjS9eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414829; c=relaxed/simple;
	bh=Ptei9JoVVIB5GON+lwznGIQ1eYUaNiXHrC992FdBm7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qo/G0PpCjH19c8wQJJJJR7mEIisjrHYw5YaQGYFeBVa3+SIefxywMEAurpGi3tXc7C0dEiEdfQEd97hqm0hQIc1eKGqRdWC6GX10+5v2k1mK4N0RKAA44JfjT9fMXyf9SxjAP2RwS0KvoE3tUVzIN+pqts246IeWwZSOeFa4K38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk4oBKiT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk4oBKiT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so27125285e9.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783414826; x=1784019626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nkwcchEu9Ml4OmDJXkdrk/JL5BeVqN7tOXDSpcJEoU=;
        b=fk4oBKiTT7WND7oHClL8riQ8wBTiyB0XTW6TYcw2NUYImdtXXpx4xpvlkU8pPY2KWs
         1UBZALT/wIBM5qnyy1mv9146azNqFccW3kgwpxJL642W96FqXxi3lG0vSn5FUZ6GrxWO
         ICEakBmufeqwinEh4BqfSsqm1hpUtXKK8xYbkz5ovm9SlshjdlyTXzzhCV49SDHQh9Gu
         SV18LODCrFCWEGw9HXhzKaC1btYNXHjX1gG9UlnUknAaHSKzXn0Ka5OcWDgZjUebgWGw
         9vQTstDEM34z10zBrbZbBsTdlnTFoL9zh+UXpUzx/9lRRbvnK4cUpo+5s1SeCEPg9Ow/
         NRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414826; x=1784019626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nkwcchEu9Ml4OmDJXkdrk/JL5BeVqN7tOXDSpcJEoU=;
        b=nv/736a6GwBVdRzcvvvgvMyTPOZuzFFqIy6IGnEZvia1U+0b0SexH5QoXC+9I264Pv
         a1uM6cN5gIl3ccm4elpE+fi1qDnRrTmMtUGHqzyCP/GnU2aCf5pFoOZ/JGWnumx6qUx7
         GgV9xR2GP5Gj+EToc21+/+8MhH4x6ieNHV5CoAcQOQFOkIc9ESA7gWzvaY6szhwP5soL
         lgESwqhtF6fZq0TtgAta8J3xgLssYvmOdSXHyBLR5w60Nv07KLfBd4UqcjSQo4i10vS4
         VfqfsMFyb5NYyFqddFy4Hl/uJwq24MGACW2N879tXx+TwPz8OYIQ46rN/Gli7hs9OYv7
         mxUg==
X-Forwarded-Encrypted: i=1; AHgh+RpUa5SJWeixnZQyzsUm+riiodZG9GP18ZDN3l0y3sfPGEreInqbmmAcJn41s0iRoQyVkMjda+2xvZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9RLXq2q9BH3ZtNiU/TxSDkdoIrYVVShGoyP+/F4uVCkjjhArr
	ARw0Fdb/9S8Kel+zCBMzIpl+71gryRr6TU48wf0uwTC05BIkOmtWWAqP
X-Gm-Gg: AfdE7clsAtxInar7krcKXpBzH5FAwr90hxFsieHeeO3ajrfEuG7u18gPqgzBtEOnSZj
	ObBxjKNWV6R0tOvGfEq5FhmlXl0qBmSrNmIWfA9iK03mqPzBjJdlIkledf1PFYWZWZBTho8ti+5
	AEfGFw5mGjOwrzqYUHYi/RUkd9qJdsMObhtfjQrRoaMbJBXeh5i0sa66eFDvgthQE6klqrU87gG
	kP7i81LOJXvXP7o9fF8rR4Pck+Jz+ItiSqgQWZdSFc2Q1H8mKW1MYu9eEfu6rkENCjxIJ1zhvbp
	JgdLY03cCEARaFlppkuCEEuU3Ll8YhQoq6YDg03OpoXrBKFINnaOCMDRe1SP2Jij9fvjaNmftVK
	rENcPJ6NjTWGh/f09bGdZVou4uRxSVG7d27I8DF4DqkDt7Hn/4Nws/A8mfbU9W3QkRNFwXtXtZx
	brbn+N2G78VOKbCedBX/CmrIFe9ejT45k+/HwUhxbR0I/y1MQDsOWJQMj9UBt4R+5Pdp/G1R+i4
	C4sugEvM77b3Wd7fNHprvV8Hgmggweb4W8eGfFW3j9wc8T3A6bRFpc/P3xDXcgA/H2fu1KkB8Um
	eTBgb7AxfQyVkoSKzNK5ZSyQRrWzk3BuxKv7s/wo88Fl6QzvZsjiS9YfOyUpsrOxIZkr5CDFfK0
	6+g5wy14U+nl4FhSrprhuscE=
X-Received: by 2002:a05:600c:1395:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493e0c325c2mr21882075e9.25.1783414825480;
        Tue, 07 Jul 2026 02:00:25 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f44b3bsm35617455e9.9.2026.07.07.02.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:00:25 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:00:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno Sa
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/5] iio: osf: add UART IIO driver
Message-ID: <20260707110023.00005e60@gmail.com>
In-Reply-To: <20260707014525.1015-6-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
	<20260707014525.1015-6-kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  7 Jul 2026 10:45:25 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Add the Open Sensor Fusion serdev transport, driver core, and IIO
> registration path as one complete driver patch.
> 
> The driver enables the required vcc regulator, receives OSF frames over
> UART, registers IIO devices from capability reports, supports direct raw
> reads from the latest sample cache, and pushes buffered samples into
> software kfifo buffers.
> 
> Use final Kconfig and Makefile contents from the start, claim IIO buffer
> mode while pushing samples, and use zeroed scan storage with explicit
> timestamp alignment so the driver does not depend on IIO core
> bounce-buffer padding behavior.
> 
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---
>  MAINTAINERS                               |   5 +
>  drivers/iio/Kconfig                       |   1 +
>  drivers/iio/Makefile                      |   1 +
>  drivers/iio/opensensorfusion/Kconfig      |  15 +
>  drivers/iio/opensensorfusion/Makefile     |   6 +
>  drivers/iio/opensensorfusion/osf_core.c   | 320 ++++++++++++++++++++++
>  drivers/iio/opensensorfusion/osf_core.h   |  70 +++++
>  drivers/iio/opensensorfusion/osf_iio.c    | 308 +++++++++++++++++++++
>  drivers/iio/opensensorfusion/osf_iio.h    |  22 ++
>  drivers/iio/opensensorfusion/osf_serdev.c | 114 ++++++++
>  10 files changed, 862 insertions(+)
>  create mode 100644 drivers/iio/opensensorfusion/Kconfig
>  create mode 100644 drivers/iio/opensensorfusion/Makefile
>  create mode 100644 drivers/iio/opensensorfusion/osf_core.c
>  create mode 100644 drivers/iio/opensensorfusion/osf_core.h
>  create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
>  create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
>  create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d4199d9e..6ce18ad92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20016,7 +20016,12 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
>  F:	Documentation/iio/open-sensor-fusion.rst
> +F:	drivers/iio/opensensorfusion/Kconfig
> +F:	drivers/iio/opensensorfusion/Makefile
> +F:	drivers/iio/opensensorfusion/osf_core.*
> +F:	drivers/iio/opensensorfusion/osf_iio.*
>  F:	drivers/iio/opensensorfusion/osf_protocol.*
> +F:	drivers/iio/opensensorfusion/osf_serdev.c
>  F:	drivers/iio/opensensorfusion/osf_stream.*

Looking at the list of F: entries, wouldn't it be better to just
do `F:	drivers/iio/opensensorfusion/`?

-- 
Kind regards

CJD
