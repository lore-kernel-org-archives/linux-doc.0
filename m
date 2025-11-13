Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189D3502B0
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763039561; cv=none; b=HX3utOmJ/BCUm+ltSHC0V5dEj6tn3KNyQSaQj64lVd8WEuq+nqXw8dNhrsr2MMuPN+xVAKkcbqOAo65fBcW4oeJk+jUVdIDitYO0pej9dyHU96+e3IHE2K4M12htYn4dg9yOr/fBLecBZdWuZ4lFXGWCyFPGp15lzuqGvLILAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763039561; c=relaxed/simple;
	bh=PYHbKpYtcN2fDp/XLJTpHxlUS9sULnm6PE4CIW+WlNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjabjHDcXTd2dTDbG45HpDsAYNgWSk+w4JtoYse2Tdp7FjDrIhKfyFWOSnnrp8M7t09jQfOb3aJaiF3pENRE4ipTAbp7QD0KM6x2z1t792sm6q7gmYDXJ39ylEYAmUcWGyzCqtl+FgkUR2M7yZYbdHv9c3FgF3DDxieR5Hi7J9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1hR2ZcG; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1hR2ZcG"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ba599137cf7so692710a12.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 05:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763039559; x=1763644359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIIPN/N9Vp0LrvuR8gE94KTgdl5e+2K5VQUK3v6uGlM=;
        b=k1hR2ZcGPAoBDl458GB26haFUIRdU+g7Dwdjd4VATi3NXjDGLYnlys50x46He1zhYn
         zP2jhGV/vys61we7IGfNB0y1vBJafM6CVA5QPbb8HvEZPBSUuQl5raNFPQhpdN1fiLWE
         HJJMuRYt9UeuuM/Fi46FrmbQBsLPmo5UFrM4IEoVAE9u3i8vjbZLPh3Ci/6pMXNJDbwo
         nLfO6YqbyV3BCYcy0/BJrGo0oH0osp6lBfToWwxOzMbA+9fE+cV7z08fwqh4iMgN6LU6
         9skjU7sWzPKOUZa2CPCOegpY6mphNg7h4cKvDaEuGMrKvYvTSfdVB/3BALK+RLCtiTRP
         ZiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039559; x=1763644359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIIPN/N9Vp0LrvuR8gE94KTgdl5e+2K5VQUK3v6uGlM=;
        b=I3b8thAKZryE1FPKSZCcA25KO26uRGKMstMncQDNXwOivUkwJf/diAipl9OCLt1YKj
         tHaWRQSibHUGKB5qEPme0MQnsCiFl+D+y75HFXDBlcR9QO6Z7lDFQpJ0rce2eis5gcGN
         pHL/aEjTBLvFcrzYi2QP07WQLMXI9MIGAG2k386BemcM+a6hXBGupkuOLgyKJErAMnLd
         9QDTFENrsTQlc6Dth7xjZOs743quwtwKGq0FMJFjZ/apLWhmCSCoz4nRVBytqLE9Z2bc
         XS7kWdJPYpNJa0YbEEE2iT2xAO3Y75KtCrXbokkGATrUJ46pZYo/o/7sVfACoJ0yZJku
         5Gpg==
X-Forwarded-Encrypted: i=1; AJvYcCUT+IeHksk8EuSaf+hGjq647/TrUWmYl/R0H0fCeTCAy7uOGnE+qS9niryYkR9ZrSftZFBrytWZCtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8lWAnyt2gnHtVt5vKYzsvT8SKx+6sZBNSHelGs5YzbDNeXmY
	pVIrFpYhxwyBFxEnfsKzLNHJANNQdvZez0D7oImGuqr4pAQr7yayLqOa
X-Gm-Gg: ASbGncvp7iUtMlVgkEm/T6EmCNjxpGrJ9B5PSDtZtwLU8azlxf9nXWBsWKgX+m6IItB
	ECcw8xrlX1MGvXt1/PVORe/nZ6AudfQWst7EsVEO9u884gW5MyHfLnjpLsXptHVEXQrv7t7oQ+f
	VNqaBANWnLwNQ/NsZ/ONq3wCRAUkRBOX0iI4RvECJuk/Oqj00xUIJpkeKqeslaQ7gV8ROV0GlPF
	Qc3ydYtSXoFY4RLjnbAujwXtexESspdS0Yjew7BfURnTaMP4Yox4BRaeru97PGdcwS20EPeMKF1
	fMXBElYMQ/llml5mACGmH9eD231igyZiknUOnzcMr5Kz0a3xY/5DqQU1Q+OMgGF83nZ0BJ+gNk1
	Q+4OZ8koiarCTcHHHi7fUNmNZSaZPnNcyOZWfB5ZlReImnd6zfdJp45uGY9eHkjkJT0y48v3Yhj
	Hi2jBoC6xu8g==
X-Google-Smtp-Source: AGHT+IHKWHFV17ns3ZpVjF2rHkOOpDusjT/d9J9zPlp7ZvaOQIJuUpu9+Z9VWrtjzQL6wybXmhMOig==
X-Received: by 2002:a17:902:c947:b0:295:5625:7e41 with SMTP id d9443c01a7336-2984ed92e1amr84549625ad.22.1763039558775;
        Thu, 13 Nov 2025 05:12:38 -0800 (PST)
Received: from localhost ([2804:30c:1661:8a00:578a:911c:ac25:24a6])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2985c244e13sm25487465ad.29.2025.11.13.05.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 05:12:37 -0800 (PST)
Date: Thu, 13 Nov 2025 10:13:56 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] iio: frequency: adf41513: driver implementation
Message-ID: <aRXZlMsPjIGWJ_oc@debian-BULLSEYE-live-builder-AMD64>
References: <20251110-adf41513-iio-driver-v1-0-2df8be0fdc6e@analog.com>
 <20251110-adf41513-iio-driver-v1-1-2df8be0fdc6e@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-adf41513-iio-driver-v1-1-2df8be0fdc6e@analog.com>

Hi Rodrigo,

A couple of comments inline since this is on the mailing list.
As mentioned in the other thread, we ought to continue the review of this internally.

On 11/10, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> - ADF41513: 1 GHz to 26.5 GHz frequency range
> - ADF41510: 1 GHz to 10 GHz frequency range
> - Integer-N and fractional-N operation modes
> - Ultra-low phase noise (-235 dBc/Hz integer-N, -231 dBc/Hz fractional-N)
> - High maximum PFD frequency (250 MHz integer-N, 125 MHz fractional-N)
> - 25-bit fixed modulus or 49-bit variable modulus fractional modes
> - Programmable charge pump currents with 16x range
> - Digital lock detect functionality
> - Phase resync capability for consistent output phase
> - Clock framework integration for system clock generation
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> ---
...
> +
> +static int adf41513_parse_uhz(const char *str, u64 *freq_uhz)
> +{
> +	u64 uhz = 0;
> +	int f_count = ADF41513_HZ_DECIMAL_PRECISION;
> +	bool frac_part = false;
> +
> +	if (str[0] == '+')
> +		str++;
> +
> +	while (*str && f_count > 0) {
> +		if ('0' <= *str && *str <= '9') {
> +			uhz = uhz * 10 + *str - '0';
> +			if (frac_part)
> +				f_count--;
> +		} else if (*str == '\n') {
> +			if (*(str + 1) == '\0')
> +				break;
> +			return -EINVAL;
> +		} else if (*str == '.' && !frac_part) {
> +			frac_part = true;
> +		} else {
> +			return -EINVAL;
> +		}
> +		str++;
> +	}
> +
> +	for (; f_count > 0; f_count--)
> +		uhz *= 10;
> +
> +	*freq_uhz = uhz;
> +
> +	return 0;
> +}
didn't check the details, but can't the sub-Hz resolution be supported with
.write_raw_get_fmt()?
e.g.

static int adf41513_write_raw_get_fmt(struct iio_dev *indio_dev,
				    struct iio_chan_spec const *chan, long mask)
{
	switch (mask) {
	case IIO_CHAN_INFO_FREQUENCY:
		return IIO_VAL_INT_64;
	default:
		return IIO_VAL_INT_PLUS_MICRO;
	}
}

static const struct iio_info adf41513_info = {
...
	.write_raw_get_fmt = adf41513_write_raw_get_fmt(),
};

...
> +
> +static ssize_t adf41513_write(struct iio_dev *indio_dev,
> +			      uintptr_t private,
> +			      const struct iio_chan_spec *chan,
> +			      const char *buf, size_t len)
> +{
> +	struct adf41513_state *st = iio_priv(indio_dev);
> +	unsigned long long readin;
> +	unsigned long tmp;
> +	u64 freq_uhz;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch ((u32)private) {
> +	case ADF41513_FREQ:
> +		ret = adf41513_parse_uhz(buf, &freq_uhz);
> +		if (ret)
> +			return ret;
> +		ret = adf41513_set_frequency(st, freq_uhz, ADF41513_SYNC_DIFF);
> +		break;
> +	case ADF41513_FREQ_REFIN:
> +		ret = kstrtoull(buf, 10, &readin);
> +		if (ret)
> +			return ret;
> +
> +		if (readin < ADF41513_MIN_REF_FREQ || readin > ADF41513_MAX_REF_FREQ) {
Can, alternatively, this check be made with in_range() macro?
If so, then
#include <linux/minmax.h>

Same question/suggestion to other similar value bounds checks throughout the driver.

> +			ret = -EINVAL;
> +			break;
> +		}
> +

With best regards,
Marcelo
