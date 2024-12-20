Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA0919D88B;
	Fri, 20 Dec 2024 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734679822; cv=none; b=OefJWds3cry9zFJ9/1tq6TUX0b1XK8qpIkqIIZz+JbOEHJOPQDLaprAlFU7IAzbeyQLLd+HyyoFOLH4pl9/UAmfjq39S/GBEbmsgfrglxWPSTl+0QVYK4ymuB8lQR+AF9ZnNqqeJO/RcD/o0c9P1b3Gg1WuEH40IHGK0b+xrWlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734679822; c=relaxed/simple;
	bh=fAT8ASg3ViXCQ79QuPRFMqvR1E5z2fvyF5UYulgSbrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZUCQQ8Oz1UIPsm5DMpHu92dKgnGGoCbd5eR0ClBrRDfc1GkgFJ06kvmviCf9lEpdD+IjELL1kAsFKcu/+zybLKccO5nZPMEW/ppB9r5L67hjDzWhPdU9xl/GmY5NaVhymOpsh7gDtXcC19WuOFzkUjy7PGfVNUIDn5AjcBgOLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QElZ+k/5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QElZ+k/5"
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B0DB4D4;
	Fri, 20 Dec 2024 08:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734679778;
	bh=fAT8ASg3ViXCQ79QuPRFMqvR1E5z2fvyF5UYulgSbrE=;
	h=From:Date:Subject:To:Cc:From;
	b=QElZ+k/5PGjLgZmmhrUEhvC/u1JCLUiiX1Yp/QuT4LQEDkz6kUByO+KSP6aYRl41q
	 qWKOnRCedDOleW0sW9ehbs8P/rbCYqAQPnb7uKALS/C6UU2wAhpHWxXb2wvQoL9Ed9
	 egKNlM8lEnmyFR7ndg4oYZO2+9DyJh81nrDP3+XU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 20 Dec 2024 09:29:40 +0200
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: Fix kernel doc
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-xilinx-dp-audio-doc-fix-v1-1-cc488996e463@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAOQcZWcC/x2MQQqAIBAAvxJ7bkGXMuor0SF0q4VQUQoh+nvSc
 QZmHsichDNMzQOJb8kSfAXdNmCP1e+M4ioDKeo0kcIip/iCLuJ6OQnogsVNCirTa0Wj0YYHqHV
 MXPV/npf3/QBudexDaQAAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>, 
 Vishal Sagar <vishal.sagar@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=fAT8ASg3ViXCQ79QuPRFMqvR1E5z2fvyF5UYulgSbrE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnZR0EBS6sDhJBZMeydtixlq2kEKFKXkr/tY3uv
 A95KZPbT+KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2UdBAAKCRD6PaqMvJYe
 9bKrD/9ByB3EZ0lZNkh4O44fFwTO4Tr5XDSkcwNT+1Ep0NST2BlUgoNbQZvqYZSnkJpUAa2dpo6
 bGrjgAxRTkUJNmObLh4siTrPPCfzOuP0HPkWj20RPLIc3BsYFmh44PfrQWrZQH3JJwrR12Sim/r
 tGZBdo8luyqtJrCPThwN1U5pDVekzGSV2jtyuy1FL2dHlU91iczv7XCY8gV2Kt5OamUxXaz6wos
 ibtZ2040+bRH9udk7ffBWqAS/TyafYVhD4N9SUtEKzcMxkqLDUsLgNuWgxRaFdqo9VB7uemKBDT
 lp/uzccXvAF75Z4++mAgsxrhYZOyv77LHj8KTsu8U6NVLE8rTRjbecxmFWat1pXM9EtBdTjnjN6
 UlzevpvRche0r7LPQ5LUES/aquX/SFiK/Iqx7KfKkFzasjREY5NQW7fAxJRf2i2B16z0C7bRyuU
 X6XtUiffrdMqNg+EaMYhGucIA9rUoeiqjG66XEuD3LCRvusJvfczH5UWOiPfr1rr64RHmjp8jUu
 PUm8V9CJBfPwO4HNnjiHWIRGiLk2nPdOCGj7hoUCbrv88ZPFf1JMeGwelIwttO/0um63Uuo2N0C
 lysHSrcPbq+OhGIpS/hCwSVPmD6rttExjDcKa+JsWxX0LXt7bRT2VfGcw1hAv72/UUTrjMzMjCT
 7p8qGp3lUUCJbfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix two kernel doc warnings introduced by the recent DP audio patch:

- Add a doc line for the new "audio" field
- Remove a reference to zynqmp_dpsub.c from zynqmp.rst, as the .c file
  no longer has structured comments

Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
Closes: https://lore.kernel.org/all/20241220154208.720d990b@canb.auug.org.au/
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 Documentation/gpu/zynqmp.rst        | 2 --
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/gpu/zynqmp.rst b/Documentation/gpu/zynqmp.rst
index f57bfa0ad6ec..1a6f9193de22 100644
--- a/Documentation/gpu/zynqmp.rst
+++ b/Documentation/gpu/zynqmp.rst
@@ -144,6 +144,4 @@ Internals
 
 .. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dp.c
 
-.. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_dpsub.c
-
 .. kernel-doc:: drivers/gpu/drm/xlnx/zynqmp_kms.c
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 49875529c2a4..d771b8b199e0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -60,6 +60,7 @@ struct zynqmp_dpsub_audio;
  * @layers: Video and graphics layers
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
+ * @audio: DP audio data
  */
 struct zynqmp_dpsub {
 	struct device *dev;

---
base-commit: 74ef9527bd87ead62deabe749a6d867af748d448
change-id: 20241220-xilinx-dp-audio-doc-fix-0651029616e7

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

