Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2FF3D9046
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200896; cv=none; b=VligBqi8DCFxdlIZ+MjhLK0dotgzYj3lcirYy/n/xFiBU0Ui5StTE+RwWN2OwnM/juozpU6raq7rOO2gUG0uZijok6VC15ki2EsMu9dGujZWIcCC0alyTJSnITaSd6hm+IaF3+CE/paLbSB68dp071a47kEo+1hukfWeEi+LMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200896; c=relaxed/simple;
	bh=JolnKv0qFTOR+o7MUsErJAFOJkrET4c/BlgelBkXp+E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+T3NWW8fuS6l/NGGK9xooxGvhkzK343h90/fjOfB+7q3aYMzlAn8VW6/ejczSHkCVUcYkryvHj17Yc2kQZ568NtHmV5QpdeDVDcbAVQA/a9ciOsLqSyioVVGzBrqd4Oj9v8de8XWbOsnVlzonxl2ZdfLjP6ZAR9LtACrkeUmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsY8mwjV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsY8mwjV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee0291921so63115615e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 02:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200895; x=1770805695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYjG7SQO8WEcZbtf5VFi69+C3kGp/XbrFnd6F1SB62M=;
        b=TsY8mwjVOlERyLMY4xZcL4FpfW2PC0FXYp2YORrLpKNQAFvrDqA9Pv48o6hL9jCRxG
         ZMXuemwqTxc+RH7GIPsI3WFUfRWKAb6SpGf4EY4O1n6o/cEcG5vTdJnTNtPw7mgxUWb6
         3HClgwFLhovEYkHr+EvQObn1U8ZFSjrZwruTVQmOZbkkkDg8h9bN9oybHLzY0iUeYa2n
         Jaly9/P13T98296deoooscmmE6uIKWGYmLYjGQuICWESIgdVTERmh7WcTeKZDlp4Qigz
         ITF8HT5YhFaBbGIYR7sDw1gEYKigBErj2ITge1JKv7mCxpIsALT8PkQ4PIDnDJf314Pz
         TnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200895; x=1770805695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYjG7SQO8WEcZbtf5VFi69+C3kGp/XbrFnd6F1SB62M=;
        b=rBfYNUa65Q2b7Hr25gEG6eRWs9tKspeeZdhvqFuz6Ne22RoROr0/bdXqpXbgIViPXA
         sohoHeDhFwgk1tf6YE8WosIwFiM4j8n+TGyflpBcfhsfXnKE6D9SkfBxPnvxL02TPK5Q
         QqLVBWLbU859p/t3zs0zUIU/UTHNKN9VB/vsFA0/90JvPafhlnEDYHQo/B20AvxCIHdJ
         EMjr8Bpl87YQMMKA8ihpBGXsqYf+DLDyiI9D6cLzWax4YvSV9tx+29IXmLHSbf9cPAE5
         vEQJt5mgKELID3I+Y6Smz87Jb//vGEDKMLm6h6stv+Wy7GQkUh+2WCYps7tRz2lq0Tx7
         AE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFd0f5YtyYVD12EFwrkKzpXZQ8TsH3Zl7Lfl2L0Muga8Bogn9LlVeqc++Tiyg9Z1GEnAmeQDUmz24=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPFj2sc4QPoA1S8jXbgLpQzAcSxgQPPzQZWhe39UrByZ7O5Zm
	OefTDvdkMv/7nfcsRlQKxTvrpdVMwpNAA6UOFYssd4e6oTFJSTOIuoCZ
X-Gm-Gg: AZuq6aLRtCJ6ypw5cmJbVlOdzmoTu9V5cvBxqFG4ZSX8pIbtDHb5BFyRTK9SSwBtq1o
	X858Rcni6f1aStssXEsb/ioQKkz+CE3zoF4nernRZKlXNTGPH+u4GO9bLAIRKDfX2Cr4wD066di
	Q+qQThhpvJ8tQMNyiwO9IW/1YHnsCib7vaSKlZVzrBtUbVXkAP5MsuVujsF7mFqyiyMwl6modWq
	oVjLfHYRn0OfCzY4vC4SbgXZIrOeG2OvYPlu/pujb+3QCLrL7IrK3JIVvTDApXvKJv8mIyN45DB
	+TOkywHVX1r+jSi6DwoK7QAm6EV0jnf5f/b1Qv+WIXb9/Rb1UnfiwR7TScF83kGYDpgEeBjaMDO
	jOKH8yRvd+Rm4D5vp5hjfXQEJjvb3dLBEd8MIuyLWBzl2jyAFHKyxqrWrjwzkdpECI/nQN+kca1
	zcGuDBfdayxreQCf+nthgcKvtQ/8WYIWIa93GSdBt0apuuVwlMs8b/4y0uhEdHwnxqvP6QF5IVD
	gxjE3KWwLsAD7Q=
X-Received: by 2002:a05:600c:35cb:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-4830e968e72mr35786535e9.18.1770200894603;
        Wed, 04 Feb 2026 02:28:14 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec5cc24sm25090045e9.3.2026.02.04.02.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:28:13 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 4 Feb 2026 10:28:05 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v6 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <hrhgmum6zdww7etc6ztchivfqecaaqeeul2bbagzyongkxpaeh@q7x4popwel6d>
References: <20260130-adf41513-iio-driver-v6-0-cf46239026bc@analog.com>
 <20260130-adf41513-iio-driver-v6-2-cf46239026bc@analog.com>
 <aYKkv3dq9Vkm3s_3@smile.fi.intel.com>
 <7tiv33i65unu5ypk7puj3buzybykyhv2qbwp54bhcem5t4rawq@dpfedqmmxbhx>
 <aYMYJppigidPeLH4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYMYJppigidPeLH4@smile.fi.intel.com>

On 26/02/04 11:57AM, Andy Shevchenko wrote:
> On Wed, Feb 04, 2026 at 09:42:55AM +0000, Rodrigo Alencar wrote:
> > On 26/02/04 03:45AM, Andy Shevchenko wrote:
> > > On Fri, Jan 30, 2026 at 10:06:43AM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > +static ssize_t iio_safe_strntou64(const char *str, const char **endp,
> > > > +				  u64 *result, size_t max_chars)
> > > > +{
> > > > +	u64 digit, acc = 0;
> > > > +	ssize_t idx = 0;
> > > > +
> > > > +	while (isdigit(str[idx]) && idx < max_chars) {
> > > > +		digit = str[idx] - '0';
> > > > +		if (unlikely(acc & (~0ull << 60))) {
> > > > +			if (check_mul_overflow(acc, 10, &acc) ||
> > > > +			    check_add_overflow(acc, digit, &acc))
> > > > +				return -ERANGE;
> > > > +		} else {
> > > > +			acc = acc * 10 + digit;
> > > > +		}
> > > > +		idx++;
> > > > +	}
> > > > +
> > > > +	*endp = str + idx;
> > > > +	*result = acc;
> > > > +	return idx;
> > > > +}
> > > 
> > > There is a development in the parse_integer in the lib/. I reviewed that series
> > > and hopefully it will go in. With that done, we better reuse the lib/ function.
> > > 
> > > https://lore.kernel.org/linux-hardening/20260202115451.290173-1-dmantipov@yandex.ru/
> > 
> > In this patch, I see that it updates the overflow check, but I am not
> > seeing that function being exposed to other kernel modules.
> 
> Can the IIO be compiled as a module? If so, then we would need to export that
> function. (Note, we may export only for the exact module(s) in question, so
> nobody else will be able to use it. See EXPORT_SYMBOL_FOR_MODULES() macro.)

Yes, one can have an industrialio.ko.
Then, would it be fine to use:

EXPORT_SYMBOL_FOR_MODULES(_parse_integer_limit, "industrialio");

in lib/kstrtox.c; and:

#include "../../lib/kstrtox.h"

in drivers/iio/industrialio-core.c

that does not look pretty.

-- 
Kind regards,

Rodrigo Alencar
