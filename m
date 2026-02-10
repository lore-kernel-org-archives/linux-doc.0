Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3673859EB;
	Tue, 10 Feb 2026 15:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738695; cv=none; b=rywCO+oiLlakX6j6bc7E+0QKiHL4nnkjcpcZd7wSXim0X/wFNueIwAJw2ZG/eZMLrN1LP1Sq1Tl26HzuPeEmJJdaITvBZ5Z86niGioWRdSSvYoLiyuLkNUCP/370Uj/Abtshplv43RLL53Ejsf3KNEFWzmc+6WV06t3QfI/yVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738695; c=relaxed/simple;
	bh=q++is72bj4uWTYoc+vkSxji6zhNdE9WWO1UbEw2tudU=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=WySh3GDRFIAEnkEQjS4N+UQK010gOS1m9IwCaduFhq8XofFPia4JJI/jwdXLHBJK9XyoD5zRKa7NW+CMC4GIioosHYUqEmlXKVRONc9LUIubsDpxuS9ZijgWp+7QqyfsNPR+EHmU1mejpNq1vDFWVUaywIhGPXzVK3M29lkgi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnWI6HFr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnWI6HFr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8BDC116C6;
	Tue, 10 Feb 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770738695;
	bh=q++is72bj4uWTYoc+vkSxji6zhNdE9WWO1UbEw2tudU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=cnWI6HFr1xnNHjshPC4yDw5r3+LkkXpVxaFR3h2hnFByRL3mXa2IZkAWf26KgNLHG
	 P7Qo5hWsg6/4z9qOyshZWKCSOBKbiGeS9Z6a/2f9Dxu4si/Al+lkTj0Wn/QV/jN7N0
	 ZBAb2QM7//B7b2eK/anIQ/bEhWHa+8YbEnjMKVdzI5yXLDPyn1cBrAeIL8/DlNtWhr
	 tfMPvfCdHpCEpIpG+vveOFecl/QePKAD8y1bvSOV84opabNTBxS0cYwe9z0mUJPL+7
	 XiX7IgAzzf2ceJD+gaS3/eAd/8XwnDw1XsQdk86Bb6bC3KRkQ+ReQuaJT5kdQleZK5
	 /4xNZoC+I20pg==
Message-ID: <5c9aeeb9e9d9c0609028dc3637eb9dc4@kernel.org>
Date: Tue, 10 Feb 2026 15:51:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 18/22] drm/tests: hdmi: Add tests for the
 color_format property
In-Reply-To: <20260121-color-format-v7-18-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-18-ef790dae780c@collabora.com>
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
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Wed, 21 Jan 2026 15:45:25 +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to check the color_format property is working as
> expected with the HDMI state helper.
> 
> Existing tests are extended to also test the DRM_COLOR_FORMAT_AUTO case,
> in order to avoid duplicating test cases. For the explicitly selected
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
