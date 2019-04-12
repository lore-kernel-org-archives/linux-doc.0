Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2E437D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Apr 2019 16:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfDLQ1q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Apr 2019 12:27:46 -0400
Received: from mail-oi1-f202.google.com ([209.85.167.202]:51725 "EHLO
        mail-oi1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfDLQ1q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Apr 2019 12:27:46 -0400
Received: by mail-oi1-f202.google.com with SMTP id e185so4775637oib.18
        for <linux-doc@vger.kernel.org>; Fri, 12 Apr 2019 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7TzQmInxTWUl6X3CTT5BO70JvWZxMxCZRjycIU7Ya/4=;
        b=PcltYHKRIuM8vHlzhVCu4OYcwec0vK5s8EcwuHuilc4fxpaAKUFJjH86ALE7l/DRKg
         YuLbX70y4/Vg4Vg9EK2HSnIrXk6NJPJw8y8+WRyWzGUmaE4xYKd8/eGCmMP+7E65HJRC
         V9LOKMTfLmoNhsyI8Fvvp3Rg/rTOhs63zBKShzPdFg+1ZUCEqbmDwMpn+4h4yoVpIYf6
         nlwJi277LS72hu0Q1cITiPFkNW6BG5CFqhch4x11dbZ6ThYr5KGyoXAktTqjmQBaHsCG
         22F/tjMXbSZ8ao7S3Wy90oxcfsbkNE4Ucyp55kttDSZvS+v+X9tVD0xDN9UCOYld79z2
         ahDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7TzQmInxTWUl6X3CTT5BO70JvWZxMxCZRjycIU7Ya/4=;
        b=TKcOZusmdp/tztU7OIPNwVVQ/S4vBckmYBBAMYSBOK4Y9DLM7S54QZ9oIzt/w5TaoJ
         eaq/d9OLFK9SGAVwGbmWA4C3imnHjUv7mT+Mm9yzoSJvLSD1CmPSYjcpsICoVvq/jJ2d
         RCfZwWILEGVVWhCBAFg7KXIy36itHPnv4Ipxovnw5yj6TXlVwipD1MA3KBGTgLnzXzkb
         BbL/XfOs8FrVtnQ1+2bgPk7de9ST5wGLoezgP12a1uvy+yDE6FW3z2jNdCcr87MF+0++
         3jJ2wTk1SbLx01Ch9tl3qVFUOpl05pZ2UdrWDFZtPE62mzDsTk/LYv/hr2dd1TmXcXav
         DZYg==
X-Gm-Message-State: APjAAAV+l+J3+uic+LgG/0UpEDzHVgvjUFgiTSGY68ANtvwr3nc8niQ+
        o0fR2Px7UWwLUHfBSI6GF0td+iQyU9B5
X-Google-Smtp-Source: APXvYqz1DvyAxVFaZuGtRTF6OQPJhjzK7BZHyl7vF8rThUVvoRyTacyB36EY9cie0Ftt7egBPF0NoxV523v7
X-Received: by 2002:aca:3203:: with SMTP id y3mr5136634oiy.58.1555086465835;
 Fri, 12 Apr 2019 09:27:45 -0700 (PDT)
Date:   Fri, 12 Apr 2019 09:27:42 -0700
Message-Id: <20190412162742.65962-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH] Documentation: hwmon: ir35221: fix company name
From:   Patrick Venture <venture@google.com>
To:     venture@google.com, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the company name from "Infinion" to "Infineon."

Signed-off-by: Patrick Venture <venture@google.com>
---
 Documentation/hwmon/ir35221 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/ir35221 b/Documentation/hwmon/ir35221
index f7e112752c04..3e82f3d93f44 100644
--- a/Documentation/hwmon/ir35221
+++ b/Documentation/hwmon/ir35221
@@ -2,7 +2,7 @@ Kernel driver ir35221
 =====================
 
 Supported chips:
-  * Infinion IR35221
+  * Infineon IR35221
     Prefix: 'ir35221'
     Addresses scanned: -
     Datasheet: Datasheet is not publicly available.
-- 
2.21.0.392.gf8f6787159e-goog

