Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2E2DCF74;
	Fri,  6 Mar 2026 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833006; cv=none; b=YcZrLhr9OTyymp7qk88sU6kfSZSQvWbk/mrRxkfUp9pgOPcS22Bl+bax+NCPWvG+zOH0V0sMPbH+g4rwLA4Pw3UOPjcrSk8nVMljHfL22PwNbwYGKdIYBq870kFn9cO4dLWW/qyglgQmh6CS1HlajYMnLKsb0DW3GZ6KfHqF97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833006; c=relaxed/simple;
	bh=rrrv97/od52gix5N3UDXATdxSWQcwxqLuGr79o0yhqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQdAUlML789n9KGyH7MfAw/6lcbkQvuTaM5GKGFG21b5xhhyjEfy/wLpsaWpcCjKZr1V8kD8tyGEImXK3cmAxwiAtlQ5mFue3bFUhaXXh9CZseC4XW3+XomMLR6r5A1xV17hc3F89P9ehSnxCufRtvykIukC70K7Ecy+0PmmDfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fNI5I40i; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fNI5I40i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772832982;
	bh=rrrv97/od52gix5N3UDXATdxSWQcwxqLuGr79o0yhqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fNI5I40iVXHpHhBywRVM7GRAGf63i4KK/ST2LezxpGgiuNzp4w3lrH2bN+Pazv5fq
	 9WbYwgKEQvRD5/drpzLWUmtQ5Ibl62Rlm9v+tLLovKma09z6yYvdF3wLVl05fxzJW8
	 atn7hae+nRoWiII99/VlBpAJhiabi+DSyHPtTjd2XbguHmVUEWctqUxvNpm1OkMOuo
	 qy7dM4lKkNpE+p7ZIEhiEM+S/t07lkn6A37im8kq7nlhhhZeyPUN+MLlS4IN4EcTNA
	 NQ1GQyG4vqo+LSihnQJjof2NiYQKjGxDAmM7Vy9aWAw4igDdZTsDoOH1HNPgyDL7b4
	 raQDax7y3dyvg==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16D6D17E0959;
	Fri,  6 Mar 2026 22:36:21 +0100 (CET)
Message-ID: <ca96f498-5da3-4552-9f04-a2f4530475db@collabora.com>
Date: Fri, 6 Mar 2026 23:36:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/22] drm/display: hdmi-state-helper: Use default
 case for unsupported formats
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
 <20260305-color-format-v10-2-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-2-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> Switch statements that do not handle all possible values of an
> enumeration will generate a warning during compilation. In preparation
> for adding a COUNT value to the end of the enum, this needs to be dealt
> with.
> 
> Add a default case to sink_supports_format_bpc's DRM_OUTPUT_COLOR_FORMAT
> switch statement, and move the log-and-return unknown pixel format
> handling into it.
> 
> No functional change.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
