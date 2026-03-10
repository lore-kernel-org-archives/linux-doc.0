Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED9359A79
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 10:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139832; cv=none; b=XDB7gexEMrOL38unaNY2dnK74mAJ2tKIimschmMNfmKP9mS4H5J+OpwhBo1GcOfDbVyAbyeETKhL2oC8Vk11Lt8vgm87S6SAUBiN2VHy1WkWfbwCWEL5cruH+qWU/Qey0Zx6wVmX3gYeKTHCRedesNOIzMrLUg9kR4tY1zZd9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139832; c=relaxed/simple;
	bh=0VoBZs7c1VaNHYX4X9G0oFihfaAjTwptBwauSkvbB9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJSDkVw0ANsU6P5mNXlNQrgw1rJ30yO/btyafo5JW3XC4gJCeh/fhb0FF0ChDW6Ygs8XlfQJTU1lPdGee8Ihfj6DU/VXxoiquMXkCsd6fnOgeDHmF0X+jCwmqN2KokErUjyWJXwRGbPyvctjgjhdNm9cp3qrQ9NMMGawymscoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M45i5+BT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M45i5+BT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48539d21b76so16925125e9.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773139829; x=1773744629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jkdkaOrB5sbIX+V1ogcejtKhZcBX+Pg6pb5seJw+GI=;
        b=M45i5+BTGzrTbsIzvfIaG8lYKev80YBP1s4aqtRU4o941SMmqwNOZIFIGXqi+K3OEu
         Ulgzn2e/sUQbQ6dPGaNd/YWPUnabYg7KuN8dMlXGcJQnyozYC9fZrhMaGSdlJN8/P3/1
         3pmnKG53NJlfeQBUBDh6aEdyUbO9HNJ/S51cUVtQ2Ccu9ttVvHYP+8A+KYfuD+KtAZxh
         gd3Lq8gg3XBh7XM7ownujYy3FSfMGDvm51Xt4No5HVCKtrup+5Rx2/FOIXKCRmdC4Y8u
         tOhsA1xYfhFY/RGICmnRc5RH9bBaYBruknRhd6J7OH+gvFcghex/CiFrU3TMB4v6f1CF
         k2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139829; x=1773744629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jkdkaOrB5sbIX+V1ogcejtKhZcBX+Pg6pb5seJw+GI=;
        b=EojplWI8rqgCvd7NpCeQnLsaXHfNQ0/wgb9s7kxkRjo1fqZaQZdDRMT8eqQXd+YqBe
         Ga+Pch5pNg+OjksP9BcmLpSahVrS11ZtVkSjHjv+eb6S5mFDmKL6dSL7/Wv/v0fNNFKH
         GRxcBapQpXJYhlOeh/6iY9c4sgwlZnDK08uWRGuJ5QTNbSZZh/b96oatHa8IDebLWBhc
         xDaSWWSs7MnlE+DGnqPeqDyUFRNxJJM6dspXnTmimaEjw9Iz3R3oiamspoz459IDCsc2
         T26RVl1UwxliL8bA/JHyhJG2lT4zQ4AY+3+BymuPYLx1WC/TWCez0b83OFRzwdRKg5Ks
         NoQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/orrzDucLMih46RKeBuuxLqnT0MApcP5m17d1wyExDOd5CyqXrIAluKdXePbuOcOBlVU87haM54Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCp3kQ3W24GOxIapmWn7Bf+QCOaRlz39U9ls21nX4Ysp6C04zB
	aP7adyoffZsdjB3/RtM6KeIAchIx1QMJSJdo+B26ChJCduM9r7om5SG5
X-Gm-Gg: ATEYQzy/+7ujprtZTvyoC+hK9uxgm+YWcFFVQStoYC3XeL/jQZAGZyQt+2SbxXfe1oL
	Q2D1WxPv9MqyqvAnsH12KtOzETiKQhMQSSpWmIuZl7G4Aud5B11+KKzMFu6uVgODDaCFX85jU6M
	F9LZMYiXfT8ZqjMcCKxmiZ5tMUcpMOb63zSajPfXIFDIXFdwqqI/de3sEiADEMFXRAfDo3kl3bT
	+MLy/VXP9+9ACeJTXv/fnAb2bnJ7e6tq45I2SNxXvTLucOmlI0H7+usDlQ2cvNMmpkRkppe1Flp
	9uPra1nPkxiwptESa4IPKItn76/aqbzDzvnv6DUkA9Co8NDnRVE8u7MZsHy5LYRwKmeqDZlO4Q0
	lwssO5zHiDVjoddBHAMWTcKsXRT9xjspeq9Q34TOvNiu5zsm89CwOOJHSJko67buu0LjjO5SGMK
	hH+rOukplVeOzFsG/jlybsT0Qfkptt5rv5HegZpwpTPjmtZIf/YYqJdm0QpQEzgSXL
X-Received: by 2002:a05:600c:a00c:b0:485:3983:aba2 with SMTP id 5b1f17b1804b1-4853983ac6dmr130510055e9.23.1773139829169;
        Tue, 10 Mar 2026 03:50:29 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm71843325e9.7.2026.03.10.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:50:28 -0700 (PDT)
Date: Tue, 10 Mar 2026 10:50:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <20260310105027.08b93187@pumpkin>
In-Reply-To: <zhjkurpwbuvirh3k4a4c3lfeu5semu4rjszvej4hnx7scjyk2q@v4r7oqexwsjl>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
	<20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
	<20260304101655.620df7ee@pumpkin>
	<6et7t3o6fjiinpkvpsmoxjhp6edn23dgclbulaxg5paccdotgp@amtf33da5dhf>
	<zhjkurpwbuvirh3k4a4c3lfeu5semu4rjszvej4hnx7scjyk2q@v4r7oqexwsjl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 09:26:11 +0000
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 26/03/04 11:41AM, Rodrigo Alencar wrote:
> > On 26/03/04 10:16AM, David Laight wrote:  
> > > On Tue, 03 Mar 2026 13:27:07 +0000
> > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > >   
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > Add kstrntoull() function, which converts a string to an ULL with a max
> > > > character limit. The function is an alternative integer parsing function
> > > > that does not require a null-terminated string. It becomes a better option
> > > > over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> > > > with custom delimiters without having to create temporary copies.
> > > > The function is consumed inside the implementation _kstrtoull(),
> > > > promoting reuse.  
> > > 
> > > If you've got custom delimiters use a function that returns a pointer
> > > to the character that terminated the conversion.
> > > They save you having to find the delimiter as well as taking a copy.  
> > 
> > understood, how about this prototype then:
> > 
> > const char __must_check *kstrntoull(const char *s, unsigned int base,
> > 				    unsigned long long *res, size_t max_chars); 
> > 
> > to be used like:
> > 
> > 	end = kstrntoull(s, base, &res, INT_MAX);
> > 	if (IS_ERR(end)) {
> > 		/* return or handle error */
> > 		return PTR_ERR(end);
> > 	}  
> 
> Hi David,
> 
> Do you have any other feedback? the function prototype can also be changed as
> follows:
> 
> int __must_check *kstrntoull(const char *s, const char **endp, unsigned int base,
> 			     unsigned long long *res, size_t max_chars);
> 
> so that a pointer to the terminated character is passes as a parameter.
> which one would be the preference?
> 

I really don't see why you need to add 'yet another' function for parsing
integers.
Having to pre-scan the string for a separator seems just wrong.
The userspace strtoul() family do everything quite nicely apart from
overflow/limit checking.
There are a few options for overflow:
- Ignore it, this used to be what posix/sus allowed for command lines.
- Saturate.
- Return a pointer to the digit that makes the value too big as the
  termination character - since the code will typically expect one
  of ",.:-" this will be a syntax error.

It might be worth adding a parameter for the maximum value.
Then you only need one real function for 32bit and 64bit values.
But you also really want the use the function return value for the
converted number (for all sorts of reasons).

	David


