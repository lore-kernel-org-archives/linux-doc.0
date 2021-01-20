Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBB4C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 00:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A72722C9E
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 00:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730537AbhATATo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730076AbhATAT2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 19:19:28 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F84C0613D6;
        Tue, 19 Jan 2021 16:18:33 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id v19so14006143pgj.12;
        Tue, 19 Jan 2021 16:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BDt3dRzzxyMOUVS7eh8bQyHtp1JLCsZLHuvxlUpRuiQ=;
        b=nLjy6Gxfv1a4qY2nlC2Q1hEzRowvlssXmdDWcqH6bGPspja43Qfhxa7Ix0xWdumpK1
         fqRacr0Kb8R5o0QBYPdYxbrWysEjuAX/uKmvA4Jal5djhdVZr47c2PAAwFwExDJn8DGz
         sXn9eBhPSm1prO93M+BMkEIPoDoNgXceZJHFqmhyQGjhNLA71Nes4XsbcgtiKR6ue1fe
         dKYZDs7VLYArrmlc0IScF7j5Px+C1lCsTHo9AxRPf81PciVHvIWxUzqkI+SDs3Xr3i38
         R5Z6Y9+Uj0CFPdpS4LD960+wLMDwtkvbQ0UumajZGyMXdwb4y36b9QCkg5vinGXuWfvT
         9Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BDt3dRzzxyMOUVS7eh8bQyHtp1JLCsZLHuvxlUpRuiQ=;
        b=orO8Kq/pb6YGVNv1hLUNF5TtofBXMBb8WsP7alrWwPV7jl1vFjE4oyUZbrtOlj9tgw
         u1h0K2GMhNUIWKYxFykfV9FIcoC/hs9Qq4DcFGlyHUST8PRC/GN7G+p7IY2x7k7kQt7n
         QnNAB66Fx5j2ky04MhvOpWyANXxCcjSc9/p6FU3nmkryxjhCL6aVUNRkdpp9zKC2sxWx
         qgeXID8idGdJqeiim0tfd/QnAmu7WhxNqx+iNQiGtdfFTB71XXS/VFVjoztGnd5u4LSm
         RmGBZafwW66L2HDodoAk/baOXVdrNjthLPCerEDbp57TLOKx0gWyx+SmMCozZhGsYRlo
         KkbA==
X-Gm-Message-State: AOAM531mrFMcuHpismzZq6Pi4SDtYFiM+JFtS62dmOWczcu+ZF9RhPdw
        /09phzt5IK4wJrUO9dESBok5Anq5T7jLmA==
X-Google-Smtp-Source: ABdhPJzScD7Vi38wkKdYZPthdXPu4530hKaGLN6+ra/ZiJuYv9k6tEPGHprwJzpX9qcKDafDONVxaA==
X-Received: by 2002:a63:e442:: with SMTP id i2mr6568758pgk.12.1611101913169;
        Tue, 19 Jan 2021 16:18:33 -0800 (PST)
Received: from kir-rhat.lan (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id y6sm227452pfn.123.2021.01.19.16.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:18:32 -0800 (PST)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, cgroups@vger.kernel.org,
        Kir Kolyshkin <kolyshkin@gmail.com>
Subject: [PATCH 05/10] docs/scheduler/sched-bwc: note/link cgroup v2
Date:   Tue, 19 Jan 2021 16:18:19 -0800
Message-Id: <20210120001824.385168-6-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120001824.385168-1-kolyshkin@gmail.com>
References: <20210120001824.385168-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++++
 Documentation/scheduler/sched-bwc.rst   | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index e0f6ff7cfa93..b55362454886 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1,3 +1,5 @@
+.. _cgroup-v2:
+
 ================
 Control Group v2
 ================
@@ -954,6 +956,8 @@ All cgroup core files are prefixed with "cgroup."
 Controllers
 ===========
 
+.. _cgroup-v2-cpu:
+
 CPU
 ---
 
diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index dcec7440c222..963fde3993dc 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -27,6 +27,11 @@ Management
 ----------
 Quota and period are managed within the cpu subsystem via cgroupfs.
 
+.. note::
+   The cgroupfs files described in this section are only applicable
+   to cgroup v1. For cgroup v2, see
+   :ref:`Documentation/admin-guide/cgroupv2.rst <cgroup-v2-cpu>`.
+
 - cpu.cfs_quota_us: the total available run-time within a period (in
   microseconds)
 - cpu.cfs_period_us: the length of a period (in microseconds)
-- 
2.29.2

