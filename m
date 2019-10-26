Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 051077D90D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 26 Oct 2019 20:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfJZU0u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 26 Oct 2019 16:26:50 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34647 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfJZU0u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Oct 2019 16:26:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id f5so4825007lfp.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Oct 2019 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqibNRa8NCQJCIfLIcBtLYRS0eXP+x++0ovWjgGaG+8=;
        b=vDGYxLzsoRGqDQ0r1aCbvVS1Y1PCWQTNTChLokd4dvNzm5aurPiNgKjDVQ6mTv5H/q
         WMhhgRVScd3iK49iH+Ibj0R/XN8Z+18ZjZqK6tP27EeWCU1jWdEM3f5c6j/iwZ7kWbbq
         DmRsgjThcLGXso9z3J4NNyHuZbkIHe8KkfpRZ/1xznRwrZLTV8rP077nQ1kqvc/rqK5y
         Z6o7/SKWkGkppLm9S5501xYx7ChqnCt5FzDZIxoHJoQ36cvVpyxy+8AKVj+JJsDC69Ml
         gFUeEBg2y7VQQFmdCoE/sSHCkhUoZFSqeBSjzJeuTAu7Z0Y7Kw4Db9jN9KSeeFoxUTEf
         tPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqibNRa8NCQJCIfLIcBtLYRS0eXP+x++0ovWjgGaG+8=;
        b=B9hoiw7e1kT94x93MRu0BvMgLAuxwD75lkGarvhbeGD6y359d0QxaK8lxXhYB6A5bS
         blK5nhN20EY23WS1WFaMRwjf9CWMIGoHqC3uFzvkILBh+wYhztg6XZ15do3E+4xWuiGX
         bepjvBOQqSO966IcvlIq8Kv0Mf9gucc2CR3s2yu/2jEJ16WNcZts7wHzttIR2MPoAKks
         NutZBIW/bKV2QXP4wATwMhtuisPodawnXo7y8a2grMfz3d3rpMQe7lwTngxQhjith0AK
         sda4shz/I3idTlEmUMMbTUSfhGfKo5Wu2i68Ww2PUXd8AaWfZtnhnPoLmkGWBD2d7k98
         eoMQ==
X-Gm-Message-State: APjAAAV52mH50cv15EFimJYdZ9J5tqEZQ8KLYQBOjdL5u/2EAT/Qp4s7
        UFWF6psG7pgA0ZuWGuNVyruLnhg8ZpQ=
X-Google-Smtp-Source: APXvYqzicRBbGQCjfXCf+Ju4S2YgCq5lZM7QCriuqaYImw08oK6ax5oEo+g5bBNxpM47V9yWgIG4jw==
X-Received: by 2002:a19:c204:: with SMTP id l4mr5781952lfc.163.1572121606803;
        Sat, 26 Oct 2019 13:26:46 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-153.NA.cust.bahnhof.se. [98.128.228.153])
        by smtp.gmail.com with ESMTPSA id d27sm3477053lfb.3.2019.10.26.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2019 13:26:46 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     mike.leach@linaro.org
Cc:     corbet@lwn.net, coresight@lists.linaro.org,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] coresight: etm4x: Fix BMVAL misuse
Date:   Sat, 26 Oct 2019 22:26:33 +0200
Message-Id: <20191026202633.835854-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829213321.4092-4-mike.leach@linaro.org>
References: <20190829213321.4092-4-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The second argument should be the lsb and the third argument should be
the msb.

Fixes: 62ab9bce3bc7 ("coresight: etm4x: Add missing API to set EL match on address filters")
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
Spotted while trying to get compile time checking that the order of the
arguments to GENMASK macro is correct (BMVAL uses GENMASK).

I have only compile tested the patch.

 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 3fc12ac44270..ce41482431f9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1246,7 +1246,7 @@ static ssize_t addr_exlevel_s_ns_show(struct device *dev,
 
 	spin_lock(&drvdata->spinlock);
 	idx = config->addr_idx;
-	val = BMVAL(config->addr_acc[idx], 14, 8);
+	val = BMVAL(config->addr_acc[idx], 8, 14);
 	spin_unlock(&drvdata->spinlock);
 	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
 }
-- 
2.23.0

