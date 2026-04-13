Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EFA35F167;
	Mon, 13 Apr 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074927; cv=pass; b=pMmfZm5yXrY+Q8BC4xwf8ycm615alDqHR8zvW483m5HW9FJf5VcD6y0YAaQ2DlLlXU3QNEwG05635NZ3F0x/rvAJ09apwcdmxY8lio6N/28BWmh0CTIN8gli7hnjKFcBPbKfP1T7WM8h70BbHlAQl7b2vejEl6Dbiz0YYKBpV6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074927; c=relaxed/simple;
	bh=lfc1JSLHA5xiRali01FFUu/ug3osumq0xJzCwJ+XDTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDR7jYSg7nvRQSILcHz0Jj4Ueq8xYPtxiRP3+FKCw9nHZCV+ToP/rw9qtzzjcu8waWH5Jro9wlQHTmTRdoDs3FZin5I00rCC50r3bzcxB2Sa9QGreaIzpsGFjdmbaNw6UTtxh1T2SI00vc5Zl64e141BadjvrSo2kgkcMgnGTaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=WLuNmRYk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="WLuNmRYk"
ARC-Seal: i=1; a=rsa-sha256; t=1776074881; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FxYCO1CVrQACGqOTr9Rcqx1O26gUet4kg6OIt1F3Ns+1kP18mrdM9wRQhMso80v6u7ny1RazPiznufN11G9qmx+262aGf0izINDoN1YVUutwhH6DnSAjTuQNQjHrehJUzjQRGdz703mKDITeqcBdi7rVXZvIYM+F1BjlEfAiC2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776074881; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=; 
	b=H45c6LGpG7qNlmUFoNXeTUWa/lyeTPA6/chA954CMhtx7xHLWrNbX8S2moU/KsQ+N3n6PHHPUeJRo25KPQwHN/n8CdxecykwLtiLHbELiF7v1KrsPpekMjhwZzVXZe5xclx3n3uIE3toeQojDM4Ro1zLKWSaDCfsNGkFlyvzdt0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776074881;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=;
	b=WLuNmRYkwvYYklFg2kJHpSOijmAz7k88TIxYuAeeSEB2U0qKLBAEe9/oQgZhjYs8
	CcRlmztuq85tsyRj3Hj6PqY50tJ9hooWLkSCnwKR3nFE9zKzWloyIO454gsKPPjFzdu
	ELNOFa9EYBkHfaWAkLn8AHdFiO4buuA5kSjmShKs=
Received: by mx.zohomail.com with SMTPS id 1776074878667643.7008965777513;
	Mon, 13 Apr 2026 03:07:58 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 13 Apr 2026 12:07:16 +0200
Subject: [PATCH v13 02/27] drm/display: hdmi-state-helper: Use default case
 for unsupported formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-color-format-v13-2-ab37d4dfba48@collabora.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
In-Reply-To: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2

Switch statements that do not handle all possible values of an
enumeration will generate a warning during compilation. In preparation
for adding a COUNT value to the end of the enum, this needs to be dealt
with.

Add a default case to sink_supports_format_bpc's DRM_OUTPUT_COLOR_FORMAT
switch statement, and move the log-and-return unknown pixel format
handling into it.

No functional change.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..a0d88701d236 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -541,10 +541,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
 
 		return true;
-	}
 
-	drm_dbg_kms(dev, "Unsupported pixel format.\n");
-	return false;
+	default:
+		drm_dbg_kms(dev, "Unsupported pixel format.\n");
+		return false;
+	}
 }
 
 static enum drm_mode_status

-- 
2.53.0

