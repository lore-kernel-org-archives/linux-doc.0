Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D0821770B
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 16:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027037; cv=none; b=D4NJVCYB0S88Y6lZL1HUT7q658PQbUepsBauQPxr8Ye+/sJo/zJA4YB1xgeRIzOhP5Kie2OVjG/tUx2qGOPlhy37JeuJV6NtIubxaWvVPFO3U/lSc7fUaNbMy9wuRGiG78svafWKNhwiSWS5hLwoBl/WdfMLXfmY0d4af0M3z98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027037; c=relaxed/simple;
	bh=eVvkeQWqrG4dYBffY48He8ILJTh8EX7LtPQhkX3h+lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHe0MlsSR17Loba+TVyZ+TlBOmhKiVkwSDImbBCY3cFucYBWI3BRs3zEvA+rzKrBw4aR5HITUzaKw/+fRBk+nTyiePsdAPucMI0bhW4VLwTJgVpKjbcX4NPO3NjKodrSiV6Qst09yGiGR4uYirPy8ceDgWjJzjNeoKqF/paKZl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCnG8vPR; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCnG8vPR"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so1662973a12.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760027035; x=1760631835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4C1j3OOKsjCqjPjMDTFb2+CfJ4gki9Qbk/4PqhkQDc=;
        b=MCnG8vPRQYAB/sRTi4esoaO/JWYoy5ApLLqeX6QndxwVYySMVYJKfC4gJjO3FwPqSV
         S30/FC8jXscm2L1XPxnjUqDd27oc5xOjcOGAGIa/5BlueteWIktVI8o/v3dMZDbmDeF8
         z5AR8SUuVLUDndif6y1kd0i2+o7Wee/2h2SVC/9uVSGcm5WK5k7oueRP+T90pEh+XE4a
         1d/kTqHfwlX9LPsj0YGzfnpL06PNlMtzs7tRQTGQIyBbwtT+lH5U1pKcVbVIix5OkX9B
         3adjH2abP2vWlPTF0J3nPlLFMQsmVhism3zMR9wh1pzs/U7nQ3hoL6WTMqh4mJNEytzO
         UfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760027035; x=1760631835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4C1j3OOKsjCqjPjMDTFb2+CfJ4gki9Qbk/4PqhkQDc=;
        b=hZum8c9t4jv/mkhAvnIYFZoZ0maSCN7DFlulmzCxP/6d8Z8ckSih6b8LkjghVHJ6eN
         tpuOfCT/B+pVyeWImfPw6UxB/dxFdYPulwrStbCkxCnfuXDOBWLfTsR/KERdsa3gKk1e
         Hzl+itBT8tfgyla81weqOZZTsgz7SMSSEoBhBlygopB8rd5KehV6xinOKiFIwzqfvBsV
         siHiT5Pve3GBLLwVeBH34Bo53yn2HM8D9AGoEdiNba9Gzc34tJszrEUNig5/6q8MWsMJ
         6RkzfT9bUNwEl+TSMSNQeGf8ghaJ5Cp19nirU6PaasVPu5QcKiqS0u3JeiCw3KPNdueh
         rzIw==
X-Forwarded-Encrypted: i=1; AJvYcCXEMWdgYnkgVLFafxOaJi1ChOkIHynzR1mcs5syZxcL/xFdFJENe+UwQ0JASieTfYMK1IzgiFTPkbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YztKC/n6WR/TxDa4itOTwNNfneSdXwgXTpmtMU2Cf1dxu9gAgtk
	EL8yUi7xnXl5aXh40mLutsJFra2IPl2X7lyWZqAyFVXanv76uCpas0yD
X-Gm-Gg: ASbGncvUVOwWFtyFVXdMZ8Dwe8fslzSL9msEgvf6u5Wj/NtqAnrUA+w+UOhnlL2f8FP
	Va1xT7HbOlLxZT3P5DFpjp2BgA74v0iZAdmFbDZgCL/9EirdIsHd4wllwI7jxghEkiTrh8PAEqy
	ijXt7SaIhuH2AkOWnNwGP6XRIZZxWJlpCVP6K1hZhlIv5maW5Gr8Rv+sfLlSnIQTykQoaZjFAty
	R7vlalNsJ+Wa8RZYnTzOTI0ppfI2tez6s4qDmoWp7Ckacl5CcMlT02AzHDAIgQFc81XGOwM4FIJ
	9cnwWQIk15Va2DjfsafKBMmfNOlO0MVs0CAxxWroFhhdJmzoTBLsL00m2v8JdOjLKO1MTWJIizL
	4O7FMGzf38nYfB9JgNPzPk/o9/Geh7dumXP5OXg8zPxVdUz8sU70L/p8=
X-Google-Smtp-Source: AGHT+IG5iTuS4lml5ybOjWvkOCPTHDj9ZrBTt/dnU/W0P0sGl3oiFllm8k9GBt9WpwjupCqN6+ivSQ==
X-Received: by 2002:a17:903:1a10:b0:271:d1ab:17ce with SMTP id d9443c01a7336-28ec9cd59afmr138719345ad.26.1760027035566;
        Thu, 09 Oct 2025 09:23:55 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034e1854asm33475565ad.37.2025.10.09.09.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 09:23:54 -0700 (PDT)
Date: Thu, 9 Oct 2025 13:24:54 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, ukleinek@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 7/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
Message-ID: <aOfh1puxPJr367n7@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1759929814.git.marcelo.schmitt@analog.com>
 <7e51e036ba930284c74cf42afd53b17d49093654.1759929814.git.marcelo.schmitt@analog.com>
 <20251008-penniless-tiling-9a83d4b4ba48@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-penniless-tiling-9a83d4b4ba48@spud>

On 10/08, Conor Dooley wrote:
> On Wed, Oct 08, 2025 at 10:51:37AM -0300, Marcelo Schmitt wrote:
> 
> > Change log v3 -> v4
> > - Now only documenting GPIO setup to control ADAQ PGA pins.
> 
> > +    else:
> > +      properties:
> > +        adi,pga-value: false
> 
> I assume this is an oversight?

Oops. Sure, should have dropped that.
If the device is not an ADAQ (no PGA circuitry present), then we should not have
properties associated to that.

+    else:
+      properties:
+        pga-gpios: false
+

Thanks,
Marcelo
