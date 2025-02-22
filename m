Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5312D758
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740242941; cv=none; b=nwM7roacHiQKanuSX2PwfDo5cHcZVLnbfu92Gpo3H8Nt0sQI2JygCUzO9yf8+QPFvo86JAxx+kqAuWXTJf236FEMVcGiraP1MK2sQdreGlkk306+pueHjBR78U964lqYkQ/jmfrfDq0O4f+eV6W1zskwIMurbOdeIYdf4m75OrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740242941; c=relaxed/simple;
	bh=V9sIK9nN7xF6r05xVvkKJj0FTsVBne9Efnq8Hm+LXdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmQAi2VojA2OQVXbewKf6HLOkDlP++qKtevuWVWNsb9Zr55Nntfv+4xueJk5Nfh5uU50SK29aQPIBhDJo2DJ8WfYzy36RRkpLK9q8Y5tkJVse3L/X+yaZp52xr1G2hGLIWQE6XKuuNgz7hqL4f2arQ+ei/1iPNt52AmRE8eWSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JI1FFG2/; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JI1FFG2/"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5fa8fa48ee5so852145eaf.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 08:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740242937; x=1740847737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vMyJEwuWpazd/Z9urlp5ndDQadfQgcDXcxg9H5b+Om4=;
        b=JI1FFG2/E5SNPXEP+HoQwS39NJq8UqQ0mjcXsPGB1jo45F915lBkgCvXk38FLGrQUs
         MCxpS1H37dWboK1pdsu3/Gumgy2SmbN07qg6kjsjWn9xS8hKo3/QrMouV9KWh/OB+4zL
         Je6OcQJSMCIQkZyLKR82nWi4mRXVW9NVDK+GmC7kAFleTwqkWkinKSeRVQbrom02c981
         IlQd9DTq91/+GSIFeio0r8b/XF4fzJrpymSGUq1eu/W9Od0GHB+Qp4SPg5hlb2AEdWyV
         8JPxzTyZyqv5CvAVbjlospCbLQBMr0CYoAM6RrgbD5X56zojV3R6MsjTliA/7RpEAXfJ
         /R9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740242937; x=1740847737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vMyJEwuWpazd/Z9urlp5ndDQadfQgcDXcxg9H5b+Om4=;
        b=d1BS26Se/ag0FtbAFULk/zH9M3R0jfD73gcNW7qQw1TIhy2VHQg1nI4D0SuafWHC7Z
         hePy8zeZlIyBOmQ7QXg25olteDalH7g6VB0H41L05YOE8hj392XuS4bzBDMbhxwLQ9bN
         7CC6nUM+nID8OuBn2AzaVYViqpJY8k1+5g5XVfL0NrI/gZG+7veGblPwRgRCNRHS7R/M
         w1Di/SCtlVLS3tgMQMMdr9EfkoX+aHYFvPPvLpE40Gob2C0aYzDXMen8jnGyCKvCnrUp
         h7dGt7vZXxjqtUKQIxub28BJShNYMUuKPMHzKgRbvQ7YAHP7ah2NF2Qk8nnMbM6HQfFV
         CGcg==
X-Forwarded-Encrypted: i=1; AJvYcCVm1Nd9IocDMrrZx8cYqW9Mno3KWs3GoTJNR+7brJhG8l1PyW94xlPMkIrjJG2WS0SzWRe/xjR0aVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI3AktmDL6MJH1HT+3gJfl3AcPlMnRFGfRwvsp9TNuN9ruoZ3q
	OzTnp7rg29SgVuXpVcy5MilLHV72orBprwRXcvzgTI8jLA2FlaeStrkpiWY6s5U=
X-Gm-Gg: ASbGnctIducpBzBKaWmx81cyuHzWUOHalc7fr4uVH3DyypGwbiA6t6AvvN93JYypyJW
	46tOs7Hxd6iv0r0LvvgVDw796Zdj4kM6pqO8EfkfBCuPwIrw6zVzfik6bIkBf2kFIBK+Cp4UyRb
	8Oyd+BZUUljL4xvdGkhshm2xW2tp1+AJuX2DttbRqSz2Ao80597ALSX6TNSxYexOjRtaxIJbfif
	2I0ykFiDPewCRTC6cLKBF7IeNpq2Mh1gCfiQ7/ml6/qfwCMXZdXnWsgaF7ogWnrhOQ5dFsJ6z5D
	cN0oKaqpSOfvHEmwfOo+YmAxGFpSqRApeGezOgqcQPY+sehbuxUgMUIse/wAp7g=
X-Google-Smtp-Source: AGHT+IHK0RqgTC6ib0kEaDmEH0Eseg0plSYmKizgmQl2o0SS2ejBy2EE0/ENmsD9a6VI8s1LOdR0WA==
X-Received: by 2002:a05:6870:6b97:b0:2b8:ec17:66e9 with SMTP id 586e51a60fabf-2bd50cdbd64mr5924008fac.11.1740242937154;
        Sat, 22 Feb 2025 08:48:57 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b9548878adsm7409873fac.17.2025.02.22.08.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 08:48:55 -0800 (PST)
Message-ID: <81edbe7d-d6a7-4df0-b27d-8f542e56450c@baylibre.com>
Date: Sat, 22 Feb 2025 10:48:54 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] Documentation: iio: Add ADC documentation
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, corbet@lwn.net,
 marcelo.schmitt1@gmail.com
References: <e6ac2a595f06ba2d5ff0eb86e5895479c9dd797f.1739998491.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <e6ac2a595f06ba2d5ff0eb86e5895479c9dd797f.1739998491.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/25 3:00 PM, Marcelo Schmitt wrote:
> ADC inputs can be classified into a few different types according to how
> they measure the input signal, how restrained the signal is, and number of
> input pins. Even though datasheets tend to provide many details about their
> inputs and measurement procedures, it may not always be clear how to model
> those inputs into IIO channels.
> 
> For example, some differential ADCs can have their inputs configured into
> pseudo-differential channels. In that configuration, only one input
> connects to the signal of interest as opposed to using two inputs of a
> differential input configuration. Datasheets sometimes also refer to
> pseudo-differential inputs as single-ended inputs even though they have
> distinct physical configuration and measurement procedure.
> 
> Document consolidated ADC input types and how they are usually described
> and supported in device tree and IIO, respectively.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

