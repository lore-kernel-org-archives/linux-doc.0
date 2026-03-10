Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1B3B8D70;
	Tue, 10 Mar 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158838; cv=none; b=HcinoZPNh9W0rgue9aS+jm4uhdeS43f2AyTXd2unG+UzzDOKoGAEmsxgSdIPlyHSg2A9wNWWqJ0NVrdjHq08qBMQjj78ykJj+iQdZb+X/zCu68B8acGi5Ya0qTD/o+Hb/IA6ZHQW7st7VaAUib8ymkg4+n9BheNDZYI3pPWgX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158838; c=relaxed/simple;
	bh=pWJGn98h8ZYkxcFli5V1DyhaDv4pkkzV67j693vyn2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7JUE1PDsIjjxWbYxWDDOAkplQcnnfD1jwxcjVDHcWAQ+ePTFLZz1QtY0M0uaEFQ3NxtdaeVr43Pl2LsaoODcjEdh9QQ1EPQqaxoUNpfUlz0XLjuS/6OuBYjnIr5GdnfhPD56tm7LMkVICb39MPY0o7GZuJ9vJFMxSbsuZxE7hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQ+hiVNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQ+hiVNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83836C2BC9E;
	Tue, 10 Mar 2026 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158837;
	bh=pWJGn98h8ZYkxcFli5V1DyhaDv4pkkzV67j693vyn2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hQ+hiVNun7GjFJ85s1FfxfbbCC430nUHV39Z4fFcoYjSx7hET3byrGuEgNDe+BtSh
	 eQy0n3wbRILZL82Vgj6baY24O+MCF4nikjsaFzskgnXdbyEyHosEIe/TZWbY3xrr0N
	 t3eRCBevUcDqfRkkJuyAnt+bGhHgB5WkKUt3mpEobaPFnzJsILw1kcDRuP5kWZlLkh
	 ZuDVT6HMw0sWRmO9zd07yKGs4funAOZYqkasvJK0VLiQk62nTxvQSme7t90dxdOz46
	 FpYWxs0963CnrlN+z3mAllaZ6FYlSGs6LUmBtI7Iz0IAikBmrmhthgggjQLz9jCOJv
	 byKmQMwrV1kFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:55 +0100
Subject: [PATCH 03/14] drm/mode-config: Mention drm_mode_config_reset()
 culprits
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-3-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pWJGn98h8ZYkxcFli5V1DyhaDv4pkkzV67j693vyn2g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJfOPj3b1fOw1bqrBd3iy67cWGWWYsO9g0cjRbzcR
 fy4mGR/x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI/UTGhoU33j9m3rM9Yo7/
 pUU2Ms9Onf0r+jj8VP+f93s/cFls/flZmfO/1MveqCyBHRYlwidmsDA2zC64f4vh/E1XDpHHjs7
 l/8/fn8/ze3/Y4RDV/gUn6kMlPToOqO89suHBbvuuV3aPFmt/AQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has the expectation that drm_private_states are
not reset.

This is especially significant for the DP MST and tunneling code that
expect to be preserved across a suspend/resume cycle, where
drm_mode_config_reset() is also used.

Let's document this expectation.

Link: https://lore.kernel.org/dri-devel/aOaQLx-7EpsHRwkH@ideak-desk/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 84ae8a23a36786705fea7c0eafd7f20813b7c8f9..54c27376f9894ef5eee378bb5b1e5fc7049de922 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -187,10 +187,14 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
  * callback. Drivers can use this in e.g. their driver load or resume code to
  * reset hardware and software state.
+ *
+ * It's worth noting that @drm_private_obj structures are expected to be
+ * stable across suspend/resume cycles, and @drm_mode_config_reset()
+ * will not affect these structures.
  */
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
 	struct drm_colorop *colorop;

-- 
2.53.0

