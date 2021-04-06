Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6528C43460
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 11:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92ED7613CB
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 11:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhDFLvK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 07:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343506AbhDFLvK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 07:51:10 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C1FC06175F
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 04:51:02 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w18so16255986edc.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+fx8l8V5EMDboI86SA1WhpDb5yjACty79dIqKbVLav8=;
        b=Mw+HKiNgTYAt3ltCtfTKUT22NKauUilDW9Occ2pOpnCmMzpNdacES37uTFOsPebj+8
         5taIAv0oPVlT1wqxHRDzzJHqToOkMEQMOkUcdrfjmzNosa9CEKiInJMOgidGaySlqWlP
         SZKCIcRxDC1iui2GvSMDk8jlM91x08pXjmUI2y0dm6CQVvvAgUz54+zCYOVz9UWXmrFW
         aRce0GtctkssK2yTSAeCSo5wsbOuDACyiaXNgvES2OA8AsAUESt6yuhhHzl1MSCIlvpb
         I29qQSkM2vKUgYmcSt0zy0HhMJpZydNKYbJOzqnDFXtbIFYo9yM4e2dxdAS+puLsFJIz
         M99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+fx8l8V5EMDboI86SA1WhpDb5yjACty79dIqKbVLav8=;
        b=jpCQFK86+uBop4y9voDgy266r7BpZGNexM6JANF4wJU5O2/a5fNHR2lSEO1+0u/pY+
         76/44Px+7nPaKLH6Deov4CnZDAZ+tUsDU8svZLaXokyRKidYBD706hYaov5R1WjSOYj0
         cUP4wx2C+q+fEICzp2Op3PQr7Mj9ZTyNTG0/RjGgFpGo1JA9c2ITy8l1Iq6+TlfDVPXR
         6q1V/jAO/r5txetcDkYOzzexkH6DNCC/2fLY8oxLn/01woSlnsy5Rz5WYSyhmQFSRPHB
         NeCOejLHjLhY8nJZGtMDw+SA4IrGCCnBxKV70dl6p+QteS5ox+9GPpfO6yMUQndYyQTB
         SerA==
X-Gm-Message-State: AOAM531/GEwKvAnbRDF07XU340/QqaYyfJ8gjkZUBUU3XOqoqLrS5BDg
        7zaxioot/BkWzfudNybfXB5v2A==
X-Google-Smtp-Source: ABdhPJzeilIr9tABKRg36g/Pdxw7Tb/DAB8WoxzkIFBtiYNsqqQOY29asCy0Pss/V85BUHnTPCJrRQ==
X-Received: by 2002:a05:6402:17e9:: with SMTP id t9mr37230916edy.211.1617709860981;
        Tue, 06 Apr 2021 04:51:00 -0700 (PDT)
Received: from gkim-laptop.fkb.profitbricks.net (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id t1sm855964eds.53.2021.04.06.04.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:51:00 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     bvanassche@acm.org, leon@kernel.org, dledford@redhat.com,
        jgg@ziepe.ca, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        akinobu.mita@gmail.com, corbet@lwn.net,
        Gioh Kim <gi-oh.kim@cloud.ionos.com>,
        Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH 3/4] RDMA/rtrs-srv: Inject a fault at heart-beat sending
Date:   Tue,  6 Apr 2021 13:50:48 +0200
Message-Id: <20210406115049.196527-4-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406115049.196527-1-gi-oh.kim@ionos.com>
References: <20210406115049.196527-1-gi-oh.kim@ionos.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Gioh Kim <gi-oh.kim@cloud.ionos.com>

If the fault-injection is enabled, it does not send a heart-beat
and generates the error on the client side.

Signed-off-by: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c | 44 ++++++++++++++++++++
 drivers/infiniband/ulp/rtrs/rtrs-srv.c       |  5 +++
 drivers/infiniband/ulp/rtrs/rtrs-srv.h       | 13 ++++++
 3 files changed, 62 insertions(+)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
index a9288175fbb5..57af9e7c3588 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c
@@ -309,3 +309,47 @@ void rtrs_srv_destroy_sess_files(struct rtrs_srv_sess *sess)
 		rtrs_srv_destroy_once_sysfs_root_folders(sess);
 	}
 }
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+void rtrs_srv_fault_inject_init(struct rtrs_srv_fault_inject *fault_inject,
+				struct rtrs_srv_sess *sess)
+{
+	char str[NAME_MAX];
+	int cnt;
+
+	cnt = sockaddr_to_str((struct sockaddr *)&sess->s.src_addr,
+			      str, sizeof(str));
+	cnt += scnprintf(str + cnt, sizeof(str) - cnt, "@");
+	sockaddr_to_str((struct sockaddr *)&sess->s.dst_addr,
+			str + cnt, sizeof(str) - cnt);
+
+	rtrs_fault_inject_init(&fault_inject->fj, str, -EBUSY);
+	/* injection points */
+	rtrs_fault_inject_add(fault_inject->fj.dir,
+			      "fail-hb-ack", &fault_inject->fail_hb_ack);
+}
+
+void rtrs_srv_fault_inject_final(struct rtrs_srv_fault_inject *fault_inject)
+{
+	rtrs_fault_inject_final(&fault_inject->fj);
+}
+
+int rtrs_should_fail_hb_ack(struct rtrs_srv_fault_inject *fault_inject)
+{
+	if (fault_inject->fail_hb_ack && should_fail(&fault_inject->fj.attr, 1))
+		return fault_inject->fj.status;
+	return 0;
+}
+#else
+void rtrs_srv_fault_inject_init(struct rtrs_srv_fault_inject *fault_inject,
+				struct rtrs_srv_sess *sess_name)
+{
+}
+void rtrs_srv_fault_inject_final(struct rtrs_srv_fault_inject *fault_inject)
+{
+}
+int rtrs_should_fail_hb_ack(struct rtrs_srv_fault_inject *fault_inject)
+{
+	return 0;
+}
+#endif
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.c b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
index 5e9bb7bf5ef3..6e53dac0d22c 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.c
@@ -1232,6 +1232,8 @@ static void rtrs_srv_rdma_done(struct ib_cq *cq, struct ib_wc *wc)
 			}
 		} else if (imm_type == RTRS_HB_MSG_IMM) {
 			WARN_ON(con->c.cid);
+			if (unlikely(rtrs_should_fail_hb_ack(&sess->fault_inject)))
+				break;
 			rtrs_send_hb_ack(&sess->s);
 		} else if (imm_type == RTRS_HB_ACK_IMM) {
 			WARN_ON(con->c.cid);
@@ -1489,6 +1491,7 @@ static void rtrs_srv_close_work(struct work_struct *work)
 
 	sess = container_of(work, typeof(*sess), close_work);
 
+	rtrs_srv_fault_inject_final(&sess->fault_inject);
 	rtrs_srv_destroy_sess_files(sess);
 	rtrs_srv_stop_hb(sess);
 
@@ -1748,6 +1751,8 @@ static struct rtrs_srv_sess *__alloc_sess(struct rtrs_srv *srv,
 
 	__add_path_to_srv(srv, sess);
 
+	rtrs_srv_fault_inject_init(&sess->fault_inject, sess);
+
 	return sess;
 
 err_unmap_bufs:
diff --git a/drivers/infiniband/ulp/rtrs/rtrs-srv.h b/drivers/infiniband/ulp/rtrs/rtrs-srv.h
index 9543ae19996c..001889e148ac 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-srv.h
+++ b/drivers/infiniband/ulp/rtrs/rtrs-srv.h
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/refcount.h>
 #include "rtrs-pri.h"
+#include "rtrs-fault.h"
 
 /*
  * enum rtrs_srv_state - Server states.
@@ -73,6 +74,13 @@ struct rtrs_srv_mr {
 	struct rtrs_iu	*iu;		/* send buffer for new rkey msg */
 };
 
+struct rtrs_srv_fault_inject {
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+	struct rtrs_fault_inject fj;
+	bool fail_hb_ack;
+#endif
+};
+
 struct rtrs_srv_sess {
 	struct rtrs_sess	s;
 	struct rtrs_srv	*srv;
@@ -90,6 +98,7 @@ struct rtrs_srv_sess {
 	unsigned int		mem_bits;
 	struct kobject		kobj;
 	struct rtrs_srv_stats	*stats;
+	struct rtrs_srv_fault_inject	fault_inject;
 };
 
 struct rtrs_srv {
@@ -152,4 +161,8 @@ ssize_t rtrs_srv_reset_all_help(struct rtrs_srv_stats *stats,
 int rtrs_srv_create_sess_files(struct rtrs_srv_sess *sess);
 void rtrs_srv_destroy_sess_files(struct rtrs_srv_sess *sess);
 
+void rtrs_srv_fault_inject_init(struct rtrs_srv_fault_inject *fault_inject,
+				struct rtrs_srv_sess *sess);
+void rtrs_srv_fault_inject_final(struct rtrs_srv_fault_inject *fault_inject);
+int rtrs_should_fail_hb_ack(struct rtrs_srv_fault_inject *fault_inject);
 #endif /* RTRS_SRV_H */
-- 
2.25.1

