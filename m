Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2922C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 04:17:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhLJEVO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 23:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbhLJEVO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 23:21:14 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43297C061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 20:17:40 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id m24so6971244pgn.7
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 20:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vL3Y1Rk2eD3Gd4ypGwP0fE11/NX/fkqRANEauaUrI40=;
        b=IdoFoJVM4kEenyiFWKD1QGz40T0vPvEIcErwrEMfNpB6W1xVlO95j3QO2iBOS7Eja6
         vO9gNCfgPtssbvCp1tz/HSIjZ7fY9mpSpQsIfS5mShky22fTxMxjVRo5K2mivSq//iIN
         kQfdjUe/lsgmdM/lq0zMsjFiMzkgLRg1gyHOgpDyhZOyY5jbYbG6pIaHnQNqOZ2HlE7X
         4tyvSP0OpVMLqO+4GTZYagI/q5W4BJ+oAVANtOz/gcaFU+fjWtikPZ8xvhISMTKOuLY4
         7SsokwpZS2fi5cnSDb/YwcPc9pvfNQ/r1jCNpw/PoA1fRGmU9l0AwuQJX/5exNO8lu4+
         qjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vL3Y1Rk2eD3Gd4ypGwP0fE11/NX/fkqRANEauaUrI40=;
        b=UNexBb6LJM4CjWeFS5px7zsud2op8BJhwToFCf7UJexlMb9TWpp1V6TfEpDzLBGgqh
         lQg5j3lqNOtvwTrTQHC1cEZhRZ+Befxri/1ILsDpYMDFlrfxozohsLBdGerk3YTM0Uje
         7giEhDlJ+/47Ku2Y83O61J5te88j1w8urhHk0zT7iphNI97ipsPIiW25hIWJL/CSdLR/
         Svw8OqsBwhfUomRfalFEEFP4Tjw/TrK1zOupGvnnHIHh2BQ0rZUmCnWXIvlxZB4eKWsI
         aol1b083IgOdOW6Q0p7GY5IDhQ9AZcqYjv9iHHeyrN4xm1u3DPxRRPvihnjkeRvTqBtd
         8hIw==
X-Gm-Message-State: AOAM5311AL77QNlLZGWel6HmQgnwdcN46vmhciA+JYhTk5nx11RMQ9/m
        JBKwCszWIGnTMTqW/H9wpN7IrrAY8t60ww==
X-Google-Smtp-Source: ABdhPJxA+caUz+uVrGLxR8h6qZCnkCW+P9BIys20mb0zn6OiGwHdi1m3RVGdO8umERogvc1xjLW7tw==
X-Received: by 2002:a65:6853:: with SMTP id q19mr3569782pgt.612.1639109859774;
        Thu, 09 Dec 2021 20:17:39 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.60])
        by smtp.gmail.com with ESMTPSA id ne7sm11222140pjb.36.2021.12.09.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 20:17:39 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     mhiramat@kernel.org
Cc:     rostedt@goodmis.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, akiyks@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs/trace: fix a label of boottime-trace
Date:   Fri, 10 Dec 2021 12:15:36 +0800
Message-Id: <20211210041536.1446734-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 559789539255 ("Documentation: tracing: Add histogram syntax to boot-time tracing") which
introduced a warning:

linux/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)

Replace with: (path)

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/trace/boottime-trace.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 6dcfbc64014d..d594597201fd 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -131,9 +131,7 @@ Ftrace Histogram Options
 Since it is too long to write a histogram action as a string for per-event
 action option, there are tree-style options under per-event 'hist' subkey
 for the histogram actions. For the detail of the each parameter,
-please read the event histogram document [3]_.
-
-.. [3] See :ref:`Documentation/trace/histogram.rst <histogram>`
+please read the event histogram document (Documentation/trace/histogram.rst)
 
 ftrace.[instance.INSTANCE.]event.GROUP.EVENT.hist.[N.]keys = KEY1[, KEY2[...]]
   Set histogram key parameters. (Mandatory)
-- 
2.27.0

