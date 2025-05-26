Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190F1EF391
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252184; cv=none; b=of+Bf024nfYz6DXna7C3Qxv+FCkcnDknKEtEenMdkpe6SCw8fD8WuNTOgO/cAtiKOVZvLc2eUULewyH7ufJFqoX/f9K4L81zZ1/rY0lWsZoDNhUNdQ/oUDM0BCl8VEIzPBIbKSkx6VSB8uCSduJYdJoSFBpdtJWagC57leY2ZLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252184; c=relaxed/simple;
	bh=DDVEnB3+og+dd3LXUpJ1xgMQIwKxMfEZf9aH+Vn41gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi9I2C0jZnzOq88mRr+DmerOkePUzsz7fFU5vtkmP0ldEyplo6noIaog0LdCJ1iy6nGuFJANalGfpwy4xh8F0WJmTUhwSCp3aiaStdxTmyXSyHbECN78CJ6bx81VWaaiEsfYj8DIY1q30vewUPaT+13dlUyJt2PJ+t3tp8LmS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ktyoC3kQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ktyoC3kQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441c99459e9so12067735e9.3
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252181; x=1748856981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akRWiY61vXSqwjUp4+3SAOB/I392KNgK//SHiZbby44=;
        b=ktyoC3kQWDeC4wmZtpiAiPbUUznI8gVoS5yaZtVWmxcjjybi2HGt/IET2iHT3OfMnc
         dk75LavzAY8CxymTk54EL3XxQi7FPtaJRy3dOWf5o66Gp7YSvQJ6RQCXHRIyL/pLJm2J
         J8zHvdm34c+OYYvDVph6uOpUM7MEr32ytc8IphKVM1HRQLeWqUY35RrUSj1YtpP9fkE6
         +JDPEDyLEWcgt7wzyTJTHaAdfLDOKe7nZTc2EImMtaL+qO1bfytymfg51IuCK0+1/fgD
         b2NcujBb/J5Zq0/+gT+VbA2rZXVs9VH5CcHTN86RdNVIRGFxIuljOnAxiDV1UbWwg5fD
         pp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252181; x=1748856981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akRWiY61vXSqwjUp4+3SAOB/I392KNgK//SHiZbby44=;
        b=P3kr6x0fjE21MIZtfvae6wjN7i2Ba/6TdzgE+k1GKl8oVejJUn7fcOqdYdNdN7tgl+
         bHkoLkfcvXWRrb4Ot4dOFgAzNm5VFX4QZpOWn1I20ojWrl3zP8ld+mXNF5kXMoUknE7H
         dO7kO5Vb4UZY5UFn+B6+sbWKDq5LHGnf9ivwzKpxg4uJQskG1kiYIK84An+qconV1Q4I
         TQE9CIMIBX6xdyVUHsQWnyLXAybAZrP9khhnuHux6geF4fxfm+neINHDF1VF5k+4ERre
         L/YPDtoUmpFF1RWUbQPGwWcZOMc8r6i5LlZWJVCFrCBXKmiX9cs9K9MSSwEUcBdygmGi
         2PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkxn5qCNAH9Ivy4fWplXPe2LDupztP67g3/zOR8nIyVX/mHMURWZq51rtfTGyldQyJIZHYzBZ4Hr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qXUKfZIQOh9sDCS/+3gA/NXmIY8aUrx78OQymqSQbwavwszb
	SgsTbfzMekxLkUaNf/EjCrpTB99BL9PXIIwh/LR3RGhde0DqbRAXeQ6AC6WTUSwrStk=
X-Gm-Gg: ASbGnct9JFmGbGeSDcAxTw2Ac46XhoLpUZHDKTZ8xQk+AOJsDWw8aeywMYD3PrQM6b4
	9yzSpgkT73a8XQvIYHvf+pZtqZqJATB3rc0AHOFd19KEthBnyZdqSGY503dN8I5aJQRJLRBntli
	b/gRSguVJt9VVZdg77AoG3sGOvTbg1Wja2IyboEvT696SWBXuSZmvsVoFR9xJ4XlHlmIizKQJ5U
	drIgYFt0IZIHczAvrftIdQUECNUVak2w55nvp7JzAJrSzF1TzY19CtLxxtb01clJzMLvZLroolX
	uzuTkxPpoyvvq5Y2KXagI4OxvSVrYpPyK3tmfGGkg+uvIm7oKeDq2PHtbj0liJizyxELJ8m/5/R
	zxhRbeQC/4v1qyw==
X-Google-Smtp-Source: AGHT+IHdDy9HaiyBHAWl1b2RTOZvmcqUOl/x5XI+mJD2ZIuIvNRG2stc5RkHbBIlxB8zAvuJ5iXn8Q==
X-Received: by 2002:a5d:584b:0:b0:3a3:6a1b:6885 with SMTP id ffacd0b85a97d-3a4cb486043mr6616468f8f.47.1748252180662;
        Mon, 26 May 2025 02:36:20 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4babec83csm13835277f8f.80.2025.05.26.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:36:20 -0700 (PDT)
Date: Mon, 26 May 2025 11:36:18 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, milena.olech@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] dpll: add phase_offset_monitor_get/set
 callback ops
Message-ID: <3unqj7hiplrlcaaq56hf24d6vohi6rsxu6b5g75s6aypjwqgwk@hpewzyd77dhq>
References: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
 <20250523154224.1510987-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523154224.1510987-3-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 05:42:23PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add new callback operations for a dpll device:
>- phase_offset_monitor_get(..) - to obtain current state of phase offset
>  monitor feature from dpll device,
>- phase_offset_monitor_set(..) - to allow feature configuration.
>
>Obtain the feature state value using the get callback and provide it to
>the user if the device driver implements callbacks.
>
>Execute the set callback upon user requests.
>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
