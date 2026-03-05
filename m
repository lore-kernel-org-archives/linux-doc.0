Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8A3A6EEA;
	Thu,  5 Mar 2026 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722014; cv=none; b=D04PnDTaoJmWUotqQoxMJPGVJkFOF0pRS7kLKAI8IBt8AJLJkYsW2/AnmdTIqRAuafneJcnTKU4mQPMXiru+3wvMIVRE6qu+AIJ3uBDPzBhHlo6avjYt37zIFLOSr/F8clsCd5xxOq32Klfo1LYV2tU2k6o7VZhipJ3mPAfBtOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722014; c=relaxed/simple;
	bh=+vyyNXwbVKSALuloOGJ/u3XQdbK2QU/tneBRUrk0GPg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=DRbZxwankyF845t0EjVH4JZtUJDxXCxKZwLcfv2Rg57fsSXA6k16DN3Y0iZ+3WYATJvYG2qBfq+LK3rq+wzxBzYVw+9pH/rnGdgd3aYWD2+yoOAXfpoSn2R85FnC8naPpIeH/hN3qXqsMyZHsubC9AXAWQB0QN0Zh33x4bwLbNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dtp4EoEr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dtp4EoEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D781BC116C6;
	Thu,  5 Mar 2026 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772722014;
	bh=+vyyNXwbVKSALuloOGJ/u3XQdbK2QU/tneBRUrk0GPg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Dtp4EoErGT5rmyC8XF590dGA+1fJwq3ailHWMacH5ErbUV+V1olQJF0gWKHFogu0X
	 BS6BWuhIKpEF8bh0LvV+cqOW1xT56JIqFWU6kgMkxpYrJtZIQj2zJYo4NETaHbFvir
	 H7q8e8sCROgU5De7vFaYkHpe5SBoFyZ2kXGiubH8BVWWjpCVMn6WZJrSdmBblj+JfY
	 3QJLSw282cXQGFqC9c4Yqoj8DvGpn3osMVMUdJULiALh0LhbcxoeHYNUDGXthpqT1t
	 2lJZ8L1MpOzPvXV2y/6wfRJ35EnJ/sfrhKG+Tixtl7ZwK3UmPTVA9jsaF/w6p9Xr0B
	 jpKoTIypQBWrw==
Message-ID: <0d4b2eb4691010abf43dcafb96b3694e@kernel.org>
Date: Thu, 05 Mar 2026 14:46:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 06/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
In-Reply-To: <20260305-color-format-v10-6-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-6-a58c68a11868@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tvrtko Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Thu, 5 Mar 2026 15:19:32 +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
