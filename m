Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E343A641D
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788909; cv=none; b=RN2VbPs14820Xcw6IREtPRrSOXNYV9gJQd7ha5xLQ+eK54+eiYzqVYnsjB2CjRnYJ7Q/kFdqjesChGBVVkc6tHeD4B9MBfix35gkOzQg0eH15bXw3sTOCudRQ/sIjb3X3YzYk0mEg78kmZothegVyP6CHJDgatBq4LpVWDDgBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788909; c=relaxed/simple;
	bh=SUe2Z7csLu3EIVSgP3ikRvI6dwffX9wqRIZ9j07Ovhw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=e5XlgEeK0hBwwSb4vHneI6WSIgxJ5pSh8RB9dDCyDnaowGpN699ZJH8U6avccjQT0Qlb29Bxw+yP861fJe1V3zI3GBl8wGTGpztQaWOvuDkIZRm9emS3VEOfrvdbARLNls0/8GgHg0yT5kgrdOC0Y4v5Q8NZTK7f64JGpjSV6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DG6zvNGH; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DG6zvNGH"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1330d6bb78dso5235056c88.1
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 13:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778788907; x=1779393707; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apzLLVPJoJDzSyz6mTxviWGjUoPCsnXa0PozzLDEgxo=;
        b=DG6zvNGHi200NQ6aoIFP+TdLjIn/iZoZiTfJe3oMkkcNVyw7uBWa5W/2wYvlrR4rk+
         eTNIg9nUmwwbbb7Ng16wWu5AxjYc4pFIP4UM8IbAv96ZlZVCSsI4EO0e1X68X5S1BawK
         ZQaTlhwh/ZUEcHspAlsp0NHiHBEwN11YqUktC95LIn4tR1HGqAFySAnC9Y3aCmer7kKg
         ee5CPUEFQgBzY2EDkEuj9rb+zUw6vDregfZsAMu5VbqNNwsL4A6kA/iPLWm8waNS/140
         SRZA8TNBaT3/xU7uLoC67Z4VIcn4ifF3+vyRvFuHtImf1EWjQN/le09L4ph7ItHIFej/
         D3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778788907; x=1779393707;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apzLLVPJoJDzSyz6mTxviWGjUoPCsnXa0PozzLDEgxo=;
        b=g1IztAYLwL0C8KhssEd5JR6OvZr1TbTUAXm6ZdvbeUL6uxHVe92sxPge4bzCh2IKVL
         QBV7HdQEpgq4KTLlkxs6jOO9UNxJZEEy4xxo6T44/xbDX/ApYabjGWG36wdE+lQqyg7x
         NcP2AV0mmNSIWicRFbgA1/hZ4DAnj12A6+fXH3EqHOBRF8oeAwdqFeAp07r1FAa13Uvf
         PRWKYjgY8qZsc6qggWQCFD84VA42Vo5fmw+r3+ioUVsXl762Xwr/yNj3aEs7plxeokKS
         3lpNXJnzZ0bY9MrEcSEdo1kBPduZNWJAeIBdcOwpv0LaxWFcqZzv4VVd/f5TelgcwNDv
         tlvg==
X-Forwarded-Encrypted: i=1; AFNElJ/sI+I/4Lqvdkq7iavYCd0A6fKYt8oXSSWUwbAZhx1SasiCbYvkO6YjktefzZB9GAfc4IxuguzPqMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+37eKii0yf4z4KTS9o3C3xfJlBM+xNAKvYvhI9ifVePRlIHQ4
	grGbG5y8OUtS8R8+hvO3Xp6gyTcam/m3J0VWl1pmFXV8Dy6Gs7RcXJgjHQQI//APTVI=
X-Gm-Gg: Acq92OGC/uasMnb5BjOK52PunDGwzEnyxTcluPWaFSbWEcfsQHgfE4VSl6Cs45OACHy
	jg4WSwWO2n4uhnD/PtlovBLE5qEwc0ipT5C8LAcqUQr/nyj3SCl7YbEGf6a1nkcosOmEsrib72L
	bp/7ppzxvGkPSrsGTHl3WlFeo61JS0sSdKxKSbZKSudwOa1crXukFvwWTuTgouLr4pGWuagt2ui
	bnDE0rXmSKGCZdXzwSrt2T97s4MN/88XzaWvqkpWwPw9NNgAq6hXHNvj1Wk/SIDcb/fpngvGyBV
	Mebv5vIDVQm39JRQGaXAsftJDQC9gtp7weT0KEpWFvFiAJ7GOTNddS1r0W9NS9uoaSmUOCD8b8j
	j1Da0bH1eVQCDEfA2Smxe5P0v5uBfPPIB24XsAsAYfdd/iSEcC0l/cYeO68C/OwMjhPScyF/IYn
	+zfyRbb407abZrlYE3BBzcCZZnIkmsnwbj5w==
X-Received: by 2002:a05:7022:220:b0:128:d29a:3d45 with SMTP id a92af1059eb24-1350474413bmr286821c88.22.1778788907100;
        Thu, 14 May 2026 13:01:47 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm5914767c88.13.2026.05.14.13.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 13:01:46 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 13:01:45 -0700
Message-Id: <DIIO1I9O6X0A.21ESYHG7CYZZX@nexthop.ai>
Cc: "Guenter Roeck" <linux@roeck-us.net>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-hwmon@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260513-d1u74t-v3-0-27bcd6852c45@nexthop.ai>
 <20260513-d1u74t-v3-1-27bcd6852c45@nexthop.ai>
 <20260514-dazzling-ethereal-bumblebee-d9b69e@quoll>
In-Reply-To: <20260514-dazzling-ethereal-bumblebee-d9b69e@quoll>

On Thu May 14, 2026 at 4:43 AM PDT, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 03:33:02AM -0700, Abdurrahman Hussain wrote:
>> The Murata D1U74T-W is a PMBus-compliant AC/DC power supply unit. The
>> binding only declares the compatible string and i2c reg, with no
>
> Describe the hardware, not binding. What does the hardware have?
> Supplies? Pins? Clocks? Interrupts?
>

Hi Krzysztof,

The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
Each variant delivers a 12 V main output plus a 12 V standby output
from a wide AC input (90-264 Vac) or HVDC supply, and includes an
internal variable-speed cooling fan and on-board voltage, current,
power, fan-speed, and temperature telemetry.

The host-side digital interface is a PMBus 1.2 port on I2C.  The
PSU's other electrical signals (status, alert, current-share) live
on the CRPS edge connector and are consumed by the chassis
controller rather than the host SoC, so there are no host-described
supplies, gpios, clocks, or interrupts.

If the above two paragraphs provide the adequate description of the
hardware I will include them verbatim in v4.

Best regards,
Abdurrahman
