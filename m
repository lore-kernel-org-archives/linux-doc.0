Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5017DB
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wc4WOIZC"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58d08497aa1so152287eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 17:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702602009; x=1703206809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trQkv00mtfGAqfYN2kxyaymJn3A93RCw6IDqXYBNgGw=;
        b=Wc4WOIZCFo6jTOFDnqrhGeKUCKyVlhkBMYlMZ+E/7DBUHpY7zXnt097/5w3mH1MZG5
         k4iUdqOCQ/q8O1/z56mStQTiCeyEcGaE/iXP6c6AtUbPKUDWRfhg3wVz8m5UCxL/Sd/C
         hJ6NhJ5iO2w6QiET0sL289GlC/diwxfGNtNbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702602009; x=1703206809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trQkv00mtfGAqfYN2kxyaymJn3A93RCw6IDqXYBNgGw=;
        b=cMVLPVvFiUSI5EZBswBOtXyhV9yuei3kBSQno9HHhTlRWr5H8Kp/Z0LC8eSKTKDbOr
         AIeNr40qRaa+3YiBp6k1ttSrYqyhRJ/X2zY0+pAQhi6kytdg8w6GSFQuRCa+faC1Ch+c
         bjO+BJe+T9C68Kl/ebSxa9ATN4+9M5sXnOi/zVxP6uD/rBwpcQcBuqQkZqGdhuDhgCPH
         Ai4whAhiAb5CGZ+OOP4nZVoWlgJ08IeSIl2/3zh4GVZ3H7dk/qTS1HGvh0Fxk+ZG/irN
         k7ojLSfyPMKogF/3fl7/M0bIZSeRC5FEWnTTKKcwIkrp08dY4k3VEVJ5wR9ckDhCzUAG
         tDwg==
X-Gm-Message-State: AOJu0YyQsszruxw/lnEZSm92nQeUOOrCFxM3scX3lGvKVfvFYcNQ4T4s
	VHQWUWHGfKSyZXql5D3y1pme8Lzwk//25T/G0bs=
X-Google-Smtp-Source: AGHT+IH1iYwOvtkU1tCwxzK2MoeKckHqrYHL/1xyI36wn6QKPTJ8lEz/wgjo+Db3jReJOhtWvRhY+Q==
X-Received: by 2002:a05:6358:6f14:b0:170:5b7c:26ac with SMTP id r20-20020a0563586f1400b001705b7c26acmr15172894rwn.59.1702602009087;
        Thu, 14 Dec 2023 17:00:09 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id pb7-20020a17090b3c0700b0028aea6c24bcsm2537pjb.53.2023.12.14.17.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 17:00:08 -0800 (PST)
Date: Thu, 14 Dec 2023 17:00:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] scripts: kernel-doc: Disambiguate origin of warnings
Message-ID: <202312141659.56017364EA@keescook>
References: <20231215001535.work.434-kees@kernel.org>
 <6d8d2001-ea9e-4e3d-9e6d-8192064556a5@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d8d2001-ea9e-4e3d-9e6d-8192064556a5@infradead.org>

On Thu, Dec 14, 2023 at 04:19:34PM -0800, Randy Dunlap wrote:
> 
> 
> On 12/14/23 16:15, Kees Cook wrote:
> > There's no prefix to warnings and errors reported by scripts/kernel-doc
> > which makes it frustrating to isolate errors reported from CI systems.
> > Add a "$0: " prefix to all the STDERR output.
> > 
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Matthew's reply to my patch with similar functionality, which I agree with:
> 
> https://lore.kernel.org/linux-doc/ZQke26HX9Am3k2sh@casper.infradead.org/

I guess that's true, but it's really confusing to figure out if it's
kernel-doc or Sphinx reporting errors. Ah well! I can live without it.

-Kees

-- 
Kees Cook
