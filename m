Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6882512CC
	for <linux-doc@vger.kernel.org>; Thu,  3 Apr 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698894; cv=none; b=ROWFIwVhT1E3M8//lHSjrE0vLzwRjoJvbA82uvXoS3ehuYRWF+r6U/HvaRYZ0P5930JcNn/QsfvE5AZ2ZBCy1PcPpP/cSg0aL/2oSb8bkIY4kArKRzK0IctGTdnCM3P+bfq3xoaAZz2PSIih2Ww+bW0H6nNWeG3NouejyvZiR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698894; c=relaxed/simple;
	bh=4wuv9Dt/9rj9cF2a6+xai4em1wNvUS1HPV5q6UbrWUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDugB5TiVZaCCU6PAiJVpZl04ueqfUc1MvF+4wVArkNTpi5NULtBW9T8G9XnntES+xOlYDr9g+HYY6wSuDJCfjwxAcMCojUPpAhUGPmFff95tqgKzYjMs8u3PrMnhV48I4I0io4sHXKKDTwnxcVZCaX7CJY2tY3KDgCSrktK9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I3i1n9Mw; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I3i1n9Mw"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c3b863b8eso764007a34.2
        for <linux-doc@vger.kernel.org>; Thu, 03 Apr 2025 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743698890; x=1744303690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSC+FUFy0d9lpIsypY5Nl8Mx6gi/Bcekgwf80nw84HU=;
        b=I3i1n9MwCbrlxICsFt+cvK6O+W9NjVOn+9VoukT2RXByhIBHiCtcZ23dCHs0WUzMwf
         fokR4pphQR0FTr+wpqfty3N0QwMNau8SwRYJMPT39egB/8aIXvl6HuRk4qAAt1L5j08J
         2+wt73oTEvRjlo/2e7Wrd+z3bTlOTXBLwRDHG9C6sMnfN613s/KEhc3D1zHl26yKz59K
         Vqzp2YWHIzJWI5eD1QrWmZhqAs39Wi0/Wgc1V+ppEl4AC4uo6GQtnswEtt+CzaNTjiLE
         3FTOlhsW+7ECI+p8evg66aC6ezgw6B78+gzUqW8RtUnXTX6BoIp+ZDNWPZ3a509rKBvr
         XqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698891; x=1744303691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSC+FUFy0d9lpIsypY5Nl8Mx6gi/Bcekgwf80nw84HU=;
        b=d5yO5crd6d3OXJOUuxyPJlpft0ZsETcUhmuihomNFUELPFh6SDq5s2a9zWptlpDHRo
         XNVV8Xgq2/a928AtXo+i3FiTnXO0M3TBwmGh5frVWcd0GpFkMhoepdoMp4zJ78up0hsR
         S+pcTMnP56N3lpUAqPRorfwnbGJhBcvzrrtQYpRERKlWgPDXRUsf4GQV/M95wAamtJ4C
         D5WwOxq08on+OsS83K69eb++w58IVuukjr+0eL+lczzwXsqKSo0x4uEZYS99PwBQbeZE
         Nb393ZZ6tqiB6STO0j6nP5cgi8tbUS8nRggCijk6a5UTxI1UJDXkoAOP9HANlJ3GbqOy
         l8yw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Y8xilhQyp6KtZ+oHY4i1EpLBD/0OvxeFWHxuASNc4fUlKBbiQD2/27CBVovyuJyhxyMbwncKOzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6xrL4hEXJ0g8G6mEjaSU7A+OfxcmfRoPFf5i+sPh8jb9keer/
	jAWx9gmNysHCBCO135RbMDfVKnXJbrdUkq07BibQHOG1bmC7mgtSM6UlwKj9piU=
X-Gm-Gg: ASbGncs1bbhPjKtJ7dHYrpUFSkLVm3Cs+BCtX7A1FZyhzamSvuWHEkhVoD4b951Cfjh
	j5HY0cYgXZSxDbN7KGxiBgO1vpSl2SDPv/gNH8Dzv/h2vf8r9xfeqXu0Q1B5qUq94wWpSBnCoW4
	1swIVA+gR3LsWv5fJju5fraqeehB/hx1mgCUCDEw7z1lLqnYQGdDRsBcF4dYWzREwGfIWeigVl9
	YCuDPpoDH+Yo5CpJveaMCpj5YrLZd8af7GWzjYkLyH/Hefrzv8FFsnfa65sGvj5P5gtMHlWXqH4
	kGyVVKkRgHgpP1nsdP2fuJLHuQtZhB1URaDWGbD+8qy2oonkZrRZnrBiV04xRxwesx9QzcUiqb0
	qOav7Zw==
X-Google-Smtp-Source: AGHT+IHMO8mKj7XI4u0FpdUX8+XWGlKjBQ/8BZn9Gd3V/HfCKgUeXNkn3/hksONPqG77YFoErY/6nA==
X-Received: by 2002:a05:6830:4987:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-72e3696f946mr147011a34.17.1743698890734;
        Thu, 03 Apr 2025 09:48:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e30511237sm281580a34.15.2025.04.03.09.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:48:10 -0700 (PDT)
Message-ID: <c146175f-6a21-4039-8c81-5933a9ef5ef6@baylibre.com>
Date: Thu, 3 Apr 2025 11:48:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: ad7606: add SPI offload support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/25 11:19 AM, Angelo Dureghello wrote:
> Add SPI offload support for the ad7606 ADC.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

