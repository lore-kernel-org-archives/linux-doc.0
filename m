Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A7EC43616
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BA0A613C0
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239635AbhDGIV3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:21:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240836AbhDGIVR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 04:21:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5C30613F5;
        Wed,  7 Apr 2021 08:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617783663;
        bh=qdj19kuETEoEUQOFNz+TbStDyi306LK7TosDDmEqqXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NXasXv3c/TyqY62Fq4Y8m038ChY3Z2e+wlXVOxn5ibMmusUeI9QAbcNyxqzIojpBF
         Phyen13aSasOw+9/FYUmppgXB22zj4IP73k2vT0pl72D2XcNTaWBAUqH9LZnTNiFQO
         VaJJg0aSX/lNujfIQ5EGJnxsaImttNzCuQ99WYwuXenlz0xA0LPe/g+xu9k1vrW/ai
         acU1+jnezVjpyzCX1yduaizto1/BAZkYesUrc6tt79yvtVfkes9kn7Rg67p5xCqxuQ
         JXjqqY+ESb8eP45KM9Os5YXP5jYFykN5vGHuPqffZqxQMY0K6mipDy/t7jASUVAhQF
         mS9tElZrWct0Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lU3Qq-005i2t-Vj; Wed, 07 Apr 2021 10:21:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Kir Kolyshkin <kolyshkin@gmail.com>, Tejun Heo <tj@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/19] docs: sched-bwc.rst: fix a typo on a doc name
Date:   Wed,  7 Apr 2021 10:20:58 +0200
Message-Id: <5531ae131040433f8ae669e37737d0adadc9dc7c.1617783062.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617783062.git.mchehab+huawei@kernel.org>
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
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

