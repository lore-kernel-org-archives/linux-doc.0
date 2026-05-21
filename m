Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6793F1AC7
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372792; cv=pass; b=ei+tA+kL+rGehdGRcrWRCejhjswdCQCM+xUAS5ks4fxj/jJzLKd6buHdZ+l/Q75uWTWW/nB3yIAbf0KHPtc247ATY9dGJ5YTSJU6oSNifKsjZ0SArdSYOBqcq/grYfxluXCgVMiZ7xkXMiS0JyhVwkbbSk/ZIvrF0cdEa/iF3JA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372792; c=relaxed/simple;
	bh=/hyswSAwVBCiOVkaO5sAMVzTWbH4l0BgDpgUTa0M/Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttP0vEdj83Em60nc09VPEYgLxobvZ3fHaOIjcAbfBNSYSKwtz46dPj6jNVgezus2IqQBFdJDyPEF7b2gLHEwms5T3fPzr7B1PhE9B2F5FRdmkPEziZHl/gxll12j5fbg8gkuVCZoPtzIjyxVPeUbeFhdWGdLNHX6VN6xXEVyT6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=DDnYWhvu; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="DDnYWhvu"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2957953b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372791; cv=none;
        d=google.com; s=arc-20240605;
        b=bg+tQiinNXwcndTsBBmoVqzINhhWSmWvCpwuvCKTHO+z78V7LROR49zJnIDYfa4jlD
         nDO2CVN2cUMxqpsgG20SczzL+96cqF8IlKnUt4dkZ4VlPWOvDI3vTToE6rPL4kEqTTee
         fThQ6qEWFAhKo6PPLJLno91oCMGlkLNnz5rJAU2pYR1nWTiBbllV03JHK8swAb7Mbou1
         vuiXoSE79BXX7afyS/kEfBqYdrBvxti48Eh5C6sWI9lLc8Wh1w6XO3KcRXajYMUkO9vG
         nhkKF93KIhV1eoxODc8wwWxhx1VX8OxCgIvmd87lvYkJo+dq2w4dSMm6R6XDWp9KodOK
         3qoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        fh=CqmZMy81+0nqHulEL5Db6ka4pi3cpCwTpcobWaLGKOY=;
        b=lr+IgGYrRxfllu8DtZp2Z+2bz7POg85qKaYZQuhampO5wpxLCCcMF2np5HPYyEJSpQ
         IHNhr3kSZNRZpq/wWZN37V3I2Eiku0XWUPXW+go6pfksyneF1k9HC4VP3Ef7QhwcXADd
         xfDl2M3fzzql4K74Kk3lOxLSsfi8PGHH1YUTg6pCEOGLd0BfUQ4asSCij5xU1UEWj+c+
         aNHUc5CDhATB2MSs0Rl8b3RScRz2rnKVsC+fuwNavvvGYww3yUPr6kIjIXd+z48zbSAg
         FzAMymANXlikff+xGYwoPf9cjpby1WIgaGI6LftcETw1fI6cdUyryCGHwB1BR8W05Zzq
         pOGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779372791; x=1779977591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        b=DDnYWhvufh7khOIk2vYc+GOKWUqJ7NCre5wBU4Xe0RkIF/y20CzlQARDhHgb8neTLV
         rSuxzVDhMWXUkfnvLpBEwssmy5+TGsX3ft0zx0+1om94zR6AzdHu3z6BUYoJSGATQYym
         xCq/3E+r9bwZmU9zMydq8arbtss5QqQoxUvfTWhJAckW9AcfgsYbDQcH+7ZhZOpolHlM
         NlRSBLBnYlbVFSdc1vD3nDZJi73mWxDTv58l0YVObMVfqqBUjCheX5JvE+jJACXVfFGW
         kcE2gWLkREakEA6APqSae5feasvRYFju64AZq07Ypr07UhDY65k3AA3TG+nV5Jyje2Ww
         nRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372791; x=1779977591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        b=JMtfRuO6tb3tw77eTmLm6eTGw1v0SRWxRXAN4r7BE+zA5iN0hpYbiS+s/X6yzIXsqn
         vBBtmLKO6CyA5POZ1xY4GUceVZr4EntfzCOlDVYEMfqr2V54gkrFJpJ7zDBukyTMWp3r
         LYm+G+Mpi1Itc99ja0PkkhZUn/vZp8IN7BejYl+MHAd8bOUxl7fgcK0C7ldF4sMvyU+r
         dr/0i7k9yELclJVU5F7UNkgt+nqqYkA6sjYM2BGyvlOdFUUA0X7xKimObLPRno9b+8Pw
         LMMEMuoAwuxBqNEyMgvJ8H9fd7ZWYzTyvn6iwctpIXUsWOg3sgK55wZz++tLqbTb5sK5
         eRew==
X-Forwarded-Encrypted: i=1; AFNElJ8/tRFBPW2pWYXh9JVj3LhqLnTyUNS95RPGSjdKFbBiwlpg6Qy1rjDk5iftXgLu1I4t5DbTOq635t8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyROKnAVDHpSNNui7oMLLcUaYshGONWJy4glFDcdiHP2vb3DXRI
	F4SLzj9YXtuzql44Lis6q4GK5LaAuxmYyvZsre9WnaBUNdLmrIWXX/ma4Z3icSfReg4kcj7CZHa
	g8ehiZ5ivGCdEzP/uG7Q7iqK12mOTz2isVPSbvXL4SQ==
X-Gm-Gg: Acq92OG6PRz4ufUHk+iQy2/OZ0Da/jARrOFv+r/T17le/hyDb2QD+nYwFeNFg4/AUol
	OF5sMyBGl8EE82K2fQlKTINWzIU6Th9QUlIYPs/BAUBaL5V4niqcv1F2fqlUBPiZTCPZtp6Oina
	1HpWKXVQ8oVCf+DhwiBhJjpOL4iMiO0O3jKk7Px7ZM0atA0jMeXpppNLNercBvcCbm9ADXl8Ocz
	IHyrDHnJ/HYbCpw3aAvPRXhtDg50kT7YMOSkCIjs5bdpDqg1Kv4Q8xplcqekO7EX1Z3k59HEnWY
	vTF7yhewImnWLsl8op03FfiMszPGFJWlk/Ab590=
X-Received: by 2002:a05:6a00:170c:b0:83f:2568:d45f with SMTP id
 d2e1a72fcca58-8414ae0067emr3410992b3a.23.1779372790773; Thu, 21 May 2026
 07:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com> <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:12:59 +0100
X-Gm-Features: AVHnY4IhuE52xfR4O7ZsBvGU9UxEW_nGPaKeUuOJKbLW6yd-ftNZQIcte9EpFTU
Message-ID: <CAPj87rOgkSAhVzzHyuKEGPxVYeDhJKLGVNrBA2BkG00gvMJjYQ@mail.gmail.com>
Subject: Re: [PATCH v14 03/28] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       } else if (property == connector->color_format_property) {
> +               if (val > INT_MAX || !drm_connector_color_format_valid(val)) {
> +                       drm_dbg_atomic(connector->dev,
> +                                      "[CONNECTOR:%d:%s] unknown color format %llu\n",
> +                                      connector->base.id, connector->name, val);
> +                       return -EINVAL;
> +               }

Shouldn't this already be ensured by drm_property_change_valid_get()?

Cheers,
Daniel
