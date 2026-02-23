Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7735CB68;
	Mon, 23 Feb 2026 10:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771844323; cv=none; b=dS6hluTPs6G0/3qhctDPnOufiMGqQVOccvsdAMqHbFO/y+aGznwSckGL4FPnK0o7zdyime7MpSDJYWr0p89PbINqRwFUkVhOgWHtZVTQbEEjQexRADSKci1zwm8+CHrOqmeeBJe19+/1zYzMvRQKlGNWksAH7Xiw5alXD3y7xtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771844323; c=relaxed/simple;
	bh=QeUhpW5ZHW9W03OdaYVWS7lJzgfUrHq85mrNLwMR8Vk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MompLu6zhoV5RfJY0cMWGoP8KlLUZbtXKME872uJE7Nde4JUA3ixhygacxTQjubPRkpwb4Rh1TGlCgD9+h6CElxoLJ5UDXJtuKbF1g+oiCH26T8szQBD1WqBmufSftHlgiK04EID0S0J9Y19Cs30HG3v1WqW0Sr4fK4kqcQ9WUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aj1Uq+jE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aj1Uq+jE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725D0C116C6;
	Mon, 23 Feb 2026 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771844323;
	bh=QeUhpW5ZHW9W03OdaYVWS7lJzgfUrHq85mrNLwMR8Vk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aj1Uq+jELXnhsmWirdvYXtFjNwW/Rep8UbqYN8xtGttRFRcgPABYThU4kqtQkUdbj
	 oCqFah1xawKiFHLvUx6BSDEPpDEZ7HHvL+qDCu6x/+KA4b+n8b5kCJoC3mlSQgZ2kH
	 mvA3ltgbo0NBovsEGT473nQ1rM/uAPc4+YnGeg2vsTSkzfcH9YSzsb9CiXJVEMixKp
	 MzqbqwwuakbbHRHvg/Ro0rT/FftY1XwvnF5vWJpUlvXwMyINy9SWC6K+e07O57JDr6
	 lGWLTC4WQnN8g/KM6SMVUFBGl/raTGAmbutKnkh9uvHRLf8g+vniJA6mj6FMrsYVwb
	 bnXy15uAZMPeg==
Message-ID: <37669584817bdca3d569e80047c94949@kernel.org>
Date: Mon, 23 Feb 2026 10:58:40 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v8 06/20] drm/display: hdmi-state-helper: Try
 subsampling in mode_valid
In-Reply-To: <20260216-color-format-v8-6-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-6-5722ce175dd5@collabora.com>
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

On Mon, 16 Feb 2026 14:01:20 +0100, Nicolas Frattaroli wrote:
> drm_hdmi_connector_mode_valid assumes modes are only valid if they work
> with RGB. The reality is more complex however: YCbCr 4:2:0
> chroma-subsampled modes only require half the pixel clock that the same
> mode would require in RGB.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
