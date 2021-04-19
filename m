Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0F5C43600
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7215D60FE9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbhDSHiV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbhDSHiV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:21 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DB1C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:51 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id n2so51315526ejy.7
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/i9IowC0wtrivcjsB/Fsbsb8BNaaM8Yaedx4yrKH5I=;
        b=RJ2FB39oDZB6LH8cQMDZzX2eZUq1JPs5+Ri7k75DJDffc8GNoHdj/F/RwnS6/fk1Bk
         JpyLVam7qMjk4qq5OmYAsIU8Qv5AVktEIADI1haxcwngHIEabIBb6gWkGqyta76FPq9j
         0ewlqlqCVgFrlkKXnSwDWIPKJoOr2O4aM+jlFjWOAcCJvBjOpihhGsn8MW6YaPt1ugj3
         Qz+tThE1+Y4pcB45PD++emDOWyGr3SDoQGusd7W5KyL/l5J6xn2eaNw5P/Q8jG2tGu+R
         o1n1Uzfrb+MgnRo0Ywj1kungdVlh1atHkLxSRMr1vM7+egzEtLuqWzhnuMeUt/y9b2Te
         +g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/i9IowC0wtrivcjsB/Fsbsb8BNaaM8Yaedx4yrKH5I=;
        b=Z9XRtV5ckdG7IptCMWM7FXo0J1gOXwLxjRRHcLlOC81G1sLhhF8ICklCKe86ogXfNH
         7ac1l/z7WXT/B9muit4DX8uQmihb4F03yaWoFbIZqeogByCmB4xfQ3jz1zpnNBeJGZ1m
         SDiF+MrS8JLkFQL6NVeAqIjVlQpdhT41yegxJ9lfHbgZUmk59SruVsxsi0TR/Zjthaau
         eLOeK3eAmydlzoxvVFRwxN+QX98MFgx4WyMv/ziZ2BCI3p48BG3c1T0HB/a1YsmkYSmZ
         T7NtJ+XLixjtYacFlLzbHFI5Fro6+pgn8YETqEZQPCR8qWsqfjppZNBa+dAfSEMb2yk0
         7y1g==
X-Gm-Message-State: AOAM5312uPtmBw+GM4eaGpNYXHQDwqFGHXAYU7rYDGM6xOoYEoOUvuYf
        UE/8SlpRrovDVMjwRN+3kvSThA==
X-Google-Smtp-Source: ABdhPJz/6b9f5ACeGJ33sY0vDcObHYV82l390/TGtJP9OX2Ys4Dgjzep8DizhBWN/B5SzD5GhfhCMg==
X-Received: by 2002:a17:907:78d0:: with SMTP id kv16mr20464505ejc.174.1618817870531;
        Mon, 19 Apr 2021 00:37:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:50 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Guoqing Jiang <guoqing.jiang@gmx.com>,
        Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCHv5 for-next 03/19] block/rnbd-clt: Remove some arguments from insert_dev_if_not_exists_devpath
Date:   Mon, 19 Apr 2021 09:37:06 +0200
Message-Id: <20210419073722.15351-4-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Guoqing Jiang <guoqing.jiang@gmx.com>

Remove 'pathname' and 'sess' since we can dereference it from 'dev'.

Signed-off-by: Guoqing Jiang <guoqing.jiang@gmx.com>
Reviewed-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/rnbd/rnbd-clt.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index 45a470076652..5a5c8dea38dc 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -1471,14 +1471,13 @@ static bool exists_devpath(const char *pathname, const char *sessname)
 	return found;
 }
 
-static bool insert_dev_if_not_exists_devpath(const char *pathname,
-					     struct rnbd_clt_session *sess,
-					     struct rnbd_clt_dev *dev)
+static bool insert_dev_if_not_exists_devpath(struct rnbd_clt_dev *dev)
 {
 	bool found;
+	struct rnbd_clt_session *sess = dev->sess;
 
 	mutex_lock(&sess_lock);
-	found = __exists_dev(pathname, sess->sessname);
+	found = __exists_dev(dev->pathname, sess->sessname);
 	if (!found) {
 		mutex_lock(&sess->lock);
 		list_add_tail(&dev->list, &sess->devs_list);
@@ -1522,7 +1521,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
 		ret = PTR_ERR(dev);
 		goto put_sess;
 	}
-	if (insert_dev_if_not_exists_devpath(pathname, sess, dev)) {
+	if (insert_dev_if_not_exists_devpath(dev)) {
 		ret = -EEXIST;
 		goto put_dev;
 	}
-- 
2.25.1

