Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7DAC7619A
	for <linux-doc@archiver.kernel.org>; Tue, 11 Apr 2023 19:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjDKTX6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Apr 2023 15:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjDKTX5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Apr 2023 15:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A42B5B84
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 12:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681240927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qhq9dpmn2VnCwqB0zz5VnZkW7xe5Ahb4i2F79uPfYtI=;
        b=PrOSqhiV03g/OZOIIprxB9OTBb4XQCXVMj7oLEn3GRPu/WRRpaV7bsLv/O6xoZbkGj6CXA
        zYBb313CUIw1xWyB8RxmoRViB+6HWkujrtyorQqv5I86I61cPCScZFwAdM2NvYX5x65Qg6
        Ha6jYCoE57nwwmbbHO2wQvBgxSwvgMU=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-0q1xHeMmMgq_4arJPshQvQ-1; Tue, 11 Apr 2023 15:22:05 -0400
X-MC-Unique: 0q1xHeMmMgq_4arJPshQvQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-54f87e44598so9211987b3.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Apr 2023 12:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhq9dpmn2VnCwqB0zz5VnZkW7xe5Ahb4i2F79uPfYtI=;
        b=lQnlSKAi9KiKvu4fd7c1NlGLMhf+KQJlK3PquJ1DBMNz577+J2mlVD7Ms6Kcgx+CVw
         k/gXVcPrT+JnICgrloRf1vYmB2xVlJTq4eQl6UhL0RpyoSi8/SHtCAv/oBqMax8g5Ekk
         MS5CynKLLtNmtcmDPjHgmAVefVUEHyjpU3LOJa4/PoqhuU9v71TAEE8P+MbQD245h9Mn
         2I5qFdAf2KzW1GgF57N3F9zChDLYbXKqNQAPE8Pc5y9lJW4uIouJEiaiycs3Ufz24MtZ
         c2O3rHOrPHNkvAo+D43wZfV6aW2GHXGtcuRAOBvRoIEP4Y6lq2g+Mw2UkzoIcn/nNeQH
         jePw==
X-Gm-Message-State: AAQBX9fysV3MS3eS8eD5BBoSLstkvffc+3Dwz5LBOWfxPc76YAPORjxk
        iooNwTri0AZrStcchmeXVtqvfVGm3ZeLyLfCgrG60O7goe7YRjXLKxR5Us9B/SZvplmQygZ7zSd
        wvf4T2gWHsjosKBS/qy7m
X-Received: by 2002:a81:4fc1:0:b0:54e:a6e3:4f28 with SMTP id d184-20020a814fc1000000b0054ea6e34f28mr11197579ywb.20.1681240924943;
        Tue, 11 Apr 2023 12:22:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAvGxiyboI6lM0HhwWpo/+tevQ7im6CkFWSvHGl5+7rsYinPvTzZuQW64FTQLBwLf4ZWk5xg==
X-Received: by 2002:a81:4fc1:0:b0:54e:a6e3:4f28 with SMTP id d184-20020a814fc1000000b0054ea6e34f28mr11197566ywb.20.1681240924699;
        Tue, 11 Apr 2023 12:22:04 -0700 (PDT)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id f10-20020a81414a000000b00545a08184desm3687792ywk.110.2023.04.11.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 12:22:03 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     corbet@lwn.net, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, linux-doc@vger.kernel.org
Subject: [PATCH] docs: clk: add documentation to log which clocks have been disabled
Date:   Tue, 11 Apr 2023 15:21:53 -0400
Message-Id: <20230411192153.289688-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The existing clk documentation has a section that talks about the
clk_ignore_unused kernel parameter. Add additional documentation that
describes how to log which clocks the kernel disables on bootup. This
will log messages like the following to the console on bootup:

    [    1.268115] clk: Disabling unused clocks
    [    1.272167] clk_disable: gcc_usb_clkref_en
    [    1.276389] clk_disable: gcc_usb30_sec_sleep_clk
    [    1.281131] clk_disable: gcc_usb30_prim_sleep_clk
    ...

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 3cad45d14187..2199c0042e75 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -258,6 +258,11 @@ clocks properly but rely on them being on from the bootloader, bypassing
 the disabling means that the driver will remain functional while the issues
 are sorted out.
 
+You can see which clocks have been disabled by booting your kernel with these
+parameters:
+
+ tp_printk trace_event=clk:clk_disable
+
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.
 
-- 
2.39.2

