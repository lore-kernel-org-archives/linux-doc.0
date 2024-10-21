Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E741FB3EE
	for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 20:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543756; cv=none; b=LAEeeH4I+IpMBktbJaTQN3Y0WX1/SFWd32KRZYyOzkBDM4AdTDrafbir8AdfiabWRm6//Nrn/t2DsDVnzXjrIbqrl2vx80RT1habMbc3tSRRBT2ebm8bRdfH093GbVLp4Tv1pyGoKFo1ZRJnwHUKzGXipiNqrF6pJCiYTsnBonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543756; c=relaxed/simple;
	bh=ZfTgfJUgIZyPW+LZsUJr56UVHGhS9OjGp7pormuj6Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsxHqQAHXdA+D21tnvHXv1vWDpmgzJ3tbuJIZB+erXaQMF2MDqCfc7UYZsN1m47GombWa0jkUMF0Grdz/vFOyfnlbqRxDXnbWNN7hNdovoeN2YbjEE/Qpq9jMGVKFs71+a+QpRaL5KE3lFPqwYdSWc8U9DImiu8BqFjrXBSaLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c9CBjxvp; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c9CBjxvp"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-28854674160so2112663fac.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2024 13:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729543753; x=1730148553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHER1rdbewyxMbtZSXmYD5wXpGyy1P9l08fJZ6Fwh0I=;
        b=c9CBjxvpe9L/+oxJZyfOl26ZwqIDciFGFltYfrxx5GcCN9XBAaOkMguFHLZxy9NUI2
         +OTt2AY0MQy2QvVE6UlSBNKYB7Pw8tQol6RyqeuaMamAwUEfhhd7ZFxdvTRJohRK9u5U
         TVUuqNUYswlxTUdl9XeA6OnWXnMErmxx3AskTASqu44Pumfx1NqrmGLOd0O34C6Xo7+d
         zF2BiyXRGBs67FyXSh0JzrflZ8v41ueMnNqIH4fJobBnDjwczH4MkwQpLieRf56j3Jun
         KmNbQbsokNgDtlnH/rpzNlCA7+zwxeSuKFz09QbXI9T7BaXScUTrH4Q/1LxcRib/Yuge
         5/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729543753; x=1730148553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHER1rdbewyxMbtZSXmYD5wXpGyy1P9l08fJZ6Fwh0I=;
        b=r0qAcra55+reFZij/uOvhvYV2vp91tdQ/iN/7do8EAZY8cUyhB+/jMUyDX5/drV2TE
         09fe1gmpncjBOjImZfSNc1lfOpKKHgKwSfpGbSjmmDcpUlehrSGGS5SpDno4DixpSNu3
         bXKp4PK+h8LRCt3NwCCW1OB3ClBNgUz1kC2Q0sf8el7LBT2VRsfkroOujnpbqoYSZoZ5
         b/oick8IhmRZ//nPPX6AlByFPkDLgWcMozEgGeEtTpPjlBfyrE8HEIgXTTlk3FxmGHPm
         EwnHS6I6IndzVzzUl/wzHmQeKokn63lisa4t72uNx/9EFDg3AVJaohm9lQu69s6fFloQ
         BwMA==
X-Forwarded-Encrypted: i=1; AJvYcCXSIQefs7p5TXOLQ2X3YZBdVn8AxQVnBicD8YObk2vnSJqfqepcEEiR7qjxjD/72P+CxgU+OKp4Hs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhryW8Zp9PM2ZZMJ0+cbP9DP/UkKqQ40Rv0Eal6Buy0PTgNfuH
	ehv8n3mnOn4eDe18ChQLqBc77FQBPPq6WzBjAGbwJvW6/jlMBX3JwPrJfEQL+YE=
X-Google-Smtp-Source: AGHT+IGmmrpTSr9WxLkmT+4UpgNt4QVTickW9FzWdpqPfYRED/JvnLlv4SD13b9FTYMHdJ1OsaXAjw==
X-Received: by 2002:a05:6870:c155:b0:288:e7f2:e9db with SMTP id 586e51a60fabf-28cb0195834mr324709fac.41.1729543752845;
        Mon, 21 Oct 2024 13:49:12 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-28c79426ea7sm1309274fac.54.2024.10.21.13.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 13:49:11 -0700 (PDT)
Message-ID: <02c951d2-cac0-435c-8d3e-48374d42cfa8@baylibre.com>
Date: Mon, 21 Oct 2024 15:49:09 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] iio: adc: ad7380: fix several supplies issues
To: Julien Stephan <jstephan@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org
References: <20241021-ad7380-fix-supplies-v2-0-2ca551b3352a@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241021-ad7380-fix-supplies-v2-0-2ca551b3352a@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 5:00 AM, Julien Stephan wrote:
> Hello,
> 
> This series tries to fix several issues found on the ad7380 driver about
> supplies:
> 
> - vcc and vlogic are required, but are not retrieved and enabled in the
> probe function
> - ad7380-4 is the only device from the family that does not have internal
> reference and uses REFIN instead of REFIO for external reference.
> 
> driver, bindings, and doc are fixed accordingly
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
For the series: 

Reviewed-by: David Lechner <dlechner@baylibre.com>

