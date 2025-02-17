Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52645197A92
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776136; cv=none; b=GO4RVN45Y7e+TjTtCY+psP/iaLbiCh5qOBdfkxc/ocxObiBrQzRdGiowrG4riw9n8XRUdfQbJ1xUQV3F4SKNRiudXOzFHS+XAP1/8XfP3BYC3T3PrmeYYjXhyhrpLJGwuTYWu6oI2FlRU2i6ZCLnqjXuB6INJlqm7lvl5XavNz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776136; c=relaxed/simple;
	bh=i6ELZMmufiFIMX2EDjcpLrGGjmh8ucox6ZCriASggyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVF9q2cbiITYRDkrj17uu8zHUxYNfQb3HvNL/sV9M4+KIhUIaFh3ZOxKS4reITRzFisH73/tm6FfTF6CB0K7PYGbC0+MCIb/+IMs0RS8XKVlIBuRXk9SOY5W1kzPkpw18txmHtRHQnUa8+0knghS3J1QlbY0uH/GpRzzloBAuu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbiwlvOY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbiwlvOY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fbffe0254fso7500669a91.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 23:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739776133; x=1740380933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbNuZZ3ah4qQf/IyLi0J2SXaCCNZJsnmu0/EbHHX5T8=;
        b=RbiwlvOY9rjUUTTSf87iaWNWIWOCjhaWOaQ/vl0opGvpX8GRoIjnt24zrlKeTBBUvd
         86jJ8G7vYU+ZFME2RzvtcnFHDcYxNiPBhnwTMGbF+mvyDJY+tUrX0igVZe/lBoEyACYp
         nnZZiGsz9f0dC277Suj2V96Eq3Ke3R7/JpZRHedWgWV4lbCN0fNcdtP85s1ItADRNuWC
         CWEx7UMUkTwBfXM+WucgZkX6w9Xu05tt91UfirxtHAdYrWFil2+Y2s5KJ94r40YSe/HT
         MVB0bUA8IcyQWsNhcyc9rRuPm3d2jStB771dySlXL4yxV5IMZAeK6wNflJ2W72J/iE73
         ylgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739776133; x=1740380933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbNuZZ3ah4qQf/IyLi0J2SXaCCNZJsnmu0/EbHHX5T8=;
        b=kj7TekX779DX1ffJwdiY9gVyfUko/AclKCNWJ2T08bdXd+uJBTdRqoKQ8CZrf7iegu
         oyFQBt1LnoIq+6EVsTX8X4rLbo9m7yXPOndksbf0lCQ/Ng3Q7Ks+ERW344TvkANdFgTW
         d4QE3pGPDA6rFViWmCDlmp79X8k4LxzK+27tsmSSvDwwKmhLJhZr8IyCB2GsoWhDz4ae
         yfiSL2d046MDFjt2VQ9GVP/TKn4Z3uzliC/FPdQ6dE59M5uvhoPUbg2KzT/RtOwW5Ucb
         URpZTH5Hh27I9ryUPPb8gAr37kZysYAREn4ELIP6pLHQEu4n+Yx+7KabVa30Tjd2G/Uv
         l8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVjC1/ZHWZPMRHPWbE/l5I+J9wDBRn+MXy/w8GqxZqBCDdALuyXyVeBE0dXc1PGbQ8ApfkYNak8Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZWzwTkOTmjRsmxpBpzBCYCpxIZ7cmYJFT0KYYPwXbSge4V7a
	3h/CJvPqwRwU3Dq/ArRIDSpfQ2ahuBmW0xQafk6NdxRVZ6xs58gS
X-Gm-Gg: ASbGncv9gl7rAhVxUzxiHjVNEOjU+rk4p2YjmnUO5JVpjYmlOZk96L46XrNmbwfKrRk
	xIIgT9YCgidCqu46ho5d3YNwYz58eYZlBtSJsa49YuknL5wE0TN/cIx5EkWvBmfSqRL+Bmk09+S
	MUyLbHYA+cXpKMEYtIjaxs+q5enaNlXH1wjkwklk4oQKYTeKxzdBy9/BgLjHmltUvxsrI76tyGo
	u/gALVMlcX7YX2yDN43RHE6QsCTx1A8dIG2Ki41HBAikhG9e/Dan4Gdt4vOgYUnsfG2EtH9RVC6
	BS4QHOL0TgKtoc3pCyFYJHCy5D24LvAd7b2kzgr8SI3PMtByMeW+e7hKEUNGy0h5
X-Google-Smtp-Source: AGHT+IFCs4umMiGwh2VReVdIbwZvDimugd1dUsV5S3QLCBT+Si9naMiPukojkGDPHfZt8g4LXmcPvw==
X-Received: by 2002:a17:90b:4ad0:b0:2ee:a4f2:b307 with SMTP id 98e67ed59e1d1-2fc40d14deamr14145717a91.4.1739776133434;
        Sun, 16 Feb 2025 23:08:53 -0800 (PST)
Received: from localhost.localdomain ([192.19.36.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98d3b80sm9308889a91.17.2025.02.16.23.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:08:53 -0800 (PST)
From: Chandra Mohan Sundar <chandru.dav@gmail.com>
To: skhan@linuxfoundation.org,
	corbet@lwn.net
Cc: Chandra Mohan Sundar <chandru.dav@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH] documentation : networking : Fix spelling mistakes
Date: Mon, 17 Feb 2025 12:37:06 +0530
Message-ID: <20250217070713.18582-1-chandru.dav@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix few spelling mistakes in networking documentation.

Signed-off-by: Chandra Mohan Sundar <chandru.dav@gmail.com>
---
 .../ethernet/freescale/dpaa2/switch-driver.rst              | 2 +-
 .../device_drivers/ethernet/marvell/octeontx2.rst           | 2 +-
 Documentation/networking/devlink/devlink-trap.rst           | 2 +-
 Documentation/networking/phy.rst                            | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
index 8bf411b857d4..5f3885e56f58 100644
--- a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
+++ b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
@@ -70,7 +70,7 @@ the DPSW object that it will probe:
 Besides the configuration of the actual DPSW object, the dpaa2-switch driver
 will need the following DPAA2 objects:
 
- * 1 DPMCP - A Management Command Portal object is needed for any interraction
+ * 1 DPMCP - A Management Command Portal object is needed for any interaction
    with the MC firmware.
 
  * 1 DPBP - A Buffer Pool is used for seeding buffers intended for the Rx path
diff --git a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
index af7db0e91f6b..a52850602cd8 100644
--- a/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
+++ b/Documentation/networking/device_drivers/ethernet/marvell/octeontx2.rst
@@ -66,7 +66,7 @@ Admin Function driver
 As mentioned above RVU PF0 is called the admin function (AF), this driver
 supports resource provisioning and configuration of functional blocks.
 Doesn't handle any I/O. It sets up few basic stuff but most of the
-funcionality is achieved via configuration requests from PFs and VFs.
+functionality is achieved via configuration requests from PFs and VFs.
 
 PF/VFs communicates with AF via a shared memory region (mailbox). Upon
 receiving requests AF does resource provisioning and other HW configuration.
diff --git a/Documentation/networking/devlink/devlink-trap.rst b/Documentation/networking/devlink/devlink-trap.rst
index 2c14dfe69b3a..5885e21e2212 100644
--- a/Documentation/networking/devlink/devlink-trap.rst
+++ b/Documentation/networking/devlink/devlink-trap.rst
@@ -451,7 +451,7 @@ be added to the following table:
    * - ``udp_parsing``
      - ``drop``
      - Traps packets dropped due to an error in the UDP header parsing.
-       This packet trap could include checksum errorrs, an improper UDP
+       This packet trap could include checksum errors, an improper UDP
        length detected (smaller than 8 bytes) or detection of header
        truncation.
    * - ``tcp_parsing``
diff --git a/Documentation/networking/phy.rst b/Documentation/networking/phy.rst
index f64641417c54..241292b12032 100644
--- a/Documentation/networking/phy.rst
+++ b/Documentation/networking/phy.rst
@@ -19,8 +19,8 @@ amounts of redundant code.  Also, on embedded systems with multiple (and
 sometimes quite different) ethernet controllers connected to the same
 management bus, it is difficult to ensure safe use of the bus.
 
-Since the PHYs are devices, and the management busses through which they are
-accessed are, in fact, busses, the PHY Abstraction Layer treats them as such.
+Since the PHYs are devices, and the management buses through which they are
+accessed are, in fact, buses, the PHY Abstraction Layer treats them as such.
 In doing so, it has these goals:
 
 #. Increase code-reuse
@@ -35,7 +35,7 @@ The MDIO bus
 ============
 
 Most network devices are connected to a PHY by means of a management bus.
-Different devices use different busses (though some share common interfaces).
+Different devices use different buses (though some share common interfaces).
 In order to take advantage of the PAL, each bus interface needs to be
 registered as a distinct device.
 
-- 
2.43.0

