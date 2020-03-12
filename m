Return-Path: <SRS0=XGz1=45=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723BFC10DCE
	for <linux-doc@archiver.kernel.org>; Thu, 12 Mar 2020 20:14:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45D26206E2
	for <linux-doc@archiver.kernel.org>; Thu, 12 Mar 2020 20:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sPl23zHT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgCLUOk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Mar 2020 16:14:40 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42224 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgCLUOj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Mar 2020 16:14:39 -0400
Received: by mail-qk1-f195.google.com with SMTP id e11so8514181qkg.9
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2020 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvn2pKJibTXb2bx4NAqDt6T4DN8tL7CJJx9nTdlYHBY=;
        b=sPl23zHTF+ghYCHNijMqfI2KsPB/F7Rs+Y5NyLRwLcZZJvm6UoBZ28Ov/BIrBMUngT
         UbMHL3hlWpAhEx9CHPlUJNyPBhRT8M4oe5VfYS72vapkzmaULTa3/xlWgIWg9KILKyd5
         /zCsoVr0WtEH0xYACYoaUtx27xxQowzfESDTy8UFH5TjrxxL9/JuS6Jp7qkbpWJTi1/I
         cYzkMKeoeYX5DeVrqhhlKl79TP5Q5A9YJgMn/H4Ju4/vZPKYgaxynXL3Y/Y2XpJ4B3um
         75wWe7YIbyOIAeWeU7m/W5Ubvj4f2btcIJkmPmFCKKWrxgivkvY6z1c6k4S3xI0gvoCw
         ZRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvn2pKJibTXb2bx4NAqDt6T4DN8tL7CJJx9nTdlYHBY=;
        b=JfIGZnV7THirH3pw8nHVq8v1LirtQlDiKwvC0x+RMW8OBRvSS9g1NKWb7SmlShDUA7
         nMXF2Zga53SKoOBYvWrFsv3Q3RMlRnVDYWGIzhdHv7zGnPW606UvNX9bmGfxIaxYxveo
         Nky3KB1FbJk7sDcQHmJ2tKXVkbteW1ZD3hwRMnuKOoPegZJyC+2mmqGzDksGRm5YwWSU
         LN2TQzYPJtmEY7I+8KYd6XPg9rqRr+vLzR1OoTTfPofC+YmxRCNqkXe7x+NP32QqNLDq
         PSz1BMdDD59F3uI20gNs86coVIxBOELWXvArNxKocot096Rz5Yo9wbt9QXW40O8PsZFN
         0zrg==
X-Gm-Message-State: ANhLgQ2M1B+JxQ5Ik/snh/Usb19tiBRgfaSE6Cl8vd9lXzeUhkHD8fV6
        HAQrlbGbV9Eq9+XPuHANZnqw76uTOSE9eg==
X-Google-Smtp-Source: ADFU+vsCMeQySD/CiWh7iZws1d/MNp1qEdmdO8uJrFqjYgk5TT/9nw5M442yCXlaAW3Va7gZgn+JAg==
X-Received: by 2002:a05:620a:1083:: with SMTP id g3mr4568562qkk.470.1584044078841;
        Thu, 12 Mar 2020 13:14:38 -0700 (PDT)
Received: from laptop1.home.joalon.se ([168.227.33.39])
        by smtp.gmail.com with ESMTPSA id p23sm1245219qkm.39.2020.03.12.13.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 13:14:38 -0700 (PDT)
From:   "=?UTF-8?q?Joakim=20L=C3=B6nnegren?=" <joakimlonnegren@gmail.com>
X-Google-Original-From: =?UTF-8?q?Joakim=20L=C3=B6nnegren?= <joakimlonnegren@gmail.om>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        =?UTF-8?q?Joakim=20L=C3=B6nnegren?= <joakimlonnegren@gmail.com>
Subject: [PATCH v2] Documentation: driver-api/usb/writing_usb_driver.rst Updates documentation links
Date:   Thu, 12 Mar 2020 17:13:55 -0300
Message-Id: <20200312201354.285839-1-joakimlonnegren@gmail.om>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In writing_usb_driver.rst:
Remove link to https://www.qbik.ch/usb/devices/ since it seems to be inactive since 2013
Update link to linux-usb mailing list archive

Signed-off-by: Joakim Lönnegren <joakimlonnegren@gmail.com>
---
Change in v2:
updates the mailing list archive to lore.kernel.org
---
 Documentation/driver-api/usb/writing_usb_driver.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
index 4fe1c06b6a13..0b3d9ff221bb 100644
--- a/Documentation/driver-api/usb/writing_usb_driver.rst
+++ b/Documentation/driver-api/usb/writing_usb_driver.rst
@@ -314,11 +314,8 @@ http://www.linux-usb.org/
 Linux Hotplug Project:
 http://linux-hotplug.sourceforge.net/
 
-Linux USB Working Devices List:
-http://www.qbik.ch/usb/devices/
-
-linux-usb-devel Mailing List Archives:
-http://marc.theaimsgroup.com/?l=linux-usb-devel
+linux-usb Mailing List Archives:
+https://lore.kernel.org/linux-usb/
 
 Programming Guide for Linux USB Device Drivers:
 http://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf
-- 
2.25.0

