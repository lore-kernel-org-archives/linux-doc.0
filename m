Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2163BB101
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493890; cv=none; b=UZPg3BMps1zkYj4fmfT7ZPZ8FHKoNzDIqpYxQV16lzilDixBn8o1WnuUw7OvKKdgfUm/sHC27nwSn29Exs6kHlZHG3wibtQCR6tiGn9rxenXuNAgfZfY82qCWoPOSrWUfxT3wSGxan52ghv6RFZSf8wDRw/uL9xZRvaZFgbY5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493890; c=relaxed/simple;
	bh=xW52c19N5B0HvZg2cdXK0xUYydDV2eqSHfBDqEmAAMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEeJH8KSrhroKKlS+VQpCUwv63ktOVwCqeye7HTrdNmR/3eefviZOOreXc16n/Ac2rNOjvPg2hSSPUK2TCUnegRRFDeJu2NoZjepqh4uhPym7+/eLSA7jIWJogkYDobV8nDdZMpBEZVWuw7irYuUh5olotlNIl8wp2JPbvw+Ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ55nWSK; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ55nWSK"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so1736426f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493887; x=1791098687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wPh+dtt+m4rUtWUI4XkAPhzEPZyJ9dGfUwWmb4GXO8Y=;
        b=BQ55nWSKrpTHmUm0z1gVVbtsBydrsfEvgK/o8R8bIbln5o09Tlu2GaHL4VXYaaUvIM
         6iZmTztkrytjpnGxjvL3YbyzGuj97FrVPAwJjz5wvL0k0h6BzGIG16+N8dq228IijuZ4
         dZMfOX6T47i9g9DDqN3HDUYePe3sbu3//Orx7oG7MAmXT4kAkOYRGDhYJGKAIEa6DX4/
         QmPvBimoCLyQFosA3IZ02Z1Pc+EJGQlpPxFod7/5MW+XLPz1moNpS+PY8Kd0fGsxgd8x
         uUjLz3EtPo0mMWqB54glEFxh+ZNEUzPfa7+xVnZccmYMw3whaBDiKGK3sT9QqC7OIYNn
         gbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493887; x=1791098687;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPh+dtt+m4rUtWUI4XkAPhzEPZyJ9dGfUwWmb4GXO8Y=;
        b=1K0YcSDJDcRraRseHnVJdfBpc6m2w2c+zH7+7PHcye6Q6HNRCAyyNGSqjfbaiz0ZCc
         QXEQAN6ccDUAcM2BuS1uvK+qv0CxCYGARTwChZZ1lIIHydyhjowCnzMvOsEK8MP9bN4m
         9fx4SJSRp0cMvx8HqaW7acNK41l+OCADdmWOXmVoDO4cPUHb5Wg267VWEL6JgX8Hs6gH
         5P3PLiH9FwGOLezTXDCPO+vHeUtQ8wy78Tr65qUpsZvXbAiTnITAimSKJen9g90lxZpJ
         OT8S+QVgVnVLvCQ/oxsOewMf8Bzt6nO1RemkVFgAvwavuEjgfp2Ue+7Zk/Vj9xQXXWgd
         7TTg==
X-Forwarded-Encrypted: i=1; AKwUvBwPPlUnogD/zKPyKeC/2mTWpcan3OQ5qtosaDuTBQsGakkGmsHVoi8SeeR0bk3KGuPBLGMHfQtXafg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsrrw1GFnzp1RWpLWw6JhKJ87eExucv3qZdIzqgakldJsEoKWl
	3CA4Du+d8uQG6Y1xI+RL2mbBUm10nNBo+4gMR2R52bJoCxOkZhGVvWA=
X-Gm-Gg: AYBFou2+I3Va4H3kr6a8NGXr4bq/DkuG+fshuRauu61WOJ0wHegYGUT1GMBpnLHLYeT
	2hzP5Epx5aKYkS27MB4HpUaDrc2D0d/TCQ/rJvMkd1ynlxO8K2Op5RukLWfjf3ZijnkUnv0/tjp
	1DWf8JW/1xMsCtirUFm2xe8s0su6p8AGon55Sr/t8xi8JTcBdRw1Qd+nY/X7ef4Q8/tCmb4pXYG
	AZG4nkCfx+vGAh3WGplQlNOC+WGPcCR8gr/vBbYji0u/22oL+K5MEZEBkhzt3nzw+m2q4dvv1gk
	C2K72+tgQfudDEVaGN/hdLLL0kKDm+RGT0weBwWD71FIkmldK9lc1bFjyPa52m9ENu20xu+bZOx
	0j/m+/35PbFTteFtUHaINrL4EJV3coYvIBscg09lMs1ShF7jYrFPB+Xda0qZqWOzW6UeInyOGVt
	0BGJCAqRIhdlWFFVDrQIBwpqAveXGKgS0sDVV0HImgFQfQJjEc5t5P/bpuFeKR8Tob+OozjI2D3
	Bz35Celak4SNZP4JxgYalcclFmHSIsn1FqejXNLZ4usbZI=
X-Received: by 2002:a05:6000:60b:b0:487:c99:8bec with SMTP id ffacd0b85a97d-488717147f1mr17887685f8f.3.1790493887392;
        Sun, 27 Sep 2026 00:24:47 -0700 (PDT)
Received: from localhost.localdomain ([31.223.3.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm18263754f8f.34.2026.09.27.00.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:24:47 -0700 (PDT)
From: "=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?=" <habilerenturker@gmail.com>
X-Google-Original-From: =?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
To: corbet@lwn.net,
	clemens@ladisch.de,
	tglx@kernel.org
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>
Subject: [PATCH v3 2/2] docs: timers: hpet: Document userspace API and ioctl commands
Date: Sun, 27 Sep 2026 10:23:16 +0300
Message-ID: <20260927072425.7892-3-habilerenturker@hotmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927072425.7892-1-habilerenturker@hotmail.com>
References: <87jyo74rbv.fsf@trenco.lwn.net>
 <20260927072425.7892-1-habilerenturker@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a dedicated 'Userspace API and ioctl Commands' section to clearly
document the supported ioctl interfaces extrapolated from
include/uapi/linux/hpet.h, including the layout of struct hpet_info.

Assisted-by: Google Gemini
Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
---
 Documentation/timers/hpet.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/timers/hpet.rst b/Documentation/timers/hpet.rst
index 8bb51d971..007e906ae 100644
--- a/Documentation/timers/hpet.rst
+++ b/Documentation/timers/hpet.rst
@@ -28,3 +28,32 @@ initialization.  An example of this initialization can be found in
 The driver provides a userspace API which resembles the API found in the
 RTC driver framework.  An example user space program is provided in
 ``samples/timers/hpet_example.c``
+
+Userspace API and ioctl Commands
+================================
+
+* ``HPET_IE_ON`` / ``HPET_IE_OFF``
+  Enables or disables the interrupt generation for the timer channel.
+
+* ``HPET_INFO``
+  It is used to query the capabilities and current status of the HPET. 
+  When the ioctl call is made, the kernel populates the ``struct hpet_info`` 
+  structure and returns it to userspace:
+
+  .. code-block:: c
+
+     struct hpet_info {
+         unsigned long hi_ireqfreq;	/* Hz */
+         unsigned long hi_flags;	/* information */
+         unsigned short hi_hpet;
+         unsigned short hi_timer;
+     };
+
+* ``HPET_EPI`` / ``HPET_DPI``
+  Enables or disables periodic interrupts. When activated, the timer 
+  triggers continuously at the specified frequency.
+
+* ``HPET_IRQFREQ``
+  Sets the interrupt frequency for the periodic timer. This request 
+  takes an unsigned long argument specifying the desired frequency in Hz.
+
-- 
2.47.3

