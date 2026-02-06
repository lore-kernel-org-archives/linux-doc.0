Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5130935EDB8
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370595; cv=none; b=Bdjz2bpIh7RVuYRSvKUVwNqeJtK1qsksvqYSlX3avB9EuWCjQSUXTZfTXLbzosnmVlgFXOXuNeAuBwASg1gg+crwagNn22XHqfg8O2uDE5MCsBfFTffT/Igtwfh5on4jnHsPSbdpYlAppzI6U0uJ92zkdIShDZFBOw/lyhIgkc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370595; c=relaxed/simple;
	bh=Lv8uI95dliFeoBdCejcOMOusz6kZTyerXTknQcwPhW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8PmBdlncMPGvx8dtG9x/ICWgGRPCIA99VkyeI7N+2ptajDeu/K2VXjxOjXbDohErm7BvzoewoxgZ5hSoBilgus2J+x4jdfywLL/31ScTpjhHS4s1Pvld7oUrpAh6Z5tRUAxHnp+uGFJssHAQmqUX682muPttvkZyIbHhEngLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=zVTY/2R5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="zVTY/2R5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso16358075e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370594; x=1770975394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pF603AUQdiALGLuf8FGVmdwSpRghR2h7LwnvgLtFhUE=;
        b=zVTY/2R5AWD/9OiCCPIkxL/zp7SyokQsb3PgBTPTL2nJLbxeNJTyAYtMaAKiMr9XHl
         1MsawKAON4NOvrcAAKX27jySAT3eYHoXj1rh8Z+naXele+Ukxa3e48gqt+VFJDdbV2gl
         D+MEEPw6yDZ82N7IOvbnlhsHUram6127pRDfoY/cWN6OP+LfW4XBKJvCgXptTNRsD7F1
         p5KxChnzmVuHAtzHXtUq/+oSlE4mdhwj+mZobui2lJ59AggOXLIL5eiZtU1ruGxYZdOA
         +DnxcbrRkwSIQNlf6sxJzv6TXC13VLUfg0gygzAxBbippCOinkjb3hbAU1giZVR4VPEO
         JVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370594; x=1770975394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF603AUQdiALGLuf8FGVmdwSpRghR2h7LwnvgLtFhUE=;
        b=NmfZNfuSkO8afBIG13xLdiVwuwT87RXOMZnM3B65a3yPhBB19pJLJLkxPYv8sPgH8D
         rUVg+yefpWZIKjzirbe2hb0YvWPr4Ho1BpOh17uMdsP2aAy28hXXn/SWqH2b8qb9KU3d
         HEMnmmRON9bxkTkqfklSKnA9OjSXZ4fHmkhaHXWA+gLgX8aU4DOWkkiYeIgwn+wPC6Qc
         +r6OL67rzpa58sXdqaS+ii92fPwo+05MATIkD1WFxAmJNxh/BSARkW0+spKCYqBJXbFW
         aGuGLO41/Ma2cF7QRU2FJufSbqOmXrzCIMIZkZjT1M+I34jBpim3FX8BrFFGfXiesDvk
         oYhw==
X-Forwarded-Encrypted: i=1; AJvYcCVWD29m1NyskV7UOyRv7AaXM9ooQfxoFtHcBV6RphECr+YzaGd5jLgcH89I53ZYZtAxVVAOryxj8yE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG31np9jCHL6OlTbmFaxbp37ySzh2jWcEUFVbLGruakOr6Nu74
	ORcmbBPT5jfxWpHRpaDlMhpvl5pzelmGepom4JjfcrVzFVvWwGJ58Uzbrf9QbSGZbO0=
X-Gm-Gg: AZuq6aKTrrhKBiy9Nev8XukwFfML5PRTwu/T3Eoie5g/JGe0nqlpdIns9QCNMUacicP
	LGC04tRWKuCQ4eufTwmw5jwVxFi9eVdTAfadQFUGcpikgRSZOC9nk/jwjMDUK9tvZssckMPPCRg
	VB5HVxiUn3mCFuKmp5PhcAwL84VCAyanqW/AZJQ5cLBmC6uOUlOr7ZHG/tRX+sdGbEwq3DEinLl
	QUqxmtl55AYVkAz7UmoT71ZcwccPwDQ+jb8QIGCLq0pITD3HnqDLxAa5wA1+toWHcravGSXrslI
	ZbHSkkgDuG/j+aEBpeUeu1iIdCTA4vVvNz/RJHq3L3V0b5xgo+KBhpsOHmwABeEzVHzDnp/fF5c
	9RK/XFIeHd65yECJ8ZcG9THxdPqSEl7bl/YQlwO8xxWXRXTFD/u6h5Et4tibWj8spdGkZ8L30kD
	S4aWgCJ+xBEVZL86Og5f7QDx3SlIHSYg==
X-Received: by 2002:a05:600c:4449:b0:480:32da:f33e with SMTP id 5b1f17b1804b1-48320216075mr34903245e9.17.1770370593702;
        Fri, 06 Feb 2026 01:36:33 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm147111195e9.0.2026.02.06.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:36:33 -0800 (PST)
Date: Fri, 6 Feb 2026 10:36:31 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 4/7] net/mlx5: Register SF resource on PF
 port representor
Message-ID: <kmoeavzguajvf67sjwxkh4x5ogbus3cigeatrstagbfcyqyka6@w5ufzb5brkst>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-5-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-5-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:30PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>The device-level "resource show" displays max_local_SFs and
>max_external_SFs without indicating which port each resource belongs
>to. Users cannot determine the controller number and pfnum associated
>with each SF pool.
>
>Register max_SFs resource on the Host PF representor port to expose
>per-port SF limits. Users can correlate the port resource with the
>controller number and pfnum shown in 'devlink port show'.
>
>Future patches will introduce an ECPF that manages multiple PFs,
>where each PF has its own SF pool.
>
>Example usage:
>
>  $ devlink port resource show
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>  pci/0000:03:00.1/262144:
>    name max_SFs size 20 unit entry
>
>  $ devlink port resource show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>
>  $ devlink port show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608: type eth netdev pf0hpf flavour pcipf
>    controller 1 pfnum 0 external true splittable false
>    function:
>      hw_addr b8:3f:d2:e1:8f:dc roce enable max_io_eqs 120
>
>We can create up to 20 SFs over devlink port pci/0000:03:00.0/196608,
>with pfnum 0 and controller 1.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
