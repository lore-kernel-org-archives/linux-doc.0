Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0B438F65C
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791714803; cv=none; b=UIkRc7ZEm9YUi3FuvViQ5I3kjvNvTrbnABLVzmJ0AHq063kk3ZlQ//Ttj6yhixyx+U6OYKiL+JQswgfHSlAkGWg8k0pPBdh9zIlddBU2ADFaY4ecP4YnuFVXtk2OZhe7vQ2AxtnZLvl89/3u5MOUI5iLWKs+VDiy2CdgObSDJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791714803; c=relaxed/simple;
	bh=IbSgyg332uk6famZqEU4oZ978T9FSAct3rv7ZEZlJOQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EU/MJobCqHhhUoQWw5fLGMD7PjPRI4ru1JjQTbyTLjDp/aGAdSsSRuTQomb6SxO8b7VrZTeLjV5mz5HmBAzZ9HqCxfs5AI8HQOZwOq4OLkjNfC8yf8yTgMfF+IRrw3OzMEeCjiWaQ0PKgRON8aDm91LCkA/Tllggu/kGDoliYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjTKhYqG; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjTKhYqG"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e60bb65626so11662325ad.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791714802; x=1792319602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5+gLLrkFOrriXJIzNMtnJZWTojcbqnID3U5KAXZwwzI=;
        b=JjTKhYqGpUGH+nupJz/hPYcpvoEczw9HOeRnIUMi3RJPcW70IDzODTDrOcTmzEUNRh
         CMk5BtqYw8ScQzF/1HL6wjhrJ9pGRP2N3nZBgSVnLOs+X1Zaha5mLwQnSn2cSxZLB7+n
         +vgoiAZNM2VwgeuEpaXyAg61klP/hccUYfz1CrTDB1xfE4DhT9vo8bb3Bz65TuKR4JLs
         Bx2EFbt4KsbfXOfqqpJ3tSBtsiBeExEnx/NHIq0HMkj/m/zlLWFeIoVCt0Bdw3ZuNpnj
         jiGGIVepnyAY9Wrpk9S9VnV4o3pY31egEEay0Zyp9MQyPq638iK5toR4SlcnbmOwvBzp
         AJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791714802; x=1792319602;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+gLLrkFOrriXJIzNMtnJZWTojcbqnID3U5KAXZwwzI=;
        b=kiq+tc17R1ccDF3qVxZPeCOroDiy8im9//1Kf8LcCt4Y/M2pf1qSBwqaOqWY6krJRC
         c6p5x7FW1zgm3ajZmyfXZI+pHEehYS9st1hJivLCzAlUyNJYacZUiJw/aOnqH2oyhVVB
         N+IxcZkl3E7WH2v5Wcsuf5BwkhY2cCPZQ3UdzOhqNhU/Ar4N0qlujGT89KTmfem169w+
         JaO2TpyhGaLIW5aGMT6CdeAnnu4xmZVwvlctCnIV4tbV7zOc8D5sVghTbXos9BIxKsyM
         cEuHfYvS7BNBMrkdyCs5ao+5FlCymE/aChH4SFcLtLaPZ5lvlJQfXJgcYjqU6XRtrOs8
         R1JQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuH9WjTJplZ+KZoq3RQwu4/QOfI6P8cKtuRSO5iKOPAxKRB8EE1YSw118R/v2OJesPcltC7eIGUlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJysuYgJIHUkZS1iBm1HSvbRqyo9ecpALk/N+RZqFi6ijHkGfjg
	lZcmIGVPaveXVkxjS/6sVLIGsBusYMPQJmPGEVkp14hXdXGXtTPeQ2foASgWnbU2gYAfxVx5I3J
	cnyyFziBwVJ6V99akueHqzw==
X-Received: from plht5.prod.google.com ([2002:a17:903:2f05:b0:2e4:9032:e624])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:22cf:b0:2df:b510:cebb with SMTP id d9443c01a7336-2e842835a01mr44078615ad.6.1791714801455;
 Sun, 11 Oct 2026 03:33:21 -0700 (PDT)
Date: Sun, 11 Oct 2026 18:33:19 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261011103319.820657-1-stanleyjhu@google.com>
Subject: [PATCH] scsi: ufs: docs: Describe how to test with QEMU
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jeuk Kim <jeuk20.kim@samsung.com>, Bean Huo <beanhuo@iokpp.de>, linux-scsi@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

QEMU emulates a UFS host controller and logical units, but the kernel
tree does not mention it, so developers without UFS hardware have no
documented way to exercise the UFS core.

Add a short section with the required kernel options, an example QEMU
command line, and what the emulation does not cover.

Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 Documentation/scsi/ufs.rst | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/scsi/ufs.rst b/Documentation/scsi/ufs.rst
index a7b2b2ed1c3a..1ff1c8218bf1 100644
--- a/Documentation/scsi/ufs.rst
+++ b/Documentation/scsi/ufs.rst
@@ -19,6 +19,7 @@ Universal Flash Storage
      3.4 SCSI Error handling
    4. BSG Support
    5. UFS Reference Clock Frequency configuration
+   6. Testing with QEMU
 
 
 1. Overview
@@ -208,3 +209,35 @@ the UFS specification. UFS subsystem will attempt to read the value when
 executing common controller initialization. If the value is available, UFS
 subsystem will ensure the bRefClkFreq attribute of the UFS storage device is
 set accordingly and will modify it if there is a mismatch.
+
+6. Testing with QEMU
+====================
+
+QEMU emulates a UFS host controller as a PCI device named "ufs" and
+logical units named "ufs-lu". This can be used to test changes to the
+UFS core and to ufshcd-pci without UFS hardware.
+
+Enable the following kernel options on top of the architecture
+defconfig::
+
+	CONFIG_SCSI_UFSHCD=y
+	CONFIG_SCSI_UFSHCD_PCI=y
+	CONFIG_BLK_DEV_SD=y
+
+Example for an arm64 guest with one 1 GiB logical unit::
+
+	qemu-img create -f raw ufs.img 1G
+	qemu-system-aarch64 -M virt -cpu max -smp 4 -m 2G -nographic \
+		-kernel arch/arm64/boot/Image -initrd rootfs.cpio.gz \
+		-append "console=ttyAMA0" \
+		-drive file=ufs.img,if=none,id=lu0,format=raw \
+		-device ufs,id=ufs0,serial=0001,mcq=on \
+		-device ufs-lu,drive=lu0,bus=ufs0,lun=0
+
+The logical unit appears as a SCSI disk (/dev/sda). Drop "mcq=on" to
+test the single doorbell mode instead of MCQ. The same -device options
+work with qemu-system-x86_64.
+
+The emulation does not model UniPro, M-PHY, power mode changes,
+hibernation or clock gating hardware, and vendor host drivers are not
+exercised. Changes in those areas still need testing on real hardware.
-- 
2.56.0.385.gd3acb90ef8-goog

