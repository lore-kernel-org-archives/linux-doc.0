Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19DBC3F2D1
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 22:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73F53206E6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 22:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyEZx7P4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbgCCW4Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 17:56:16 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43870 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbgCCW4P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Mar 2020 17:56:15 -0500
Received: by mail-qt1-f194.google.com with SMTP id v22so4207901qtp.10
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2020 14:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+/vd8qTkX/vPxneTlpQ8qwlfxbKoqyPCokDn/ckJFI=;
        b=XyEZx7P475OFf2EIOuSkVU9LVIVVL6OThDxmppjLPDGwLLP9dl/d1KNn6s5+y72VDJ
         c7K4+x/atWiVqGR41LIkEcNXA3gqqi4StukVkMgNfoQHq1k/MrSoaPG21HTLjSAcxS05
         p6SYNnog8CUFaccDZ7gPPsZBQE/oGrV8FPl+kf30BAC02DUNi4TV+SU7g6ZK8J8RNog+
         XKh3kYO2NGkEdGP0pZoYqJkSJUL/PhIyRHxb7tUr5H88xdGBWYZDtJ4cMYIDSaIEy+d/
         JUn6hH9drgELKabk12QMG+DGfNXngSPtjtkB9ZOLWklQ5qGFKkKoq+8X669jQ5caqlAH
         XkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+/vd8qTkX/vPxneTlpQ8qwlfxbKoqyPCokDn/ckJFI=;
        b=aPKnZNTD0VWf3Qo9C68EFBOINhInQj2p9mrWgTK+z1pLHrSI2U5y4F0Xlgzt7Rclhp
         WhqgDYc8CmqP7JYf0bOCgcwEgYbeGrtL/XSY94PcK/PZquU3B2q25q4UwMpEOJphnfZ7
         eyPF72OXwtWObtDA86tozuRGhmkUWYrCJO6hNhUN1zgaqnVlTgcznJVN71/0/rlRbJtb
         9sJNyFT94/dUA2TNF7nWBxCbPz+nxlxPJcU6bXx5itk0wkdXjAH7NDFr/MS6AmqpL2VI
         B9WcSUvPF9wjG4IXc9QZiXJ1gvMwm71yJkAPQihdav70pVd2dwY8wHy37rhA58gCz38I
         A4RQ==
X-Gm-Message-State: ANhLgQ1ZO9jY1fkUD2Zyh+ACsOMDGUq21je940CajNuzQFoZNwbet6P1
        GE3QnVDJwc4OTvucDf/AMp0=
X-Google-Smtp-Source: ADFU+vuK1O6ufH8jjMxVuvuFFMH4EQdQFC9rNYfHICctLs0aVeo+TJdGeM+sdydy2zOD/Krqh1ERJg==
X-Received: by 2002:ac8:3227:: with SMTP id x36mr6668487qta.349.1583276173588;
        Tue, 03 Mar 2020 14:56:13 -0800 (PST)
Received: from laptop1.home.joalon.se ([168.227.32.157])
        by smtp.gmail.com with ESMTPSA id 133sm12969689qkh.109.2020.03.03.14.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:56:13 -0800 (PST)
From:   "=?UTF-8?q?Joakim=20L=C3=B6nnegren?=" <joakimlonnegren@gmail.com>
X-Google-Original-From: =?UTF-8?q?Joakim=20L=C3=B6nnegren?= <joakimlonnegren@gmail.om>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        =?UTF-8?q?Joakim=20L=C3=B6nnegren?= <joakimlonnegren@gmail.com>
Subject: [PATCH] Documentation: driver-api/usb/writing_usb_driver.rst: Update documentation links
Date:   Tue,  3 Mar 2020 19:55:52 -0300
Message-Id: <20200303225552.142778-1-joakimlonnegren@gmail.om>
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
 Documentation/driver-api/usb/writing_usb_driver.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
index 4fe1c06b6a13..5987762f5c3f 100644
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
+https://marc.info/?l=linux-usb
 
 Programming Guide for Linux USB Device Drivers:
 http://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf
-- 
2.25.0

