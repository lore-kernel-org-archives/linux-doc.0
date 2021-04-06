Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40A6C43460
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 11:51:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B924613B8
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 11:51:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343504AbhDFLvH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 07:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbhDFLvG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 07:51:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD40C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 04:50:58 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r22so3692591edq.9
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 04:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qEgfGkEH/4geB+vsRguqEiTYghExirAxMsBMTZDkxo=;
        b=L5EBAuUn6Duc93ViZh2kS/yNB9fVN7CY+w5Gt7cS16OrCR0hyv2YCmr7M5ERRGa93Z
         VgHaKTck15dl5prehWPTnLz7NEMiMxZ94DpylGaTtYjIJrjm6Utdx12XH5uEDjjLRolF
         JASfucoAVbX8s+ls/X3AJxSEiA9e1JHzrWfXJnBP9B1fjal3kHR2ATd7xlv97lvIQjbA
         LGDdi7nL82SJSlOj8rhEsiRqiZHj1TlNN99jsFpPOJ+VuF23Nx9527jD8Ft0GlQm+SUT
         5VvYmYYgzOOEw1FsP4Q3vpRFZ6PH0/8Lgod7f+IfMPeGdtTJwklCCsZ7DM0A52HMN4Pr
         R5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8qEgfGkEH/4geB+vsRguqEiTYghExirAxMsBMTZDkxo=;
        b=DB99dNmD/kU/im8Bk+uEXsqdd86dPXFPTaOdoIW/x/jd+o/6ylugx25BSkufMTZDL8
         LTkJgNAw8+tXP1rNndhb/Xee2AMilL+Dhp1JZkOub1j5YFWj0IhmFwkDI5DGF/gFDH+B
         eLKD4GJkyX7mlbj+q1Ua8bF85Vz6tcKHn+1qIyjmWJ9/1z5ogllxQwE6xYK3wGonbrJj
         zcfOkKKhCb2mht47fGo8nAEng78Jiu9oGZOI5tICrMi1WWlrIB0mFgg3Pqs1PeapywrL
         zx804+mzQDOzgP+3EYyiRd2gfK1sF5xdKvrURIE3hvTHpIOYg8bpV1t7QAuP0+/JMXSO
         uUFg==
X-Gm-Message-State: AOAM531BWwLMQXCGJLpMgpSeDvRoipnYSXEOxMDbtgdwE2pFU5IUZ1vB
        IxwX8tJfX2RXnikw7eLoAIwN6g==
X-Google-Smtp-Source: ABdhPJwEc8Q+BidNwrVcAZ08ycPeZUQXQlxlJ27moaWipmKzJsTe4W4Vf3I2pNmsRAxbrsIYFD/Wuw==
X-Received: by 2002:aa7:db51:: with SMTP id n17mr38765588edt.259.1617709857301;
        Tue, 06 Apr 2021 04:50:57 -0700 (PDT)
Received: from gkim-laptop.fkb.profitbricks.net (ip5f5aeee5.dynamic.kabel-deutschland.de. [95.90.238.229])
        by smtp.googlemail.com with ESMTPSA id t1sm855964eds.53.2021.04.06.04.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:50:57 -0700 (PDT)
From:   Gioh Kim <gi-oh.kim@ionos.com>
To:     linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     bvanassche@acm.org, leon@kernel.org, dledford@redhat.com,
        jgg@ziepe.ca, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
        akinobu.mita@gmail.com, corbet@lwn.net,
        Gioh Kim <gi-oh.kim@ionos.com>
Subject: [PATCH 0/4] Enable Fault Injection for RTRS
Date:   Tue,  6 Apr 2021 13:50:45 +0200
Message-Id: <20210406115049.196527-1-gi-oh.kim@ionos.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

My colleagues and I would like to apply the fault injection
of the Linux to test error handling of RTRS module. RTRS module
consists of client and server modules that are connected via
Infiniband network. So it is important for the client to receive
the error of the server and handle it smoothly.

When debugfs is enabled, RTRS is able to export interfaces
to fail RTRS client and server.
Following fault injection points are enabled:
- fail a request processing on RTRS client side
- fail a heart-beat transferation on RTRS server side

This patch set is just a starting point. We will enable various
faults and test as many error cases as possible.

Best regards

Gioh Kim (4):
  RDMA/rtrs: Enable the fault-injection
  RDMA/rtrs-clt: Inject a fault at request processing
  RDMA/rtrs-srv: Inject a fault at heart-beat sending
  docs: fault-injection: Add fault-injection manual of RTRS

 .../fault-injection/rtrs-fault-injection.rst  | 83 +++++++++++++++++++
 drivers/infiniband/ulp/rtrs/Makefile          |  2 +
 drivers/infiniband/ulp/rtrs/rtrs-clt-sysfs.c  | 44 ++++++++++
 drivers/infiniband/ulp/rtrs/rtrs-clt.c        |  7 ++
 drivers/infiniband/ulp/rtrs/rtrs-clt.h        | 13 +++
 drivers/infiniband/ulp/rtrs/rtrs-fault.c      | 52 ++++++++++++
 drivers/infiniband/ulp/rtrs/rtrs-fault.h      | 28 +++++++
 drivers/infiniband/ulp/rtrs/rtrs-srv-sysfs.c  | 44 ++++++++++
 drivers/infiniband/ulp/rtrs/rtrs-srv.c        |  5 ++
 drivers/infiniband/ulp/rtrs/rtrs-srv.h        | 13 +++
 10 files changed, 291 insertions(+)
 create mode 100644 Documentation/fault-injection/rtrs-fault-injection.rst
 create mode 100644 drivers/infiniband/ulp/rtrs/rtrs-fault.c
 create mode 100644 drivers/infiniband/ulp/rtrs/rtrs-fault.h

-- 
2.25.1

