Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7624925F98B
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453856; cv=none; b=NfJpuF/DKcOjpGCjj0LoS8X5Fp0cexiFqaG95ZzHcSf3Cy2YqWeJ+28eiMMuggfnQD7zJMfLare9Wizl6d0klrJmw9/1GNnuKaLCuxK/zX6Plv5Ovu4Mr6brqBAgJN4UYUvhGHyO7lrGadEPkuzVLdnwbC+r3XooI3kagpccQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453856; c=relaxed/simple;
	bh=IWxUbh4BDZ7bPd8L/dwwB+q8iBVYy1u5irOTFUt+L8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCzXILn2KkgOC+ckZJ+K2Lo+u3IvJPozkw6oFQu1fijG6Cpi7WX628avrkIjuJZJnwucWmvLo950LtWLS2z5esluNJf8zljVVFLT6a+Qh374cOjMSigPf1pbyEu6sEyyG/6BcM30ZelEUZc22/b4hc1CgoOLyGrkTX1faLpalR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Lxqm/R71; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Lxqm/R71"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so6010862f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751453853; x=1752058653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G1Fm2q1qB6Y+ckuWV69fHpAi4zNbor+5BGrf65Mmqog=;
        b=Lxqm/R71/qlMDJ0eVPjPMCiMWcyRwVJq+DsfxJBR3A/Zyq9stlGs2NCPVV66goGmZ+
         mGxDjmYDSO8FXJI3ByzarZvm5+3H+pO/eDuaThx9UWH5zGErhl4ZvBTwf4fbm21RtSZJ
         pkGIizRtBhsrvw0SuS9fE3oGn2a1m83Nyl6Bqrtgf+s7dPg+NaexUVjV0tyQkTVY45PT
         szz0fZOxvhNwSVTGvog8IY7uyRe3gZIWjpFthWx+XFeEa/EKlra6sLMbSgIVpxDiXxB5
         eVgyYe+Hs0Rrl+mF2uZfiS4PFTSFYPqTlNRwYQ/nmPDkAvlw3XnyrSzjHcOutUyEVbpC
         CKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453853; x=1752058653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1Fm2q1qB6Y+ckuWV69fHpAi4zNbor+5BGrf65Mmqog=;
        b=jq1svftb2thg+IXP3Mo/iIOuK7h06NhNR145RfCvXzzRgXczs01bAU4/gF7UMkrC2W
         VQfNXGbDRih10JrGnMj4TA8oN7cnNO6EJCDDS+F5FhtgGZ8PwrvjvNLrfTsMR8d7mmKw
         W2cymrm2WGVAdKSxVLzP/nFuc3csWI1WHTeSKlk9bcBsLO2l9LaOCLdRqnlfAOXgQhH3
         05rfNu6oYPaWVAcfPt2KsXk5fpyCtS5ezEeisdFBSNblTE4H81LfvgHiQF100Dr4QNBg
         1bHKjUL2Tx0cOWAyCZYEiTXjeqGFgEDFyBC2ga/3oaySdKuJzrkwFs8Gga8UT0Yp3N2I
         1vmw==
X-Forwarded-Encrypted: i=1; AJvYcCUOKWXki8VgjldXZUMn/6X9IggDfuRX2HlR34i8KVVohJDv1G9Fd3bipFdAVDMxwTCfnc7NUpK8izc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwts2fkO8bGRcURdIgTi+FgI8VdQc6cLLlsGs3vxsiAtqH4dnr
	+Wy7eB1Lm1u18uLLrIPiSTudpwq9pHD0TGCQYY55iVYuJwakZdONhYgklMIjVBwdFxk=
X-Gm-Gg: ASbGncu2/HiyxYHl69UCBxTw2Fr3gkboNREKBLRERgkavmBatjLzkKu7RFxQhXCNRdw
	XksLssi3DZcEOYGqpcd9Ndw4IkhWI4+vKvjz6aRWuyuhTOJGMzSVF68YJkVUDJZU2Ln3kW65D9v
	1zMHyZS4Na4gESCL8UyG+rart/4E1qNGkK4BvWNdVlk0UDXpHHY4MURdQG0qneHRMgOEcnijyDn
	NC6joFk6pVnac0un9znu6KPjKQrOAAIUgE2KTr2CPNRzEMbLWZKXBU4Y+iEmDuyNmcLSvqBkzV+
	niN+QRMdSb0SEAOOjS19Bp1YcJQq+CmGlwMKoy5vU3ldYAezPJ6gy89Br2LealAmV0TKmA==
X-Google-Smtp-Source: AGHT+IEDVTtMFy2hu992Zcq7801L2H6bIzfHs2qeo81vyzxGHZtPy+ypN/+AhlS2RlBfT5PUx2bs3Q==
X-Received: by 2002:a05:6000:21c4:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3b2001ac737mr1267473f8f.37.1751453852634;
        Wed, 02 Jul 2025 03:57:32 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm173817385e9.40.2025.07.02.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:57:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:57:22 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 09/14] dpll: zl3073x: Register DPLL devices
 and pins
Message-ID: <ne36b7ky5cg2g3juejcah7bnvsajihncmpzag3vpjnb3gabz2m@xtxhpfhvfmwl>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-10-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629191049.64398-10-ivecera@redhat.com>

Sun, Jun 29, 2025 at 09:10:44PM +0200, ivecera@redhat.com wrote:

[...]

>+/**
>+ * zl3073x_dpll_device_register - register DPLL device
>+ * @zldpll: pointer to zl3073x_dpll structure
>+ *
>+ * Registers given DPLL device into DPLL sub-system.
>+ *
>+ * Return: 0 on success, <0 on error
>+ */
>+static int
>+zl3073x_dpll_device_register(struct zl3073x_dpll *zldpll)
>+{
>+	struct zl3073x_dev *zldev = zldpll->dev;
>+	u8 dpll_mode_refsel;
>+	int rc;
>+
>+	/* Read DPLL mode and forcibly selected reference */
>+	rc = zl3073x_read_u8(zldev, ZL_REG_DPLL_MODE_REFSEL(zldpll->id),
>+			     &dpll_mode_refsel);
>+	if (rc)
>+		return rc;
>+
>+	/* Extract mode and selected input reference */
>+	zldpll->refsel_mode = FIELD_GET(ZL_DPLL_MODE_REFSEL_MODE,
>+					dpll_mode_refsel);

Who sets this?


>+	zldpll->forced_ref = FIELD_GET(ZL_DPLL_MODE_REFSEL_REF,
>+				       dpll_mode_refsel);
>+
>+	zldpll->dpll_dev = dpll_device_get(zldev->clock_id, zldpll->id,
>+					   THIS_MODULE);
>+	if (IS_ERR(zldpll->dpll_dev)) {
>+		rc = PTR_ERR(zldpll->dpll_dev);
>+		zldpll->dpll_dev = NULL;
>+
>+		return rc;
>+	}
>+
>+	rc = dpll_device_register(zldpll->dpll_dev,
>+				  zl3073x_prop_dpll_type_get(zldev, zldpll->id),
>+				  &zl3073x_dpll_device_ops, zldpll);
>+	if (rc) {
>+		dpll_device_put(zldpll->dpll_dev);
>+		zldpll->dpll_dev = NULL;
>+	}
>+
>+	return rc;
>+}

[...]
