Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB2F3CC7EA
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 16:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602700; cv=none; b=RlmSx42hAXG9IkjHmiVhKMRINLizuukE6M64VsKrSJpcBzFI6hdHhubvag7WQ1XDZvQ9pfE/Bm+XfTSQSesad0KwjkpQASOjJD3Q5TZ/DVNgC6/9Jiao+pdL+SBtX7Fo1eSiXYUs/E1yhY+QA4t2F3a6/qXTOomDnQBt1QyHV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602700; c=relaxed/simple;
	bh=AtvxZEfNK52qh8Sntbt6SqFzqSBGmvWLF/8w119Z9Us=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mDEimW6Pr4IrW93EmjVD1FA50zbmUExPjoREdJYnZ+ujEL2LLiUX4IKkMqr8imT/w7YuGEQmih3t66+olsJ3kjXNbatqK3Kv+yI+z7pO8EqOLq0NfYjZUbqaC+EMeok1JYffNNtV9gUM/t/TFTsCUu69QvZU+xu8+AWu26EL+/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRYzF1sF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRYzF1sF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3423273f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778602697; x=1779207497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLDhRrsYYAieX5MKmnLKzaUv/WL8O+rmn/hVKUTlz+0=;
        b=DRYzF1sFFkDifTiZl8MxVfreVi3OJ9c8ENougW5kmP1lmpZJ3qCAySvVWMyzWMgq0V
         tupJ1ysCcidUX6DHiPfHukN+Poukp8+qX7f9clPGEyJB6lFqHbdnQt0aWcL6Y0hBfdzR
         YjTh91NhBWF5BddPhz5piv22gpUfmvgpmpZFV766NVNo+mD6HVwHz8g9b82jolZxlrMW
         xjou541h6eiBvrziplYmhOUNPlN9M+7sqm/VB5yl5S04LN3s+LlnH8wqhJ5WLMuO/cdN
         t1gC/v85D2jfJ1+KGzVZcW6p9JYQpYwK2VhLg6UWMebPUsVJXlAjpD7Kfxp0uTQp0N2J
         /zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602697; x=1779207497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LLDhRrsYYAieX5MKmnLKzaUv/WL8O+rmn/hVKUTlz+0=;
        b=I7Sw5j6qBiGrGylBJKHcOwMJG4dWAHmC6GgczbVb3ryK19py7Fup99ugXL2pWaEtRc
         fEi5YodvYbW0ivMLLDrBEpBjvWv0RiXc2q6vLu7/5pwSEkb3SkRniu8Bi+1VlaTfLPfH
         3ELV+LG6N9s+qR1FSSuaGCEYqS1EZ6yNDtLXr0zMcBHJVbhljqD9eVbmMuqdS+CI+qyc
         RDnM/QT0I6G1iDWiy9BaeXBnsjPJljpRkrbl7i/QhSjaOi/svxjxGHRY1exjm29cSMcj
         TmLO8/zUoCWiOhIM9n4dmAicU6aG6H6V9FmFoNnKQL2N1eW7244jnaRRFWdPjyqEpZIy
         2WNg==
X-Forwarded-Encrypted: i=1; AFNElJ+Y/oaAp6fmoO5gX2G+z2PVvNeNeL/VTnLsB67Gqd+NxneFb/FKv81NjUVbCPFAxRfA/Y1xTqA0Dmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVljQw/EuxT08C9f8hcqPj51Ay8BJk3KB4tw0+kTNdh0oOycm
	1xw97LVLmCiuXTZo2bxRmiSNSpSTZsFVyp/vHjk9b+pL4NiRxT3eUrFE
X-Gm-Gg: Acq92OGy4/jigmU5FtLnB+kUQ4oOhLv4gVJnt+rYAbYgAOOAK1/wIljaOG0fh7b2jqI
	hbsOKbw0/BRTfWx10iKYXg8CdBUNlY7beRi7C4IdvRpiun3PaY3Lp9Dx8t/P63WbwsaZZc5ugFS
	SdM1X1shG8+Xi7etwKEd2jYW5YLjAJb42AOvwDwrqlLxPgCvK4dLx2gba755BWnf3zamCHnEOe9
	0UFauV67P7WGFM8kdGQENymAZwQn9ldUnkCgoNfO4PphyxqEY1ctPjdLl3g22CpI/dWKwPSt+es
	ZNPWTmMsjT/bWCXoNkX8CVd9dM+JcSi41HNV+a1EKtH7ifelqQRle15ujjnBRarvNfss60t37aC
	9JjzfNcLRK09EB1CCXJPweBQKR1UMkk/+41nzNKuRDEyhi72uCh2CZBOm7tHBWwO69cQcF+JCHs
	Ajkxr+Mh8wDXjqmX7lHGtzVG7d3a8Z6oD2EMRnUhLe1MSqQYo9KNM4Ve+pFe0x
X-Received: by 2002:adf:e9d2:0:b0:456:b23d:e57 with SMTP id ffacd0b85a97d-456b23d0edcmr16115850f8f.0.1778602696592;
        Tue, 12 May 2026 09:18:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b071sm33302475f8f.14.2026.05.12.09.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:18:16 -0700 (PDT)
Date: Tue, 12 May 2026 17:18:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>,
 Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <20260512171814.1934aeb4@pumpkin>
In-Reply-To: <CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
	<20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
	<20260512123953.40d80bc9@jic23-huawei>
	<agMnWzMjW1LwCSyT@ashevche-desk.local>
	<sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
	<agMvlS3-0wvGmBwh@ashevche-desk.local>
	<dxjg2sdyxb7ieb4abmeyyye7qok6cczrxabpsjyjhcbehwoec3@sbbqoo4wmzre>
	<agM8pWrM6j_XksvN@ashevche-desk.local>
	<ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
	<CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 May 2026 18:21:44 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

...
> > I think we are going in circles here and we could look at the code instead:
> > - integer parsing with _parse_integer()
> >         - overflow check and validation of the return value
> > - fractional parsing with _parse_integer_limit()
> >         - overflow check and validation of the return value  
> 
> No, this is not fully true. That's what my whole point is about. The
> max_chars parameter limits the input check, then it skips an arbitrary
> number of digits and only *then* it checks for \n and \0. What will be
> the result of the
> 0.00000000000000000000000000000000423 in your case? Whatever scale you
> gave it will return 0 without checking on how many digits were
> supplied. All the same for 0.9999999999999999999999999999999000423. My
> point is that we should limit this by 19 digits.

Don't forget about 000000000.123
And that you also need to worry about leading spaces affecting the length.

To me, the easy way to parse it is to know how many digits are valid
after the '.' and just carry on parsing digits after a '.' until the
limit is hit.
If you really want one function, pass zero to indicate that '.' is invalid.

> 
> On top of that, what about -0.9(19 times) ? the fraction should be u64
> in this case and it's fine. The sign applies to the combined value.
> 
> >         - extra scaling and truncation happening outside if needed.  
> 
> Right, but the given input may be way too long and still needs more validation.
> 
> > - check for input termination
> > - combination of integer and fractional parts with check_mul_overflow() and check_add_overflow()

A lot of the time overflow can be ignored because the digit string is short.
The check_mul_overflow() code is likely to measurably slow things down.
(Especially on 32bit where even a compare against 2**64/10 isn't cheap.)

-- David

> >  
> > > > > Maybe I'm missing these checks already performed?
> > > > >  
> > > > > > > Having the test cases is a big benefit, and that part I like the most.  
> 
> 
> 

