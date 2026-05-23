Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2BD33D6E6;
	Sat, 23 May 2026 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565765; cv=pass; b=jVsR8RU3X/tsTUwxk8tK702T1CRAQ83Iu1KnilemqAmS8Rkbc7MQLRWqoQhQAnMfLdgzjJplCYBOGFDuw6gCI0CoWmV8VHMpinb3hyXTnMPuHYCF547GbMVbG4dUyI+1QMsYyPceIehWEOyrzFTsYOYGx2pbMSDfTlsc2RTnjx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565765; c=relaxed/simple;
	bh=SzB+VQqu5xtkzjb34ltqNeBCTQdZiV9iNLlZ/29ra6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alFyKhkYxyXtQ4moAy1TnQYMfeHpZu7KiB/7jFcTZTMnjK2UZo4U5f9To+edtcF+e9An2OjXUaHEgwSGJlGrmd/Jr+KG9cNS57HxxWVh0+lgB/qYQsKmwCqjCsfKIcp+n8m9kbPof7ADkNta/5KT46B6hzmzGsXGtHyA7WTNOWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=DHJpKuP0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="DHJpKuP0"
ARC-Seal: i=1; a=rsa-sha256; t=1779565726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YivRdyVdIUyefuyRo7wM018X8HLm1qVWQ9Hbl73R7Qb+sM4fwrqfQrccVXONNbNPudCu7CKKmlAOXzUTpT3sYqzgzK4coTMRVxwOxEOOA8US0QS1MMiUZ87iugfBWw7V8SKrB7P0T/JejsY0OyEEyyoGsUW7R/bqVUzYM+a4fLo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565726; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=26EFTuIhlqnsc4uUzyuaHx+9wSdJArl+zaLC9veBaX4=; 
	b=BXYniJO0Clx+DFYzVCJmbmcziRtNTI6T9eHiSp+LkDpp3YMyKJC/arcT1M2JJFUSpyD6zNlVOpiLO5JKxnHQyizdwMcLLRs/TsjYRPO00CxyqBxwH8p6mRKnVvWo/Vd2OyxzMuSVBt2TZXV7oNIjQeaeAKlR+wxIk39hOsLdrpY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565726;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=26EFTuIhlqnsc4uUzyuaHx+9wSdJArl+zaLC9veBaX4=;
	b=DHJpKuP0sXDC1x7Nl/iQacLFQF9x8ET0NvL/bls/uu+59nJ9K7HxFhCJAKCosk3o
	Ck9w5iITProSiAUZVc8NkadC5s7XzRbD/IHjRW5WWH4gjcaqojvM6UreaNhIdQHEJ7E
	lJlHd5ZnXFDWpvR5Cj5oNOif8XII3xByZGWaQFlQ=
Received: by mx.zohomail.com with SMTPS id 177956572445825.918389143356876;
	Sat, 23 May 2026 12:48:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:44:03 +0200
Subject: [PATCH v16 28/28] drm/connector: Update docs of "colorspace" for
 color format prop
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-28-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

The colorspace property's documentation states that BT2020_RGB and
BT2020_YCC are equivalent, and the output format depends on the driver.

Now that there is a "color format" property that userspace can use to
explicitly set a format, update the colorspace docs to mention this.

The behaviour here is not changed for userspace that doesn't know about
the color format property yet, as the color format property defaults to
"AUTO", where the choice of output format is left up to drivers.

Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b91c1f76355e..52f9a6a8daf7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2573,7 +2573,8 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *		conversion matrix and convert to the appropriate quantization
  *		range.
  *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
- *		driver chooses between RGB and YCbCr on its own.
+ *		driver chooses between RGB and YCbCr based on the color format
+ *		property.
  *
  *	SMPTE_170M_YCC:
  *	BT709_YCC:

-- 
2.54.0

