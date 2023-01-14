Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF6AC46467
	for <linux-doc@archiver.kernel.org>; Sat, 14 Jan 2023 06:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjANGIz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 14 Jan 2023 01:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjANGIy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Jan 2023 01:08:54 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9100B30DB
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 22:08:53 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id j15so15349330qtv.4
        for <linux-doc@vger.kernel.org>; Fri, 13 Jan 2023 22:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+2LAaOxNQuhC+S8GRJpCwLfoqVevt1c8Xbyr6vRhjU=;
        b=gFnpBpSkC70sxHenDkPzNMijYG/24BmL8bGnUIuoE13k3qT7qn/PAOuHK/80vnAL2H
         E5If086c3G8wGYctQ921urUJs0LqxYH76Kbq//y2cnKhZJUniTly09Sq4POIuq/sKqW2
         DEfU+MChdgcpc3ZKTsl4gbejqfhI1wK1xQrrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+2LAaOxNQuhC+S8GRJpCwLfoqVevt1c8Xbyr6vRhjU=;
        b=lZavPjQvvHhf5NvdsH+XhQtPsAjyRj0U3r6h9lo9EBdZLPVFYbeWLCxuomekmywt2v
         rNnir8DWFri8QvDEQedXFapTxmi7V6W9ALrQ2sKEP+UDGhmuNBF1RZgrQSHbU9CKLPYf
         n3XUdBm1tKCtaioHsmYz2n1e6fCHB6fO75QvzwPj4FHlnhNQyTKDk8iZOiaYkgNRRxMK
         jYuDQ7IULTaPUDfRVIzoRdpxgIw4sqdNMThluwzSlWTZzLr1f34L3aZBGAB447UcH94y
         Yt1nmthC55lXn0U3ejwyeHyqIvx7OHMMy/xpLSDCUdnQ5EwDss4Xv/tR/VpSvxItKrfm
         rMaw==
X-Gm-Message-State: AFqh2ko5H3xivsm5yaV0WZyudZwzc8yaAvqlPus4URUacZfLpNRrVaTb
        EGe6Qzs51M8kOmVXPYAi2pFb6W6MF6QZJlDP+oyPYQ==
X-Google-Smtp-Source: AMrXdXtmFUppigjwv0C/k5mQlzbCkvyuCL8GIlLqzgqKplS56HkGm+iznQF/skNIo+h34mxAUORiTQ==
X-Received: by 2002:a05:622a:1aa1:b0:3b5:77ff:fbff with SMTP id s33-20020a05622a1aa100b003b577fffbffmr89441qtc.37.1673676532448;
        Fri, 13 Jan 2023 22:08:52 -0800 (PST)
Received: from [192.168.1.3] ([2600:4040:29fb:d300:887b:7eff:fe74:68b2])
        by smtp.gmail.com with ESMTPSA id z26-20020ac8101a000000b003a70a675066sm11553086qti.79.2023.01.13.22.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 22:08:52 -0800 (PST)
From:   Peter Foley <pefoley2@pefoley.com>
Date:   Sat, 14 Jan 2023 01:08:41 -0500
Subject: [PATCH] Documentation: Avoid duplicate Kconfig inclusion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230114-doc-v1-1-efec2689e423@pefoley.com>
X-B4-Tracking: v=1; b=H4sIAOlGwmMC/x2MSQqAMAwAvyI5W2hdQP2KeIht1ByskogI4t+tH
 ocZ5gYlYVLoshuETlbeYgKXZ+AXjDMZDomhsEVpnatM2Lyxtg5Thb5xbQmpHFHJjILRL1+7oh4k
 n9iFJr7+fT88zwsoAllAbgAAAA==
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Peter Foley <pefoley2@pefoley.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673676531; l=634;
 i=pefoley2@pefoley.com; s=20230111; h=from:subject:message-id;
 bh=cT2yd4HoZ95mdHyqj3Z2j/xAavuANzfRGr7ZZ7U0xB0=;
 b=tS0PDOXdiSBNHvVvN1q7KitOv6SCfxJJupFDvSaky/lTE5HpdWF4YoDDoA3u5+DHRwXHMJrOc+7Z
 KSUI3/QbBGZ3KG4NFu2ONZHhUEPUaah8qJ5F1YF884p1y0aMeghR
X-Developer-Key: i=pefoley2@pefoley.com; a=ed25519;
 pk=DCQqIdN6rHnvfQH58WQiQzJFfGUo1HyWSvdYG8vnO5o=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/Kconfig is already included from lib/Kconfig.debug, avoid
including it again and polluting the top-level menu.

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Kconfig b/Kconfig
index 745bc773f5670..97ed6389c9211 100644
--- a/Kconfig
+++ b/Kconfig
@@ -28,5 +28,3 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
-
-source "Documentation/Kconfig"

---
base-commit: 97ec4d559d939743e8af83628be5af8da610d9dc
change-id: 20230114-doc-005df4ac8193

Best regards,
-- 
Peter Foley <pefoley2@pefoley.com>
