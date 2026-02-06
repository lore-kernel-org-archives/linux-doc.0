Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C6036EA91
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384056; cv=none; b=BqGY7vUqdEHXMk7Ghal2WKqKbzGfqM36w8aNj4L0mc9KRK48X7Tnf0X01EDwAs9Y3hKpHxdHKZqJvDaLPJuNy/o7bqCT5W5oMlypAOErmjF4iXazWHz/wO77b4wKczDVUDCZnWfVANNWnHFHcpokj71DOqTzSa3NrzCIoC1UBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384056; c=relaxed/simple;
	bh=MFL2JcUT6XBkbvTvf0RTxu+0ljLyVw0pbemjp715oXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IU5Uq5udfpzllAXNEiZ89K+NJi9DTdYSAtRb3p848dmKtRE7jY/gA3bokFDp1fpYhbIw6NUi8+5D6Jfi6BFXoEPn68KizC+LD8gnc+fnXJxooIaiPITm6DfZaA+WrXSGg/5YZq/FoN1hC//6+NP6NigjZFOAkM+dnyNQAX1GPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP3QpeMd; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP3QpeMd"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64acd19e1dfso486658d50.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770384055; x=1770988855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zrTQt5CBH47S3XXW4HJj9QjzQOye6OspfLxjidxB16A=;
        b=UP3QpeMdJF1zw4n5yXKEaktjRbG7Rb2vodtQN2/C/Jf2o20aX5eQQagBKtnvDIv44S
         LWh4CpQFln6C0NwHfkMYRu22KViwjXWRDhJshAfMiuYLp8wFE0Z8kEYmopKBFrqipRIs
         390A+i9cjsKZdauuZRieBDvW8ifvRMXQTPFrK0B6eUMyhF4wo9KjaRr+B89xGoRIHxN+
         NHesOKrcqvhSvZ77cCFa5A5duzlc68H9hdPMI7O8nrlZziM5NWuWg6nGa2PdgosWSLvb
         oVorPIEMrvvpDr/Gh2apTlknjdYtJa6Ht5yidc2ElriD4uN7NSxiMTkyKd8Kso8iOm45
         ZhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384055; x=1770988855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrTQt5CBH47S3XXW4HJj9QjzQOye6OspfLxjidxB16A=;
        b=ArDYjmcb3Ewi9huVCvXi+jBRGHcxpeZbddvQxhUc/hQ4oGMoY/2E1pCh+UU19102uJ
         RwLfWaRJye80aT2sZPiKu41d3saJ0pVSGH2vM1pVCyYK2wP7QTd8vaB+PkdksVig1SHt
         lFFlXJnHXskUNf6qKFp2RB9eNIaYmHxWuTTaJskLvhsdKI1N/v82Dai+UvGQFHJbTmYW
         Gc9Na+D/7PzMOMhFYcoL6vXKYyfMiEgbzkTQ9OFR2AOQpoBaHPTzFfDgZU21snVN6c6F
         /UkuKq2jkce3emRUK5XBDb5dQK38XewkGmtZr2eJIlUg0NFkLXfKLhcrPwM0aUNzpMtg
         bx+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwSbJZUBGTEu2I+fym2Q3CmfEMaRuSEvifu8fd6ig7iWvwcvpWTWR18LCAGzP89DLqf9kiizv3Dpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyqeg+6B7C12APnxTxnToKCXFIriqBhU3ljusWZRv+jnO8xt1/
	pNzofgIH7dWYIrwG/Mktj2LbK4HEh/4Q69H13sjlCTLd/LJQDeipL7fN
X-Gm-Gg: AZuq6aJLKhG92W+JWRIBYmZxnTPPrTFwLarbb1Bsfvozr9Likcm9dO1q55MuA5R5Oue
	1zaKQCSnZEEKCm/xtf9SuRoc3oYQjNrwxcVEj0p3imo/FATqT9RBt6QS/zx9d1YsypSkei6dDSt
	NXTrWZC23v4i+hAwCFbqd5MzXIZWQUO37TYypB0AXWhJBZx8hTwjDfbFknisSzy+gbasAATKVaV
	kk4WRhOkIeOcO/iSgqfpfLUnrnTmGlKOVaLRxKQb6wooil324uQVf59Z5uut5OMcdlvP/FYbn/P
	S5syZE1vUL/iCDzeVUh40F9yLWor2Q8gsjQ8aau7nkWOwFUutPt7cgoDp3xULJGXcs4I7DcDZQK
	xkVh34za6WxFW/Y0qrxqHfJdxo1fYAU183jbljdrFfPvYtOsZrhq9+6CgbEh3fTqvNxrwRvOtTq
	P+LUhDkvKlzmexWUE+jQ==
X-Received: by 2002:a05:690e:1505:b0:649:97ee:f469 with SMTP id 956f58d0204a3-64a1c2ac060mr1591405d50.95.1770384054908;
        Fri, 06 Feb 2026 05:20:54 -0800 (PST)
Received: from localhost ([2804:30c:945:ff00:3e6b:164:acca:cc55])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649f229d5bcsm2229957d50.0.2026.02.06.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:20:53 -0800 (PST)
Date: Fri, 6 Feb 2026 10:21:21 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 6/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
Message-ID: <aYXq0ZSRSa_dBwWs@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1770309522.git.marcelo.schmitt@analog.com>
 <4b879f53450e87739afc0dbd832dab5a3f83efb1.1770309522.git.marcelo.schmitt@analog.com>
 <20260206130559.GA30712-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206130559.GA30712-robh@kernel.org>

On 02/06, Rob Herring wrote:
> On Thu, Feb 05, 2026 at 01:48:55PM -0300, Marcelo Schmitt wrote:
> > ADAQ4216 and ADAQ4224 are similar to AD4030 except that ADAQ devices have a
> > PGA (programmable gain amplifier) that scales the input signal prior to it
> > reaching the ADC inputs. The PGA is controlled through a couple of pins (A0
> > and A1) that set one of four possible signal gain configurations.
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
...
> >  
> > -oneOf:
> > -  - required:
> > -      - ref-supply
> > -  - required:
> > -      - refin-supply
> > +allOf:
> > +  - oneOf:
> > +      - required:
> > +          - ref-supply
> > +      - required:
> > +          - refin-supply
> 
> Why is this moved under the allOf?

I missed the immutable branch with spi-multi-lane change set provided by Mark.
Am rebasing on top of that for v8 and will solve the this and other
issues reported by dt_binding_check.

Thanks
