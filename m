Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2302311C35;
	Fri,  6 Mar 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772831704; cv=none; b=UL2pzGHfB//5DqdxSinu80iRU/pv4tjdWpHnJr1xPNXWYp/JsR5OkSlr8GJL9TTz77ZKLWii1N59ReSHK04PGofXbipVcv1Ke1q/xF8hYFpUWULoiR54fdSuPYWlyX5/5VOtWn08ojFQB3KV0mqiGh5i8rbuP9yRxhCRGOCx190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772831704; c=relaxed/simple;
	bh=b2xKIZVvU9oNpwWfGskzivc5542W5iNveuIWwtPS3D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skhXB2gzr6a2wptbW2fnZSt9+gLJIyf9f/sJ2nymbQ37E7ThF+ALxyV1UReCu/nRAW7k/rCQOdDnWuLFzvmKT/MiZetGhzW/1TWdRfWJweVdadcfDdjCzE7aK/wJZ8QMHW0ofEcmw0rptqd2f6K/A33h7heT3ruWByqCdr1RKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SMAvJLpM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SMAvJLpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772831700;
	bh=b2xKIZVvU9oNpwWfGskzivc5542W5iNveuIWwtPS3D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMAvJLpM0AucH2FC7JWxiudQ1BoadPrwmgjnGc17sKtxxIxs/mJGmiNX5x5j+V1oQ
	 Z9C56kerzEd6F4vGEj91VkStUeFOGhghtmxo1VYp5gSTYHQT18TV5flyL93s5TPL63
	 FlGjh0XLuuYOzUd1gazWPzVODg2rbkDwqtN7r1JnWWDSdjYwxNNiR1yTF1QL8389/N
	 Wa5rGoNJqw+YLbgF1o7Zi2pfVRSP+MZt0P2Bx3iHcVMFNWTdCQiATScYEPK+hkE0UY
	 0t02Kd9hILR8RM7DxXSf1LiN0PctHRg/Y4Mtac385Hnz+Feub6CBoH9qKgFB7Sli9y
	 vTNjcFeZa8SUw==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7787A17E0071;
	Fri,  6 Mar 2026 22:14:59 +0100 (CET)
Message-ID: <8360f269-7f10-44e7-9654-dd5894a88abd@collabora.com>
Date: Fri, 6 Mar 2026 23:14:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 14/22] drm/bridge: dw-hdmi-qp: Use common HDMI output
 bus fmts helper
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
 <20260305-color-format-v10-14-a58c68a11868@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260305-color-format-v10-14-a58c68a11868@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 4:19 PM, Nicolas Frattaroli wrote:
> Make use of the common drm_bridge_funcs.atomic_get_output_bus_fmts
> helper for HDMI bridge connectors.
> 
> This allows dw-hdmi-qp HDMI bridges to participate in recursive bus
> format selection in a meaningful way.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
