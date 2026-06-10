Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F937F741;
	Wed, 10 Jun 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092485; cv=none; b=FAYFRsDOaHlccRy3yiCEd/dXYqNlIktdsXs1qPRzCcQEut25rW7oZ+mS60ZyD/sercoIziI+jG64JKLoBGd8mxDziBUYiQoDlYaLaXdFJbCKUUPDf80AZBz6kgGAdGf9OZaq/Uadopcj1KjU1ZY0FbcDCQlRcZoVXmCX0BLQ+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092485; c=relaxed/simple;
	bh=IBdSvbniv45jCKX2cc9fNGt2KfPPluvYcMxmenPPBM0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B9LiYWEyYC3ThlCg5MPKR8sDgxAqRvd545Z4OYElndKglPmSBMezgsF0cHxxmOL2W8LaLpRI+PX53MHhxCNwCYzRxp6LpTY74Rr0bwJFYn9wLiwO1nSYZRQcg4hOj7PmK2QRcnEBkLOJ5iog//8cB+GzqH8zt30OM3/hsX80H9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8m9eQ+P; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8m9eQ+P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092485; x=1812628485;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IBdSvbniv45jCKX2cc9fNGt2KfPPluvYcMxmenPPBM0=;
  b=a8m9eQ+PQeVhlZTCMjGLPcA2Y9U2Aw912dTp4B+8MOslLy51AuWkbKtU
   MBow95YbLgz+BaMoPWLBeB7YmLCbYg1wbbfOVynoBb84fkXCanK+SIJfr
   XGasThfEMrSvY/sDXk4w7zw+rn29XUHFEpqVtkGYWFBug1XM4P0jjJpHU
   1JShHhInuxRKbxhmAs6R7cnNKx21NcO1R90rPZwEm5xPK+bs77TnyeWkS
   3UvzjdUJQrBQ1FaqMokDLsZllB0zyEBHZ0hGkEHfR6sUN5gGjrTgM7AC+
   alGy5IvFrcbRAhaGiSNLEjkHq+OUHzx4xv4KYo/zD7jm58rrRv6sF3WkE
   A==;
X-CSE-ConnectionGUID: 84PuWs8WTzSmbhnvtcmnZg==
X-CSE-MsgGUID: IplfI+8KTVW0YKWIppx3cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81789855"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81789855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:54:44 -0700
X-CSE-ConnectionGUID: YLk1Sbj9TlyqNzCagqc0RQ==
X-CSE-MsgGUID: /M4SHBnES7ybbKKuTAV9eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250439091"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:54:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Daniel Stone
 <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v17 21/28] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
In-Reply-To: <gnicb4WkT1S4aQIC2G_naw@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
 <20260609-color-format-v17-21-35739b5782cc@collabora.com>
 <04ff70850213ae0f75486b1a27a7edb6fb4e71c3@intel.com>
 <gnicb4WkT1S4aQIC2G_naw@collabora.com>
Date: Wed, 10 Jun 2026 14:54:29 +0300
Message-ID: <596f0f063d6ef2ffb4c6640e3df5ed89d95b11dd@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 10 Jun 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> If you don't want __maybe_unused, then sure, I'll move them into a new
> .c file. Though I think the two are roughly equivalent in that I don't
> think anyone is really trying to minimise the size of their KUnit
> binaries.

I think placing arrays in headers is bad practice, and we shouldn't set
that example, kunit or not.

> I'll send a patch to move them to a .c

Thanks.

BR,
Jani.


-- 
Jani Nikula, Intel
