Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7F92BEC3F;
	Fri,  6 Mar 2026 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772832479; cv=none; b=F6f70lNlQEDcEvF4xbmcJM0BGjth0d4hcY9iJI+5p+fCgitSUNVLe8BwwYnG2jfbOzfTXOEfUuIeLMKLqWRB/QA4+hCXtMSQNBUu+E3RGhqHdolSccVxMlJJAzal4fti6wPZxaoDyxGnE7sCrzS2V4kWJ4hNHQeQ82OTHu56eT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772832479; c=relaxed/simple;
	bh=8AcXATpPHhAW6+VsEJt3fbqjfR+nRZ5oVmrac43OOrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AZGSK6nfbvIKGL7VQwbY+zt+xONE30GdqBYiTFYa6t2ECPk/tYAh2uZ7hnAf9VW/iSLbr2CxFVrLQK/8IhYHa6SRc6p8TDYhLlsH/jH4VuVUfeqSec3teYMzSYXBOJVhp8ZC/2rHee8gE2PDdOieR0xCI17mAsZQknz2NTS7NA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TKuE5TCY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TKuE5TCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772832476;
	bh=8AcXATpPHhAW6+VsEJt3fbqjfR+nRZ5oVmrac43OOrg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TKuE5TCY9pEao6ovX2ljN+08xIEW10blai+3m0jm5lIqeNw1ZtMCznKG1mP5WDIZa
	 RMy8xazy/23QolllpOLPnM3DiBpIdv86oGjBjzgKGYmPUFe0o5AZVmGdLurCUda0JQ
	 OmEwFnoXG8n8ZNpeIqkW8oVCvVmcmF6s7Wg5DfvXLqXrnEX6+tZM4LQN4fZNcuLEEG
	 Jfy9uq4P/0HDrrTyIYtoAlj/aDYFhzyuRf91VNqojzpQFlYt4I1WkkkkteEwnp8djt
	 WxIJeugI63Mz6WslOt1Hk6ceagZFYi5AwF1vZ4o3IqKEguUiKdtrQEyR4KlT6/MbPW
	 1vV1T6W5Cx2Hg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C482617E0959;
	Fri,  6 Mar 2026 22:27:54 +0100 (CET)
Message-ID: <84b30917-5d09-4432-bc49-873d1b2674df@collabora.com>
Date: Fri, 6 Mar 2026 23:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/22] drm/rockchip: dw_hdmi_qp: Implement "color
 format" DRM property
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20260305-color-format-v10-0-a58c68a11868@collabora.com>
 <20260305-color-format-v10-15-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-15-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> Switch between requested color formats by setting the right bus formats,
> configuring the VO GRF registers, and setting the right output mode.
> 
> To do this, the encoder's atomic_check queries the bus format of the
> first bridge, which was determined by the bridge chain recursive format
> selection. Pick the input format if it's !FIXED, otherwise, pick the
> output format.
> 
> The previously unused GRF register color format defines are redone as
> well. Both RK3588 and RK3576 use the same defines; it didn't look like
> this as there was a typo in the previously (unused) definition.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
