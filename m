Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0BBC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 13 Oct 2022 18:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiJMSu4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Oct 2022 14:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiJMSuX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Oct 2022 14:50:23 -0400
Received: from mail-oa1-x49.google.com (mail-oa1-x49.google.com [IPv6:2001:4860:4864:20::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CEF1905C2
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 11:48:59 -0700 (PDT)
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-132693a4072so1502865fac.4
        for <linux-doc@vger.kernel.org>; Thu, 13 Oct 2022 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0gWS1Rw9QNW178MBH3rQYyjPci3LcXjh1PeumUkEvY0=;
        b=SPmV85/CXGT18nqdgNc2bVFB6FOJEFOJJJjA0QszKG8EDPi4km83mwHHPR3osac6HN
         SLapYOfekOA7H7YwCTREJPaNw1Q+6i8LLfljfN3iob18AmoMeQrYSLBKYfxuamE9V5+Y
         miXA0VuKascrYgaTiWz6QyvJDP2+Avr+3nDY6cJO+R5wbnje3EAB30xsQI7cJmsJ3Bun
         YNdIeBXjp5mavMuxR6DRf/A4dCM6Kvic1h+sSWCjgB0jpgYzaZd7oTKiZZTSLzvb6vnG
         vZ/IWXO8I5k3jNcksvE//Kr/7zUvm5dnSdl6nsnnnuyJ+S1Desu0mqXx752QBLP3V88k
         dCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gWS1Rw9QNW178MBH3rQYyjPci3LcXjh1PeumUkEvY0=;
        b=PIaEO+OnpAX5SyfT86xp0iGmF72H0131jWQtLl1cG1WaDiAzh+Hs6aJYsfucu3TFmm
         paQmFN82IG/JGbsH3by3mQoeEjl7i5wxJ6MoT7+Lu5cD2D6lhWB3rOhg5mOcjxrtS7T0
         ECrC1X4r9Z41CfkBQlcrEvwLlA+k7u0XF5epbeVW4P3JPg8aC0/OCO1GW40uoeMZyshj
         y2OaGMiqVf1oRHQbmtGJ/bQhK3uDuLXvHYfxIyjhXJCtrsSclvoucI4mItMMYBG3TXd6
         TedHUmYuISNQ5DOadEd3EyxU+bFu7rqGDeDArXjVjUhN+Px814rEQYGwCOWkC0FYArId
         IPPg==
X-Gm-Message-State: ACrzQf3UyeI4ETj261CZxI4uMbM34pAjUb5afVXpt3tEsqo8vR1XgtK7
        c4baN6BUsXuGHB1OivRfpXScozB1qhO3n1bMxoM=
X-Google-Smtp-Source: AMsMyM4DDqcC5wwIb6U6MJS227ssjtYzYiqgSNeTslq/8MxEkCOEFi9b8LCC/NWCduUPRi6HCbjXD+mwpiCAXhV30X8=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:ff3e:881c:4c2c:b8c9])
 (user=ndesaulniers job=sendgmr) by 2002:a25:495:0:b0:6bf:bdc5:3736 with SMTP
 id 143-20020a250495000000b006bfbdc53736mr1274663ybe.578.1665686059593; Thu,
 13 Oct 2022 11:34:19 -0700 (PDT)
Date:   Thu, 13 Oct 2022 11:34:14 -0700
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665686054; l=1411;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=czttrwh15PCLCb/Xhri1fjJYLYK14iikqyBN/eGLRok=;
 b=irYGPuiGg4jbvPC64tkM+rz2k8ARR2OBaQt1McNPuj5Bo+iYJob601Lhd9DG+0n4rpYB/UaxpRRT
 Zt07x56KDrDz8LoWXyKQr8sbErqS9FAXDbOsZDNEiw5HVGh0zs2k
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221013183414.667316-1-ndesaulniers@google.com>
Subject: [PATCH] Documentation: process: update the list of current LTS
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
        Sasha Levin <sashal@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

3.16 was EOL in 2020.
4.4 was EOL in 2022.

5.10 is new in 2020.
5.15 is new in 2021.

We'll see if 6.1 becomes LTS in 2022.

Link: https://lore.kernel.org/stable/514c425e2b4dca71a11b0c669746d3122f7039a5.camel@decadent.org.uk/
Link: https://lore.kernel.org/stable/1643877137240249@kroah.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/process/2.Process.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index e05fb1b8f8b6..9ae64376a8d4 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -130,12 +130,12 @@ for a longer period.  As of this writing, the current long term kernels
 and their maintainers are:
 
 	======  ================================	=======================
-	3.16	Ben Hutchings				(very long-term kernel)
-	4.4	Greg Kroah-Hartman & Sasha Levin	(very long-term kernel)
 	4.9	Greg Kroah-Hartman & Sasha Levin
 	4.14	Greg Kroah-Hartman & Sasha Levin
 	4.19	Greg Kroah-Hartman & Sasha Levin
 	5.4	Greg Kroah-Hartman & Sasha Levin
+	5.10	Greg Kroah-Hartman & Sasha Levin
+	5.15	Greg Kroah-Hartman & Sasha Levin
 	======  ================================	=======================
 
 The selection of a kernel for long-term support is purely a matter of a
-- 
2.38.0.413.g74048e4d9e-goog

