Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E130EF9D
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184885; cv=none; b=K7fSeYUQOdnZoor2sNAn+YYjgWkHAgjn9UfRTlNct1hfAfkThLG8sJHkeXfioqIj/gS5fxhoZLNNvn863wf+dDKweEUm0Ls0nCW7ItDGLu6qzMN0fPGRewfAVhfeaP3wMXS+ywlD1KtSnzVW5S4kojU25bPPtEiPJK6hpt2w5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184885; c=relaxed/simple;
	bh=04fVH+Ybh/xOhNmHGiUOXfPQ1KtKmvbSXs3LJi9XWQU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7qEnYM/xWpX7kyb533dMDJfEAZ4pb2Ij7DKq552mmmb7bgi/gHcm16jdTor2xDWLt3XfMzUJqeYeIcD0Acy0qXvNdjXeT9Hmu1LR29v6RBrsYL+ihwkzP+lnahvZlGQyHCKlv/y3OxmgaPbqO2DF11EFUz1PHSwg9xwyLgkaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8sS4H2I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8sS4H2I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso27475195e9.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 08:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769184882; x=1769789682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZZlt0wXGEeAJMNmrtm9rEmgb+VoKNl+2Pu9hilzxa8=;
        b=m8sS4H2IhkURVj7K4opc9WYKWxtHLGt7gxdtFfE2zOdBz9tEel7HgvKV18ekgN9cae
         zNLM767VvznXCdDiQfDOZiJ9ckLShSHeFM6psdkyyBT6Ezp2ziiLCjp8vwD1d+fzH6ux
         yMh2qd8et6Eyyk6L5b67JFD4ULBh5nu9bV2C8sI7FqO4Z3U2E2GikkGa1QAvQKxswpFN
         KKuG2TnwAZZKxOtrqLVuUMXKAMAOtdc0CYcSe5n0zP0RH54telVzIZds/5p/Pw0o9Zp0
         feRrctfNp3aR93/FLOUqAxLgcKshUgB7zsOhjn0vq+MPtvUPlWsGRtOkMbkB3fUMV9N1
         +pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184882; x=1769789682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZZlt0wXGEeAJMNmrtm9rEmgb+VoKNl+2Pu9hilzxa8=;
        b=ZI0A9fAzHBiP7ACD/5C+4QrgGfhhSSFapw6efyGW+EPBFZZEfQMcKDIKMVygfWMLJs
         OCgglWmImYmtiOIeqszaB97pKOhUYeR8XTr5T36gPTRrnLeR5A26/2je5Ml8MQiBtqZK
         yiDJG/H9lL5JHd9OOAHMRVINNCCcgyf572QxHPoBIVw870TMs7rJSBegqTBZZL12tY2x
         CdKz1MNvXbrpUHx8Y4qGRDI85vMIz6TjgE0xP7Xt6F+pR1znBCCcR+c3rOhm+E9xiiLE
         eAxGM0fI/S4THkV+vvwz682pSH6djxs0UtO4Loe3mROISV/SU6HExSQSkAopPeS9Z7qQ
         Q9jg==
X-Forwarded-Encrypted: i=1; AJvYcCUwR/HH1V6UWdW2MZKXUKTEpvSMFOUm1yaeCBjGxUMACoCWBtbOKA5QzuTaWLMdx/uSrbiiSpb5KLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN44rvJL0fj/zO/BGbNdM9oE62NFKfcHSZrGYaHKFqdE7UtJtK
	YWKF6pmbdFLgCdHlzYGaIGOTD5kQZSMOOetUbJqojELR0Jv5CxnwOtEC
X-Gm-Gg: AZuq6aJDBaWOrsVej3JX18sRroBQcN0bNwj4iAcS+EpQg5kyr4Evt4d2qmECPhxC5BN
	TaH7kHT6hcUc1kN6k0ophpNy0fmE3N23KYwN1V8WLreKcEVhAS0tlQXBGD1WIu2FdY+HKIlJGsa
	qcTmTK+uOeHb3dtMcNg9OF0tXGsz0vEFVVnFy7QdF5YKbOPUxIpdKy3t/8/8kuQbXHA49RT6vO6
	tjqX55H8ShhptvdS5uFfXxcHnmw2IrENYmjZtFM5tPuYAX1s3EFN4HkJsANnIN6MEgFM6q2iUK7
	gmo3fjG9d2NsEOdnBOJk2Av9SYM+Qd99MiAPiWh3ds+Zyist23QS8P9pwuc5WyF8uTUpiTzcWOQ
	dStPrYDXoXQKpXQZAF4vGWKz2corpyQ2+PzsmqXQJhWg57YiSSPcHCqRWmWTdKYY/IN7D0a+hXW
	1TA9bw/jGi5LyyeLoc17DxVi5JG+7DIgO4ZVk0xzIrwzG+RhI6PD2rw/A+BAztTyKLUykvS8gAA
	Ank
X-Received: by 2002:a05:600c:8b6e:b0:480:462e:d640 with SMTP id 5b1f17b1804b1-4804c9cfef1mr59266115e9.36.1769184881426;
        Fri, 23 Jan 2026 08:14:41 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbe1fb8sm24330765e9.20.2026.01.23.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:14:40 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 23 Jan 2026 16:14:33 +0000
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <3rtccxcqpxkwq54jjbl7l6rq3xm3ibsnlh5s7hiymo4okir7dg@ky43houswpjg>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>

On 26/01/23 03:53PM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add iio_str_to_fixpoint64() function that leverages simple_strtoull()
> to parse numbers from a string.
> A helper function __iio_str_to_fixpoint64() replaces
> __iio_str_to_fixpoint() implementation, extending its usage for
> 64-bit fixed-point parsing.
> 
> Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

...
> +static int __iio_str_to_fixpoint64(const char *str, u64 fract_mult,
> +				   s64 *integer, s64 *fract, bool scale_db)
> +{
> +	u64 i = 0, f = 0;
> +	char *end;
> +	int digit_count, precision = ffs(fract_mult);

I've just noted that I should have used ffs64() here. 

kind regards,

Rodrigo Alencar
