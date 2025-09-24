Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD71145B3F
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742292; cv=none; b=lSlx+bMU4K0wzNw9fN6h0KDeQLpTvq3KqCncZ7qxtoL7B2Lq6PLc/yruv7pGATc6xBOaAybT9GfzVD9HNKIwQ1yfXudZo/T+ZcFeo6t8/tPA4+X9Nl6Biv9+WgHEiqMRqq7qL9lH9YXYbS1oudHH4NmmEAzSq6Jia0qXpKfYiiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742292; c=relaxed/simple;
	bh=USTPbmjc7larzUfmJLTr1dEREs8PNqu/Af6hD/JnsLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN6PAD+kb2ebjdvcFNIdq+K7FUItrSVNO26CU4/3Se9uhMZ1PsBqYNjmEBKNdRfgn3psqLF1cGcey0HxbxpICsORIhHl2Ztb382kTnrxzG0Xdv+E+9Z4G06IsTZ6tKRetfG8ody7zbK7GWy3DSERpyErnKpi1zxfmU9PmspjvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2PxfX+n; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2PxfX+n"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-330b4739538so184258a91.3
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742291; x=1759347091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=A2PxfX+nk0WkmX1JYbDnYTaWpZAm0+isLhmyD2bi9ChvnRuAfG06O7uI9ewKwmJbup
         CGwlOuKFnX2dMYU/TAj67X1tLzIZ6GXwDVEXwzBO2lYRV6hWtCnz1piOKoUzRSGgmZ9T
         m45TQE4R9OtXvy2X04po5uwRnaNKFLiIutFI6Z/cIpz8Te5AQL5q0jsgtKxCQuAlaEgd
         v5lqkGeFFZmhX+gOEM+cjTfgXq61BwFg/+vXTOqn5NIWF1k+k766b7A+0/RmirV9PJbC
         m4ClbXjvjtV77RJbYkisp0Pxyu2YDktj1ahgzcRIm1hXroUg7FP9s071xJgtAVtss/lB
         x1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742291; x=1759347091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=wztJWDUbS4FuMP+KKxna7vtR8KqP2YPkyf/5WHU/QIAPBIBiC1bbGJb0gkwEHiuhL2
         okXr2x0iwQ+NMkuoPaxTAMpCkPz/z65IZzeADY4cR+buN8xz7YltIBAG+s/07/VSuTJf
         xmg/JSTL2GlIxkRQEtKMi390DPscnUYz5QI1NQXKDLs/0vVoCqVIrFO51lb1ys5cLaYq
         Ee9ZX9QUOyWsGVlfHPZ9VrYxfl5Q012irlU2W8n1rd2ZBb7NsbE/mRSBPNugfK7z5dqy
         NLioRuODUFbwwR6YKPqo+Bfz34iI8UG07eDgtUCe5li0R/CylopPm3Kr5uKuASKQh0Hp
         hU1w==
X-Forwarded-Encrypted: i=1; AJvYcCUKtoRvU6O/wNRjnr7wH+fiV9Qttd4PWjI99/7M7M8ZGTeI5ffpjdEaOkmEzG8y4nbJ5Zt44f35MMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgV/rIOPdcUWORH03MCCbgU8EPZUusAOths+1TOhGBB3MbZpG
	OaHlln9cfAoGOTqAbnEFauzlq74MiIZrUaler/V/IG+CLfvwZ1zEhHjv
X-Gm-Gg: ASbGnctNJ30vIL2FOQS5cDp4hBI1cg58NRmZm3IUnvPwB5Q51KHBqDIStLcb4Ewz3nw
	51VzTgQ8ZiFaIn1IIcu/3BSefOrG16NhootKWJmpfrDNthjzeYaOowfurpmBUcoU89OhXljUimr
	m6dDhmFT+VTZLG4XMNNuqzyNRXcKd06hu8Z1BVfpYtx1dHoL3JFgZm/ltF+nfp857ivJyUUjcCi
	H+qqrky0rGu1it9vdZOtY6MS7wVZh4QE+4PwiTqf7xTa3j9iMNvsLodKODNb/XWOeuHZWMZpEwJ
	w3AA2ZQRWFDzyza7I/s9dImzvI+Nepv/SVFrGjNaQNAvzWt+apIrxyO8d+j4+oBIw1Oy7oVkwcy
	GZJmmouoiXVZJjylnHKtiGATTCDZVfX2cZ9A=
X-Google-Smtp-Source: AGHT+IGf79Ctst2lzMknAqjXUhWGTlNDl/Rp/nJBOnuaOSO/Vxp7PZh8N9WTKkOOb7wF5fRUDXamvA==
X-Received: by 2002:a17:90b:4acc:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-3342a22bf2emr746435a91.7.1758742290588;
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdd63c1sm3208982a91.26.2025.09.24.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <c2dc1970-386f-4e4f-b1cd-ca849d002aa6@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:36AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter
