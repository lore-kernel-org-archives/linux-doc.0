Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B571F14A4C1
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382458; cv=none; b=TRSj4D/3tH9XrDYLNW0bhTGQgq5bdt8D5DoilUecqCR0sbBxg6W/9vcnU8Wfc8B5/O67ZNhMwlHXQz4me5ukL//b+Q5LAAwEd47kuL/ti9MjLH/xA9xIOzcxuUaHT3LIZMJgoFCYPAf3fMNdKNeaTWFA6BbI9rpKW8gfFRD7JqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382458; c=relaxed/simple;
	bh=WGd4AsHHHAKOzxnmtiUcoZvGsiI213HQOzoaaZf3ovs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIiQs4Cn8Fhm+DiVMWqW9MjFOhr9f3IFH8T6GVbSNIkg/x4jAXdYlxdB+Fg+65T5Z5QxaifknAw0Q+VQ+EbcUVsWzUWwJk8JWPyCoN0bkde4OT+7x1JNHMvzD5g1UWcwpkE8pMg24eI9G92dtUAgHV650IOYgaACv7aO61LtSSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oCsNrdPn; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oCsNrdPn"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d106f4025so935682a12.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 23:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719382455; x=1719987255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P68vjv5P5fTQyUzXQMtlC4ydEFa3hgGxJKTbgujUek0=;
        b=oCsNrdPnj5hMVbLGKe8YlXJzzic3QC5VmOY+MtONc3smcr4KOba0rAsbzBHLU0InpM
         KW8P38YPaoAOCiYXhkxs6OvtpS4Lty5FyN2CmYEArYIbn1b+rvP09vAnUmB/EvSVGMtl
         xH5SEF7gWCb5iEqbMhlmtdf0qKlWvPN5qt9v25D2UEqIVPDMq8V8w+HVvWRvqmZqGCif
         I/pGSeHV5rdRULDumqKnnAdvNRFFSp6aeZnUG2pLIMST38nkJDAYAlVvUeU5E/wJ78RG
         8tZuAzhq1o4XmCsdIoX6ZyZpVaNZ4TcW1hHDB0ReoYDtoNMGg+FtcDbb03uDdP9F4wJ8
         XIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719382455; x=1719987255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P68vjv5P5fTQyUzXQMtlC4ydEFa3hgGxJKTbgujUek0=;
        b=HV//AWPeTe35PIFqEh7fdc//fhkJeT0jkFnFnYzF4tuXWWobdCfoUUdPwmxi5q/lwA
         OFDElasS5YF3n6c9BtD9JBtcJ6W0GDseeFYsdXS/bAJaZvSfuJPQJINq9r+DbYsPq9yp
         g1IKPPHfZIxSNhy0SYZcapuj/zCJdT7QgyYXNKS0ukG9G1WPrtbv62UjDmPhulqko4EJ
         /SHS/jdT8AhPdFECdmqCIEbxujt8R4sU+uVQsCBMWvyuftfVy6LYh++svKOuNFreCl7u
         2lXdXoXNeCGWSNPOpdLJ0U4lcrLTg/zwJGBIKPP54sThC23yGoibheqJKvWXfz6y1ET7
         GRrA==
X-Forwarded-Encrypted: i=1; AJvYcCVeCJdpIojOIHuFzlMjE8v2gSbVOHQFHaR5Au+Vg3Tm6wPbRZ0n2dOpS4iaHHPjjZt86JSL/s1gPp+XKCrVw8BRgNLpBnH+t6fe
X-Gm-Message-State: AOJu0YwEFRBEtEN9UAR3VsKt7bFhecXEabDlziXQBxyCAF+9hlX7P6UK
	TAk+2JWDozO24FnQQfloBF2vTYGBJz/AS9jK3X3O3licZ/B+DSvasnl/wB826cbuzvS/wfE41HL
	+uw+rkyT0v4p+yTmxd2bTdoirz0O0e+RmvhI07w==
X-Google-Smtp-Source: AGHT+IHFrAZDhVdGptSc44l74KYpkoXPmWFwKAgqD9iIY1egI+hz1d/5rPoCQHY/mWyFFxrbbPr/3PvyyHvAFloZ1tM=
X-Received: by 2002:a17:906:8315:b0:a6f:e2a0:b5df with SMTP id
 a640c23a62f3a-a6fe2a0b6fbmr729513766b.7.1719382454861; Tue, 25 Jun 2024
 23:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1719351923.git.marcelo.schmitt@analog.com> <072d74af9fc624490b84a1d001039424e572e827.1719351923.git.marcelo.schmitt@analog.com>
In-Reply-To: <072d74af9fc624490b84a1d001039424e572e827.1719351923.git.marcelo.schmitt@analog.com>
From: Alexandru Ardelean <aardelean@baylibre.com>
Date: Wed, 26 Jun 2024 09:14:02 +0300
Message-ID: <CA+GgBR9S7q32i-1ehNAgLHim66-Ud=PajgTSczBSJ5LUZdA7cA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] spi: spi-axi-spi-engine: Add support for MOSI idle configuration
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: broonie@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, nuno.sa@analog.com, dlechner@baylibre.com, 
	corbet@lwn.net, marcelo.schmitt1@gmail.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:55=E2=80=AFAM Marcelo Schmitt
<marcelo.schmitt@analog.com> wrote:
>
> Implement MOSI idle low and MOSI idle high to better support peripherals
> that request specific MOSI behavior.
>

One minor nitpick.
Feel free to ignore, if there won't be a re-spin.

> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  drivers/spi/spi-axi-spi-engine.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-e=
ngine.c
> index 0aa31d745734..5a88d31ca758 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -41,6 +41,7 @@
>  #define SPI_ENGINE_CONFIG_CPHA                 BIT(0)
>  #define SPI_ENGINE_CONFIG_CPOL                 BIT(1)
>  #define SPI_ENGINE_CONFIG_3WIRE                        BIT(2)
> +#define SPI_ENGINE_CONFIG_SDO_IDLE_HIGH                BIT(3)
>
>  #define SPI_ENGINE_INST_TRANSFER               0x0
>  #define SPI_ENGINE_INST_ASSERT                 0x1
> @@ -132,6 +133,10 @@ static unsigned int spi_engine_get_config(struct spi=
_device *spi)
>                 config |=3D SPI_ENGINE_CONFIG_CPHA;
>         if (spi->mode & SPI_3WIRE)
>                 config |=3D SPI_ENGINE_CONFIG_3WIRE;
> +       if (spi->mode & SPI_MOSI_IDLE_HIGH)
> +               config |=3D SPI_ENGINE_CONFIG_SDO_IDLE_HIGH;
> +       if (spi->mode & SPI_MOSI_IDLE_LOW)
> +               config &=3D ~SPI_ENGINE_CONFIG_SDO_IDLE_HIGH;
>
>         return config;
>  }
> @@ -646,6 +651,9 @@ static int spi_engine_probe(struct platform_device *p=
dev)
>
>         host->dev.of_node =3D pdev->dev.of_node;
>         host->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_3WIRE;
> +       if (ADI_AXI_PCORE_VER_MAJOR(version) >=3D 1 &&
> +           ADI_AXI_PCORE_VER_MINOR(version) >=3D 3)
> +               host->mode_bits |=3D  SPI_MOSI_IDLE_LOW | SPI_MOSI_IDLE_H=
IGH;

There's a second space after the assignment.
               host->mode_bits |=3D<2 spaces here>SPI_MOSI_IDLE_LOW |
SPI_MOSI_IDLE_HIGH;


>         host->bits_per_word_mask =3D SPI_BPW_RANGE_MASK(1, 32);
>         host->max_speed_hz =3D clk_get_rate(spi_engine->ref_clk) / 2;
>         host->transfer_one_message =3D spi_engine_transfer_one_message;
> --
> 2.43.0
>
>
