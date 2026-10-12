Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6F3DA7F9
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806465; cv=none; b=hlIP2pLyst1qVqGvUSRPLuAUlClFciUy3bF9omHcn+QqUr8djbFvAApFk+sng7uNtlTjI9AaEBkZV0YnZrrr+6HeGOp4171pRUhv66v4nXy9TYp/66I4HHbWh1PGljmZnu/FDfDMgzlhNqFVEgePlH0e0NMs+2RGz+VmL7U4DCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806465; c=relaxed/simple;
	bh=bpKLm+RbzFiB+bE/8I3pbOaOeaDV6hPfYhyAv5Hqq1I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HS8zKHSdqyj0WM2P96aVeuUK8dWEOpZLO/TeYS5AUHIAcUAJDggE2AON6yWHcZw4Fieku54ECsye2K9FDLcS+02HLTn2zMSeSkpe2NieynoueyugfEZREYiFrsHG3DZJzsLHh43JazWas8wdKudwHbSlHe45CzekFnWQRY5EyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSjMYYBe; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSjMYYBe"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so929156a12.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791806462; x=1792411262; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgmqd2G/3foFRFZCjELywxiq8w/o9QCKNyLCBypUvzE=;
        b=OSjMYYBexOo3DYBUDlkyLyINC/AtnX+Z84vddtYdUh/l05GDLRkEmNKYOhv5sdzei1
         NZFb3Dw2EnNZAZBw0qwDsJ+eIjBkPD/2L5EXrPU7H0BStAXWedKd4YHjq6gz5jbznpT8
         6ZOK9qI3fmNgwVl9GGw6mWQOFqG3HfNhS+9HSgwWmW5TTuimS51nYphhsozc7cOMR5QN
         XObMJwZ4nyrmlW9DLR6TPJZdUG8Fy5ljIon8+N5rQG/3MeAW0/59b7D1LSD0/0gkL7yf
         Yykoe0yesHviawTiipDEETtMafGpCdwmPBhlFH0C5pml6ciagTCmieF3qZEDUSgWej6N
         v/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806462; x=1792411262;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgmqd2G/3foFRFZCjELywxiq8w/o9QCKNyLCBypUvzE=;
        b=bMBLnc/EaUzR2Hd3DWV13cem+mcPEu4JTq98eWNAKviAauZMI0G1eou6tUgmWYxGbf
         L8HEUZ754O/it/xrQU1XG9Jpo89ih6bS5lw/hiv0uAHTD0X5p5xLPntDL9jZptwv4yxx
         5amRkxfwAJGDoNkm5wR7UYpIVvEgbt/nTwwoFKhq284RfU8Up5//uxqHlqIXPZtdXOWM
         4sXmMtzBjpXTESYxgv2aUX4TeMm3gfGjYNVYTrkNWEpd2nApM2CBTSWZ74FtOVgJB3yL
         fwH0cz1zpyCBM4AqDmpJYTr2i8MCAUY8u5Nwc7sZ2oaq/6APxnSF1XZV5EtAvooYOwT3
         uoRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWlOv33A+FbIyoShyJgxZqRaAxsVqesGcLyipMTUI7RXXBsdJzBTOB2ZxHKvQNXIGlnRu798n/tP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsLQslZwcK260xyJU3asC4p4GjG8cbE18WdVfC1fQ3eMLZnMT8
	mKJhKvYex6J7xZb6LIrlFmJP7RaL69uZAymXQnsczAKtfgkkPCJjp0lA9YNh/0ybSK63bmDR4YE
	G4Ju4S1NLfALjVwLopGcGRQ==
X-Received: from pglk23-n2.prod.google.com ([2002:a05:6a02:6b97:20b0:ccf:f961:1634])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7d0b:b0:3d1:c99f:efbf with SMTP id adf61e73a8af0-3e16be892f4mr7988010637.14.1791806462062;
 Mon, 12 Oct 2026 05:01:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:00:59 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012120059.1371653-1-stanleyjhu@google.com>
Subject: [PATCH v2] scsi: ufs: docs: Describe how to test with QEMU
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
Changes in v2:
- State the minimum QEMU versions for ufs and mcq=on (Bean Huo)
- Mark /dev/sda as an example (Bean Huo)
- Say the emulation accepts but does not model the link startup,
  hibernate, DME and power mode UIC commands, and that DME and power
  mode need QEMU 11.1 (Bean Huo)

v1: https://lore.kernel.org/all/20261011103319.820657-1-stanleyjhu@google.com/

 Documentation/scsi/ufs.rst | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/scsi/ufs.rst b/Documentation/scsi/ufs.rst
index a7b2b2ed1c3a..06f1b9b4e8dd 100644
--- a/Documentation/scsi/ufs.rst
+++ b/Documentation/scsi/ufs.rst
@@ -19,6 +19,7 @@ Universal Flash Storage
      3.4 SCSI Error handling
    4. BSG Support
    5. UFS Reference Clock Frequency configuration
+   6. Testing with QEMU
 
 
 1. Overview
@@ -208,3 +209,40 @@ the UFS specification. UFS subsystem will attempt to read the value when
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
+The "ufs" and "ufs-lu" devices are available since QEMU 8.2, and the
+"mcq" property since QEMU 9.1.
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
+The logical unit appears as a SCSI disk (for example /dev/sda). Drop
+"mcq=on" to test the single doorbell mode instead of MCQ. The same
+-device options work with qemu-system-x86_64.
+
+The emulation accepts the link startup and hibernate enter/exit UIC
+commands and, since QEMU 11.1, DME get/set and the power mode change
+sequence, but it does not model UniPro, M-PHY or the resulting link
+state. Clock gating hardware and vendor host drivers are not exercised
+either. Changes in those areas still need testing on real hardware.
-- 
2.56.0.385.gd3acb90ef8-goog

