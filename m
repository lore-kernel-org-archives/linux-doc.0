Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BF377D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 00:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfF1AuS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 20:50:18 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41215 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfF1AuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:17 -0400
Received: by mail-pl1-f196.google.com with SMTP id m7so2197622pls.8
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m+CwaiEJYAeRor4kEz6OTKmpKkJwK4ZSop7mjZ0336M=;
        b=m7qPdfplzl6xowEsLfLZ3DZ2ID9dC7ZOe2+1x70VEFvGd0L3jOgP87b96Trvj18FhQ
         SqVvv4nbeSJByhlGx46BUb1i8g4xZndETzsJnHcE3irXHyVumc36teJl4jP6R7QnaXcT
         TFSIMXetlO/0A9Ht4Hzs5HcifW5ZP7ZboZXBvG8GNcyBUChHkIz0BpAqXNkvqsVOWrvv
         ddhtKyfygUVf4rGOxvaOrM29QK27Zzo25eY28BWXPJCRI+SHgpPostougICZgi7Umpa5
         dxowqDjvqYRDBLeSXzZ1zChaRL/YK0ypX7lEwiuvZ85ix5aMK+dFSYcR2ErduK/mWzup
         TcVA==
X-Gm-Message-State: APjAAAVg8pYh0m1s4+Z56uSSyq67jtpBrIOtYNUO40YctRuXR9g3FtXY
        4D4lTZj/SJA7BkyzEN0vhab4MA==
X-Google-Smtp-Source: APXvYqxzsP8xXGKl/Qhpt656m8uctj1yVi0IGiMIRv0+QZIxubDjbGfRWK4tm5YMCPI/V1y2ZpPiEg==
X-Received: by 2002:a17:902:7443:: with SMTP id e3mr8041660plt.176.1561683016190;
        Thu, 27 Jun 2019 17:50:16 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id i3sm270313pfo.138.2019.06.27.17.50.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:15 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Wu Hao <hao.wu@intel.com>, Alan Tull <atull@kernel.org>,
        Moritz Fischer <mdf@kernel.org>
Subject: [PATCH 01/15] fpga: dfl-fme-mgr: fix FME_PR_INTFC_ID register address.
Date:   Thu, 27 Jun 2019 17:49:37 -0700
Message-Id: <20190628004951.6202-2-mdf@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190628004951.6202-1-mdf@kernel.org>
References: <20190628004951.6202-1-mdf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu Hao <hao.wu@intel.com>

FME_PR_INTFC_ID is used as compat_id for fpga manager and region,
but high 64 bits and low 64 bits of the compat_id are swapped by
mistake. This patch fixes this problem by fixing register address.

Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Alan Tull <atull@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/dfl-fme-mgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/dfl-fme-mgr.c b/drivers/fpga/dfl-fme-mgr.c
index 76f37709dd1a..b3f7eee3c93f 100644
--- a/drivers/fpga/dfl-fme-mgr.c
+++ b/drivers/fpga/dfl-fme-mgr.c
@@ -30,8 +30,8 @@
 #define FME_PR_STS		0x10
 #define FME_PR_DATA		0x18
 #define FME_PR_ERR		0x20
-#define FME_PR_INTFC_ID_H	0xA8
-#define FME_PR_INTFC_ID_L	0xB0
+#define FME_PR_INTFC_ID_L	0xA8
+#define FME_PR_INTFC_ID_H	0xB0
 
 /* FME PR Control Register Bitfield */
 #define FME_PR_CTRL_PR_RST	BIT_ULL(0)  /* Reset PR engine */
-- 
2.22.0

