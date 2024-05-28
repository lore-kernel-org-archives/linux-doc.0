Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C562900
	for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858057; cv=none; b=BEiLhalul/lxKOGiyzuvXjXdQJ9PyAHrmMshgpRiiCiG9uhMcrT3uzhJkSlyubcBonPpfDSj5AmPdu6oRCAq7lEelq7sZ8ssbqZF5qfyEER0O0v4hmhEySo/yqXyV8OiPgNHy9iYBua23iVEbEaYiXvLWmQc0pa5EEBrOGZSaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858057; c=relaxed/simple;
	bh=6RdCALqZATAaluv2o0adt2Iu/oX3BJUs4MRNlUA/VzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWeKX5BAYm32veZoeSFcLvToVZk11GhIoo9RmP8rAa6wQWPGbAcWUArr1h5vEChzM7j/hfP9QGxmiJcnuyyGuGlQ2gGNcrcLnPUhuUr8kYBfgk5sy6DO3bO1+nZg4ZrADfjXO7m97fHJdFpucqT6sunczaWcBIzlIiEQq9l6+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqC1zBT+; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqC1zBT+"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5295a66e775so376318e87.0
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 18:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716858054; x=1717462854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
        b=IqC1zBT+fWSFvFsviFO9X15r/OilFe//BBZ5T1qv8GOEyDDGm4jlUCDhU9KamtAATt
         eHin5JH2RR7MPE1+MsKi4y71sKDcGbaXrTCFdhtsBz5Y/6ac55ndlabxNRCD1YKtKODC
         egvRKxmBQG9IneVxQm5P1+/w/bfFvSaCCiAY2KcWMywjOfsIh7wuMPZ7YwTVzPk8Btti
         NZdNVaLzed48yx6AiJee/mrEx+5IWHqgaKjawSah2zf4V0IWmfVPuNEh4nxWQ+YipqK0
         SKt8Z30aizmNl5wl7pnlbirK0tydw/nPjLAc7B4Xc+cFMvO1Wx01IBnKguXHKXr1V05u
         dBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716858054; x=1717462854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmwopWG0DiE3sCpp8aZ0JQHOY+FYWa6TPkm28zzJyuE=;
        b=JvaFfKRpdHTYm4EyPoZZcOsMam5yrh6+xhc/z1mFMj6uzNWUjZfzwErohsxb4mZ6dO
         I1sUkxwS4NrzT9P870KypSqwQv0mkLAq3tDw+BRk2eTSP92bNwHhf/7SFiZCoBJjzysr
         W7u9gBlrJAL34Dm6V6u149vXwFTVF6gBOvX0sVbzh9Naih/cY7lagtMwpSgW5CPI+F2N
         +J7S7D2fgFpoH1Mul7tEwZjSPXHl0naFvQCCuY+P5EVGPF8ZQS8ac7mLYWhX2z69ugjq
         04EYtreAN6gV9ppRa0o4Ewf3TBnuU2TRUbJpOIdXEIJGuCbOoWmIFXkPA66MCVq82fP4
         pjgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvbPgAYEt/4IQYQljIOKSxBTLz9UkoTc2YMaC1v05h82ibVopSz4omB0qrkbLQtMW/18g+sdMxOWb2GW19FL+grkYDHNJXglHt
X-Gm-Message-State: AOJu0YyQmjkOCaekoidLAGLAcPYyPKPbpqF6+/c2rBTxd6+YwODo8rHQ
	h96z83cEo1U4HculMmZYpTtBSRTZ+R9hum6QChyCfCwWaalgc151vyNoMIm0X+k=
X-Google-Smtp-Source: AGHT+IFvbCrRsIbF9xwlxxNScbQE81pHqx1ki/P6zSR2F11gCd7AhgIu3KUS7x8FnRnamS3CF4QPsA==
X-Received: by 2002:ac2:5a07:0:b0:520:11b7:6caf with SMTP id 2adb3069b0e04-52967465dbdmr8591708e87.64.1716858053510;
        Mon, 27 May 2024 18:00:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529712f32f7sm825854e87.282.2024.05.27.18.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 18:00:53 -0700 (PDT)
Date: Tue, 28 May 2024 04:00:51 +0300
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
Subject: Re: [PATCH v15 09/29] drm/display: hdmi: Add HDMI compute clock
 helper
Message-ID: <gdfhorm6pj7l2z4mfhkyabtckoprp3xmdcihjnulzt5gcbtlbq@hmaoimvgwgqn>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-9-c5af16c3aae2@kernel.org>

On Mon, May 27, 2024 at 03:57:58PM +0200, Maxime Ripard wrote:
> A lot of HDMI drivers have some variation of the formula to calculate
> the TMDS character rate from a mode, but few of them actually take all
> parameters into account.
> 
> Let's create a helper to provide that rate taking all parameters into
> account.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_helper.c | 61 +++++++++++++++++++++++++++++++
>  include/drm/display/drm_hdmi_helper.h     |  4 ++
>  2 files changed, 65 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
