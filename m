Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D16C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 19:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbiKPTCg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 14:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiKPTCe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 14:02:34 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A613758BD2
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:33 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id p18so12325460qkg.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 11:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBQTp22OGSFCuoqSP84p+fDY/Yjo7gxGeDeghU550ss=;
        b=OpcNPhOHE3r7+5DbA0qp9eTXwWAlJN6scW+qzEguD7oZiZC6goH0wlIJ/XOW0mWqiv
         aK7zV0HRzJ8DkT3gJw1AOdsBHibIDZ+ZYeePTAwPI9/pEWpYhej0E75jsZZVFoxAhdJP
         GYJcDhdWcYR5m9Z6bRNg3/xoLR5+h7EdxPdQToFWaVbl8gVbcEETTgZZYMF0a5GcboQp
         wzkCVpVA5Su0itLBTcm9FzbzmUOksKATdb4Wz9npa+sn645SrV+MbLnWAeWJ5gg6vcqX
         95oPjJqffLSBRWOGCzGtkRkDB10lMhjtANTwM/I9UaKg2KBafQLOB/K1yB9LCzC2q/43
         uSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBQTp22OGSFCuoqSP84p+fDY/Yjo7gxGeDeghU550ss=;
        b=entIF75weioQ0khuo/L6DjGwsIRV2TA+oub4gQ7yIkKoWt5PxGBiJ4/43XzeAlJOJz
         2RsdZRmJM4KKc78WpD05dL1RUeFmYisxpIA0FR7NLI/UWeCgkN0HyPCu5wLRjW2ZCJ4E
         DmYA9+saPDftRAd7Fz8m6dla1Kayuy8Wa2ie5UslgG5TkIoGeFoHF2ZR+PYqtZJktpOM
         ChmKopTabpuVKUbs4K1BWnBAwjkyD8Js7O38ys4E4gYSiFeut5Ph7CicfuTRjUaozH6m
         eSIcS1zazPY7SVHo/GgchK4xQVnWG/vCBbSev3YAIKyK/lDnmYuHoT10kzq6rXl8Kwv6
         nAcg==
X-Gm-Message-State: ANoB5pk88NbW6x00ZFybtKPQBlMeo3ZtrChi7pIHP90m9jznWsgiNidC
        iYzWMpQgoeqfABT4RAXsE0zh2nxo+PSWVg==
X-Google-Smtp-Source: AA0mqf6IosYRmeoWns+v46Cs0cZdVPa4nPERQzBSysQmIn6JwNCYnLIFjBYKXO1bXA+oC/P6PG8GkA==
X-Received: by 2002:a37:ab12:0:b0:6fa:156e:4525 with SMTP id u18-20020a37ab12000000b006fa156e4525mr20953903qke.76.1668625344348;
        Wed, 16 Nov 2022 11:02:24 -0800 (PST)
Received: from localhost.localdomain (dsl-10-133-21.b2b2c.ca. [72.10.133.21])
        by smtp.gmail.com with ESMTPSA id o5-20020ac87c45000000b003a494b61e67sm9256304qtv.46.2022.11.16.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:02:22 -0800 (PST)
From:   Maxim Cournoyer <maxim.cournoyer@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: [PATCH v2 0/2] doc: add texinfodocs and infodocs targets
Date:   Wed, 16 Nov 2022 14:02:08 -0500
Message-Id: <20221116190210.28407-1-maxim.cournoyer@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is revision 2 of the series, following feedback from Jonathan
Corbet.  The second commit was split from the first one to ease
review/discussion.

Thank you,

Maxim Cournoyer (2):
  doc: add texinfodocs and infodocs targets
  doc: specify an 'html' build sub-directory for the htmldocs target

 Documentation/Makefile                     | 13 ++++++++++++-
 Documentation/userspace-api/media/Makefile |  3 ++-
 Makefile                                   |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)


base-commit: 81e7cfa3a9eb4ba6993a9c71772fdab21bc5d870
-- 
2.38.1

