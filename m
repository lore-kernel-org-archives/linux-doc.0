Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B658480;
	Wed, 25 Oct 2023 21:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKtiqcH6"
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222F8B9;
	Wed, 25 Oct 2023 14:44:53 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6b36e1fcea0so191714b3a.1;
        Wed, 25 Oct 2023 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698270292; x=1698875092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MafASQSV0b2ZlN9+ckzPdP7g0a8373h3IV546BZ1uro=;
        b=OKtiqcH6GF//s/fpe35pAt4V6UQ9D72PR1eCNk2nW3jrQnZXkWijn6Lz6LMQfvwjQq
         cD7djQ/Lm+X7iejI+SjcODl4v8MOaHvkAnemnYgMPyPK0Mveble+cSB14ZhkTcgje+kW
         NvrVbWaVoLDWk7pCH+KMbXqqGRf2z2KAcMX6WcI8hD65UH7H17b/3IPxO+/4r9u3E2TD
         cUAomHJyelXdKhqopl1qnV2kE/4zUmNPQZQ588GBd8HrBhv6J1rmq/KCnrxdW6K+mmvX
         DJfGi3aKG7J3lymAQ0ZWUm8S5VL9CYCbIv15vhl5gScORWwtprRgb1+Qospqh2jc02ND
         hI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270292; x=1698875092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MafASQSV0b2ZlN9+ckzPdP7g0a8373h3IV546BZ1uro=;
        b=UoFZR6DlaQTaXUuyfNtXxyULXkg8XeQgNvMCfstJaA1gk7u/LsnLGaKbUjifkiKl+v
         dtX4/XzmyfAK1Wl/t940uns/l0y4b2wtL+BkfUTYxfVamr1ydnk86nzEkohrtGYD8XvI
         WKau2+PN2QhcXbzwYAEanoYJ/NtXYHX7o0PjJTMZ8H2sB3a5WzyrWddlmuqdnhWk4Wmx
         UOtEgKIqCXU6cg7eIKUiwIQp4OhRu4zu9m7O9YFMDaAbSTlswnUYThg7eUW4DTL/Ugmv
         imLsKeKfcGI61lXja2RzIshTJayHKJCLsLy610Gj8rq9NEBEzyHOsEsd7QMJWqbz3sId
         6bmQ==
X-Gm-Message-State: AOJu0Yx/5sjaqESfJ/x/UdqmaW1+1X6ce7rz6lyhE6P1e1dhQpwjHxOH
	kl1vuxgWEkb1Xoatxtv4xC6YBkEzyJc=
X-Google-Smtp-Source: AGHT+IEtR4jNaDrFcSwlZjzbetBiNGa3LWgw0BHzX5JN9Dugo0Mbs3qGguJ5zN+e5+JzNutQ32PFvg==
X-Received: by 2002:a05:6a20:9384:b0:174:63a9:2aa with SMTP id x4-20020a056a20938400b0017463a902aamr7427646pzh.18.1698270292524;
        Wed, 25 Oct 2023 14:44:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q28-20020aa7961c000000b006bd6a0a4678sm9791259pfg.80.2023.10.25.14.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:44:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 Oct 2023 14:44:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Matyas <daniel.matyas@analog.com>
Cc: no To-header on input <;, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/7] dt-bindings: hwmon: Add possible new properties
 to max31827 bindings
Message-ID: <e816a91e-b38e-4a43-b8e2-f361485bff55@roeck-us.net>
References: <20230919093456.10592-1-daniel.matyas@analog.com>
 <20230919093456.10592-3-daniel.matyas@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919093456.10592-3-daniel.matyas@analog.com>

On Tue, Sep 19, 2023 at 12:34:51PM +0300, Daniel Matyas wrote:
> These modify the corresponding bits in the configuration register.
> 
> adi,comp-int is a hardware property, because it affects the behavior
> of the interrupt signal and whatever it is connected to.
> 
> adi,timeout-enable is a hardware property, because it affects i2c
> bus operation.
> 
> Signed-off-by: Daniel Matyas <daniel.matyas@analog.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
