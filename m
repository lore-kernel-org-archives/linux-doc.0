Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com [209.85.128.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C60A1DDC2F
	for <linux-doc@vger.kernel.org>; Mon,  7 Oct 2024 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325476; cv=none; b=uNGTZfhCXVERiZ7eqVLPOKgaSLalzxNf6fjxd5kYERS33Gawsyj9XT4ZBxrWiJeEO3Rq+Pr6z1uiY7ZKWs0J55YIbetnHMTPLA+3wijCJlKXRZiniZ2RHDTPD1xaZU1ovj6bd+4fuZrHKDlm3EdNbcV5ghHguHXjW3AX4sRnHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325476; c=relaxed/simple;
	bh=w6LdgIOhjc250dIk7Rx+Ytl+Sk5e4esszP6YKCo9TGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mhje0RXD//1buF5L6x9LKWxrDotBE8p036bTwqtmkK7Z+rdRKyd7fZaxILug+1n1Sx3zpzFGw8Vywo7j6iHiIJ+c3zgOLXeFEzte6jaXhSYH1FutrRShKwPm11/SWIA4fK8pO6Q/x1SDL8ZezdJjr4CkcviGuECMGTuexqqV/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NYabTLk5; arc=none smtp.client-ip=209.85.128.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NYabTLk5"
Received: by mail-wm1-f98.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso48185745e9.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Oct 2024 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1728325472; x=1728930272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiJLzYaJNgoKuqGrz0VXF67d0Soid/dfAGjb8HjQkE0=;
        b=NYabTLk5lcLv8wG7Kd9ZtJnx1SsmCQyYAXZEJ/JnPOqjy/+nfPt+W8KMPwLBPsTlsT
         mysMn3yqvehIul+bMA3GrJ0Igr7jT4/wJvIYFdp/uHw/K1GzTdQsfkQ2otYOVLTI/GOZ
         pAJIql0/rULlxOkYY0eLUQFP6gqa4tdEhLgwkgeEmtrR7OLJeEvIYROp/T+l5lxAYKO9
         QMPJtJ052wxJdwq5vh/TBKbQbO6dsLodG0ncYXHFAjQbJuF1+IQbI3gfYTT8WFR9XMs0
         9APlfq2SqQmfmipoxSlcVfq4vaaYonIpBWGk8AH5Wyo+Xln3jNQ5XsZfcxvbYqpzAm7E
         oJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325472; x=1728930272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiJLzYaJNgoKuqGrz0VXF67d0Soid/dfAGjb8HjQkE0=;
        b=pf3XJCL8a8C/8IG5QLEyvfEV4IoMU6cb1VBXhginIRhY6qb8hMP4qb6buLshdj9Lzz
         pIFCJbF1aS/I6t2IRF4BU/38evC3zAxLxDXS4zMvUXmR2ClaOEh7Cpf2soNZWWGw30nI
         ZeIjFUAsxm44jNonBH/aNp0R9SoBdKpWv0Qf3g3lNwj+quTf9BsJFcImBFZgQcM8Fw8C
         4v+OBx5nPgrM3pDion6jAIp0B3eLbvBLoFHscjS+0UJwmWGDdwFO7r6v1ywTi0cTqSV5
         5UU5xqQrq9h6Jxy8c7hNW68stb7hmf/Ibd2icaT/7tBc4D4FvjxuYzOx4OB4NQ7FJ/zk
         6u1g==
X-Forwarded-Encrypted: i=1; AJvYcCX+b8F7l3P10bE43tBRBLf0nCdliRn+I/37rFr7tCgsVDfhRf7yI2SUJa8e6RbqEKnr+NuvEgRXeTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdw4biVBQZKpl6bRgFUGP0m5+3w6wyRNJiLgeNAv+5kGwYf42P
	9eJoAg7jGUd1EHUXvCED2wwP5h7Vhj3xnoiHBUTHEIl4KmJFOn0fDk82KSsX+Kbm6Numhkcz9DG
	bLlC0Bkh9/LmJRZlYw3419dXp++3umep+
X-Google-Smtp-Source: AGHT+IF/zB3vQwn7lxcYIb6r6GzeXL17PZJzn1KAqTVDcH519KBSfmhuUnSRgOouH8ASztCuOdYhQVei3DSO
X-Received: by 2002:a05:600c:44d6:b0:42c:c401:6d86 with SMTP id 5b1f17b1804b1-42f85aea06fmr90659715e9.27.1728325471523;
        Mon, 07 Oct 2024 11:24:31 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-42f89ed9c55sm1978985e9.48.2024.10.07.11.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:24:31 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 39A46340282;
	Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 37855E41398; Mon,  7 Oct 2024 12:24:30 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 3/5] ublk: merge stop_work and quiesce_work
Date: Mon,  7 Oct 2024 12:24:16 -0600
Message-Id: <20241007182419.3263186-4-ushankar@purestorage.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007182419.3263186-1-ushankar@purestorage.com>
References: <20241007182419.3263186-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save some lines by merging stop_work and quiesce_work into nosrv_work,
which looks at the recovery flags and does the right thing when the "no
ublk server" condition is detected.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 64 ++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index a838ba809445..d5edef7bde43 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -182,8 +182,7 @@ struct ublk_device {
 	unsigned int		nr_queues_ready;
 	unsigned int		nr_privileged_daemon;
 
-	struct work_struct	quiesce_work;
-	struct work_struct	stop_work;
+	struct work_struct	nosrv_work;
 };
 
 /* header of ublk_params */
@@ -1261,10 +1260,7 @@ static enum blk_eh_timer_return ublk_timeout(struct request *rq)
 		struct ublk_device *ub = ubq->dev;
 
 		if (ublk_abort_requests(ub, ubq)) {
-			if (ublk_nosrv_should_stop_dev(ub))
-				schedule_work(&ub->stop_work);
-			else
-				schedule_work(&ub->quiesce_work);
+			schedule_work(&ub->nosrv_work);
 		}
 		return BLK_EH_DONE;
 	}
@@ -1514,10 +1510,7 @@ static void ublk_uring_cmd_cancel_fn(struct io_uring_cmd *cmd,
 	ublk_cancel_cmd(ubq, io, issue_flags);
 
 	if (need_schedule) {
-		if (ublk_nosrv_should_stop_dev(ub))
-			schedule_work(&ub->stop_work);
-		else
-			schedule_work(&ub->quiesce_work);
+		schedule_work(&ub->nosrv_work);
 	}
 }
 
@@ -1580,20 +1573,6 @@ static void __ublk_quiesce_dev(struct ublk_device *ub)
 	ub->dev_info.state = UBLK_S_DEV_QUIESCED;
 }
 
-static void ublk_quiesce_work_fn(struct work_struct *work)
-{
-	struct ublk_device *ub =
-		container_of(work, struct ublk_device, quiesce_work);
-
-	mutex_lock(&ub->mutex);
-	if (ub->dev_info.state != UBLK_S_DEV_LIVE)
-		goto unlock;
-	__ublk_quiesce_dev(ub);
- unlock:
-	mutex_unlock(&ub->mutex);
-	ublk_cancel_dev(ub);
-}
-
 static void ublk_unquiesce_dev(struct ublk_device *ub)
 {
 	int i;
@@ -1642,6 +1621,25 @@ static void ublk_stop_dev(struct ublk_device *ub)
 	ublk_cancel_dev(ub);
 }
 
+static void ublk_nosrv_work(struct work_struct *work)
+{
+	struct ublk_device *ub =
+		container_of(work, struct ublk_device, nosrv_work);
+
+	if (ublk_nosrv_should_stop_dev(ub)) {
+		ublk_stop_dev(ub);
+		return;
+	}
+
+	mutex_lock(&ub->mutex);
+	if (ub->dev_info.state != UBLK_S_DEV_LIVE)
+		goto unlock;
+	__ublk_quiesce_dev(ub);
+ unlock:
+	mutex_unlock(&ub->mutex);
+	ublk_cancel_dev(ub);
+}
+
 /* device can only be started after all IOs are ready */
 static void ublk_mark_io_ready(struct ublk_device *ub, struct ublk_queue *ubq)
 {
@@ -2155,14 +2153,6 @@ static int ublk_add_chdev(struct ublk_device *ub)
 	return ret;
 }
 
-static void ublk_stop_work_fn(struct work_struct *work)
-{
-	struct ublk_device *ub =
-		container_of(work, struct ublk_device, stop_work);
-
-	ublk_stop_dev(ub);
-}
-
 /* align max io buffer size with PAGE_SIZE */
 static void ublk_align_max_io_size(struct ublk_device *ub)
 {
@@ -2187,8 +2177,7 @@ static int ublk_add_tag_set(struct ublk_device *ub)
 static void ublk_remove(struct ublk_device *ub)
 {
 	ublk_stop_dev(ub);
-	cancel_work_sync(&ub->stop_work);
-	cancel_work_sync(&ub->quiesce_work);
+	cancel_work_sync(&ub->nosrv_work);
 	cdev_device_del(&ub->cdev, &ub->cdev_dev);
 	ublk_put_device(ub);
 	ublks_added--;
@@ -2448,8 +2437,7 @@ static int ublk_ctrl_add_dev(struct io_uring_cmd *cmd)
 		goto out_unlock;
 	mutex_init(&ub->mutex);
 	spin_lock_init(&ub->lock);
-	INIT_WORK(&ub->quiesce_work, ublk_quiesce_work_fn);
-	INIT_WORK(&ub->stop_work, ublk_stop_work_fn);
+	INIT_WORK(&ub->nosrv_work, ublk_nosrv_work);
 
 	ret = ublk_alloc_dev_number(ub, header->dev_id);
 	if (ret < 0)
@@ -2584,9 +2572,7 @@ static inline void ublk_ctrl_cmd_dump(struct io_uring_cmd *cmd)
 static int ublk_ctrl_stop_dev(struct ublk_device *ub)
 {
 	ublk_stop_dev(ub);
-	cancel_work_sync(&ub->stop_work);
-	cancel_work_sync(&ub->quiesce_work);
-
+	cancel_work_sync(&ub->nosrv_work);
 	return 0;
 }
 
-- 
2.34.1

