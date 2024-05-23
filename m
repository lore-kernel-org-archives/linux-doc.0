Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB913CF85
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459819; cv=none; b=CUpc/nNBTJWFcHqwvieWzTWWGlabsDgR7kldkAZyUggOTpc0Gr6MCcPaXxVWrZLYi5sCKAy8BUfDQCAzWtv8g6R1BSb0fEVBRkLDVqe+qQRNPPbERF+ruSYS7D0oIcJvGwuovZtz8wJ6IDQvSxZDrmEkl4TSSIRJlc0IZ7CUi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459819; c=relaxed/simple;
	bh=2KipswG3SW06NUnJzETJvY0SfYT0V8GYDD2v8dOrjrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSkms3g19vodhHbOcfaeosEpiQFeAytTFeeb8RDKbtwJrNwB905md0YSQxAAt8b2KNcUnlOPlEMQ2xFnT8BIf+THlXvMtEqTjJNVskS5dAlBTs8AaWQ5k/kotS2fclJ/fIFkibdGFQY9JVkoeSiuOOs3tW5c0Jylm6nLGweZLPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jt+Tc59O; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jt+Tc59O"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52389c1308dso7576847e87.3
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459816; x=1717064616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=Jt+Tc59OJwYgtbkiKVOiZ8+cBGfM+bxufNx2SFQRzAqlPEpa/KrOHAPFPoWBujzEBX
         LHlUpgjlaTTKIRffH6Cwl7LPnfYY25ppvF9msna+rCMxhM4JdA1EVACLlJEgItGdZ863
         5+dAOBwI01s/K2xUK54T0kiy4BSD51ZrJ1l1oiIbblsigpFGtEi7kSdICyqShoePPSAk
         Z2AbmDTvpuan9KwYBCzvEJmID1nWUP3vKiXiFCLc//SU8XrF/OUm7dGY2zTw+e0i4atg
         vCI9yY59MHRxIPj7iodmITOpI8AM/Zbn1MABUR7qj/+1lTTl0ZPL2KfGf6pOp+elj745
         4nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459816; x=1717064616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKSB7IlQHbEtURtFb5gxRDwbVXbfNmYltNG39raj9z0=;
        b=fEC6oliRf5SmR9UpJPWSCL2exghOWKEHE4qgaSael/YMtk1nZKrXLRo9u4GYDDxFVB
         SH77TfqQYq8NkcsYr9AMhR+opXfWtohlxAQPJEbVs8yj3TwGjN0VBTBwdceAKXo8NoEg
         qnoamTn06jVP5qtd2p28FK0IGlHrD58Ry4Cqd+4q+J7bfJOcGlrS8ysHKKtdVB1i3EVl
         Z3wHeqWNbhAwfYTlz5Dp4d/HUUg2NRtiMunoHFa4J1ydH2e8RFSS8tYS0JSvdSQI8QI9
         aYN1HKflJlhe5AXXHPLOyxBxjrvP82oUEbEgvuHAvyW9ilHl80pyDN7tjHA9HoMxs/bO
         9+mA==
X-Forwarded-Encrypted: i=1; AJvYcCXLfaGgx4rClZnZQdZS9xxi8pLel3vF0xRvur6kBUNExjonetYcNLMUi6DUPPZNnEID9UyclB+5hqQhtkp6aymdKUBXuzL5L+MX
X-Gm-Message-State: AOJu0Yzi8sO85mel9x/4MS92vTLXv3pELh+7xiLjrt1RuYzxTjyPv0JT
	CtOnkq0CKtDQj3J09DyX32qnxmPazvD6btwvLCZysm5q/JBWx+OlwYWVM8mnass=
X-Google-Smtp-Source: AGHT+IEzxmh8z+32apu2/wM5J7agRdiD9NBJtehzlsORjUBmhCc0n9L3OJrcZNqTzzbLZrKSNAoRhg==
X-Received: by 2002:a05:6512:3b85:b0:528:996c:137c with SMTP id 2adb3069b0e04-528996c3830mr730488e87.63.1716459816721;
        Thu, 23 May 2024 03:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d899asm5271242e87.231.2024.05.23.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:23:35 -0700 (PDT)
Date: Thu, 23 May 2024 13:23:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v14 18/28] drm/tests: Add tests for Broadcast RGB property
Message-ID: <3pxdrdobtqbxedsstby2bfexuvzyqinzlxdp7d3gii6bbecp3y@zg6wl5lu4kgk>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-18-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:51PM +0200, Maxime Ripard wrote:
> This had a bunch of kunit tests to make sure our code to handle the
> Broadcast RGB property behaves properly.
> 
> This requires bringing a bit of infrastructure to create mock HDMI
> connectors, with custom EDIDs.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_connector_test.c         | 116 ++++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 151 +++++++++++++++++++++
>  2 files changed, 267 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
