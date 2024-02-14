Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1237E5D75E
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925682; cv=none; b=t4ydV0EoXfl/VXpOvxqoUNbHF7BrXnpvDW0FwFf6ZWfaMPtpFt7z6um1+rxKCMIqYwa2hDYLI1TH3IVZZR2ygGzTdN5JibsRVejJsptCwxskUKEyaiqqucovg1KE0Gr6XgjRONE6xnthwM37LvWrU6zDuZTCjGf3J+be+C98Zfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925682; c=relaxed/simple;
	bh=OXo9CJObNilBsOGumalkvDIP0Qjf2R+AA2nb7vEMJFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dedNYVi1S0X5x9c69wDD3JE1M5nW5KnE2Kq3whU5Whoe2272zdkaxToxHTSU1pHYy8SgFYlUXp8ygZrNyCAsgdnaq9IP4oHKL4QeVVtf2vk+MQlq408IArRFH//aTkmKS43gKoidX9ugRmJoAqqb0SUXHqsUXphnqJyqStxFp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJErqcrb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJErqcrb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so7545179a12.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 07:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707925679; x=1708530479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McuX+46GCJMWVVIeDmGS2EesDa+qgN6dZa0RniqPfYY=;
        b=fJErqcrbwLtPl4rojjxpSNTwlp5EjJvRQrN08CpPv1JBvWA2oanw+uDYAbgMX4ECAo
         C3OQNoLLD7D6q7TO6n37fxA3hMVT0djzuy8Mrf096l2/KCHRY5xXIaTb4PZkM3duU9Ur
         NTk/a61jafgQFUxwpuaP2Ha968HOpCgnJuSkF941+WGl/N/VT6qFCoI0rRVEgtdgtQAi
         ntBgREnSfRpjnMkO7id5IuMcwqm55ZTCCfuqDsyzfb6ddBKEHV3yrlAW/1e3jqYHBOyn
         x5odjTG+Jwtal1dHoHO+ZVdmE/MZJ8Nzc4AtQCEN3SvHS/hKagj6p+FXiCOlBZc3Hd2k
         R2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925679; x=1708530479;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McuX+46GCJMWVVIeDmGS2EesDa+qgN6dZa0RniqPfYY=;
        b=B2UBS2/yHTjlmeIn2yBz3BkyPXplQhUhMlaW5w0rPIoyvgbgjO2uBxurJEOb79mS+f
         xi3dC8Brjn5s04aCXUAhbQERBc/oaMvTa6Y7xrBh5QD/Zni9gguGc4OhjmUy8KqQrHJd
         Hylq6+x2PmNQ1hNQP5mgRhxa6v3k6Isr5mwdrJvTR+8e3onb4z/hZIo7vT3FkDjDwavh
         UHa4bLUxcCI4XHxlrMI4/6lknYgLzEYj056NgAuHnjm3gJiEzLBFx9JXJiadkYbhEGjr
         Muf2RTrZ1h/h0n6w9HdxQLhC7SJOIUfPl1sX0Gl4doL/NS90fmYeFewOxOKIoW0OutvS
         4Ojw==
X-Forwarded-Encrypted: i=1; AJvYcCU2aTo9iBZhSrpJ4idYPkpzConPnCDziiRK8ghRHGQfl1BFYptaP4HEgswJ5aeOd4TBZp/LupBq0KgOafuXGVrtwfBr6PbCEINm
X-Gm-Message-State: AOJu0YzFDvLCrCpRTytIK9Xze+NGrmGfGY1zZcZhDojp+/lMYBR4P/D3
	gE+Acou/RP2PO2EDS8qwKlC7i6imOk/Bz0UnPdlcrWbryqRgmVKdQ0ZT4j+Uq+k=
X-Google-Smtp-Source: AGHT+IGvFxgX5xtNHTBtY0C7eJHL1+eIyCwo+5PZLWqptHy/PaLq5avuplbL8is2vdZyJDDISqW3aw==
X-Received: by 2002:aa7:d752:0:b0:562:10a7:9ebc with SMTP id a18-20020aa7d752000000b0056210a79ebcmr2286734eds.18.1707925679279;
        Wed, 14 Feb 2024 07:47:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUz6FmQmF5wn3+zPS6iPau8SZ/a9b4GG47ZBDtTcZsdbARlczj3X3HDZ7VCr4lYdZgGmw0O3qjxKmLBU+SNQqg8cyJdgFpE0goL9yS3+Y/ch/8yobscE2JRBajb8iw24jXUFK9bhYBAdnPuNh9swYTi4+1tpo92mLZHrijTpWPJ08TKi7hOFrH0ZqpnQfJ/NdP7xUsW/VCJIuzQKq5zQk1jtQ2nrNmh7mgbD+jjI5bY3KC5AAlPttLPp9vcGJS7Sfcneb8xquWCn+DNrDMJm3QnmWo0secBSBTV7X29e25Otd4DfnXTlGt1JMjL0lTUGahkBeXTx5UjIOPiRCQsMhFM/VF31zzl5c31y48nNt1ocIGfTKGZgwM
Received: from [127.0.1.1] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b0056200715130sm1424435edw.54.2024.02.14.07.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 07:47:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Christoph Winklhofer <cj.winklhofer@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20240214-w1-uart-v7-3-6e21fa24e066@gmail.com>
References: <20240214-w1-uart-v7-0-6e21fa24e066@gmail.com>
 <20240214-w1-uart-v7-3-6e21fa24e066@gmail.com>
Subject: Re: (subset) [PATCH v7 3/3] w1: add UART w1 bus driver
Message-Id: <170792567823.152954.6100416373090677412.b4-ty@linaro.org>
Date: Wed, 14 Feb 2024 16:47:58 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Wed, 14 Feb 2024 07:36:15 +0100, Christoph Winklhofer wrote:
> Add a UART 1-Wire bus driver. The driver utilizes the UART interface via
> the Serial Device Bus to create the 1-Wire timing patterns. The driver
> was tested on a "Raspberry Pi 3B" with a DS18B20 and on a "Variscite
> DART-6UL" with a DS18S20 temperature sensor.
> 
> The 1-Wire timing pattern and the corresponding UART baud-rate with the
> interpretation of the transferred bytes are described in the document:
> 
> [...]

Applied, thanks!

[3/3] w1: add UART w1 bus driver
      https://git.kernel.org/krzk/linux-w1/c/178cf9db9e6d8fb0c026098c8f2d1fd92ae3d79b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

