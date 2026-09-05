Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8A23033E7
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600289; cv=none; b=Weinpfh8LR5E783C4OltPYAFXNQpnsWRVvOkOIM32/rdv7OEX8qVcBppJiFrwUBgC+xqK1ugIwYejVvkaPUHy54w7yUZ7v5c5P98kZjXfADckDfo8NPSqxAaQmJ3W34LllO+m6ypODA4AzF8iGp7T4HTqjO5PmqxiyKeF9nKn7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600289; c=relaxed/simple;
	bh=QaCebBQOpBVoyKU1YEampELmIKQVNwzsTR2of/MqDdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u/Vu2px19bqs9C1zknRKl/NiQnakMgdeIPAWjYZ43oGVkJHrj7xibfRGXEOOhcv9C8NeVu9sTwu5d/xF3S0HgPaNwMxcplMmONtp2PfQgljOwhwv2JXaAPfRicfbeQs4tAiQktcv7mmuTSjWQptgrKd0O7UbMy9DzOPcv8JlszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3RM0mTY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3RM0mTY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b965570d7so21428455e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788600286; x=1789205086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1B6Q2UTc0NYJ9rjx4iyizU2jLsIDy7H6FgDj2PqGSg=;
        b=T3RM0mTYau8OmUyiTPKI0wuHRhucuVj1DrkaDJsAGRFirIIMomsywLoB8rohTS2ITP
         1ePUIuCygwHG1CUl++fYkh/CVUV383r8sgN4/ntt1TAyK6lHceDZedfb+v2EeslGBaE1
         99FK3lS8KQj9FupSsqj4bCRKZyvQ811t0jzQoFRLGq5J8B25subN3D7VQiVTCFFnu/a1
         DGR5mk/FMwRVwBP1Gehs8ZSe1urD9KuXSZnUnUOXiZNGCuLMuyg2ePudJC41CUBO1uUQ
         oaV9I/FsLnkOslgKHBfrTHX2AONbduLJolL8ua0KAvP+GwCk197LUC379Wl4Q6aP+d08
         SNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600286; x=1789205086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1B6Q2UTc0NYJ9rjx4iyizU2jLsIDy7H6FgDj2PqGSg=;
        b=czitAMPp/qFelsEdqS1afFaAQ2jfwjGQ0ky0QLlqy464N2cb7DLFY+cDlV4G1kF8U3
         m5+tqHx6KWhaZCJH6aBgJCGHmF53dwNHHuVhTZ+jAL3VdF7fqNGBJCTV0ZtakpIP1qwD
         w+84wXxtJJU71fmVbWxCUHGm822OC/4RVbmEXdgHjJS+fVJD4pU+/3SFbWbEfw4heveE
         wY3Dt1sWy/EFhjRn0xSwlA9kH8qX9/L1nGYideTBFJh+w2EM2+6M94zchAssi9A2dVW6
         Q/8E/PZ/v16pw4/bVl3T3hH1RLLUz/wz7OS3j0Xl0AKRDDrQ0UOOlcGS0bFAEXitDh/0
         aQLA==
X-Forwarded-Encrypted: i=1; AKwUvBzS73nrF26hwpWTDuSIsIUDsG5r2XwawjgY+FW8VGNWOZpCgZLSnpjEETRlMGMjI0Bnh7xmVidRqg0=@vger.kernel.org
X-Gm-Message-State: AFuF++mI4LMmPpzVPWFE+vBNaOiPlBfc9Bmm2U5I+QvP89y92f/wFrbF
	2+oonBph1M4O8lmEB/KYOC4NEQ6tECdnBVLz8nyYAVXovMOfZ6KTPBcr8EVNAtLq
X-Gm-Gg: AYBFou3Olyv4BzXlijAQ2Q74vjjPJvB9ifQKOOG4LFNSeKW3mJMI8xNCQTepd5762m9
	vZ5bGACTIh5gLozxdny+x/+v1KO4qtM60YsJZbrFD5oSGgjARrGXXgTMaPA1EMY9G/1NHXY4/Gw
	tm8TUxcIiWYnif07DbHRNxS9tbb2NvlN7nLL0tECRSOevLSS1IA09KkShIBsXAeuufQ+A2XVQQ2
	ap01lq5nGavVoiJ4/sfhh7FxI0QUW22DnRsWNugwrxRm6mlf+H+zAshAPDBeBQsg2grBQm6w9oR
	4NHe+G+Lh4FC17IDM8kmiZcWlvBmBCNtGYxKdsqa0+/WD60q3Hu0UfRBVlVVASplr1HckSyxjMg
	v2YdaE2WVsLUGGEMFleqCIkKB4/Ex8EQ1/Oh7n4FRF9AmVBIgqNNE2iv3DIHeBiCuIF5XCahCr0
	hyqIniubnIap6ZLyqe1jKrRykUOIEg606XCKN1lXA+4awWgGDJk3+ClMmBJLAr/2iEbuQyS1/Zc
	JvXxs/+uwAsXuT/kYn0YVCpLJLfULiWTfvH5RNeRX5kI/zN5sf1TtHaV8RnFlSWiARUaKadtgu1
	qqZLBYfN2y97HK45p+lzqJ0OfXzIjrhvgaO+wvekLF96vsLveUq95ikYPVsRqjlTJgA=
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr112485365e9.4.1788600285882;
        Sat, 05 Sep 2026 02:24:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm107621925e9.11.2026.09.05.02.24.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:24:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-edac@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: RAS: Use the real EDAC PCI parity control names
Date: Sat,  5 Sep 2026 11:24:41 +0200
Message-Id: <20260905092441.41401-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The document names the sysfs control
/sys/devices/system/edac/pci/check_pci_parity and the module parameter
edac_panic_on_pci_pe. Neither exists.

check_pci_parity was renamed to check_pci_errors by commit 91b99041c1d5
("drivers/edac: updated PCI monitoring"), after the document had been
written.

The module parameter has been edac_pci_panic_on_pe
(drivers/edac/edac_pci_sysfs.c) since it was introduced, and the
document described it as edac_panic_on_pci_pe from the start.

Use the real names.

Fixes: 91b99041c1d5 ("drivers/edac: updated PCI monitoring")
Fixes: 327dafb1c61c ("edac: core fix redundant sysfs controls to parameters")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/RAS/main.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
index 5a45db32c49b..c1040e5a5b35 100644
--- a/Documentation/admin-guide/RAS/main.rst
+++ b/Documentation/admin-guide/RAS/main.rst
@@ -623,7 +623,7 @@ Under ``/sys/devices/system/edac/pci`` are control and attribute files as
 follows:
 
 
-- ``check_pci_parity`` - Enable/Disable PCI Parity checking control file
+- ``check_pci_errors`` - Enable/Disable PCI Parity checking control file
 
 	This control file enables or disables the PCI Bus Parity scanning
 	operation. Writing a 1 to this file enables the scanning. Writing
@@ -631,11 +631,11 @@ follows:
 
 	Enable::
 
-		echo "1" >/sys/devices/system/edac/pci/check_pci_parity
+		echo "1" >/sys/devices/system/edac/pci/check_pci_errors
 
 	Disable::
 
-		echo "0" >/sys/devices/system/edac/pci/check_pci_parity
+		echo "0" >/sys/devices/system/edac/pci/check_pci_errors
 
 
 - ``pci_parity_count`` - Parity Count
@@ -725,15 +725,15 @@ Module parameters
 
 	module/kernel parameter::
 
-			edac_panic_on_pci_pe=[0|1]
+			edac_pci_panic_on_pe=[0|1]
 
 	Enable::
 
-		echo "1" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
+		echo "1" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
 
 	Disable::
 
-		echo "0" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
+		echo "0" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
 
 
 
-- 
2.53.0

