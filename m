Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE6377EC6;
	Mon,  9 Mar 2026 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070847; cv=none; b=IAJg7iTEHo3AHdW+M08Hc0LLtCHIKD0lGDhC9dFzbxbR9ULn6Y8CXc05YGfbYNijGEjZULuuFDL5ZAq5knnONqfit63a8j5cQl33rJ93u9Eeual8PftAuN3aZ00fbH0G+HT+yNfpy3P+0quFSBmHibLsyULgxOk0mcSjhDRr28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070847; c=relaxed/simple;
	bh=PAZtWAN2KXcJZD7/+GRucZaV1mlBN/m2M2sQSznJBTs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=cLppEIK5xsh/10f3fr8tjZenOtn59u4D7YqQ7BVp526nSWJdHUTj2qkVb3OdzG+e+NIs1fAuxnrbktwIDJ9IVtmJEZfnecPS/wqfcA+Q3U3ABlLlHQWz0OJSN90MDzCAZmV2RsHEclJNSpZIoMC2wTC8QVz6xGVIWj+o6tRP+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBoYJCf5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBoYJCf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E379BC4CEF7;
	Mon,  9 Mar 2026 15:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773070846;
	bh=PAZtWAN2KXcJZD7/+GRucZaV1mlBN/m2M2sQSznJBTs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=YBoYJCf5n3qeMJbCX+q02URKqcH0Zp1vdaoDvCdqaUhChNeqctktQVkt7x6Sjoy9E
	 YqCr4mz7cvTkCE9lM/gZxrrcJg3Cvt4haSVqOSZ0xxiD6tFD+LkZeqEuAbcDoQH3sL
	 3PrRLMiQHHfImkUf6Qy0zsKqCgcirHTKzr/4TrSdGB8aivQTVaOIZC3ry10EVKa0tz
	 kONfIfrhQJPOO/AWYCQW3nV8CgWGUBCxmECRhLkviIu2ElTPFLAAOzqrWEgK6WCVk2
	 s1CpFKBc1QmQ3xlNYYgi3ySEJbPqumHAgqCWhBS085mq2C80X5vQp8VH786pOGkUEn
	 xA5qJyPDORRCw==
Message-ID: <92644dec70015171f22b9e7ad4d9386f@kernel.org>
Date: Mon, 09 Mar 2026 15:40:43 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v10 21/22] drm/tests: bridge: Add test for HDMI output
 bus formats helper
In-Reply-To: <20260305-color-format-v10-21-a58c68a11868@collabora.com>
References: <20260305-color-format-v10-21-a58c68a11868@collabora.com>
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

On Thu, 5 Mar 2026 15:19:47 +0100, Nicolas Frattaroli wrote:
> The common atomic_get_output_bus_fmts helper for HDMI bridge connectors,
> called drm_atomic_helper_bridge_get_hdmi_output_bus_fmts, should return
> an array of output bus formats depending on the supported formats of the
> connector, and the current output BPC.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
