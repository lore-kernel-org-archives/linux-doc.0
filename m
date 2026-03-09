Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816AF3D9059;
	Mon,  9 Mar 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069936; cv=none; b=LrZ52PUL73t2Qlx69zogHFm4r9jl/uAqSzv5f7aGO6jHn+/PbXFN1cL8ZHC9MJIBo8ktmGBmTIwH2mko8oIXKt5iW+EleagWcxui2cbNc8+wiJmPKciLsX7y+zWDwxe8utm2Qx5ID9BDtDZbznvn3/e+l8L352gUnbIGRXedKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069936; c=relaxed/simple;
	bh=fBBN7nvLIOBBwvSPB0nsIwVG0Bl8ydOvAnuxSNjiMJ4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=hycEeuiTRIzfw2Idy0QDshQF+EOM0hxpcyIcgRTJbAoJnyDI/GbCj31rw25Xk9fyoMtyyjna6g29uOIjKNVKgm9DPCK1J2uatPPx7f3fsDgR4SfWoUrrU/62dQQU5XHjWxKH0Q9GI64pOzjITE6Abw/NEiURzI+8oGNka7fdtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNAmv8fD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNAmv8fD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B133C2BC86;
	Mon,  9 Mar 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069936;
	bh=fBBN7nvLIOBBwvSPB0nsIwVG0Bl8ydOvAnuxSNjiMJ4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=MNAmv8fDnhYtxM0AqvHEvs5plNOfcFG5T5i+Ja+7DrxyZIGfF1AAYnIY+u3KsprMG
	 JMuD8rHTrFsGxJuWtPzYn1oTpX5E/S8Wt7w6/5DuKx+fhf450UI35MM2GkY6PE1bKn
	 maJdvsjJrMxdqAY0d4lhnCsvLP7aIkDoSGt+jsXb5ntSN4HlTvmbbzBDcMOZTgsLKA
	 fu7AB0yWeg/bOhCRg6RIQcQ9MK05WUSRy63p/aUCNSck2EKbYfMnfl3bpUTcKRp5/z
	 yCwhrXd/YmGiRCR7yH6ahfW4bFw3FHW/3DByDbQ0Kvt31TJT8Tpqn8CtNZmxqUy8dU
	 GlADCxlH2vpOw==
Message-ID: <da696271d7b5e27569f026d4f7c2ab82@kernel.org>
Date: Mon, 09 Mar 2026 15:25:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 03/22] drm: Add new general DRM property "color
 format"
In-Reply-To: <20260305-color-format-v10-3-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-3-a58c68a11868@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andri Yngvason" <andri@yngvason.is>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>,
 =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marius
 Vlad" <marius.vlad@collabora.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Rodrigo Siqueira" <siqueira@igalia.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shuah Khan" <skhan@linuxfoundation.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, "Werner Sembach" <wse@tuxedocomputers.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

On Thu, 5 Mar 2026 15:19:29 +0100, Nicolas Frattaroli wrote:
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
> 
> Possible options are:
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
