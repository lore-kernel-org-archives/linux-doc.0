Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7460CC4361A
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5339D60FE9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237950AbhDSHi1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 03:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237895AbhDSHi1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 03:38:27 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89D6C061760
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:57 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id g5so44636857ejx.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 00:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+WusjvsYw5StKARzVGPy5VqECBTOsgPT1toBxn5pBW8=;
        b=JaGUwUc7DZcoVAKStUGSmkYCT1j9dizx+39l2WdQ/2t+57x3hjcpUV48bobxlTWBPu
         LdJ5t2oyyVtX33xrvKnW0ozFXzQXkfFgei/PhwrLvBcTgpz0FJ0hGQDL2ramb8SaAgVv
         FtXOJQBSpPW8LgAnf1ZldHeSQwXZL0mRhaO/2FRwIdEwMTb12DI1Hd8BwymrQ7AiwZEB
         7GyxxDzHufU6D40Ew44ygOPvAnCW/mVhXiTAkkHoSZWvXIBw4GO9y8nNQi+Nm8IWaeI0
         9Jbf52+T5QF1FeC8tnJ/viVEKqvVB5Q6UGB01RD7olUQySMt8TXiq9nq293AdcOzFym8
         qgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+WusjvsYw5StKARzVGPy5VqECBTOsgPT1toBxn5pBW8=;
        b=ORb+7gE8zfNU1lgizyPjZnOU2UFZyCzff8r3cBPPU9iDT1vc9Rx7BtRq2Aw3ndk0c/
         a8gbcvGt1ayO+Oja2hfzl5ODxg/LI+WTOzDhQIuw9MbmniPpyyybw0uOzwyHiW8FsWAs
         aJwyCGTXlljcvp0pY2ZxTmg5Yn8xMuqboZVKMZB230dv2It/iSsDErrx5p7wTmXAHQdB
         CvZiX4Ig/dMe2mdTBxVQm5P5A432U1eLIEPnWCs824gfQilNNTeLkynYPu7w2dlSGhaH
         blBeeLxiuyZ/oX6vJwFAeTuOtTryLmeM8iYDiO2flJcRimMbJxVyfcmtuhYc5DA264PP
         DtBw==
X-Gm-Message-State: AOAM530ZtprLj2UdGLz2ixD3fANKnFKMKdmBFS4Mzup7gVmqu4OjGohM
        LC6y8YKOSC6aJA33oQUCSl5OtGs8fWtx4eu0
X-Google-Smtp-Source: ABdhPJz/FXoP87ls7wj41eFRH3KmzHOkLpD6Taj5U1m5reU2lo5QVYEqAMc8yeAgkMAjxbUKfkxFxA==
X-Received: by 2002:a17:906:430f:: with SMTP id j15mr20706135ejm.543.1618817876556;
        Mon, 19 Apr 2021 00:37:56 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id g22sm8701833ejz.46.2021.04.19.00.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 00:37:56 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     axboe@kernel.dk, akinobu.mita@gmail.com, corbet@lwn.net,
        hch@infradead.org, sagi@grimberg.me, bvanassche@acm.org,
        haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Gioh Kim <gi-oh.kim@ionos.com>
Subject: [PATCHv5 for-next 10/19] block/rnbd-srv: Remove force_close file after holding a lock
Date:   Mon, 19 Apr 2021 09:37:13 +0200
Message-Id: <20210419073722.15351-11-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

We changed the rnbd_srv_sess_dev_force_close to use try-lock
because rnbd_srv_sess_dev_force_close and process_msg_close
can generate a deadlock.

Now rnbd_srv_sess_dev_force_close would do nothing
if it fails to get the lock. So removing the force_close
file should be moved to after the lock. Or the force_close
file is removed but the others are not removed.

Signed-off-by: Gioh Kim <gi-oh.kim@ionos.com>
Signed-off-by: Md Haris Iqbal <haris.iqbal@ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
---
 drivers/block/rnbd/rnbd-srv-sysfs.c | 5 +----
 drivers/block/rnbd/rnbd-srv.c       | 5 ++++-
 drivers/block/rnbd/rnbd-srv.h       | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-sysfs.c b/drivers/block/rnbd/rnbd-srv-sysfs.c
index 05ffe488ddc6..acf5fced11ef 100644
--- a/drivers/block/rnbd/rnbd-srv-sysfs.c
+++ b/drivers/block/rnbd/rnbd-srv-sysfs.c
@@ -147,10 +147,7 @@ static ssize_t rnbd_srv_dev_session_force_close_store(struct kobject *kobj,
 	}
 
 	rnbd_srv_info(sess_dev, "force close requested\n");
-
-	/* first remove sysfs itself to avoid deadlock */
-	sysfs_remove_file_self(&sess_dev->kobj, &attr->attr);
-	rnbd_srv_sess_dev_force_close(sess_dev);
+	rnbd_srv_sess_dev_force_close(sess_dev, attr);
 
 	return count;
 }
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 1549a6361630..a9bb414f7442 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -329,7 +329,8 @@ static int rnbd_srv_link_ev(struct rtrs_srv *rtrs,
 	}
 }
 
-void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev)
+void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev,
+				   struct kobj_attribute *attr)
 {
 	struct rnbd_srv_session	*sess = sess_dev->sess;
 
@@ -337,6 +338,8 @@ void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev)
 	/* It is already started to close by client's close message. */
 	if (!mutex_trylock(&sess->lock))
 		return;
+	/* first remove sysfs itself to avoid deadlock */
+	sysfs_remove_file_self(&sess_dev->kobj, &attr->attr);
 	rnbd_srv_destroy_dev_session_sysfs(sess_dev);
 	mutex_unlock(&sess->lock);
 }
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index b157371c25ed..98ddc31eb408 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -64,7 +64,8 @@ struct rnbd_srv_sess_dev {
 	enum rnbd_access_mode		access_mode;
 };
 
-void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev);
+void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev,
+				   struct kobj_attribute *attr);
 /* rnbd-srv-sysfs.c */
 
 int rnbd_srv_create_dev_sysfs(struct rnbd_srv_dev *dev,
-- 
2.25.1

