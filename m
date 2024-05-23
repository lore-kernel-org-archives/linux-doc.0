Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3D5B5B8
	for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716455417; cv=none; b=pT89RB80mvSIPt/uHXkyUSMUvy3YX4dqgJfeNv1hegMR7etloeAmlp5ID0T3xJcK01f8PcvJE6Z6E8a5nVbo3oOi9bvZMNJCo6EPcWaMR07RKmyoU3GGWRQKwABdpNvpuVMKdlqrw4jTv42Yc8oe7vJpEQOcK+e0CI5L4rsf4zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716455417; c=relaxed/simple;
	bh=2LLQXSCtOxv6wPX6ulrJ4oQTIol5AljMIJ9YZtpb3U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqxcfEkDea99d/BLiIYUr256a3swpnA0wd8HPxz69Om25C2GSA8T2WPWU3ZWVt8VFmQHhNL9tR4vGcMaopIkZ2qPPpaeKsLV87ciM1WrWeqWrbJLjtUkHgGT0KDSC6K/CsXVNVF9U3YEJA4pgkQDnvEHhzP0zkEWyr031r0CW6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V2jm2ZeS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V2jm2ZeS"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ffff16400so11963970e87.2
        for <linux-doc@vger.kernel.org>; Thu, 23 May 2024 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716455412; x=1717060212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=V2jm2ZeSP5Ndp8ezR6Wgx9a3wCMGt6X5v53RhR6FSO3l3dTcYaRDerC1nL4c6LHiyl
         XWGZ4tskCaG/BYn27veSA+1xKcR8ZDbXTjrJEkfzwGdVusg3qaGB+klaqJQbjBN6welQ
         Dwi25bicIPhR99Hf1y1FR5v1gqj3EDbAXQW+QeJpbsqpWGWj7opRfqUKcnzPRB8yf9hM
         qLt0MOghdpWOJLDa8gIud6T/PQ/IbJ7ME4kIBe5LZU/u4/MkVHQ+ZSb9J4m0SapqPDI/
         i9axg6eCNaFTEV0xCi/9u/S/HrwEfiWigdYqFeC+mL4faFyZE4vSjdAiFKaiAHAlUGj9
         F7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455412; x=1717060212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLbNbEeZZx+Y9UagHOzdXnc5AHkeTqV4LNqc32hMk7o=;
        b=v5b/3S/J7kkX+fG7jArrMr36EIf2hVD708Sy6GvK3SDeJC/g34jwZ9iTM7VsBNYzIn
         UefOmzOHcx+yfxQsKxFh6cYZYyBgt/MY2d0FCQ1zrwe99ygJ9Rl0Ic6tUj2suRVWpoIV
         N7xfBiU7YgUHsniG9brbm7qEIaf79oE1DtmMurOBgWdTPjvEJMWoKnd3J0wpphHlDktX
         UlMqyU4X+XEkSzSV0vhAtjDLEoZ8UwcCsP1g0C902Ip4DX+sqzq1XAeGOU0QMs8dOB2N
         oMEf1EuBqTDsGPMoJAqJpuQwmvKnYz8gYQ78soqJOoiEHtP0tbtjS15SzQiPk4docUpg
         UXoA==
X-Forwarded-Encrypted: i=1; AJvYcCUcxEMC/3XotR6xYOR6xTomraJNebXuAunpsgOFk5ASmTJmfLFav+yF/tNkfBtxpX2OR2ITl6t1ZZXl3RhiDLF+D032J0/SB8ME
X-Gm-Message-State: AOJu0YxL3yjyNGQjrOftK+sOseSSfZyqTndkLJfJDj/b1ExlwdIS2gKK
	lDKru6Wa7yZEy/KkSpXgSQUizrT3sc71jQ/F8G4gS3W2KyFHF8djcuDVfx46lss=
X-Google-Smtp-Source: AGHT+IGdSgWnLFMgir035AHyOCVqS5scq5u8M8DlUryO/CIUdmVczkNrL4TJ+hWCvcPS/dK0wrOj/Q==
X-Received: by 2002:a05:6512:44b:b0:51e:646d:fe3b with SMTP id 2adb3069b0e04-526c1213db4mr3455906e87.60.1716455412389;
        Thu, 23 May 2024 02:10:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad640sm5253516e87.61.2024.05.23.02.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:10:11 -0700 (PDT)
Date: Thu, 23 May 2024 12:10:10 +0300
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
Subject: Re: [PATCH v14 06/28] drm/tests: Add output bpc tests
Message-ID: <p6mpuna2ubfpqyfogblvknxadga2uqnm3lsocwol4npwmgw66h@42yt4b5zhk5y>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-6-51950db4fedb@kernel.org>

On Tue, May 21, 2024 at 12:13:39PM +0200, Maxime Ripard wrote:
> Now that we're tracking the output bpc count in the connector state,
> let's add a few tests to make sure it works as expected.
> 
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Kconfig                            |   1 +
>  drivers/gpu/drm/tests/Makefile                     |   1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 140 +++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 438 +++++++++++++++++++++
>  drivers/gpu/drm/tests/drm_kunit_edid.h             | 106 +++++
>  5 files changed, 686 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
