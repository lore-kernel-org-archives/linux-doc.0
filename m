Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F5132C33E;
	Tue, 10 Feb 2026 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738737; cv=none; b=p/13SNnbC7ZEVLf8lUPbVCEfOi0GlGuCslXSuhq/OEgKhlZbMbeUG/o9Ykqp5HQPpfn/RI2GBXHiwDC0TYC83SWFfGzmQxzahpe2c4XJYPfZtunljBYbbrAY3M86OW4ipnWSnb5Dn7hnNrnwKjKB+1H/a5e6fVT5ufNkWJPe/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738737; c=relaxed/simple;
	bh=RQCwNCcBeQU5tvcCgLx7gzzyD5u89C/R0Ffzky3epSg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=AB7WoZjYNumIPBqFqk1qa4oY+FNZe7McpYLIArutsZbWgwufPyewG9PNLfqH9B5DDVLXlcKzyvx5L5e264eRVdOtasX0yqKGCsXnatl88dzIB7zuwW5ads12kX7ru1MbuSy65Gdgrc9e7Kuooj67W2ZzNwccm1mS7UGA79YJlLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L59I9SaT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L59I9SaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB61C116C6;
	Tue, 10 Feb 2026 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770738737;
	bh=RQCwNCcBeQU5tvcCgLx7gzzyD5u89C/R0Ffzky3epSg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=L59I9SaTtdMvZlOhb5jGb3izQPshIAAA5N0NwrHQ9OHzFRKT2N2aTHa6mubs/+8fT
	 Fd8ClyLKa2PSEiACbqV/S/q35ydzv8P72f6fDEDz7fmEgXd9mNOlAV4RUKfXafs2Pi
	 W3f7efLT91mlI5d8Z2t8uaGyffr+UL9jMyEDKDFRyB2IdVElXspukJmAsg/0p211AK
	 nczKveQhsTZSu7CzRB0lD0yApoKULmjqz0i3Cb+5+0RCtBPgq3lLfFmhAnDXrLoWAV
	 HNBBL+Dh6OWzv8FeSN+ajGyLHIu+c5etcJmxfpXoV80OQf4OewLWzMvnVySHkLp9IR
	 +14wAkevYkQfA==
Message-ID: <6650ab0f95871398568f6f2c3d2f3e56@kernel.org>
Date: Tue, 10 Feb 2026 15:52:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 19/22] drm/tests: hdmi: Add tests for HDMI helper's
 mode_valid
In-Reply-To: <20260121-color-format-v7-19-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-19-ef790dae780c@collabora.com>
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

On Wed, 21 Jan 2026 15:45:26 +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to verify that the HDMI state helper's mode_valid
> implementation does not improperly reject chroma subsampled modes on the
> basis of their clock rate not being satisfiable in RGB.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
