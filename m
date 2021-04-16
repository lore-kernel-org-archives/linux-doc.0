Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AE1C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:16:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEAFC613C1
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 22:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhDPWRV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 18:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236151AbhDPWRU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 18:17:20 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B34C061756;
        Fri, 16 Apr 2021 15:16:55 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id m16so21305153qtx.9;
        Fri, 16 Apr 2021 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fx2Tmd2WyLpe6PfeJpCMpI9taGaAaW4B0t4BrmsvIRQ=;
        b=Kfog+3oQ9awxIsBZH8cZPkhLbz5kD1x/LXtAmFtMgXaP3ZmXEzDBm0EhpD1Ir6JQQX
         7jvExXaUVNpxvmyuUaBu0XFwjayH1wwseworDDeo4UzQyk+ZbqHx/QL33qIGHINddGyw
         p8hiJ0ivRH5MVdbIcgxHoY/BCCrz5yy5g4L6gZn/VGOiMSvrYJV1SqYEvbXbxxBKorFR
         Ecia5e/yvWYJWW25bCvfqrhlA8ydCpU6aC/Skgecs5+wUDOHXSBUzjygOaSxuKO9kyew
         JCGalsJp9CYSzpy+kYpae0aDg89pMNWfKIOxkxiI3WV3tueyU9dbjDFEll9nfWBP5jJo
         yqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fx2Tmd2WyLpe6PfeJpCMpI9taGaAaW4B0t4BrmsvIRQ=;
        b=mPwxcCmkr13In91VJmjRoqKzPkxFzBCqYuOq0fi/8LlpWajcOmoRP7KJusoSUBZtx+
         /Gar8Y/9FNXP6RA5RS74BUY7hYHPi3Ar67H0rp35Qcl29fc8MWA6DZ8IZtLVrl7DnaXi
         3uJQk48wpW6k1EHxILHcjdEas91JVJNe6bEnjTL7tc2ZI5Q4T3m7UVTDXEngsgWZijgJ
         keX8MeVXpMw0gjGG8G4dUIDMuHouhBl1Gn8ug4lz7Qe0EHK0NzLl8fowq/pNqXCxUlf/
         vSBiJDFTGrMYY0+UChqjaaomzM8tGUzp7UTvRjDeabp9FBLh/1vhWwW29NFRDRCGpWXY
         n4ow==
X-Gm-Message-State: AOAM530dnqk4+0M2BPTPOBuPedfZ7zUIIJrds1/BFZLP6bgRN0hk4UPN
        sgjObEeqDRn3ND7HvVl5U8cJxaT7i8kp5UbH
X-Google-Smtp-Source: ABdhPJxWkyF04vOP8ycU9pR4T6dxuT8ynkl6MFSsbc0DTcDu+fCe0DF74O9/3o6dYezr8KkhokU1yA==
X-Received: by 2002:a05:622a:13cb:: with SMTP id p11mr1204691qtk.349.1618611414674;
        Fri, 16 Apr 2021 15:16:54 -0700 (PDT)
Received: from LuizSampaio-PC.localdomain ([2804:14d:5c21:af45:3b27:576c:7dde:37f1])
        by smtp.gmail.com with ESMTPSA id y6sm5131166qkd.106.2021.04.16.15.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:16:54 -0700 (PDT)
From:   Luiz Sampaio <sampaio.ime@gmail.com>
To:     zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Luiz Sampaio <sampaio.ime@gmail.com>
Subject: [PATCH v7 3/6] w1: ds2438: changed sysfs macro for rw file
Date:   Fri, 16 Apr 2021 19:17:36 -0300
Message-Id: <20210416221739.501090-4-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210416221739.501090-1-sampaio.ime@gmail.com>
References: <20210409031533.442123-1-sampaio.ime@gmail.com>
 <20210416221739.501090-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The iad sysfs file has permissions for read and write. Changed to the
recommended macro BIN_ATTR_RW.

Signed-off-by: Luiz Sampaio <sampaio.ime@gmail.com>
---
 drivers/w1/slaves/w1_ds2438.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 56e53a748059..910e25163898 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -388,7 +388,7 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
 	return ret;
 }
 
-static BIN_ATTR(iad, S_IRUGO | S_IWUSR | S_IWGRP, iad_read, iad_write, 0);
+static BIN_ATTR_RW(iad, 0);
 static BIN_ATTR_RO(page0, DS2438_PAGE_SIZE);
 static BIN_ATTR_RO(temperature, 0/* real length varies */);
 static BIN_ATTR_RO(vad, 0/* real length varies */);
-- 
2.30.1

