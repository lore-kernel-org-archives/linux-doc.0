Return-Path: <SRS0=0k1m=44=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2B1C10F27
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 11:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7491F2082E
	for <linux-doc@archiver.kernel.org>; Wed, 11 Mar 2020 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583927460;
	bh=vI7h967nhP9TwkGRMl01qAGPqkiokNYU5yD5wp+dvFs=;
	h=From:Cc:Subject:Date:To:List-ID:From;
	b=vBmlBvRgen4DaEDfEgR8oH0ZoxCROJwV8QvgFXDJ7ozdvtx67AFatdz0iiKIu25Kg
	 oKaX5b1Fn2fCiYEqt8nX1jbfxsut5yTXTcPVqOZC8zuLQZzilHLNndSbiRTguD7G8m
	 BLGBCbk5dFUqOAeHaifcrnkR9E89usZtwjo+3zXQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729084AbgCKLvA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Mar 2020 07:51:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729016AbgCKLvA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Mar 2020 07:51:00 -0400
Received: from mail.kernel.org (unknown [217.110.198.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0214E20727;
        Wed, 11 Mar 2020 11:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583927459;
        bh=vI7h967nhP9TwkGRMl01qAGPqkiokNYU5yD5wp+dvFs=;
        h=From:To:Cc:Subject:Date:From;
        b=gkVEBF6YfFGFCLfdDklI6yekxZ1MdFRN0EbJzIYTBK804zY98gRudKbTt+/Z8TjTN
         3b/MMTE+OAw91x5rHz6E/b6gH9ndXE5tDRkgD04kb0W0ge7+sVUnZAKreQgH3UJabO
         6YgwikjPDkEcHiB0KT9Bu/pbMs2e43o+19O35bhg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBzt2-0001Kl-Vb; Wed, 11 Mar 2020 12:50:56 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
        GOTO Masanori <gotom@debian.or.jp>,
        Jonathan Corbet <corbet@lwn.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-doc@vger.kernel.org
Subject: [PATCH] docs: scsi: add NinjaSCSI.rst and ppa.rst
Date:   Wed, 11 Mar 2020 12:50:39 +0100
Message-Id: <c320edbfb9b2888bb18a5ed96165bd5600d1f994.1583924186.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Something went wrong when appling those changesets:

- 070e28484411 ("scsi: docs: convert NinjaSCSI.txt to ReST")
- cc5019eefbbe ("scsi: docs: convert ppa.txt to ReST")

Instead of just changing 198 lines on NinjaSCSI.txt and
12 lines on ppa.rst, the applied patches actually removed
those files. Probably something weird happened when merging
this series.

So, let's re-add those documents again, after their conversion to
ReST format.

Fixes: cc5019eefbbe ("scsi: docs: convert ppa.txt to ReST")
Fixes: 070e28484411 ("scsi: docs: convert NinjaSCSI.txt to ReST")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/scsi/NinjaSCSI.rst | 164 +++++++++++++++++++++++++++++++
 Documentation/scsi/ppa.rst       |  18 ++++
 2 files changed, 182 insertions(+)
 create mode 100644 Documentation/scsi/NinjaSCSI.rst
 create mode 100644 Documentation/scsi/ppa.rst

diff --git a/Documentation/scsi/NinjaSCSI.rst b/Documentation/scsi/NinjaSCSI.rst
new file mode 100644
index 000000000000..999a6ed5bf7e
--- /dev/null
+++ b/Documentation/scsi/NinjaSCSI.rst
@@ -0,0 +1,164 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================================
+WorkBiT NinjaSCSI-3/32Bi driver for Linux
+=========================================
+
+1. Comment
+==========
+
+This is Workbit corp.'s(http://www.workbit.co.jp/) NinjaSCSI-3
+for Linux.
+
+2. My Linux environment
+=======================
+
+:Linux kernel: 2.4.7 / 2.2.19
+:pcmcia-cs:    3.1.27
+:gcc:          gcc-2.95.4
+:PC card:      I-O data PCSC-F (NinjaSCSI-3),
+               I-O data CBSC-II in 16 bit mode (NinjaSCSI-32Bi)
+:SCSI device:  I-O data CDPS-PX24 (CD-ROM drive),
+               Media Intelligent MMO-640GT (Optical disk drive)
+
+3. Install
+==========
+
+(a) Check your PC card is true "NinjaSCSI-3" card.
+
+    If you installed pcmcia-cs already, pcmcia reports your card as UNKNOWN
+    card, and write ["WBT", "NinjaSCSI-3", "R1.0"] or some other string to
+    your console or log file.
+
+    You can also use "cardctl" program (this program is in pcmcia-cs source
+    code) to get more info.
+
+    ::
+
+	# cat /var/log/messages
+	...
+	Jan  2 03:45:06 lindberg cardmgr[78]: unsupported card in socket 1
+	Jan  2 03:45:06 lindberg cardmgr[78]:   product info: "WBT", "NinjaSCSI-3", "R1.0"
+	...
+	# cardctl ident
+	Socket 0:
+	  no product info available
+	Socket 1:
+	  product info: "IO DATA", "CBSC16       ", "1"
+
+
+(b) Get the Linux kernel source, and extract it to /usr/src.
+    Because the NinjaSCSI driver requires some SCSI header files in Linux 
+    kernel source, I recommend rebuilding your kernel; this eliminates 
+    some versioning problems.
+
+    ::
+
+	$ cd /usr/src
+	$ tar -zxvf linux-x.x.x.tar.gz
+	$ cd linux
+	$ make config
+	...
+
+(c) If you use this driver with Kernel 2.2, unpack pcmcia-cs in some directory
+    and make & install. This driver requires the pcmcia-cs header file.
+
+    ::
+
+	$ cd /usr/src
+	$ tar zxvf cs-pcmcia-cs-3.x.x.tar.gz
+	...
+
+(d) Extract this driver's archive somewhere, and edit Makefile, then do make::
+
+	$ tar -zxvf nsp_cs-x.x.tar.gz
+	$ cd nsp_cs-x.x
+	$ emacs Makefile
+	...
+	$ make
+
+(e) Copy nsp_cs.ko to suitable place, like /lib/modules/<Kernel version>/pcmcia/ .
+
+(f) Add these lines to /etc/pcmcia/config .
+
+    If you use pcmcia-cs-3.1.8 or later, we can use "nsp_cs.conf" file.
+    So, you don't need to edit file. Just copy to /etc/pcmcia/ .
+
+    ::
+
+	device "nsp_cs"
+	  class "scsi" module "nsp_cs"
+
+	card "WorkBit NinjaSCSI-3"
+	  version "WBT", "NinjaSCSI-3", "R1.0"
+	  bind "nsp_cs"
+
+	card "WorkBit NinjaSCSI-32Bi (16bit)"
+	  version "WORKBIT", "UltraNinja-16", "1"
+	  bind "nsp_cs"
+
+	# OEM
+	card "WorkBit NinjaSCSI-32Bi (16bit) / IO-DATA"
+	  version "IO DATA", "CBSC16       ", "1"
+	  bind "nsp_cs"
+
+	# OEM
+	card "WorkBit NinjaSCSI-32Bi (16bit) / KME-1"
+	  version "KME    ", "SCSI-CARD-001", "1"
+	  bind "nsp_cs"
+	card "WorkBit NinjaSCSI-32Bi (16bit) / KME-2"
+	  version "KME    ", "SCSI-CARD-002", "1"
+	  bind "nsp_cs"
+	card "WorkBit NinjaSCSI-32Bi (16bit) / KME-3"
+	  version "KME    ", "SCSI-CARD-003", "1"
+	  bind "nsp_cs"
+	card "WorkBit NinjaSCSI-32Bi (16bit) / KME-4"
+	  version "KME    ", "SCSI-CARD-004", "1"
+	  bind "nsp_cs"
+
+(f) Start (or restart) pcmcia-cs::
+
+	# /etc/rc.d/rc.pcmcia start        (BSD style)
+
+    or::
+
+	# /etc/init.d/pcmcia start         (SYSV style)
+
+
+4. History
+==========
+
+See README.nin_cs .
+
+5. Caution
+==========
+
+If you eject card when doing some operation for your SCSI device or suspend
+your computer, you encount some *BAD* error like disk crash.
+
+It works good when I using this driver right way. But I'm not guarantee
+your data. Please backup your data when you use this driver.
+
+6. Known Bugs
+=============
+
+In 2.4 kernel, you can't use 640MB Optical disk. This error comes from
+high level SCSI driver.
+
+7. Testing
+==========
+
+Please send me some reports(bug reports etc..) of this software.
+When you send report, please tell me these or more.
+
+	- card name
+	- kernel version
+	- your SCSI device name(hard drive, CD-ROM, etc...)
+
+8. Copyright
+============
+
+ See GPL.
+
+
+2001/08/08 yokota@netlab.is.tsukuba.ac.jp <YOKOTA Hiroshi>
diff --git a/Documentation/scsi/ppa.rst b/Documentation/scsi/ppa.rst
new file mode 100644
index 000000000000..5fe3859a6892
--- /dev/null
+++ b/Documentation/scsi/ppa.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Terse where to get ZIP Drive help info
+======================================
+
+General Iomega ZIP drive page for Linux:
+http://web.archive.org/web/%2E/http://www.torque.net/~campbell/
+
+Driver archive for old drivers:
+http://web.archive.org/web/%2E/http://www.torque.net/~campbell/ppa
+
+Linux Parport page (parallel port)
+http://web.archive.org/web/%2E/http://www.torque.net/parport/
+
+Email list for Linux Parport
+linux-parport@torque.net
+
-- 
2.24.1

