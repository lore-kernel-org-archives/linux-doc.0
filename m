Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 890BD7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 20:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbeJaFUb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 01:20:31 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54723 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbeJaFUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 01:20:31 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 567D28364E;
        Wed, 31 Oct 2018 09:25:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1540931131;
        bh=1pKnJt/ZX742GPF4+kiLlg/Iapmx3cHhdSVoJX2yVlY=;
        h=From:To:Cc:Subject:Date;
        b=N69dETulL9kcIQVWvcDB7fEgE6+hTZzmQDOLgFfoKI02nWP3y2lFzFLy1cwsE8Yhn
         KayyGQUjs4FMeqkj2QdHpRhquexnU8AePIpqllQ4RZXq5QGQ9NwkVaF95hg4UdEeqv
         /Ss3IoPKwjSyx3a8gGi0c76r6WAa+aLtJXXycxaKiNxLGG15LjMPuSDh0qkWj2WMBL
         JvwYISDIDOS4mV0Hh9W9BrY/DAAjBYtLwp8uEH2QguZYjoO1rS/6mmB1NEjyoj2bNN
         gw/XwpfmcUkgJ6C4xWr70m0C+VP0tucYE6znK4+HC3i9rQt7XkDa577Mv4RwQ+Paa8
         EOgwfQLx93CEg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5bd8be3c0000>; Wed, 31 Oct 2018 09:25:32 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by smtp (Postfix) with ESMTP id 03A4413EF06;
        Wed, 31 Oct 2018 09:25:36 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 15EA11E21FF; Wed, 31 Oct 2018 09:25:31 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (adt7475) document mapping of sysfs entries to inputs
Date:   Wed, 31 Oct 2018 09:25:27 +1300
Message-Id: <20181030202527.14581-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As per the usual standard with hwmon drivers the mapping to sysfs
entries follows the register map of the device e.g. in0_input
corresponds to the register 0x20, in1_input corresponds to 0x21 etc.

Hardware designers tend to work with input pins instead of registers
which is where things start to get confusing. A hardware designer might
say "the 1.5V rail is connected to the VCCP pin" leaving the software
designer none the wiser as to which of the sysfs entries should be
associated with the label "1.5V".

Try to bridge the gap by documenting the mapping of sysfs entries to
the corresponding pins. This should allow someone to create a
configuration file or other mapping without needing to dive into the
code and ADT datasheets.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
After being given numerous hardware designs over the years using ADT chip=
s for
hardware monitoring I found myself always having to read the schematic, A=
DT
datasheet and the adt7475.c driver.

I was about to document this mapping on an internal wiki page but I figur=
ed
it's probably of interest to the wider community. Hence this patch.

I've only documented the voltage mapping as the pwm and temperature and
tachometer pins appear to have reasonably sensible naming.

=20Documentation/hwmon/adt7475 | 12 ++++++++++++
=201 file changed, 12 insertions(+)

diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475
index 09d73a10644c..01b46b290532 100644
--- a/Documentation/hwmon/adt7475
+++ b/Documentation/hwmon/adt7475
@@ -79,6 +79,18 @@ ADT7490:
=20  * 2 GPIO pins (not implemented)
=20  * system acoustics optimizations (not implemented)
=20
+Sysfs Mapping
+-------------
+
+     ADT7490     ADT7476     ADT7475   ADT7473
+     -------     -------     -------   -------
+in0  2.5VIN (22) 2.5VIN (22) -         -
+in1  VCCP   (23) VCCP   (23) VCCP (14) VCCP (14)
+in2  VCC    (4)  VCC    (4)  VCC  (4)  VCC  (3)
+in3  5VIN   (20) 5VIN   (20)
+in4  12VIN  (21) 12VIN  (21)
+in5  VTT    (8)
+
=20Special Features
=20----------------
=20
--=20
2.19.1
