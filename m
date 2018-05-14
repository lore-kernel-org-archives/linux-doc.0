Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4BEE97D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 21:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752372AbeENVzU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 17:55:20 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34942 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752038AbeENVzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 17:55:19 -0400
Received: by mail-qt0-f195.google.com with SMTP id f5-v6so18255238qth.2;
        Mon, 14 May 2018 14:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ePUJMAiWNw2qW5oOca9EAjtCb7ini/hNVDmMlpR8O+E=;
        b=QcZD9wKatkvrloHkmbwdyGZTdG+di7mgvice056lmtwBJ922h5Mpg88AkabuVdDIZN
         cWePboat+1WlLhJTATCQJNZ/gj/kr4Y9/n/gU1hXSVhvU8eM0gwPMjx0XhRcUm7ThAE6
         +T0MAxcnx2eHAMi2LLRSglxZILBljL6kwZH6keGka+QyvLYRumX7aMxr/TapxdVmtkVq
         xV0SgBLPoQZROQ71hXqrFQiRxE40tj+/SVW+rvA3KuuW96BAU/3viFI9y0+UbF34RbjD
         sITIV2sGvG3wjRZMzvrdDbluwK+8jJPmj6yLgGkxLid2kGkgjFM7ArbdYgdPqLVsGMn+
         wERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ePUJMAiWNw2qW5oOca9EAjtCb7ini/hNVDmMlpR8O+E=;
        b=oIRWRjeUi0iOLU7Rf0Nm6nvouiFAPK3p6uo7Xdr1B9NVNx2DTbiblbjmXvPWrUFWVe
         HpefXTdTr51aoy2ebG0CQsEoqyMsBGjSewCI4fCLwLjrnVQqREZ+tTAg1hfl5kvVFav1
         Je2T5Xsx5eqreter7BQYgT7fzbcJL7M/l8OLmBSFY4Qx4ybNYAKR0on5Mo+fcrBBgaqc
         VIdV9rkaA+Q6fnyZ50a8mSjJljILPjwOhFtzCUNqys2bjO27jm377JF15zg0vfxYi7YQ
         Dt1wS05o6AKwUfHww40EACRN4bPRgi5yj+kq5/7AVcMmsTgDJ2gXl/8OXOtK2vUMxRaA
         NV0Q==
X-Gm-Message-State: ALKqPwd/K3DQJmVqRfZlS43k2ARpG3bLUCppmzWhJXWKzg6GFIyFIhaN
        dkbzirAy6NJOX5DTGOBwB/mdN+z9gJQ=
X-Google-Smtp-Source: AB8JxZpP3m4V2ZlqDpCbCI2NqRpgw6eLsuJooeC9kb5ZVtKbFYF0JyWm+jhUNbLo+l4jnde5DK9JMg==
X-Received: by 2002:aed:3fec:: with SMTP id w41-v6mr10678338qth.154.1526334918563;
        Mon, 14 May 2018 14:55:18 -0700 (PDT)
Received: from glados.lan ([2601:18d:4600:e68c:feaa:14ff:fe71:bf72])
        by smtp.gmail.com with ESMTPSA id u21-v6sm8061159qki.63.2018.05.14.14.55.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 May 2018 14:55:17 -0700 (PDT)
From:   Thomas Hebb <tommyhebb@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     trivial@kernel.org, Thomas Hebb <tommyhebb@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] Documentation: arm: clean up Marvell Berlin family info
Date:   Mon, 14 May 2018 17:55:10 -0400
Message-Id: <20180514215511.17328-1-tommyhebb@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove dead links, make spacing consistent, and note that the family was
acquired by Synaptics in 2017.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 Documentation/arm/Marvell/README | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/arm/Marvell/README b/Documentation/arm/Marvell/README
index b5bb7f518840..56ada27c53be 100644
--- a/Documentation/arm/Marvell/README
+++ b/Documentation/arm/Marvell/README
@@ -302,19 +302,15 @@ Berlin family (Multimedia Solutions)
 	88DE3010, Armada 1000 (no Linux support)
 		Core:		Marvell PJ1 (ARMv5TE), Dual-core
 		Product Brief:	http://www.marvell.com.cn/digital-entertainment/assets/armada_1000_pb.pdf
-	88DE3005, Armada 1500-mini
 	88DE3005, Armada 1500 Mini
 		Design name:	BG2CD
 		Core:		ARM Cortex-A9, PL310 L2CC
-		Homepage:	http://www.marvell.com/multimedia-solutions/armada-1500-mini/
-        88DE3006, Armada 1500 Mini Plus
-                Design name:    BG2CDP
-                Core:           Dual Core ARM Cortex-A7
-                Homepage:       http://www.marvell.com/multimedia-solutions/armada-1500-mini-plus/
+	88DE3006, Armada 1500 Mini Plus
+		Design name:	BG2CDP
+		Core:		Dual Core ARM Cortex-A7
 	88DE3100, Armada 1500
 		Design name:	BG2
 		Core:		Marvell PJ4B-MP (ARMv7), Tauros3 L2CC
-		Product Brief:	http://www.marvell.com/digital-entertainment/armada-1500/assets/Marvell-ARMADA-1500-Product-Brief.pdf
 	88DE3114, Armada 1500 Pro
 		Design name:	BG2Q
 		Core:		Quad Core ARM Cortex-A9, PL310 L2CC
@@ -324,13 +320,16 @@ Berlin family (Multimedia Solutions)
 	88DE3218, ARMADA 1500 Ultra
 		Core:		ARM Cortex-A53
 
-  Homepage: http://www.marvell.com/multimedia-solutions/
+  Homepage: https://www.synaptics.com/products/multimedia-solutions
   Directory: arch/arm/mach-berlin
 
   Comments:
+
    * This line of SoCs is based on Marvell Sheeva or ARM Cortex CPUs
      with Synopsys DesignWare (IRQ, GPIO, Timers, ...) and PXA IP (SDHCI, USB, ETH, ...).
 
+   * The Berlin family was acquired by Synaptics from Marvell in 2017.
+
 CPU Cores
 ---------
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
