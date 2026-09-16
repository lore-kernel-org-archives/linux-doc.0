Received: from mail-ed2-f26.google.com (mail-ed2-f26.google.com [74.125.228.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B251E430
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572781; cv=none; b=V8CaR2oosw+/RwlJf9K/AmZ6lFwuO4w3d2PvxtHdEtIWz1+9TxB7qyi7ucTtcq+CmCtLBJVZY/2T62GDMLMbTjpdCZ5xiLPLC3rnZ7qbaku+95SKisP+QFuItepbCjUd7TU6qMWT/hDuVuu2B9cRFRg7RONR6Ao6eKzzdN+9uV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572781; c=relaxed/simple;
	bh=sUK+d0HwIPouiw4GF2YvY3hSuqBUYY7UDZVaeoPdCco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uurboB3jWry7DR0tmXiXeGhhnISdHo5TuSPpV9aybWegPbgCq5JszzBW4JQxqvQysqPTfzUlt32K5ZQoyul/Hou+MZDW8dNWaQQfvQVpdQT5cyzPe2JGTWovRGDNzYnCKKIbX+aJ8UDelgUs3TzhtDNnKifXX6Cyb9E+EIbmgOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrSF4YYm; arc=none smtp.client-ip=74.125.228.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrSF4YYm"
Received: by mail-ed2-f26.google.com with SMTP id 4fb4d7f45d1cf-6aa13e194easo1721846a12.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 08:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572772; x=1790177572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCHve4KAw17DJDENoy3wdVsGPjRR9u4ySMXlBrw/K6U=;
        b=hrSF4YYm8fCXcQzH3M9am8EXav+JsFDfD8g1Id9PWFaI/2Y5h5aNN6zy1e14NTTDD7
         tKx++o4Rfi+r+e0riV/p7V8HJe/O7hy+oOauiuWcTpMR+MuDirgPuEdQ49Mi+9lpERr8
         6Qx5QUjvDO0VqWGMAX3zlvGNfydi3UatZF+Xpdtq0hfVBVhIsS/aFQT5Ra0vPjP3ZGj7
         q6Q47AkxHuy3ylx0IlWQwoxUuNQ6WB6B3j2f5BhSMngNxPzSLiTNVJpg7R2vo6f/pyAK
         3ZmoPpCN4TBWLhQykjISERAM3ZcxoULNZTHL+B4MDcCx/KitUw4GVx6nVHtxKJDO+vfQ
         4W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572772; x=1790177572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCHve4KAw17DJDENoy3wdVsGPjRR9u4ySMXlBrw/K6U=;
        b=OJCpZkVLvWRV6VkJfeBSy9iIrxRYp51aQX0HLAKH7ZpUUQVrRn+M5+yf0TijsFFxMG
         hYKN82GITpGUS0MO0CXqA+s2q4LpFqwv+xatly7rcd07jRHc8BIHVZPodDPl+A4FVkYZ
         MpIUX/ylwi0p76DHDH5dygDnuxJPNVzM5ghKimhG9S2ajkfi3FwXydKBKP3XqTE2lb4i
         SEq5/u1YJn1kdhmfsgHmk/lV6S8jvCK0uNdXUoOmMug45QGJMONxUzn8nadxI2Nw2Ooq
         xi96EvA2aPu0gQ//lXclI3DTQI7X8EiO8MXn3DSIDoLGbKvjg4h0HmEiTEoDJH4WLq9b
         YWUA==
X-Gm-Message-State: AFuF++nhi0IcCPRTT9NWw98JVQUQqrmpoYJ67vttAsSRshL6rigWGt1V
	3Gv8VMstXbOOBquyssBHtzpi8Dj4ojB6dxtTY+FBEr3U6C2FUJxa+YQ3
X-Gm-Gg: AYBFou2h+0PorwpAlLl6sb2OqeeU/iW7zdiiPMWoJETf1XCQ6MnZXp+ldrQEqxQvMEI
	E8qhmm8k1Tt6N9k3SOLsrI2992ucTeMrPatIc8ff85vk3UxhytvGycV8Y5XirMGjXY6zfEr6X3s
	2SBpGmap1HckBd9RIrc2rszv4CR/lPWoDgSZMXvqMThXb5M5L5UsnSthudcAWnpiusMtjMW3TRc
	wtpTPQIs6SnOg4KeS8T8FgkGmL/c8G5+HrhqNwI4Y1zTxSeZbgFBXlNpF/nnknhtYT0yh7oLYf3
	OHUKTWsQjCJwKYcGfHKL4nAYYOSAV7mthaIoU9cDOJ6RoLGeTI4N7sJjTplKVITu1P3qccfiviz
	4f2UrmgddS9eJorgf5X8pQ1Uarh5bUuu1JZAnOvkdNlF/TZh2BkqaPJIsaWm/s+85c3mTiI0+R/
	os4wEI7ELYJPBtzovGskWvBIYUy42fE3BGxDDqltkiUXlmQZ7oAM80MIF9ke5z5i1L92FhtdOVR
	SK0LRAmBE6+sm3n1FfNh3vcuWIy5ItHOiiWQJBVvrKJy4CmTk+L
X-Received: by 2002:a05:6402:2498:b0:6a9:b87f:8ea3 with SMTP id 4fb4d7f45d1cf-6aa2244cd2amr2521242a12.45.1789572772441;
        Wed, 16 Sep 2026 08:32:52 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1cfe0562sm2067081a12.3.2026.09.16.08.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:32:51 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
X-Google-Original-From: Sagi Maimon <sagi.maimon@adtran.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v15 2/4] ptp: ocp: fix dpll cleanup on probe error
Date: Wed, 16 Sep 2026 18:32:40 +0300
Message-ID: <20260916153242.157171-3-sagi.maimon@adtran.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260916153242.157171-1-sagi.maimon@adtran.com>
References: <20260916153242.157171-1-sagi.maimon@adtran.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sagi Maimon <maimon.sagi@gmail.com>

Two problems on the dpll error paths in ptp_ocp_probe().

dpll_device_register() takes a second reference and stores bp as the
registration private data, and only dpll_device_unregister() drops it.
out_dpll dropped bp->tracker but never unregistered, so a dpll_pin_get()
or dpll_pin_register() failure left the device registered and visible to
userspace with a priv pointer into the storage devlink_free() releases a
few lines later, as well as leaking the registration object.

A failing dpll_device_register() jumped to the same label as the failing
dpll_device_get(), so the reference taken by dpll_device_get() was never
dropped either.  Give that case its own label.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 401b04f12d2b..f4299878c27c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5124,7 +5124,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
 	if (err)
-		goto out_devlink;
+		goto out_dpll_put;
 
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE,
@@ -5150,6 +5150,12 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
 		dpll_pin_put(bp->sma[i].dpll_pin, &bp->sma[i].tracker);
 	}
+	/* dpll_device_register() takes a second reference and stores bp; only
+	 * dpll_device_unregister() drops it.  Without this the device stays
+	 * visible with a priv pointer into storage devlink_free() will release.
+	 */
+	dpll_device_unregister(bp->dpll, &dpll_ops, bp);
+out_dpll_put:
 	dpll_device_put(bp->dpll, &bp->tracker);
 out_devlink:
 	devlink_unregister(devlink);
-- 
2.47.0

