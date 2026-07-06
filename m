Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ACF3B6BF7
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349324; cv=none; b=sflAWxHcXIOOI7nN4JznSzsV6sSJh4Phsta2vYLE4GLaYZpT4Zf8wfn2668h/WUNXfHGlTWevbxxlcPZ++Y19qq11qDFaQ74N9rah5U7obHOibanAe1nWDqleaRsYYaFZCJtGuyZMjoM3ivE0epIz0L9oqS/ROo9pp7GOe/28DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349324; c=relaxed/simple;
	bh=04e/Vb8TzD7k0lpyz3v8T9K3xjbwU9F9Cf26pX1gqJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pykNmlcEvpOCsMu1SpA3L7bun81eOAfweUtZALkW29MBQmC/Cp0ffw/8zBM6+ME9c/VknDq4ymiSbpznQra2IHNi7fDvSy4bNdx8djHk9Fj726zqedP1LXXz3SAnlVyhWRI04sCtho1cWLZzV/SJ16umXkUipWrKErLMHBXVSbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Cg0jXF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Cg0jXF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso3511271f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349321; x=1783954121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=T0Cg0jXFiW/sf7z4mQpBgSbQzSJk/K87jJ/pxWbWn33Gsuk00e5xQoSjUSfwOtiWW+
         /q6IfG688t8dfc4UZfRdgzLEatU7NV3hiONzWU2gX7/cIrvNVHRkpEZgwJNeLEeI6iWw
         eEn+4Q4olvk/WJSORVqc1UQfPy5hSiDpUUxnidRNUoKQfRpoFLZk3F6IAjecTxPdEa59
         GlAuBCwo9iNwpUbuQCuFgmRiJd0X5YzGlJtEylfpV+x0kxF2Ujv4zaCUJrxxm9UtupTq
         b5uzHiy2bI0nXZWz5rCFjy+sv2W5a4f45kQavuXpzNFWlMyxd9d9hOXIzy9epJX3u/Wz
         wvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349321; x=1783954121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=Kkp+OsvwzqBiedR5GqDfyq/nMu7tuKpxiwdkncs6cB0QXrvfFT/Ge93+LcssMxTIZz
         uARZk3z+QcoZuvSc+4YPbrBdKJFOfsIDJ/31scyq+vQ8hSBsZzIU08XHouj05qDrbCnf
         yrO+3vI6rFfpuH6mNlDV9Hrq4n7MAsYKajieIru3WNhfMYsL4Wv2EBsvzvo25uBuB2Zt
         z6rj27IVCZYpYbmrfIIBcgyQmXsb6DMUIuD4xw2Jk+7AYkwmmuwRsGEA1nnr81ashMQO
         RQi+J/eqLOx6Yd6ny4qYgHJoGePGm+DFqPz3PhF0yaJLMZGiGHCOeeW12t67J0I1xJFK
         5FBg==
X-Forwarded-Encrypted: i=1; AHgh+RqNz+xmOK6y9gNDk51bQ4WkvqsEswBLQJnsPL+IZ0xjRjjitqra0N0zCG0/tHodYYjdS0sIEDns0ag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6cMQpd5/dUmP+dX0a+pPWgO/1GlKoWiOYg29HOrWynIWG9SLW
	pE6aMoMSgvSJzfxm+5AED1JIYCFwYI656gPjxmW3NyfNnf5C+QyuJukE
X-Gm-Gg: AfdE7ckL+JFxORfJxoT6WX2UKL4SbY3sNkob0EbppalELH7WhPN9vY5tllXZLW6aBiw
	/4MbQE5u46ARefnE8tyk9j2DsMhGoOQ2aiD17LAWkTIh6RTGmTY5cH/b9QV0LfB+E0uHMPwweZq
	vEDQ+nbqDd62UK/Ut0Nvp9N8JPQQ8ztyWCPUeaexFOLMHphXGn9MHv8JHeCeuM83i+vKfMhpe+r
	pS94OkhW8BFezKQ9OKHREsYa5MCqQH7EslCSevZcBkt132pDd4Qa1I2NsBb4QaTUjw1rFKiTWCe
	iG+nWZbMqBX6QoWRK08SYlxqvT6V1frOJWVUE36U3sQjL8iQmpgw7wPbaBun+EqXD3tOCetOKzU
	6FtUvfNxuX1D4yUp+rrKjoHU0UEba8oM8KdXQOrUKxrf+Z6BRyDpgNJeLk84VTA7qxU3M2dJ4cF
	Jh4axYtalNlnGxVmyTk3SojYE=
X-Received: by 2002:a5d:6541:0:b0:478:2698:72f8 with SMTP id ffacd0b85a97d-47de66e581amr498285f8f.49.1783349320613;
        Mon, 06 Jul 2026 07:48:40 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:39 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Date: Mon,  6 Jul 2026 17:48:27 +0300
Message-Id: <20260706144828.3517631-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation describing how the NPCM watchdog driver reports reset
causes through bootstatus on NPCM750 and NPCM845 systems.

Document the reset flag mapping, the watchdog instance mapping for
WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
sysfs bootstatus reporting when watchdog sysfs support is enabled.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/watchdog/index.rst    |  1 +
 Documentation/watchdog/npcm_wdt.rst | 71 +++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index dbc702b31a43..eb9e76275fa0 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -25,4 +25,5 @@ Driver specific
     hpwdt
     ics-wdt
     mlx-wdt
+    npcm_wdt
     pcwd-watchdog
diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchdog/npcm_wdt.rst
new file mode 100644
index 000000000000..cdc45ade9e0d
--- /dev/null
+++ b/Documentation/watchdog/npcm_wdt.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+NPCM Watchdog
+=============
+
+The NPCM watchdog driver can report reset-cause information on
+``nuvoton,npcm750-wdt`` and ``nuvoton,npcm845-wdt`` systems.
+
+Userspace can read the latched reset cause through
+``WDIOC_GETBOOTSTATUS``. When ``CONFIG_WATCHDOG_SYSFS`` is enabled, the
+same value is also visible through ``/sys/class/watchdog/watchdogN/bootstatus``.
+
+The mapping is fixed in the driver. It exposes the SoC reset indications
+through the generic watchdog bootstatus flags and is not configurable from
+Device Tree.
+
+.. list-table:: Reset-cause mapping
+   :header-rows: 1
+
+   * - Platform
+     - Reset indication
+     - Bootstatus flag
+     - Reported meaning
+   * - NPCM750 and NPCM845
+     - ``PORST``
+     - ``WDIOF_OVERHEAT``
+     - power-on reset
+   * - NPCM750 and NPCM845
+     - ``CORST``
+     - ``WDIOF_FANFAULT``
+     - core reset
+   * - NPCM750 and NPCM845
+     - ``SWR1RST``
+     - ``WDIOF_EXTERN1``
+     - software reset source 1
+   * - NPCM750 and NPCM845
+     - ``SWR2RST``
+     - ``WDIOF_EXTERN2``
+     - software reset source 2
+   * - NPCM750 and NPCM845
+     - ``SWR3RST``
+     - ``WDIOF_POWERUNDER``
+     - software reset source 3
+   * - NPCM750
+     - ``SWR4RST``
+     - ``WDIOF_POWEROVER``
+     - software reset source 4
+   * - NPCM845
+     - ``TIP reset`` (``INTCR2[25]``)
+     - ``WDIOF_POWEROVER``
+     - TIP reset
+
+``WDIOF_CARDRESET`` is reported only for the watchdog instance whose own
+reset-status bit is latched. On systems with three watchdog instances, this
+maps ``WD0RST``, ``WD1RST``, and ``WD2RST`` to ``watchdog0``, ``watchdog1``,
+and ``watchdog2`` respectively.
+
+The driver may report ``WDIOF_CARDRESET`` together with one or more of the
+reset-cause flags listed above.
+
+On NPCM750, the driver samples ``RESSR``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD2`` so later watchdog
+probes can report the same boot-time state.
+
+On NPCM845, the driver samples ``INTCR2``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD10`` so later watchdog
+probes can report the same boot-time state.
+
+The WPCM450 watchdog continues to operate without this reset-indication
+mapping.
-- 
2.34.1

