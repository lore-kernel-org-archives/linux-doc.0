Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2973C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  5 Oct 2022 03:09:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJEDJN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 23:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiJEDJM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 23:09:12 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C4D66138
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 20:09:11 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 3so14272147pga.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 20:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date;
        bh=+Vn97T5ZgWO8eA81UcppQ0AICJmWjWwz+EJ6bt+3VZ0=;
        b=HYOiyXkCr1ng8LxKvaCkuLG9Y02uiVsPQrTxxBAfHWX8Fv2ogRpWSYNRLApGnXEE7R
         usqx3V1G46JkUsYS1pxEJ7pYx8z0R5ucuBakqUFyom60MkO3QTken8VrqD8YClGKDEZF
         6Zy1TGeBKwGzq16FiaQIK0y00hkyMB6/dtR8/6XHIPp0qWUGLMtaNvrs66/15u9FTU9f
         LxTiBq+LYxUAqnl9fzREbzHszZkAa8+q5LHTlo+PzdcmlE3YHZUFt/LlgwDLry/M8IBf
         qn6DluzLKAP6E0MUE/Z/wjLZ0YlFN7PZqRCCe7uPfhrC9QQeJRVsDX7Vytp8idTJx9s4
         t5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
        bh=+Vn97T5ZgWO8eA81UcppQ0AICJmWjWwz+EJ6bt+3VZ0=;
        b=r1wMgBsC7ZVZzz29HFKp8fPH4dP+1YBeH3KjqNAgiU3fjTf8QB9zPQjHa7ZVTBHUKq
         3ptdX3ZMYQpgcRbGlp+WKkYNGfDHLo/rtEPsX8EGmFovmSb1XTkwxMNlSM+rcifIQNro
         LEwI/s5N5QgdbcruYlUbU7dQhSWaOXChrh1yl/iv+nC/KJ05Q/oeV6kdk3MEayjRUV6z
         KtAoApGWCHkyTdjD/70LS9d4EJXBHMjbmTXMifJAswj/TJ9+0R4UNMBddDTDxD4B3FW/
         PkG2kbSimByK7GUKvFuf+Tww7hhIEgofgE5WDgbVATKX74UEhIRhXZ+V7fDdJL6LwmJM
         7eNQ==
X-Gm-Message-State: ACrzQf0oTOpElRQDAUQzQ3fXZtHhTtjBLx9kUzxe5UrF8nHHAYFp+bTP
        /YPsYot20NtRyh5iCKphjCPle/HSw+s=
X-Google-Smtp-Source: AMsMyM5ysBLbFMe7y3PwUmhzhBQhL9WLCGM+VH1b0k1y0eaiDPOrhm+LE7hIvncjniYRnq4JlhpSag==
X-Received: by 2002:aa7:8896:0:b0:556:cc53:3f43 with SMTP id z22-20020aa78896000000b00556cc533f43mr30538386pfe.19.1664939350504;
        Tue, 04 Oct 2022 20:09:10 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id bd12-20020a170902830c00b0017bbd845c17sm9580624plb.158.2022.10.04.20.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 20:09:10 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Richard Weinberger <richard@nod.at>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: ubifs: Fix compression idiom
Date:   Wed,  5 Oct 2022 13:39:04 +1030
Message-Id: <20221005030904.65604-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Clearly the author meant 'on the fly'.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/filesystems/ubifs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ubifs.rst b/Documentation/filesystems/ubifs.rst
index e6ee99762534..ced2f7679ddb 100644
--- a/Documentation/filesystems/ubifs.rst
+++ b/Documentation/filesystems/ubifs.rst
@@ -59,7 +59,7 @@ differences.
 * JFFS2 is a write-through file-system, while UBIFS supports write-back,
   which makes UBIFS much faster on writes.
 
-Similarly to JFFS2, UBIFS supports on-the-flight compression which makes
+Similarly to JFFS2, UBIFS supports on-the-fly compression which makes
 it possible to fit quite a lot of data to the flash.
 
 Similarly to JFFS2, UBIFS is tolerant of unclean reboots and power-cuts.
-- 
2.35.1

