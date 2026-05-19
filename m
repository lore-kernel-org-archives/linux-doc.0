Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D82237D137
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170999; cv=none; b=f+CRzYxVWckCkufuJBL2Qbwtn7Sw27JVLZk0hEVnGf7VgPuKepovhFJUqMRh3sLBx1BtaqJx53p4oTEbfFvJZqMRRxhISVG+WQ6HCGoCe8hXt8jxg4MkUeToTlSFMT9+mfu/bhqyFfTtvGYBp+SDLPKndE1gTtQIU0Qoq9JxZ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170999; c=relaxed/simple;
	bh=m4Wkj+rk/VrvijEitrfIMERd/zmOQp580t2sTN8465o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYelJ8q1v0KWZ8IzTVoBr1C5cmFgwBNDvEJG2L0dxAmPMgdjhkm2Es64250GN8FyF+JoKoeXG+G9facrdHOVuHyxaZvz0l0nz6gLLA0Y5aXFfwXzdOk4sFE2RbcYH2W4zvmvQpyLWCdy36EKUQMcPbk2oNSj+3rESbgJHpUxpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efLuJxH1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efLuJxH1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so19766955ad.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779170989; x=1779775789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35UEgwPy5bOt7bPAiRN5I3s053dsTnr88mncjkP29bU=;
        b=efLuJxH10cUg1gukP013S367aaVA1L9r0LkGaWAVp/yFbTxJ2TP1CpIdBJRtmKc7Zz
         fGr7acFJmVz5GxgIuhls2Ti5nrnLFnmdbNxu+U8MiTjG2340f+N8rtD0C+ORScuGf5fK
         hCZb9/EcPOD5K+ZtqOdRkHvV587n4Br791Cdgdu3UitFLqS65nBs1VdeweVNFnSThA2d
         zMClp/ExjcF0ttlXzJu3T7zrjsNhRUH/xOr9AStU8oREjyuclsfyqX6fpgRU5wjPp0KQ
         lkJRVbYXOll1EqyHKTNG5HrGAvTPDZDFMfmXqk0omxWngJpQQi/lWN0Wm8wRackSO2rm
         XSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779170989; x=1779775789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35UEgwPy5bOt7bPAiRN5I3s053dsTnr88mncjkP29bU=;
        b=Oaqic1p38wdZ7eQAlinKE7JiIIofpfudpwbBiUphNKY0Yd7E+1RKaNEO7KBqqjdspY
         eODBLjn/bPWcSGmxwyl/JUzpqJLohzC+stcNxF2sa7qZ93I3ZcyfQtUFjwFKVJxeJsek
         FC0raXj7ZGaMODogyRzp80GSvO0e29UCRRx4bTp0F/6lQEQYrDLVeKY5oTs4DXHDehfe
         80UH83KRKoSBgfGF42oSKrRCuolfgBhdlAzJthAb8LljZleJk8mPO3jfXe5P2dQVfp2j
         1CENaKNL+1SLy7aXSGrLE1XOUcYnM1fPhQLh3UaxxI5xY178yYVPAvj5/HGijvKP4SKo
         hcdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9U4MeO3qQpAgVYbXyLWpFD/dx9iYENkL+UiMiNHg+4gYwQha6PeZlvn0WQZtRITh3k1U1d1by9II8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPYaEEIatQBvf/FHun+xf/BemraNYp5jTVYk+sbGC081dnHuv
	IIx0DPWZwRS1+Q0ssjdRAAX33vBur+o1XqIIWjszDn7UV91I9EwK/cnC
X-Gm-Gg: Acq92OHbnbS00umuSBYIPSw0R7u7vFPvl6ZO8AfStPB0WH3a2BBMCJVnceHFXTqopsO
	SUdHcdeN04m2TXeTekVPiJsdDYDmBFv/eci2YVofrmZrENZn6hkon9qFg8vlGAqD+uoCFzyU0Ek
	s4ZwS29vvC1+aZqBjX0iSDbPjRVRagyS4bUZMHdqIvbcpzAeoEIuKWrydXtrozbLEE350mwEEkY
	dnWkT8tu2mADhbdSEMB6SPOjYi0L+wHRxiqHe60F4eInQUS2/903PRJSN8DW+Y6flA1lWhE+Dkg
	dD++3sT60PPZdWkBHmXyjaPx3phhk0PYGXp1ldKvi73ZLq7JKgGMM1iIPkyOPprAIj8d8Mzan5W
	S6zV73Uks1GddBzm+a3jY5yoskOgSUGsFJRlf5obGVgYADAKm6xXynEKU0wjYMOA3HfFE5FO3rl
	wTWzHQrgPwfn5v/UPq3EgOhV1uWbFQ93sY126DZr7GYX5cOstTkF0ACNRCGTuJ6Ewddg==
X-Received: by 2002:a17:903:284:b0:2b0:60db:7927 with SMTP id d9443c01a7336-2bd7e977b8fmr200540165ad.28.1779170989314;
        Mon, 18 May 2026 23:09:49 -0700 (PDT)
Received: from harvey.lan (c-73-83-32-130.hsd1.wa.comcast.net. [73.83.32.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe64a9sm172805975ad.53.2026.05.18.23.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:09:48 -0700 (PDT)
From: Jim Broadus <jbroadus@gmail.com>
To: linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	Jim Broadus <jbroadus@gmail.com>
Subject: [PATCH] tpm: tpm_tis: Add optional delay after relinquish
Date: Mon, 18 May 2026 23:09:26 -0700
Message-ID: <20260519060926.103727-1-jbroadus@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some TPMs fail to grant locality when requested immediately after being
relinquished. In this case, the TPM_ACCESS_REQUEST_USE bit of the
TPM_ACCESS register is cleared immediately without setting
TPM_ACCESS_ACTIVE_LOCALITY.

This issue can be seen at boot since tpm_chip_start, called right
after locality is relinquished, fails. This causes the probe to fail:

tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -1

This occurs on some older Dell Latitudes and maybe others. To work
around this, add a "settle" boolean param to tpm_tis. When this is
enabled, a delay is added after locality is relinquished.

Signed-off-by: Jim Broadus <jbroadus@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 drivers/char/tpm/tpm_tis.c                      | 7 +++++++
 drivers/char/tpm/tpm_tis_core.c                 | 3 +++
 drivers/char/tpm/tpm_tis_core.h                 | 1 +
 4 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb3ec..5b7111033fbb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7651,6 +7651,13 @@ Kernel parameters
 			defined by Trusted Computing Group (TCG) see
 			https://trustedcomputinggroup.org/resource/pc-client-platform-tpm-profile-ptp-specification/
 
+	tpm_tis.settle= [HW,TPM]
+			Format: <bool>
+			When enabled, this adds a delay after locality is
+			relinquished. Some TPMs will fail to grant locality if
+			requested immediately after being relinquished. This
+			causes the probe to fail.
+
 	tp_printk	[FTRACE]
 			Have the tracepoints sent to printk as well as the
 			tracing ring buffer. This is useful for early boot up
diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 9aa230a63616..8ac0ea78570e 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -101,6 +101,10 @@ module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force device probe rather than using ACPI entry");
 #endif
 
+static bool settle;
+module_param(settle, bool, 0444);
+MODULE_PARM_DESC(settle, "Add settle time after relinquish");
+
 #if defined(CONFIG_PNP) && defined(CONFIG_ACPI)
 static int has_hid(struct acpi_device *dev, const char *hid)
 {
@@ -242,6 +246,9 @@ static int tpm_tis_init(struct device *dev, struct tpm_info *tpm_info)
 	if (itpm || is_itpm(ACPI_COMPANION(dev)))
 		set_bit(TPM_TIS_ITPM_WORKAROUND, &phy->priv.flags);
 
+	if (settle)
+		set_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &phy->priv.flags);
+
 	return tpm_tis_core_init(dev, &phy->priv, irq, &tpm_tcg,
 				 ACPI_HANDLE(dev));
 }
diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 21d79ad3b164..68be26fa5817 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -184,6 +184,9 @@ static int tpm_tis_relinquish_locality(struct tpm_chip *chip, int l)
 		__tpm_tis_relinquish_locality(priv, l);
 	mutex_unlock(&priv->locality_count_mutex);
 
+	if (test_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &priv->flags))
+		tpm_msleep(TPM_TIMEOUT);
+
 	return 0;
 }
 
diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_core.h
index 6c3aa480396b..413cac5e0f31 100644
--- a/drivers/char/tpm/tpm_tis_core.h
+++ b/drivers/char/tpm/tpm_tis_core.h
@@ -90,6 +90,7 @@ enum tpm_tis_flags {
 	TPM_TIS_DEFAULT_CANCELLATION	= 2,
 	TPM_TIS_IRQ_TESTED		= 3,
 	TPM_TIS_STATUS_VALID_RETRY	= 4,
+	TPM_TIS_SETTLE_AFTER_RELINQUISH	= 5,
 };
 
 struct tpm_tis_data {
-- 
2.54.0

