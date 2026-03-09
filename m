Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CF3D6CB0;
	Mon,  9 Mar 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069685; cv=none; b=TYvN7tjt3S/85MurGAumwcm1xVsqvRW7r1XiwVeH5OaQQqPkEuSR6yqlTDYBels6TIrl7/2bOkS2f2wi9SvFn3L5SrwJDgKdqPXCaGWMnSdHJRuxGPObKERpjsDOGWYlUfKWmxSy4hNgfjFmTK2EDhnuki0NS1Ki/7yDR6e2yMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069685; c=relaxed/simple;
	bh=yjH9Qy6R6RruoyUt8z/lT2greWmRoBg2fSGT8Nm76Q8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=husbFvR6mZ6P0MJN/HzX/GhNPQP9caK/CozgpF7sTUTBCPcfHeVQ3K0VD+DQj9MlCCgcRSR5KYHWzmrhM24p8BEDHHpOJw3qzy9xuk5xYLw44W+SSMtUXlVto9WAfZoKo77Ku4KbhS6P0pj1dYvOSlKuvchHNWm1wpMTKm2bY2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4L5dPhP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4L5dPhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C57CC4CEF7;
	Mon,  9 Mar 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069684;
	bh=yjH9Qy6R6RruoyUt8z/lT2greWmRoBg2fSGT8Nm76Q8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=U4L5dPhPxfqs4JNxt0xMlRXLGgEgFbnOQkZVlti2gjv5KyyiBwar0P13MLfQ9bubh
	 qoAYnquJqnlBkPmCiE6OKMAJ4v/QiqauKhbUAXkoMJ8Y9RrRG0IkIJ28p7FTw5mPql
	 6plPQyAshZdZ5b7qevch3261+Fjqvboq/GTm2b9uI8FmPBQU/hkEKtdTz8FnEoRKLC
	 ZEBYDl4se1JJHja0XWGGDOuK36m958TCJ/Yj3Lycd18LJwFnAXMo5fB6XXjPurHM9o
	 oyMWVj8KaTN+fQHJ+Vc+dbKpr6WF/9ejDtfgkMgS/2g73umL5BRttrc8oPU2gxO28Q
	 8m+T8znrqdNyQ==
Message-ID: <c693c826ce1791fbab960af03ed75138@kernel.org>
Date: Mon, 09 Mar 2026 15:21:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 02/22] drm/display: hdmi-state-helper: Use default
 case for unsupported formats
In-Reply-To: <20260305-color-format-v10-2-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-2-a58c68a11868@collabora.com>
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

On Thu, 5 Mar 2026 15:19:28 +0100, Nicolas Frattaroli wrote:
> Switch statements that do not handle all possible values of an
> enumeration will generate a warning during compilation. In preparation
> for adding a COUNT value to the end of the enum, this needs to be dealt
> with.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
