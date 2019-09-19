Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE0557D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Sep 2019 09:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387637AbfISJZY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Sep 2019 05:25:24 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20498 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388436AbfISJZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Sep 2019 05:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568885123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=fMRCNlG4fHQ6srApEX1ynJpzQyPhLql6/7HXNniPNy0=;
        b=JQ58EhCATzXxK8JL9fJ2czPxapwNwyQ4DykbhSMaRffHwIasiinTh1Sw7lk5nK8ziWDMhk
        eFimR3+zvMJYqE1UekcSODGDPuEkTdvp787wHHNbq2lKWwPkQkU0L9mMpzfsvIlOTeetT6
        hJmpJe8tbGmquglzduR4o0z70dLn3WE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-vX1GsW00O6W6MvHfAph50Q-1; Thu, 19 Sep 2019 05:25:20 -0400
Received: by mail-pg1-f197.google.com with SMTP id j9so1830090pgk.20
        for <linux-doc@vger.kernel.org>; Thu, 19 Sep 2019 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XLesU40Hdgd7PzoKuluSVn23wOzzqt01Vg23PoBHteo=;
        b=cvZQEFmJTXKR9TnZBFHN6vNhmrA9PuF/hN1VrZC4n643vlsjm7mmr5DnNwBcdO5IuP
         PcwecTr41s4wu8GvFHMfJpv+w/k2Topp5CSAwmMKAs/7UUIpCN5nxdpXm6zXa+Ce2EJP
         iw0VZsopumJHEglxIvp+LOjJMgTUSDKJ+RJTRLw31ltz5oQcXBob4WY9JoU5sxTkYOxT
         LQ1Bv5KUsdN3vCmHe/yr2iTJ1egGf1gqhi/hXzREdcz//paOpzrFJZKRiORWcRG7/+9n
         XLirNRkjLUNnwYM3D+pO9d/sf4TY/3DCfu4/xVKOmC3OXRSIY8mz06n+jNqOnWXvZ5Dw
         FJBg==
X-Gm-Message-State: APjAAAXC+RaCMgy7xjGxKgjxhjHlFYDrOzewTGkWiueBGLtWi9NpsSMj
        65KkWqQTHH7pGbaMnJNuz/YfbC/QCtDHnlSE+dSZIU7OqoVDyNhMD+5OJOe7I2rh7fiRofUPG5+
        3I3not1OpyWUVIp2Qg3tnMnNaEYH5bg4mF57s
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr8608985ply.337.1568885119762;
        Thu, 19 Sep 2019 02:25:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxebg/eFmvg9TSWxTkXz2wakbtt36/63ziH8aDxfeXIpvSWlwa/HdF+TsW6Vtom1fFad2V2zw7pONDoTjCDXY=
X-Received: by 2002:a17:902:d201:: with SMTP id t1mr8608970ply.337.1568885119507;
 Thu, 19 Sep 2019 02:25:19 -0700 (PDT)
MIME-Version: 1.0
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Thu, 19 Sep 2019 11:25:03 +0200
Message-ID: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
Subject: [PATCH] k10temp: update documentation
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: vX1GsW00O6W6MvHfAph50Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's been a while since the k10temp documentation has been updated.
There are new CPU families supported as well as Tdie temp was added.
This patch adds all missing families which I was able to find from git
history and provides more info about Tctl vs Tdie exported temps.

Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>
---
 Documentation/hwmon/k10temp.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.=
rst
index 12a86ba17de9..bb2d0a02dc45 100644
--- a/Documentation/hwmon/k10temp.rst
+++ b/Documentation/hwmon/k10temp.rst
@@ -1,7 +1,7 @@
 Kernel driver k10temp
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-Supported chips:
+Although the driver is named k10temp, it supports wide range of AMD CPUs:

 * AMD Family 10h processors:

@@ -21,10 +21,16 @@ Supported chips:

 * AMD Family 14h processors: "Brazos" (C/E/G/Z-Series)

-* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
"Kaveri", "Carrizo"
+* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity",
"Kaveri", "Carrizo", "Stoney Ridge", "Bristol Ridge"

 * AMD Family 16h processors: "Kabini", "Mullins"

+* AMD Family 17h processors: "Zen", "Zen 2"
+
+* AMD Family 18h processors: "Hygon Dhyana"
+
+* AMD Family 19h processors: "Zen 3"
+
   Prefix: 'k10temp'

   Addresses scanned: PCI space
@@ -110,3 +116,12 @@ The maximum value for Tctl is available in the
file temp1_max.
 If the BIOS has enabled hardware temperature control, the threshold at
 which the processor will throttle itself to avoid damage is available in
 temp1_crit and temp1_crit_hyst.
+
+On some AMD CPUs, there is a difference between the die temperature (Tdie)=
 and
+the reported temperature (Tctl). Tdie is the real measured temperature, an=
d
+Tctl is used for fan control. While Tctl is always available as temp1_inpu=
t,
+the driver exports Tdie temperature as temp2_input for those CPUs which su=
pport
+it.
+
+Models from 17h family report relative temperature, the driver aims to
+compensate and report the real temperature.
--=20
2.21.0


--=20
Later,
  Lukas @lzap Zapletal

