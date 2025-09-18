Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D312D8776
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758224345; cv=none; b=EJQu10/erq9wde/a2jHJM4nMKvYjusnRZbURz37YFjM4rAquDQd8vz32Oks8m5VCvNNhI93hbdo/7QYj43ilHQsc/vEu8ND0bt73/hyBahHoxZtld4A5EV8ZDenxncRzj2IxywuK2jOMrnwiL8u9iLRH5XaPSvnZ7K4zR7smFPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758224345; c=relaxed/simple;
	bh=VQ3t8/qxZa8M7ApZdBgI92YVOKX5tQcpsXI5KcrvT5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5C8NEBppyqDB5ZliB79npVppzlbqug/SDsYTo34qms/kgejTmwPFmtyJe9EHpvLBjiw+IAenv6M+8QsSOeC8vIBHFdgfkLBOqQpuCgQikECxudbW3mePOEScPTsQpK+TMdRlozXjJuAVl08X2punq2oDGQVt6b3oxMy7LzH2FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UpPMRvqf; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UpPMRvqf"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-62347d880feso844015eaf.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758224343; x=1758829143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lC1D1RXpqGWlfeokss9Ec91Msfh5uPWlxYgo1Th1KKE=;
        b=UpPMRvqfOgPqzydGEl7JaO4hSSi6dZcUjUkHSSoIz0DfqyvkvF9j/JsdUOSOYTuWhl
         o4jfmM7W5OJJ6zHMOS966ArVDhX66r3qIhCNyNAj/V5S/+eRnEUl4k/slQRRKch3DgS9
         1YXJQznDKqO0M3OQmVewpS7qGTYoAp4N50yo7l1yNvEz5eFrGGs5OHZCc9Lo+O1wNXLq
         SiE03ZfxmRahrzrVmBUYgrc1bMe2B6N/vEv1O/lZqi11l3GtvwdeXe8HMks8gQtDDZ5X
         YBAXo4JzP/OQgVSRtlPYASsrot/bGx966NlHvOMADKz4IdAl0D46ACEB4aAzub+njKCm
         2dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758224343; x=1758829143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lC1D1RXpqGWlfeokss9Ec91Msfh5uPWlxYgo1Th1KKE=;
        b=DrHEwnZlA1pyMYt7Z/N0Xot4oWsWDwjF3HL61fmIwWw9diqaHqKdfvFF3ZYI4eAI+n
         iTXVQioFUwi9wZfhiZ+RXuMH/cSxxnJdXRes4Pe6cGmLYT9WdM/3Y2tv0QB90Dpl+BRF
         qxNrenDAyf/oyAp9VsCmQq+EhpGx1tJqIakLUOMd8YIHq6gsT3t1SpcGautFbv9m5Nsg
         ycj5F8cX6PQC3I3druApXrmDhsu1R6mYeENeip6LcHVTZtrdR9uCjIZ70uk4Vbq3XIjo
         YIuGTI2yRNO7T0C41mkDgZWf2qZlNVHq9cjVAJVDyveOyfShpoKsU3Hg5WHNx90+ZNnw
         BwFg==
X-Forwarded-Encrypted: i=1; AJvYcCVRw40qycxWvkIoy5c/7V0/+f1Zcso8Fiz2wS/IAl+fHl5i1W8D0sXIk7XHy3eGw6ML6dP++Eh90h8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KFPBkrPCl/1/V/KVwI8Leo5ggd7Gg3/jXCRPJqPPGLrYQQfG
	ryhHzmQQcPwWF+JPGC45n8YRkefALbyIE8j7aF6ZrUq2IjNazzear8YUBnQrRo2XJ4o=
X-Gm-Gg: ASbGncunH5PlDtyZkMI14MvW9HLIxVWoy+WfTwWyk34ffDzmPdrTAKqWZldFkgYoI3F
	D+iOrDQvE3Oflyug6W9x0q27R+fQxy6xISWWBvn8KSW624cYKVodLbM8Yf/jGq79mDaAfOB5VCG
	ixVaMH5sdrRlmpjZSputxt1SMCJbd6ThitDQebggj/lAMkIFuU0rIdAgYgr3MdT0x7MtsTFyFn8
	haKx7jHDpY5w9Tg0JqbH3EA61HF63n5SY8B5TEBvdjOXw43KIBgEC2I0VYlIwdiioeoZ4qScvL9
	lW6N5qzHXKVlteYsjpS6upkNgnM+kJkIN5iaGhCue6O14FDACbuSI7DqTUfK1ddkGYGrsCtQeFl
	L5R6aUws6mZ/FdL45m3ZYkFZRlNIV8fdvGycpc9AmZDieBWEN630WRLFFPQt3bDmEDuucvo+EP0
	fzhxbWsueVI5QWbVEW/w==
X-Google-Smtp-Source: AGHT+IGwPYMqQBvoGrbWLKmtCrh7hU1R/7J5LL0cXcvqHKYJ/id7TQ+ISZN+tixS6oxGOqJOrN22sQ==
X-Received: by 2002:a05:6808:198f:b0:438:bdb0:89b7 with SMTP id 5614622812f47-43d6c2c68eemr244526b6e.49.1758224343041;
        Thu, 18 Sep 2025 12:39:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e? ([2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c881af7sm1142955b6e.29.2025.09.18.12.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:39:02 -0700 (PDT)
Message-ID: <f7d7f400-cc43-41d9-bc97-39d308363f14@baylibre.com>
Date: Thu, 18 Sep 2025 14:39:01 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: iio: adc: adi,ad4030: Reference
 spi-peripheral-props
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <5c1c448e3e731fc013e1e3b3fdcbc31f806d41fe.1758214628.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5c1c448e3e731fc013e1e3b3fdcbc31f806d41fe.1758214628.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 12:38 PM, Marcelo Schmitt wrote:
> AD4030 and similar devices all connect to the system as SPI peripherals.
> Reference spi-peripheral-props so common SPI peripheral can be used from
> ad4030 dt-binding.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> index 54e7349317b7..a8fee4062d0e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> @@ -20,6 +20,8 @@ description: |
>    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-24_ad4632-24.pdf
>    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-16-4632-16.pdf
>  
> +$ref: /schemas/spi/spi-peripheral-props.yaml#

I think this is already referenced for all child nodes of a SPI
controller because of pattern matching of:

patternProperties:
  "^.*@[0-9a-f]+$":
    type: object
    $ref: spi-peripheral-props.yaml

in Documentation/devicetree/bindings/spi/spi-controller.yaml

So perhaps not strictly necessary?

Would be curious to know if there is some difference.

> +
>  properties:
>    compatible:
>      enum:

