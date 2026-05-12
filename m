Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B1360EE4
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592081; cv=none; b=eWapDl75kZuCAWHjsMiV0YVuNrQDFaAhHk127GOviaZLEn6AfCULuszwF/FXKuoMply3mOV7UYCip7Nd/CIHfY0VMGqnEl37hvbA96mohAIfn82rk011f4LhKXDczSmgwqhldhUZT12ury36fq2gx6Q/rEtTMcczCymBlWLwjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592081; c=relaxed/simple;
	bh=sEiYG2uut8eryJgiVxXirz97HD1qb4i40If2RpVaDvI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+gC1YowxlhABSZVndi04G5/G2X8ZdF/nue+vJ49kZA9ak89EOoOXWSnE5/e6lFeK0C9DHRATdxslb/PaAxC6NID34NaCRTzvPYsvpGrsZPBXE5hEuw4gukMzj96S9D9PYn/MgKrNYLGoYizvPwiBcNI38f638ANtaqDRVUFIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HW4WXrgQ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HW4WXrgQ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-448528f4e69so3296141f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592078; x=1779196878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0iUBbHJXRnojwm2dbHMn4bUhVf32dcx1R5+1C6RZQw=;
        b=HW4WXrgQJv/8u5VL/s2qAKveBKj0j9M6F11QIaxwdjh55mQx1OtuJ1fUm6YBNXWLVh
         5xqZC2rN4vmzO3PV8WnKxVaB22uWj5NdIf2JYcINvJsgMXselYnS/zEa+EtVHMhS7vHo
         KQ1P7mE3H+WwzWWPcyqwavohBt7J18tnCMLhwdY4rB2fntrqXz2m98Ngk6t5bVmsDVot
         o//rWQG2SP+xzPUa227lCd8SPg/0nvy+GW26o3fBlPdT3+CiKkG3fGCNQYCg2loWLjho
         j97JjqSlXGaXoaQZM+nxBlwTjHFsdaDZ6neTqJf72oXcJTibYrsk9PlOFfaNh9c+Fq4J
         6JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592078; x=1779196878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0iUBbHJXRnojwm2dbHMn4bUhVf32dcx1R5+1C6RZQw=;
        b=tLMLeXN92uAvbPLG7cM2d4ohDKbLk5uhZuuII6yKhnSF2dWNzRGO3GqqlbvezRYkiw
         Vzf/OmdxSWB22hrUDfIFFRLyzZzQrtaqw6CacSHzfr2wp+1tzf6sidFnHnJhgXyZ+dAe
         AEIXk1wu+FT7slfJzbQi4054I2yGkOz0/pXVUzdCH+Cd6l9U5uMUB8ZJwabvig7HEXOF
         7mQIq9K1ElaUzFhjV44UgwRMh1YpRV+qeVJKqpDwLWy/k3/9Mzt5RSU0cF0J93pTKmGz
         nIdVfmMt5sVsKcdZk7K1aMMXJuDEd5OI35pBxK2T4QN+91I2WrfxzQOol5r0Puv9eA78
         6B0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+KXR3vMy+zbOK4jgTZXRxR9fGCFKaUkzAL7QenTxMprM8qqhm5Gxb+hVVLZ1//sA3evqsTfUUkR3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLV/ekcgSrSl5iDNoFHW7VilJPxYkOaCjXbTF7VGAIg+0WbEwo
	gaZeYtN3reifOl9SorXnzu7JiMI6sDu/rwEWUN1/LkOrWlrMZMNTfLd2
X-Gm-Gg: Acq92OFyxz3YCf49zY9ytyt4sj6jmP4uzcdlq/134dV3EfZeLSESsNQobCM53+AIXQ0
	XHVBIkAbbUk4NOV6zRZYzZUmzkC3r0/9BCZKh97ojoq+rcN0hLUKhRSLEj6GTLFltyougJG2Jvz
	ONPMLsm9kbGLUfc2zWzw2nAT+Xgn66rvwlfE3jeNTTnJdyMMuoqrgRtmX19AItzg7Kab/S0PpZs
	uJGNiX1hLkwVx7b7NtSBY98vZirwNFRLsN43odOfTQfRw1X98TyZlneOQVlqEoGOX7bUNmlAP8G
	DALtgON6Lh0GMWfGyELu2N24E3GzcnxOxDYmgG85C/wxjFtnEAIAMhARlg1Lvlc5rtkoYKhrFFb
	beV5t7Z8Iot2ZSp2ubU4mHTQFSQcGYDHYX4FY8i3u8rjRX/SCIT5CGaF8dtAugCzmE0+jKtkGR7
	MVNRTIT+sRiQpU+57wUtsye8glbXLpe4Y6BQUnOhYos7OMTrqvTOjx4yxMy1byBGckF60cBvHcw
	v6w6v/Fu16Y8Xh4XKwYARjKFPXSKi6qglOc4QMb1o9Nbh3sXA==
X-Received: by 2002:a05:600c:a412:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48e6748a724mr188954735e9.4.1778592077610;
        Tue, 12 May 2026 06:21:17 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9055ec3dsm43552285e9.0.2026.05.12.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:21:16 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 14:21:14 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <20260512123953.40d80bc9@jic23-huawei>
 <agMnWzMjW1LwCSyT@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agMnWzMjW1LwCSyT@ashevche-desk.local>

On 26/05/12 04:12PM, Andy Shevchenko wrote:
> On Tue, May 12, 2026 at 12:39:53PM +0100, Jonathan Cameron wrote:
> > On Sun, 10 May 2026 13:42:20 +0100
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > 
> > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > precision). After the decimal point, digits beyond the specified scale
> > > are ignored.
> > 
> > Whilst Rodrigo has already replied to say there will be another version
> > I'd like to request final feedback from those who were involved in the parser
> > discussions.  
> > 
> > They got very involved and I'm far from an expert in the right way to do
> > this stuff.  
> > 
> > I don't think David Laight was +CC so I've added that.
> > David, Andy - I think you two were most involved in that discussion:
> > Any objections to the end result? 
> 
> I already said a few times about the naming. I do not like the kstrto*()
> be semantically different on how they treat the input. Second point is
> to avoid code duplication, but this one is less of a concern since the
> new code is in the library close to the other potentially duplicate code
> piece and hence can be addressed later.

I suppose I reached into kstrtodec64() and kstrtoudec64() because it aligns
with your expectations for kstrto*() semantics, no? Those include:
 - overflow check;
 - extensive input validation;
 - optional '\n' in the end;
 - mandatory nul-termination.

am I missing anything?

> Having the test cases is a big benefit, and that part I like the most.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Rodrigo Alencar
