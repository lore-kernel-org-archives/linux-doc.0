Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41AEC433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A636F610F7
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 12:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhDIMsP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 08:48:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232615AbhDIMsO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 08:48:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52B27610FB;
        Fri,  9 Apr 2021 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617972481;
        bh=qdj19kuETEoEUQOFNz+TbStDyi306LK7TosDDmEqqXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q85IEtHijZqFt7NgpH1h2uRUr1QEyLsn8VBc+qtbnhYFznOZcnjNBbF4kZrrYuF9/
         eYp26rcMiote9jVDETGS8WQvlOpV24Hr9te5JexRdg+BlsNWUDF3xTSVG9qPu26FAb
         WIho3WiT7Cv2rI2sd0qjhTXflTHHoh5RMi9ICHr0iwzX50YH0NkWZZnYT/J8c7L3Ek
         Cyhj6ZKgqDwwEIqaHTtLCyYqSuBJPieKwJHN+jjywoVTU1U0X2Vkl5r6o7W0vU1h+Z
         pakg0V//eAxqs14THkPnJ5mYSJMpGM4akM1dbArnaVDIEthHL4NFgiHB/fhKrPyn0u
         n+LOfITrk+yHg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUqYE-001SLu-F8; Fri, 09 Apr 2021 14:47:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kir Kolyshkin <kolyshkin@gmail.com>, Tejun Heo <tj@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] docs: sched-bwc.rst: fix a typo on a doc name
Date:   Fri,  9 Apr 2021 14:47:52 +0200
Message-Id: <ff7c6f344d6330430869ef3a93bb859695047d47.1617972339.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617972339.git.mchehab+huawei@kernel.org>
References: <cover.1617972339.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

cgroupv2.rst -> cgroup-v2.rst

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/scheduler/sched-bwc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
index 845eee659199..1fc73555f5c4 100644
--- a/Documentation/scheduler/sched-bwc.rst
+++ b/Documentation/scheduler/sched-bwc.rst
@@ -29,7 +29,7 @@ Quota and period are managed within the cpu subsystem via cgroupfs.
 .. note::
    The cgroupfs files described in this section are only applicable
    to cgroup v1. For cgroup v2, see
-   :ref:`Documentation/admin-guide/cgroupv2.rst <cgroup-v2-cpu>`.
+   :ref:`Documentation/admin-guide/cgroup-v2.rst <cgroup-v2-cpu>`.
 
 - cpu.cfs_quota_us: the total available run-time within a period (in
   microseconds)
-- 
2.30.2

