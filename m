Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B2420E60
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993322; cv=none; b=ERLme5J8la2W24UKV4gtUwTOnphKI8PHJajXPPQFzy1R2O3XvpN+ViczzzR/KFmRWD+jT8P8mmpe9axikzyvj5oFJVMZDvoyTlniD2WT2FBrprgvwqp64VzGv3a4/UB0cWTq9B58T/XNkBqEY0y7R4osjFSe6Zc5jmUt94p5Yh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993322; c=relaxed/simple;
	bh=3UWePbw4rKjLE9jN9ka4BAbk+tU9/kzm9ZJJmB6lbeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghj9wnPenm1mLrZrsUWpWTYbfb30QBrKzAsNgMyVEfxf7vznEmKBAbisN/YT6+tNH30GGIKktcTsyYmbU8GD6Az4i5A7F0NyT7XmC1VOPcDtxcLSY7qCOeJtl9vDSkO6cmoDTWLimQjkcsvrzeOOuwBBi66Ww/LB75L31YUetTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULcROm7p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULcROm7p"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b779003fso8569565e9.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782993319; x=1783598119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=t0V/WwhcWDu6tebPbs0Nt6qIlHb80wmhn3NHdOSdGwU=;
        b=ULcROm7p/zMsmFIiUn/Pecf7zLZxyBITk7I+ISXvuVhweGckmqfLSwBDebkpaGzPxS
         0c0XplhV+AR8lZpor6X2P31uZ0JbVmmJ/JiaWgDdFGoCrzsFAhyDqt9h4h+2KIjvbASB
         P49j3CqRUMEtbiK59z5/tjRAh/6iVtC3qhBgcSoNT0Sf6ETxY6gVQzO3CmhtkXUelYac
         gsP4sAcYW1b545RGKtIumLrfu5N2NY7FwW3ZN4K/nGmkKwaPemUgAmcskgohfDaux3u/
         gIovU653/YxGcAiAdme1vtc0ZYMDJUNur0lJasy1IjucECtlcnAExDly9KzRB9Fa4pUx
         Go2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993319; x=1783598119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0V/WwhcWDu6tebPbs0Nt6qIlHb80wmhn3NHdOSdGwU=;
        b=TWgB8hC0YUWrytNu/DVvU+LSoZ7vnxt8B0fKrRyC68rFkQ9kt+EK5ZNFs1gXbRFhyh
         WripXTagzgFxbWP+0uJbDrpWmHWbBiJsyga0dgCR+31nZnjyv6XiXKCBs8o6ser9AE7a
         W9RuxMn7oZx2uRrsVuDa+Axck5SgP42VngLz8d/kNfw75RhG2CrSTuP/OQCojUChdC6C
         4rMa/r6m1ZGkI246497ujxnRZsDiOsnaDiNl5W9hVPeEm4ShnJWsZSNSctttvh8gc+rn
         GXXV58GGnE8pPTs6cJTXuXggl/yGq18bwbfcYnk4eOc7hjvOs6yCUCwmlDxwI/mO7qVz
         xDMA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZTyZCJwU93+Ot8NonwZpuqfMM50lWlszXSXGBXGjmlB/Ho/cNypXG6lJZTlTxcXC2sMvZZP39IU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz078kBSiIH4j1ysLLqkcP9efBCdR7NTLd9AIThXZU4uF1p+aQO
	SQXNifPOyWPjvHRk/bXIZGlyA5KhvX7Ikd4egNXNd8VJxSvB4bCpCM9W
X-Gm-Gg: AfdE7cknYivmpfyNQ6joNKF0oKF5fqDRPa9KI0zH8h4BU2y7ikKA+t7ycTJWA0shtS8
	kokdhwDs9zdiFnyI1d4h4Xj91odqnweizGErBT7sbiuaYZOWwcLsTv6xSDt5z6WBU9ZCd+APEkT
	pY4nS+Qx4j/jWs8XsJ/Y/bYgeG2/n+vC4u1UwoVGEPc/F0Ceq9VICG+k5LsVgAz9w79pSafFySa
	HqUwWM71oio189kEbFKOrGWbAcxBe2/Ju+qWeiwjGGBddLny/vRsKC4Lwqct4IVa/MDRHQ8fA4G
	ctIQZSN/lXkQi5VhEdsyLh4aCys/mVxlMZomZL7yzRV1+Ct7JOzR20Kv0TsjqxqUOj2err10xds
	2xpMcvjwlUK7Fuv7MkWVnjIS/PqXnZ+erDEFamQJoHmjSXfMBabyomXK0pKE7uD4nyIG9CDTWFt
	1lnKrLln/B3RKJ58OVDa3Tui1qgaKkej0sjvuk4+Kq/DW8wEAgcmFnizD3N+ic8iFWOvOq6oTgg
	zipwbEu
X-Received: by 2002:a05:600d:6452:20b0:493:bd53:ed00 with SMTP id 5b1f17b1804b1-493c2b38bebmr65763435e9.1.1782993318900;
        Thu, 02 Jul 2026 04:55:18 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm45179945e9.10.2026.07.02.04.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 04:55:18 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <575b53a9-dc42-4510-9466-7a55f6eed22f@gmail.com>
Date: Thu, 2 Jul 2026 12:55:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 5/5] iio: osf: add UART IIO driver
To: Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628191337.937-1-kimjinseob88@gmail.com>
 <20260628191337.937-6-kimjinseob88@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260628191337.937-6-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinseob,

On 6/28/26 20:13, Jinseob Kim wrote:
> +++ b/drivers/iio/opensensorfusion/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config OPEN_SENSOR_FUSION
> +	tristate "Open Sensor Fusion UART IIO driver"
> +	depends on IIO

The 'depends on IIO' here creates a duplicate dependency, since you
already placed the import for drivers/iio/opensensorfusion/Kconfig
within the 'if IIO..endif block' in 'drivers/iio/Kconfig'.

- Julian Braha
