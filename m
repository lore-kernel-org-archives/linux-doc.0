Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75478F59
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877126; cv=none; b=PwYm9tqoD3aRxgizGxdQq0TT+zKdjj75/TJx0cKOfTP4piwsk8bKIHmvZEFFyLxoeip6YoqCqVyN+WgqJ3O7+Ist6dwZ4ZGXsA4i+yt/9fo86tjh/lpxoUZbaLQSnGoZEfSdy7VDa3mAo1LUaRKMJl/t6fWZnrhSZRPortC5yqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877126; c=relaxed/simple;
	bh=EokrUka+8q9BFBcMOPMx0zXPzrf3e9HtqUOEMOxQYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alIST9ymfkxGyJhKhazLyFrDAi93Wwr7iGEWXrODJ/Fw4cbbaRRoBaQfPipcdnYrVBxLhXqAIYk+/dHqRpfvEvUOaMHKN8UomcDAOmw1JopsJnUN+vn06j/Evsf9OYpZAzHrTK3EnThwOx9QuFbHW0o9ahpWJrlizFKVhPcGaMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=PO6ViXcm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="PO6ViXcm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453749aef9eso8733555e9.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 01:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751877123; x=1752481923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jk0DSP+snP0yxTTILdaG1XmNWZzWY5PtYg8JXeBa+lA=;
        b=PO6ViXcmYP6ZlnXVKyLR/Oh6oKcVwhg9FBYCZvZZUr+FtiLlsUSY/Dz5S2Jls4Fzu4
         uvUsi2yT2DnVXrpFjlWbSGT3LHGL6TvV1AWqpNZiphD6QQapD0V5xwyE8BdotU4rW+Al
         d8fqljugqv1xT66OULBbTFDdyDwMtbgngaZIY45bGo8fhMQQXd9g9Wkl1BZc7AcZvBVB
         FUgwmzA6otoIaBwFwj7lSFuHR4zwFG96aPL+VzG51ifR9E99LXpIHxEV/4r1ConSQCP1
         Em/SOcXVh6mZPxgbUDm6MYZERJqp0W5FEb5vDuEAgQRVlAf9qryCq5mA3BAg1Xq4XyXu
         EhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877123; x=1752481923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk0DSP+snP0yxTTILdaG1XmNWZzWY5PtYg8JXeBa+lA=;
        b=Msdi/4XEMR+VNFXTJ2vayG6SWs5fCtmwtmvC49YVHsXXfZQbxOWjqgY+i60oh+QiLd
         gr9YE37n6tGlEph+unNerLFbT9+Ykx5eNKr/o7GBQhhl3kOiedf1j3yRzXLisy+XX5xC
         baWPVysxSwiw+XZqkykD70+NGNK5/7WWuhlqmlJ9UOJXih6Ele/ZZgZ/1aKCWVoAMdjs
         VuCHILioE7oQIrw2rxKZz4ItUC5tcuI9+KsmmhQk8sTZko4mslQ82w+6+uxdW/HduR5U
         d3+012lK1Vhsen1kP6usrF1+9yQRTcSE2SIXJdFiPr1zxxE6Gq5OzyAxERWqive05jaL
         6YGg==
X-Forwarded-Encrypted: i=1; AJvYcCUm6gOzUCpQR2zelVvV8GzxvaxYOg9LTqlVt34ePZxBwV9Q+nCrD+6ELhObqkhgfPONjXys/fiIAvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YycqqidxMUhgaSvPGQ0m9ci3VwC6zDFOYZ0kh0aDJbFwONAoLP3
	NBgXtdhDd4Z6oVyYUbT02WdYykOjhgqW5lYmuo1JsFjEWUmZ7TIdTfMLdWxN375/6fU=
X-Gm-Gg: ASbGnctTZF+CbW6rmovd365O9beY90C3WDxlL0/KrXv1xcDf7vmEEN2a2eAgh/pL4vZ
	AjPOWVlUU/DsTGKMQzDbPPWuuWvCex1yAovweyxy6VTOchWpbSXijRcaxoPHZG2l1Fu1oad6hXw
	jcu/Hq3QMHkFGFp71Y/OEGKOkkE8j1euCDrxcYRHOjJ3j7kw3h8Xyd1pe2tsEBCO3oS8K8rRmMc
	dL9Yu8xjytFNL1li3HR0aTANSkbNx1qvCdwZmv3Dw6V8DwVpFuyDwrRBWBkEHupC24tbIH91rFN
	CAio7E8UGlPPRfwCbeQ8i4J5puqaQ+nwAGXYsz8OiennsYpDZzQRzA+uspkQGys=
X-Google-Smtp-Source: AGHT+IHColHEC/SleUA2FaGBvscXm99Qomr8ucT1fEnsASZPSUvkTO+j3OPSIwgqWNk5VgdiiF29Ag==
X-Received: by 2002:a05:600c:3b1a:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-454bf4092c3mr47838765e9.8.1751877123334;
        Mon, 07 Jul 2025 01:32:03 -0700 (PDT)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm94590505e9.1.2025.07.07.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:32:02 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:32:00 +0200
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
Subject: Re: [PATCH net-next v13 12/12] dpll: zl3073x: Add support to get/set
 frequency on pins
Message-ID: <idzmiaubwlnkzds2jbminyr46vuqo37nz5twj7f2yytn4aqoff@r34cm3qpd5mj>
References: <20250704182202.1641943-1-ivecera@redhat.com>
 <20250704182202.1641943-13-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704182202.1641943-13-ivecera@redhat.com>

Fri, Jul 04, 2025 at 08:22:02PM +0200, ivecera@redhat.com wrote:

[...]

>+static int
>+zl3073x_dpll_input_pin_frequency_set(const struct dpll_pin *dpll_pin,
>+				     void *pin_priv,
>+				     const struct dpll_device *dpll,
>+				     void *dpll_priv, u64 frequency,
>+				     struct netlink_ext_ack *extack)

Unrelated to this patch, but ny idea why we don't implement
"FREQUENCY_CAN_CHANGE" capability. I think we are missing it.

