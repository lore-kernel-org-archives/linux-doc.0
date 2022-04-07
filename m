Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B332FC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Apr 2022 12:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245290AbiDGMkC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Apr 2022 08:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245293AbiDGMj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 08:39:58 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B5A258453
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649335077; x=1680871077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4uLM6s3+y1CHrRpxw3aADKBqeaNm8Zhmk4Evf5XeW0c=;
  b=ZNiPWFRHM/SDjbU1Fyww3mPsMgewMEW4YaqqbWOkNgUL92nw6d2TJQ16
   DsKeI85TRq6mv+OshtzNXC8L3x/PQgbtyst9jUAe6defbtSRDwggXH6MS
   Eu+jkxLZEicxKrArB9vBb4eyhKvNZ61XpahC8VLhYAXp2rsvbDFl/uWb3
   o1aDdtteY64Rc42VxKOQgNJ/W9TKswBl+PcEnj35EA2Z3XPNcoI7JREHv
   62GPgpLR5cCXdITX0SEE27+b3uArsmpWtHbjcRwYOE2WciCL5Lomz3n9g
   9vAHCMQP/APf/owkA2EZCzobvq7/1uKOmpUO0m6F5JRT2AqJk5K2sD8z7
   g==;
X-IronPort-AV: E=Sophos;i="5.90,242,1643644800"; 
   d="scan'208";a="301515568"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 20:37:57 +0800
IronPort-SDR: SdFcJiS18DCeU0ovAFYSiPKlt9KYS2eryngvGSoZ1XNdBcr6DKlofctFqZyTZZa83gga3Y+MWp
 2TClRFFJfsBtr7BLjtJ323xLQeM7vTZoFEPu71PPh+3re0s4R+Wwq7mUYfHwaGzotdGLcuuFAr
 BwdPR4AWDa9Qt5dWdh0Trr02dt05HOVBUrc3ZxkUY/noqQpoU/o2/QJZggli8wfyxcU0lLximz
 hjuLN44NeifoMNZkd9SKGsW6b0kPAifN86qJdnSe2GKMZqnMmz8YHEgglWN25rLVbj2JYgVkJe
 ehpOB0m6YKDXs1EHbCQsdnuf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Apr 2022 05:09:26 -0700
IronPort-SDR: LpGkkYUu3Lam4PeMs+v/yBPFw0r6rLk+WwpIvJBeMe6t+WG7hGR80xU1wcm5a19C+krOXyoJp9
 5hmKysnJquGbzUS5mbfKE1cQn7eu0+FsxXXBZzf8NTJIv51nbEshHYU9o8STRmIHSKnnZQRxRu
 REhBjEBErA04KxehbE5QEHdMRB/5SHucOkgMM1PgEg13Q9c6nfM+REyorQ0qgpjGu82X8qzFCT
 u7gf4QOwTxPqHFR1SbUUR0AXkuzHuKNCWJWdGLK0RrLHrge7N67vInos2RmeRlYA0Z0sZ422zE
 QFA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Apr 2022 05:37:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KZ1BD3k81z1SVny
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 05:37:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1649335076; x=1651927077; bh=4uLM6s3+y1CHrRpxw3
        aADKBqeaNm8Zhmk4Evf5XeW0c=; b=Qb3uryAcOpNmGmf2oYBAqp0APPMT5PLcOD
        8cwVxoXWgzsUa+YgeYW5fHHNEMDhTbWNVefgur64OPcV+LlV7sUp6uAZkGNmAoyE
        DUtAz/hACILfQpFM/ctBbq8/SUhMVSyYES4ob+Ytitu3yzMmeiUuUn0vz+qLg/g0
        of6V5TQst0kNIdPeA1oT1wit/qtVTIyzkMdlRfQq0vezIFV+8yANGraidchpOZ/3
        KyZL3eXVfVq4mdxuPtlEoFNF2ji6UuSiWM4FeRVLk1gf1NIoRD9djcZVTZ1VW4av
        VO9yRv3ZF8Ai48UlQIDFObjcEO4yqCpodJ5JdFrKg4+z/pyy08RQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id APcUwXu3fb-R for <linux-doc@vger.kernel.org>;
        Thu,  7 Apr 2022 05:37:56 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KZ1BC2DZcz1Rwrw;
        Thu,  7 Apr 2022 05:37:55 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH 5/5] doc: admin-guide: Update libata kernel parameters
Date:   Thu,  7 Apr 2022 21:37:48 +0900
Message-Id: <20220407123748.1170212-6-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
References: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cleanup the text text describing the libata.force boot parameter and
update the list of the values to include all supported horkage and link
flag that can be forced.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 .../admin-guide/kernel-parameters.txt         | 71 ++++++++++++++-----
 1 file changed, 55 insertions(+), 16 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
index 3f1cc5e317ed..30734a610b92 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2622,14 +2622,14 @@
 			when set.
 			Format: <int>
=20
-	libata.force=3D	[LIBATA] Force configurations.  The format is comma-
-			separated list of "[ID:]VAL" where ID is
-			PORT[.DEVICE].  PORT and DEVICE are decimal numbers
-			matching port, link or device.  Basically, it matches
-			the ATA ID string printed on console by libata.  If
-			the whole ID part is omitted, the last PORT and DEVICE
-			values are used.  If ID hasn't been specified yet, the
-			configuration applies to all ports, links and devices.
+	libata.force=3D	[LIBATA] Force configurations.  The format is a comma-
+			separated list of "[ID:]VAL" where ID is PORT[.DEVICE].
+			PORT and DEVICE are decimal numbers matching port, link
+			or device.  Basically, it matches the ATA ID string
+			printed on console by libata.  If the whole ID part is
+			omitted, the last PORT and DEVICE values are used.  If
+			ID hasn't been specified yet, the configuration applies
+			to all ports, links and devices.
=20
 			If only DEVICE is omitted, the parameter applies to
 			the port and all links and devices behind it.  DEVICE
@@ -2639,7 +2639,7 @@
 			host link and device attached to it.
=20
 			The VAL specifies the configuration to force.  As long
-			as there's no ambiguity shortcut notation is allowed.
+			as there is no ambiguity, shortcut notation is allowed.
 			For example, both 1.5 and 1.5G would work for 1.5Gbps.
 			The following configurations can be forced.
=20
@@ -2652,19 +2652,58 @@
 			  udma[/][16,25,33,44,66,100,133] notation is also
 			  allowed.
=20
+			* nohrst, nosrst, norst: suppress hard, soft and both
+			  resets.
+
+			* rstonce: only attempt one reset during hot-unplug
+			  link recovery.
+
+			* [no]dbdelay: Enable or disable the extra 200ms delay
+			  before debouncing a link PHY and device presence
+			  detection.
+
 			* [no]ncq: Turn on or off NCQ.
=20
-			* [no]ncqtrim: Turn off queued DSM TRIM.
+			* [no]ncqtrim: Enable or disable queued DSM TRIM.
+
+			* [no]ncqati: Enable or disable NCQ trim on ATI chipset.
+
+			* [no]trim: Enable or disable (unqueued) TRIM.
+
+			* [no]trim_zero: Indicate if TRIM command zeroes data.
+
+			* max_trim_128m: Set 128M maximum trim size limit.
+
+			* [no]dma: Turn on or off DMA transfers.
+
+			* atapi_dmadir: Enable ATAPI DMADIR bridge support.
+
+			* atapi_mod16_dma: Enable the use of ATAPI DMA for
+			  commands that are not a multiple of 16 bytes.
+
+			* [no]dma_log: Enable or disable the use of the
+			  READ LOG DMA EXT command to access logs.
+
+			* [no]id_dev_log: Enable or disable access to the
+			  identify device data log.
+
+			* [no]log_dir: Enable or disable access to the general
+			  purpose log directory.
+
+			* max_sec_128: Set transfer size limit to 128 sectors.
+
+			* max_sec_1024: Set or clear transfer size limit to
+			  1024 sectors.
=20
-			* nohrst, nosrst, norst: suppress hard, soft
-			  and both resets.
+			* max_sec_lba48: Set or clear transfer size limit to
+			  65535 sectors.
=20
-			* rstonce: only attempt one reset during
-			  hot-unplug link recovery
+			* [no]lpm: Enable or disable link power management.
=20
-			* dump_id: dump IDENTIFY data.
+			* [no]setxfer: Indicate if transfer speed mode setting
+			  should be skipped.
=20
-			* atapi_dmadir: Enable ATAPI DMADIR bridge support
+			* dump_id: Dump IDENTIFY data.
=20
 			* disable: Disable this device.
=20
--=20
2.35.1

