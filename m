Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7D13F011
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459937; cv=none; b=Tqk0wsTJmDWdYEkc1URoacBVFbUohPTM3+hOg/9jBLu5QYQkWJD6jbXtaYPfpFrGgcwuAcPymk8/8eGMaAY3MLPYrNtkMFJpmkXaxQVuQgQm2lIRzsBpuhtU1QuQWonky6lkjCfG+Qe4bYT1xFqUwVura1otmsLWd/NeDTZfWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459937; c=relaxed/simple;
	bh=7qYk3nhcej1wrZJb9D0jf9PZ7Z4vN9EkOqPyNt6ofBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4a1JCuRE0eR1z7rvAa9WjVuMBf/bePeKeUOJtQfD2M5kbk2rViB6I4/PwPfd+ji6pR57qauYtYqehqua5ONt6o1nzfRDYEK2rkscll5+M+DGTcJezzJlOSclyvfUlfAwcrSLKHLHMjMShNfdlbwadKT1k3uUQ0RSXAWIVXULT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAbDqDQ5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAbDqDQ5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f45104ef0so7500563e87.3
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459934; x=1717064734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=wAbDqDQ5plrdgEgnRvwbWiOGE42EGXPV/bMvDMI5DSR3xTKEllKa0SqYnVwQ9xUwx3
         +W5tHNyEt4ceN5+JBV1F+pNqvtvAvQBvWWp00G4xupivZ7XPVpKiRh2DSToahFdtEMlO
         IRbSarKYsKf4mVMG90VLw4+ZRcBY0ctbxUDuri6BikW6s2cQlqykZCCym2GTCVG7wOq2
         TxLgYTqGXW3Uk0J7RK6SguvwDUiosucz9UXRt33uvZw63BaZxm0amdIWgRsr3hhD2ccd
         VwCvQQDUMFUIbVmHKGGYUs7n+n+MMHBUBztmfSMxb/yIoKv5ZZCjLU0jJ6ge/6wm02Lf
         IGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459934; x=1717064734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0Y/Ql63/IxwaJL+O/h+E6/ion+Rk9v6vnf8eimobm8=;
        b=O6LBsIdPlwm4OjSU2o90bwFprkmyimDXd5DOZ++R/lzMCYop/Mo84Xgo6BKJeTQAXf
         cVwG7V1yXUnteMz5OZCaCoB3xcH2GDhOFd9omazBflr4bdrzn75ELfmw6y4Ysukh4Ka7
         etGym+VlHy+gK65zcM0l+7cwzFTPj2NvmY+SCS8ANLzlcJKDChgTOWfPFOcdhSlZSrr2
         FjEr95jMQ64o8BMm2tqkv6MbnhJmfskqAQUrHQufccQlN2JIQXyClq7Q0inFKFtbqgzR
         BH8QRgWoGlZUhKaTnwmMns6sXqM3VIfrd2Oj2q8OWyjscpfu0Yii38A4fo11325fYTyz
         P8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVZJZAcCt7hQ8b6v7Qv2o+FF29Azc9lcnUDjodE0mSUcJpJ8Mwrx7u3ufFIohpVIKTUP+g9hGAvMbGMwproFTBYNxWfuwjoEP7X
X-Gm-Message-State: AOJu0YwFUDFL2Pj09NRqa3DoC5POgVGznGHrL8Pu/nj1nNJsC5HMhgKK
	O0QpdSAYx4ZxYjTAelVGxHN5tw9iUllUXHGGM7a7HZCdlvpoach6LvJ2J1sj0Ok=
X-Google-Smtp-Source: AGHT+IG3S9HxgA+BRyKc+tEiIJocVHkYeAAUZVOvMSsA2E8b2S+QZ7Z9TP78uV3Je9C7031yrjAtlg==
X-Received: by 2002:a19:5208:0:b0:519:2a88:add6 with SMTP id 2adb3069b0e04-526c0782f50mr2886400e87.55.1716459933553;
        Thu, 23 May 2024 03:25:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba739sm5323969e87.101.2024.05.23.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:25:32 -0700 (PDT)
Date: Thu, 23 May 2024 13:25:31 +0300
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
Subject: Re: [PATCH v14 20/28] drm/tests: Add RGB Quantization tests
Message-ID: <pruqf2ou26m7i7ez2p6rgjdfbzkngqyuwfv3bnx5d3jzxce3af@sa3d467uka3d>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-20-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:53PM +0200, Maxime Ripard wrote:
> The previous commit added the infrastructure to the connector state to
> track what RGB Quantization should be used in a given state for an HDMI
> connector.
> 
> Let's add some kunit tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 355 +++++++++++++++++++++
>  1 file changed, 355 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
