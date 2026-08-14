Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32733495033
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731638; cv=none; b=OPbPlgcJOKJE7sP4jTguhfP+73QFSih8VSDjoyW/t7qQUe7yTwaPJwoeVMn9/0WxKt/IRgYRVGPlsViGfkwz54g4pswmJTgGPeWdKayWaY/Zr6RK3hcZlV1IG0z+TXpCQQxmFc64YV3HRvAhgMuO9ZVZWPdmdds88bWUJK2K374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731638; c=relaxed/simple;
	bh=kuqNhqWbIiQdR4l+57aL+uGLhVvHIY32NCV9DcATX/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSg9+wYundf37duwTfpjjDnzI/hlHfy9WB6dTRbOEns5fr2d8b1qEDFkQ3Q9VAtAz74NRfAurUsdcyRJ0kuYW6smg6jtLIHv4e7wM8zvjN7JERsfPgG8TxNwVCsgT7j+0If4zdcICAsoV7sWACd5+ZV6pYdBKl0etvvcBVhtFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+T+ulzf; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+T+ulzf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1010407a12.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 11:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731636; x=1787336436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d37aJOtG5AvFszJFKSyu9o54r64uWVb+xegUaUEkkBQ=;
        b=h+T+ulzfFK0MnsrW7pIE/kxUHGzrLXlgY4RjKalrXZWNIalZ0shHYJyQTjIJ4JWUkI
         zVd+6+lOVeMgvXcqRRb8JzxOCL5gnLGqFpOcIPvWEWSSYdf+xCG9f7gkMCFBqbDVLtt9
         rAs20ZPs5wFygO259o6V14fFISfkwNuZNXKlwD+5WaS/hgrdzolfEzTNjZ7SQhehrT/0
         Fwz+RQLSpFbwhE1E2vTVXOnGCt3SdmwlRuFigSaAACJd+HSbjtCXzraVHbFKwhE4hNub
         fgD8RTSH4rugEimjYUiPCir7dMRGrfYg9YR8XA4A1LxIPoh6I77r7bC2NKD61GdXCSTk
         dpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731636; x=1787336436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d37aJOtG5AvFszJFKSyu9o54r64uWVb+xegUaUEkkBQ=;
        b=MrsiXPo5fcefT6mPxU/65eZXZvTJyHau2a1BOZkZcz8Ffe1OWbLZeLRICnvvE6Pg1W
         RREEo5ciziYB1JVA/eTDjIhBvnqsMHvvWs4h5om10MJLnBFrn1P5v1yXLRnlcMjnqQKV
         JBteIhWRIf9NeuHegFjeqC7SwBJvtsp8mZUY9dVwyr2QzEX5O2xB/vGj0H4QyQbFyee0
         D6m5LbNMNcxVoVtRILF1ug2Ob5M9j8tPHhC2jyO/kgMLNkfx6RSYMydQnsSvEeoEgsIG
         WU4CILA++k5Vdg1+iEz+VNCN9Vd3vETicMt/mg16h0MiHMThjqGGF+CGSnTkHsA3DoeC
         KUbg==
X-Forwarded-Encrypted: i=1; AHgh+RpQuXag8/lgi0d6h6/VMUGtQzw8u0uLWRz0p2PJOkbnjtu0lUQ4L8v6C1ZGdqdQEuhrY0n8Kk72bjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVM0rrd/XpAsLQNE+IFNXZ9lU+xMBOTQJhKRXsKpXSkapWUnBE
	yyJFoEiSifX9O4yVQrXpgkE0EDt0A6CNwD4CcaI9Ckj8dZo2npClxcRM
X-Gm-Gg: AR+sD11PD+4encf1PHBu6lh4kskiZSi+VBLTfRZSJpe/axLQxdhuKsLXVmvf4j/Rkf5
	9bRTfj3eWF2fd+Y0/uhx+lLzeqoQYibZbDHoMK96jK2aRyv5itLZUVwCIp/vNxZAey6Py12yNBQ
	beM27RRNpLwvENz8TH9P6G+CBt5eMXGLBlDtmJkmm26pWlBsZeOmWvrQrTyFoECm4L/MhdjS66K
	oQM0i7N6DSt9iJ7xHzjuOfxufF0n2Ki0S1KEsqqGZt9DxiQZp3IoqQpH3NJ8rv3oyL9p4/DP6RN
	5GKnyFZMszJOinHozHCsBK4r7SJy7OH1RBN6DafnYyYnN5TFfbZ7FpRR1GhuV3UYhs1dPBM7Lyv
	TzS/Szeh7pR2sqkf6JU/4jq/PFFIcWxtt04Xq4BjgN2Iqai1AqEcazsza6kDwawz+ZsBDBMAKHp
	a2ANYOcl6XUs9qIoJZmy7lxcvLPu50KlYLBASqHY+gI5PkBPlBQWt6MxLOSwM5isjI0VA69lQgZ
	Q==
X-Received: by 2002:a05:6a20:3d1a:b0:3c3:875d:c52f with SMTP id adf61e73a8af0-3cc71b65952mr9149175637.10.1786731636363;
        Fri, 14 Aug 2026 11:20:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d60eb8eesm6916587eec.10.2026.08.14.11.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 11:20:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 14 Aug 2026 11:20:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] hwmon: (asus_rog_ryujin) Add per-device
 configuration
Message-ID: <55c7e267-b5c9-442e-9127-a4195619e03e@roeck-us.net>
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-2-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812103532.395049-2-renari@arimil.com>

On Wed, Aug 12, 2026 at 06:35:30AM -0400, Arie Miller wrote:
> Move model-specific report offsets and capabilities into a device
> information structure. This prepares the driver for coolers which use
> a different report layout or do not include the external fan
> controller, while preserving the existing Ryujin II 360 behavior.
> 
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.
> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter
