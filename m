Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587B147CC8B
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038713; cv=none; b=IUkalUT5ZBhBoNHLfT8C1fcOHBQtgwwkK4cxLHOmZLZ9r4G+CAqk3I6OV42PnGmXT8oXY+1PW7nd/QYV1se8saN1gizVnkRqNa9vlgbM/0F04Fdlw/NqbkJ3zOPQiPNRnmoPp1LvmKd9fBNJrENcyXhj0v835JOr7EkAb93bKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038713; c=relaxed/simple;
	bh=0DKG2To6jCVPnZRJ2L+oO8w7P5y+YqwjWTPKkHTL7CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrmQOPFyZRroOrm4zowOXsZ70DilfQrvGmEXSriNSxa4TZhppilKChni1cRly1qPDbsENIUHz11pWWF7bItSyCuvmZUFNnpvG506NpjaDuWC8DxAGeAXGwR5mLuPo8dFCTJdtl6ZlkRIKqpoQ+myZTv7Dvg2ehOUq1RoWmHI25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCNYjfqJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCNYjfqJ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c12614b81c9so815474866b.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784038708; x=1784643508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=rCNYjfqJEzBdbv652WV30QWwA2LgBr0pVAD1wzBiaswK7omi9pocA3wJjjcecykjC2
         IHB2Xtqi6vIH5UoMxzAmV1VQs/VWLMsqCpJ/Eh2u3f/1eIIGIFfbOkKu22BvY57YbhPY
         KL3EWDh4ZOl1Rosam/maNvWAUmYChjWAY84LonhCeltJ5qigSq+nqu0jKseqCI3TFmTo
         x6Dlhm80cUzqpq2pIwqI/o70c/oEQWawZQVH/6eBOPWjJFCwEb/s6H/+HdjHSfgr9HK5
         M338OIPwzRhuwWmGNhSzhDzVjs5s5JG2OCDAOf82nzPJd4ikbw4YKjWKEUlMh4hMyNwz
         iQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038708; x=1784643508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lZB9rfFkhOTFphdLGR6TyG9TjcpFUip/IJVahTcTdLg=;
        b=Bq2BTzbRMmkYlZrYoL8Q6otu+vypdJtN0h867SC2LgplsoGAb+4d3kNnSXVLfvLsjL
         DcHoyaIqzX6tmj98Bs3iFEz3l5ZNy2R1Pz4JjzeA1lG42oAdqoLDXdnMp5mUIUDPPN/I
         8PUc0zEDIdYLz+OC3j0cRjbJrtZlVHf297FzSMers7H3qfvvO5GUrpR62gdqa73dTAQN
         XJgOm9mxV0vthmtXEVSFojpXKUlebSF064QAVh7g+juROeEtOHJ3CRur7PjPq+L1Dgfz
         9XGPAkT27sc7g2RpOucQKOh9DziSPsP71gWjWwS1NjIxB4UwM/5052X+Gg6R4wMei5zL
         Qu4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrQapTTb8kwIR3AHdMG2mG9KJ/FcPXP8EABbpGwQWW1aq4uLJhHrvOjJWCb6YC5HepglxbABDozj68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvaMyjWGTOa9kFCuqwIGPq8g3sYJGgVbog1Z7DFahK3lhX5LNV
	liJLX4cQnPSCE90CpfCv7+sdcKrJNrIElRxAUTK+WLuXK4AUpNksrY74
X-Gm-Gg: AfdE7clfwldicYz4pjWGV7dwSHk2GK5Bt809ZRyA4qb5w2q7+yYOCAquj5y10a0nIVi
	HMxIX0NIvavGgRoay+oB5mEB1nPMkGtcQ+XpsekdINXBmNBZx2l/e9m3XYknQUe6utbQGBGsltm
	/VPXTcrRxLaKxLB0MlXCzjEez99m/g+AQEBENpxEYzPxfQ0aXsDZYGysOPSTU7bItuQ+FQJP5rW
	i1mQlT2W/qHdV6UdqyGg64qKZOHBaDq9/JzScNi+K6S+EuSBFdFvxbPB7FVJ+IAu59YuuJt+B47
	iz1diFdgJHRkXMiqoNgtJZh4INRIUPMW/fcCHuBAR1NWzrOz3ViI1hhzlARzRY7as9JIHK1eKqZ
	QbTuDp0MAvtvGixPwNn4aj6uo8jdL5OTnQE5zSnKlcm+kb9/ERj4RcpVO0M5WeXErq+COaXzeTZ
	WaaCssvYwP5sRBE6XdyapmANGjdWE=
X-Received: by 2002:a17:907:d58c:b0:c15:c290:ca8c with SMTP id a640c23a62f3a-c161f58f09amr573359466b.39.1784038708083;
        Tue, 14 Jul 2026 07:18:28 -0700 (PDT)
Received: from NSA-L02.ad.analog.com ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15deea5cf6sm853090966b.16.2026.07.14.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:18:27 -0700 (PDT)
Date: Tue, 14 Jul 2026 16:18:24 +0200
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Janani Sunil <janani.sunil@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
Message-ID: <ucrlt75xiwbv3rrc4gvgdop24u54eizhuqzf2av2qsa6ceymdp@kfkuiwuvakhl>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
 <20260710014617.323acf6e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710014617.323acf6e@jic23-huawei>

On Fri, Jul 10, 2026 at 01:46:17AM +0100, Jonathan Cameron wrote:
> On Thu, 9 Jul 2026 10:50:14 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
> 
> > Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> > processing in the AXI ADC backend. CRC provides data integrity verification
> > for high-speed ADC data streams, ensuring reliable data transfer between
> > the ADC frontend and backend processing systems.
> > 
> > Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> The 'other things' I found bit from Sashiko is interesting. Far as I can
> tell it is right and [devm_]mutex_init() is missing for lock
> in struct adi_axi_adc_state().  
> 

Ouch! Yes, I was also wondering about the lock comment.

> Nuno, looks like it was from:
> 7ecb8ee5c93b ("iio: adc: adi-axi-adc: support digital interface calibration")
> 
> Which indeed adds the lock with a mutex_init()

You mean without :)?

I'll send a patch fixing it!

- Nuno Sá
> 
> Jonathan
> 
> >  static const struct iio_backend_info adi_axi_adc_generic = {
> > 
> 
