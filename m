Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE46C3BBA0D;
	Tue, 10 Mar 2026 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158855; cv=none; b=DXo+s6wnGxOnMwlUEGifxG35f/UCUN/NwjzgiLo5y2Caw/T7IGQ/XkX2ZLQ6Gs10VEhDspakIY2pxZd9kVCYmvV5f1kRRpDxowrUZJBcRQpeZHfmSlneCx88bPwYshjiRX78TZkEHjoGx5psgJ/UKEbLtkmGTb/9xeQciHaES6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158855; c=relaxed/simple;
	bh=ZCmJ88Jg/R0ZaGWt4Lbnf1PZ95HMiD+1w0SbJAg/htU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5hrHJUd/HfUjQQ3Ot4Gt/Xd4ZxIud/RvLcSCc7uHYsq9EQ81ikLSelCqNHfiY71Bpkw7vzigfZG03Xf8eBtuzQg8vLkix1UR2yDHe8cCB0I03fjNZu3INBWYk9P+8uJyjRD3gvP7k/Mtn8XHTHWp5c4wWzmcSPNtVt4XBsjziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bw+d62D+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bw+d62D+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5D2C19425;
	Tue, 10 Mar 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158855;
	bh=ZCmJ88Jg/R0ZaGWt4Lbnf1PZ95HMiD+1w0SbJAg/htU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bw+d62D+2HAfYfotFT6pc35QvkZrS8flNObZOziMsggFtGfJbJnB2pfiMwiMAz+8+
	 r3E20RdKJcwhBUFxLQFlbpf6uQfJefqiC3wnPVF+ozMqc3Xz24yiglkfk8A2/A0j00
	 pCz0LzxoHaCnDb5Fyh2yluwsVOevkBhv6AlF9tvJsU7cjuFvZjHZgZp50sjYkpjaPy
	 tEFyO2VsaHwdTMe2jGTpmu77LazbVtVyPEeGdIXvq5a9gtIvd4hYVRU754kiem9v3m
	 KNdahupPURYGu709tA5kxe0hZnNVsR8LUPobsKZz/KWdw4G61VXWtl7JYQwchyvH5a
	 R/TeGn5EssIYQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:01 +0100
Subject: [PATCH 09/14] drm/drv: Call drm_mode_config_create_state() by
 default
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-9-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZCmJ88Jg/R0ZaGWt4Lbnf1PZ95HMiD+1w0SbJAg/htU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJf36mdZLL85p/vFqdry3oYvaR9CN05a3Dq/zeNy7
 JZnLDlsHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiW3YyNhyWOHdoznL3PbG5
 4QxHrNN9uiSPpa18E/J56ueunDpmocWWAUwCM5ijrvEb3+C7+s67k7HhL48upybDoeDUXn33wsY
 Vq6Xf8+9W4U2NudoTzcQh7Xj7tY2J8aatp3v4+75U8vB6vgIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Almost all drivers, and our documented skeleton, call
drm_mode_config_reset() prior to calling drm_dev_register() to
initialize its DRM object states.

Now that we have drm_mode_config_create_state() to create that initial
state if it doesn't exist, we can call it directly in
drm_dev_register(). That way, we know that the initial atomic state will
always be allocated without any boilerplate.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
 		ret = drm_modeset_register_all(dev);
 		if (ret)
 			goto err_unload;
+
+		ret = drm_mode_config_create_state(dev);
+		if (ret)
+			goto err_unload;
 	}
 	drm_panic_register(dev);
 	drm_client_sysrq_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",

-- 
2.53.0

