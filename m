Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DA513C91D
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716459446; cv=none; b=QcKwC7BxXN0QEfyzEM8NSmAkiMJsyIwBugQTfEIV4/WUO3z6Oc7JbA73NIX5EGoS9Nfns0aQeHCcbQafAxN19DczyujFeu/t0O740QRhVeFPY9iaKUr3SnN2ehmSmiVeN/sJ8Hb+Si5s4xHS+xC0GpRYA2JB31ZVASX1m84aXq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716459446; c=relaxed/simple;
	bh=VxArPR+4LU1aox0+YmS8YeLfjdTov1uipRKbrBd98BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA39XSnkFmwSW7N3vgufbjpIOhfadFA3SGjJz7cK9iFDDquOBsKVfOQaaBJwJZwHKV3k1zf8HiRgZetQzqgCGoC8DnRWKAKqBkgbHmUULYWcaNQ2wK+mhYN/VvoVGvzdB9UBMxFzXNNhizMSABb7lDKIga6W4JPPW3EzMlm1Pz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrYky5nl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrYky5nl"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso7697601e87.0
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 03:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716459443; x=1717064243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=mrYky5nlTcHVHJz/YJkMD+3f82gKVxSIWizyBGJkt1wWz/BOQXMinKD1/YeV3ncIjm
         WCGraQ7W+kV2bUJ07+lI+7nHmJXa1SQVhs3VuVRourkjtmekp0lkrdh/dh3js6HPAgy9
         FaxnZKtoNp9/wQdwyK17+vI2AT/6LQg+Qj305gMebrl5FtX/s0GZPhC8DE37U4oE1AMe
         dhtp18uOR+WFSlnj9lRqHDYmyYfeeijdKrZPULbKLw9V4QNVE5X+zF/WqBFvPDrPJfge
         LrncKnzK2feptacPjvO0wfXk3/zZM8ZusoL0UYq9uxBc5KVEBGPPUwoMZHEQVN4UGNpq
         +kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459443; x=1717064243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80bP7y7qA9MMuEwQlAA7CumJ5PPSgBtdUbjEPN31H7U=;
        b=lOnkF0LMnf9XoBESs4WmGDTnHhfWAEFilXhLfZm3pM9NVsG8FAiHSEWHhOFOYvCZCV
         +Y0t34Mhu2lE59/sG6Bmh0IpTDaX5qenMloYVV7X9rfX8iTuW1dNYQjNn8GJKIuf1wRQ
         Ffca0VmWEY+gPjQvxA2mKpjXmyVQHQ9C/2Re3WekaxoPcoLFgDBZO2f7p6amEMBd7F06
         S3054hdcILS1CGYfnQ6loztTcYM6AfWf7Bw4qd8rHdFs8xBFW2m9KFmUoJ/hHlM8oi/L
         TOowHzatbswBer4KwDel1PMQypkm2zY2sshAMJW0iMIM+S0UJHtEJSDiV82Q5uz+Wbqt
         P59w==
X-Forwarded-Encrypted: i=1; AJvYcCVNaPvXFMdgRwv1wo7GoJYqTPPT1ugXSzfoncHpkxqeOv+TVT32Ts5ooCSJk1bXOd/5hlbTpEYSGKjRIwL/EA9/H8N/0SoDxMKn
X-Gm-Message-State: AOJu0Yxm3Jsv/PjDYTghWLc+pcd+cwCqEFHNO7prRrotBwVF+l9dXJf0
	mdwrAs3NJZmMueQ0QSAIC1AyV7GN4+wOSxg5lueTSfIXrI/jbffQwmSuGUzt674=
X-Google-Smtp-Source: AGHT+IHf7awBjw/9D/TT+Rgq+OAeb8dHAhP0xUpM418Uxoc/FOiPxZ31oJO7H7MbUzlhcOAfgCiNgA==
X-Received: by 2002:a19:f618:0:b0:523:89b0:b03f with SMTP id 2adb3069b0e04-526bf35ccf2mr2563834e87.28.1716459443132;
        Thu, 23 May 2024 03:17:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52812cf2e1bsm215911e87.254.2024.05.23.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:17:22 -0700 (PDT)
Date: Thu, 23 May 2024 13:17:20 +0300
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
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v14 16/28] drm/tests: Add HDMI connector bpc and format
 tests
Message-ID: <7xvmyypalx7letzlyxoootpc2e7io5f2no3pu7jnmh36m4su44@6sewdztpjqfz>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-16-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:49PM +0200, Maxime Ripard wrote:
> The previous patch added the bpc and format an HDMI connector needs to
> be set up with for a given connector state.
> 
> Let's add a few tests to make sure it works as expected.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 509 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 160 +++++++
>  2 files changed, 669 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
