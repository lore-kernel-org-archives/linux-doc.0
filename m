Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B747F7D910
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Sep 2019 20:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387592AbfIMUkW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Sep 2019 16:40:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34897 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387461AbfIMUkW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Sep 2019 16:40:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id 205so18808732pfw.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Sep 2019 13:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=YX0Jl8x6RlVJ3WIQRXv6TwIJGxSFKsrNzwr9swiyGPk=;
        b=gOXYVHLxCHXMTmjdd2bcDb9RRGRwhC0VODLjjEwgCLFDLH4tfEC4seppaE1oTk/kWo
         nOF3nR8Uct3kFljLsKcfTY4m8aNEqcyWMHj+/RnJv91QsLa8eE0RXD+1eEgiD6xN7k40
         uh0EGXQt1eKpAuoxRrAO+AoOemvepYYSiSRCpb2R0DWbFryVTTZJn52IFbsLuCy5YEH9
         z5X9TNUqPm2zQ0Zz9yMqTYPVVQMJsIv5ylbWu1wxgNwJht//Gwy7uDN7ymM6pjbi/eqC
         goYdcT25FX45yChBk0AD/c9y74/ZEJiajTGZ/n3gZeXkz5kAIkuu1j3dtmLQ4fcpu/7J
         WkcA==
X-Gm-Message-State: APjAAAUPfd1Gx/qfIEuDmeKAl1MOpHSENiD+DuysSz9GNbEWLr3TIb4/
        R5b5G4jR+/SaY4SsvqdBSS0IVg==
X-Google-Smtp-Source: APXvYqwZU/vHw7C6zg2Y5gixSECAXnl4Li36MKYGhuCAaoGVWhphMTaMSawEPavWsUQywc5Kjyyb4g==
X-Received: by 2002:a63:4451:: with SMTP id t17mr14762885pgk.128.1568407220964;
        Fri, 13 Sep 2019 13:40:20 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
        by smtp.gmail.com with ESMTPSA id 20sm33791616pfh.72.2019.09.13.13.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 13:40:20 -0700 (PDT)
Subject: [PATCH] Documentation: Add "earlycon=sbi" to the admin guide
Date:   Fri, 13 Sep 2019 13:38:43 -0700
Message-Id: <20190913203843.27149-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:      linux-riscv@lists.infradead.org,
         Palmer Dabbelt <palmer@sifive.com>
From:   Palmer Dabbelt <palmer@sifive.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org,
        Christoph Hellwig <hch@infradead.org>, schwab@suse.de
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This argument is supported on RISC-V systems and widely used, but was
not documented here.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4c1971960afa..ca437381f91f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1044,6 +1044,10 @@
 			specified address. The serial port must already be
 			setup and configured. Options are not yet supported.
 
+		sbi
+			Use RISC-V SBI (Supervisor Binary Interface) for early
+			console.
+
 		smh	Use ARM semihosting calls for early console.
 
 		s3c2410,<addr>
-- 
2.21.0

