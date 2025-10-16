Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B812580FF
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647677; cv=none; b=OlcNqymizSKEBYEyBcruc4cWn8eqc294FEpewQKXhJC8GYaRgOL9tSB/4F8J1BP/kXcVj3MLiJr3ybc+afIZsCTiITwr/M+DZaGjtvtT9syasXB13aVXGEwItOHnEJFRe+k1HnrkOrrvBkFovUghxTjIIa49OjE8xy2lbWRu7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647677; c=relaxed/simple;
	bh=ndgdnL4NvZXc2YXbgp6JkfbQHOsj4MuJcCkc5VpFe/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy2YXW9r6DtRjO7YZeGXxD+/AnVhK/RbdorqqoBISaxQ3gM/6M2BOLRlWwf7BWkM01hUIP8fDTb1Tp+egnPShjwJuP5DjmQrayXOc3GIkyLhalBd3QUqAmUDGQSc68OnpW6VWhJX+6426qZIWZtL1b8f5UylNzEQ8GYidt0wyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAsYphbZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAsYphbZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so1211342a91.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647675; x=1761252475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=UAsYphbZ4MRTWb6nOF2oYdTwBM7kMjqt3H5KRekV1snBYxE/SwbQfN7wge5KyO/PY8
         83gMgfYuD5ePzwm5dnfRiOovj2f2xMJvBK/nVrcXkk1I9HPIZKOhy4XgxDRYedCwaqSY
         Qt3W+raQA6SFeD8aFEDciCGljFlf9QrF+yuRtUeH8CH3qHO/72boG3SGgxrsPywOz+VB
         tqZ2p9vNZd5epbHdlQJa9zg7dlOtszigehn3JHyezeBbljes4hCBUUZ7C/V6gt6yOCN3
         c90pGCgVX1V+XpQy5s0rVkPoKp+lj1FaBxwjqeblBwmC+mtMPQokFNb3wcWc/26D+N56
         +0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647675; x=1761252475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=SsDbQAEG8zjaovgYzg6eBq/b0xaIHcfqE+okLTXvSavR/tQ9iwayzfvkSdT7sGH3l8
         NeiHxgwLOxPXQapCg09CH2WG+0a2q/2DNzWTV1xIWzx7Q9DVb5j91uWj1wUUZg8spNYe
         G7fotQJAuAAijo9YMZ71Gv4840eKRfQnPpI0BaBMWqnWjI4z5qrn+W8lUnl7NyfKJTwm
         2w/wlutMCmj7lNkN2M3XI4GNbsof9jwbfeZW1JGvH0p48eNsUu7l1WNFs2a37pa2N24W
         NvLqzp8n0v/hLHgLTU4jeX1NuFCUvsWbKSBX6UwF22i3SB7ndlKqqI8RYUtoLNuTuxTN
         4hGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpUHZl2I2Om0DUiZEl6ZiYJzb5+NrWxWvSFcj6cO0E9Ue77IFUf7PkUPHIaFBrL03XG3KMlRzWQt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxKNBsBo/fJjQ0x+Mt2jr3U7gh6x+hRBNQCih6fwmMNaMdntPM
	A0cLmvvt3xGAU6X9BJCmn29UiOpdSZu/EImMBNCDOQzuWEPWPmDrFvtp+P9FQg==
X-Gm-Gg: ASbGncslD9KvIrOhMQ94pQethzWmLIst8o1xAO9EhoCvgyz+MWrGGGPmQQvDNs5VmNx
	IjTKtChI13JwABu3cyVdh7ZJnZbJJPbhM0hgX6aG1KI+CRBdhtskngZJoSCrypTJZULsOABXjxa
	JBfk0dv9Exwdy71SfHLz/gh8u35LZXUwYe6HfAgEpdUnrUerV0ihWbxgs1O6gMGSH3rzxQYous8
	ZbgGzvD6zL5tEFcQiiRu++Yfl5pmiOsRWlUhKuiu0rJD4s98qG1M4x3MjNW6oZ8wRBN1pEWO5FQ
	a7OWuadhVAadZKVP3iWGQ5GmEDsvHgOG7aBMBWxONriLU8dc/I5i15+dEXvvNGX9HtgmvUehjrs
	yysQ6QkgudXS+DuzMtng2gcryhzns8MMTOfSQEJmbgyQ1fSuZxHxulTbOOXYH3Z5uyuCQr9qPrN
	8hoQq3ub9yiLJO
X-Google-Smtp-Source: AGHT+IH4G3cPfsZSOD6swv+Nr/r1bSZCKg8w/Ox7KOwwd15eIqRctEk/RfdSNTo8Nh6NWlqwEHC1PQ==
X-Received: by 2002:a17:90b:4b0f:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33bcf8faac8mr1245917a91.28.1760647675393;
        Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bb5b8fsm3746596a12.37.2025.10.16.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:47:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:47:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs/hwmon: Fix broken links warnings in lm90.rst
Message-ID: <dff61b90-31fc-4c96-9bc7-0f8aa8404689@roeck-us.net>
References: <20251016103049.2573-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016103049.2573-1-spyjetfayed@gmail.com>

On Thu, Oct 16, 2025 at 04:00:47PM +0530, Ankan Biswas wrote:
> This patch fixes warnings in Documentation/hwmon/lm90.rst reported when
> running 'make linkcheckdocs'.
> 
> On 2011-09-23 National Semiconductors became part of Texas Instruments
> and national.com is no longer accessible. The datasheet resources for
> the chips are now available at Texas Instruments website and have been
> updated for lm90.
> 
> In 2021, Maxim Integrated was acquired by Analog Devices and maxim-ic.com
> redirects to analog.com. The chip datasheets are now available at
> Analog Devices and have been updated accordingly.
> 
> Some additional broken or unavailable links have been replaced with
> equivalents hosted by DigiKey.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
