Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 16D5F7DE5B
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 00:51:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfF1Av3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Jun 2019 20:51:29 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41553 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbfF1AuT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jun 2019 20:50:19 -0400
Received: by mail-pg1-f194.google.com with SMTP id q4so300343pgj.8
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2019 17:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5YuFi6wQz815HLumeYih2vZ7yJGUUzK81KZ4UHpdkE=;
        b=WSzuudQTIpaZ3EJVwH+TJiFBcqoYCZD7UldbdcfYolGHGByR0NC4mOkoW/OgjZ4BGv
         ePrsDWvBqTzHOKc/aHvWBOVFlaGu1Ia0XBcndzWeda1F3D02ituG6Nh0zw33YyQiiB9R
         qoLUXwDma7nnaWRgx5n7+bylNHLiIRDnGz+snADKfcu2wR4UjBULLuh84SQWdHQ8J4VW
         QZhlezXfgSLPvmDfSiQlLMOIHGzpjTlOzq+B5UAgsFsHKJwSeeV99ww5glNV43N77YKZ
         p5lcKHoseT0bSlx/IdTgOnAiA0fxMgAyvpu4G+kXrAUWrWsJ2J3xfxu4q0AOa4LMm4Pb
         im7A==
X-Gm-Message-State: APjAAAWRUspgvntavRimqGL7IZD9jnJR5Dyg7SgftI3jidX4B+bTMy+F
        9TGopr7/jzumjyUadXp925haVw==
X-Google-Smtp-Source: APXvYqxsYnA1syozsfK0rSE+AAruFi3hspGXjnsXOpnbU/0EQNXN73FE9GR0RH5JOn0z34Ftgtlvsg==
X-Received: by 2002:a17:90a:dd42:: with SMTP id u2mr9628988pjv.118.1561683018485;
        Thu, 27 Jun 2019 17:50:18 -0700 (PDT)
Received: from localhost (c-76-21-109-208.hsd1.ca.comcast.net. [76.21.109.208])
        by smtp.gmail.com with ESMTPSA id v27sm280406pgn.76.2019.06.27.17.50.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 17:50:17 -0700 (PDT)
From:   Moritz Fischer <mdf@kernel.org>
To:     linux-fpga@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        Moritz Fischer <mdf@kernel.org>, Alan Tull <atull@kernel.org>
Subject: [PATCH 02/15] fpga: dfl: fme: remove copy_to_user() in ioctl for PR
Date:   Thu, 27 Jun 2019 17:49:38 -0700
Message-Id: <20190628004951.6202-3-mdf@kernel.org>
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

This patch removes copy_to_user() code in partial reconfiguration
ioctl, as it's useless as user never needs to read the data
structure after ioctl.

Signed-off-by: Xu Yilun <yilun.xu@intel.com>
Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
Acked-by: Alan Tull <atull@kernel.org>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/fpga/dfl-fme-pr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/fpga/dfl-fme-pr.c b/drivers/fpga/dfl-fme-pr.c
index d9ca9554844a..6ec0f09e5994 100644
--- a/drivers/fpga/dfl-fme-pr.c
+++ b/drivers/fpga/dfl-fme-pr.c
@@ -159,9 +159,6 @@ static int fme_pr(struct platform_device *pdev, unsigned long arg)
 	mutex_unlock(&pdata->lock);
 free_exit:
 	vfree(buf);
-	if (copy_to_user((void __user *)arg, &port_pr, minsz))
-		return -EFAULT;
-
 	return ret;
 }
 
-- 
2.22.0

