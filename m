Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B5366049;
	Tue, 24 Mar 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368170; cv=pass; b=AjHSZTyUgIGYJmXpfEALu/9pHHMENA4nb4Uu1jtEqOUOa/vCFEZdwcwG9Du2y7zclC0/wpY3es+3GAsMqWn3HPLqIqo1BYDDAfCRwgo9Xs5idWEAu0M3gUNlUDGIZgJ5SokqN6ekqk0EhvKmgNhIGjIPrYxXtMDxxcRV86hmu+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368170; c=relaxed/simple;
	bh=lfc1JSLHA5xiRali01FFUu/ug3osumq0xJzCwJ+XDTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL9FIm2At2HLGL9Wat5cD6hmh1bcDhdzdGeciyN5Xmr0zns22fCxybPpf+Mg/yiJ68ZvCOF8xOihZu+H7LRM2Yjq6UaDCF+g75Q8eGzza72vWErCywcGXIyvNcP56gy2G21Rcsqheow80b1VSAaCejOsuNSnqYgNKoXH8k22O/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LJlyLDFO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LJlyLDFO"
ARC-Seal: i=1; a=rsa-sha256; t=1774368115; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gs08Bykwix8N+aOEMavV30rEtPtSY/Ije5NV9VZltQJvU5U7gD9/cfA83NdXi6LTwZtxuj9FMTtpEELDYmZwc2PDlo9JSBO0pFfXq8bh8xA525bBj7BeAAYVEBHwq8qwJkNht9qSH339PinYRTh7vPbmfuEgJfpRZ72A37BAdl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368115; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=; 
	b=VcgOPifWwYAxSd1ILFQ7Nh2a+HMl0D/qoJIYqZAHyBLtLsG+Li0d77Z8hOAVNu6HHJH+OlsT5hZ8pC7fC5gXR6uMnyR+6kmmPFWvTILJBtzWp28lfE6R18RnXhkSnM8pieTrk/nTpvHGlPkbJSwUAKemVWIpLzu1RWAEyf2Dc4Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368115;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PlS0fOKH4i7gWqyWLF6xhZ2wNtI3PN2yuFORKR59uLI=;
	b=LJlyLDFOboPVcRcYEGH9QS+kXdKpsKBZnrWfWQSfvg1CmeIETrG4ifEjy3kSFHUr
	StobU+HeJhDAD8e/8fb5QHJuTV4xlLxTexfjXZ66OufbcVGLzjM569qWeinVeNEniaf
	GXZ3SvTawPCQctgJDgqIwmgd0EByvSwJ/De8DFgM=
Received: by mx.zohomail.com with SMTPS id 17743681130400.836362593438821;
	Tue, 24 Mar 2026 09:01:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:06 +0100
Subject: [PATCH v11 02/22] drm/display: hdmi-state-helper: Use default case
 for unsupported formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-2-605559af4fb4@collabora.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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
X-Mailer: b4 0.15.0

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

