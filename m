Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FDAC4727F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B0282075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472477;
	bh=lFEzsRGazv6x3BF+7IzZhV96OJvEaoKXaQrpvpjxmPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qKg243WscYtq+66qsCmzS6FJCdw9TdDcb82Z15wpIlvUzUeYonRGbFI3994B9Nn8e
	 0gYZrwTpwOZAJVb4eOEmCraTX3DtpBMKP5jfdlD1w9fKjUlpb8/DhCeT34gRD7pqxM
	 aZyyn97b1jJmK48ga2fft4E1s2NtDZqej30vpmfE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730592AbgI3N1p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:27:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730226AbgI3NZV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C84BE23731;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=lFEzsRGazv6x3BF+7IzZhV96OJvEaoKXaQrpvpjxmPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2u6KUkg07hbdhx4TSO/whYXNl3vo0a9Kmrn6KIP2RUzrbNxB7qXM0nqoI7+vm9e/A
         S4K2CBYiYzgVE7bx1FST04LT1ddvmpn7DWJQftBVaW30QIGTLqs7KgEtfSyPVh1i+q
         Jy9K7EmU6GIZZA31KYEb4nrCszl5L5gh/oe4SaBM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XK8-Ud; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 29/52] docs: basics.rst: move kernel-doc workqueue markups to workqueue.rst
Date:   Wed, 30 Sep 2020 15:24:52 +0200
Message-Id: <913b26af73f87892de5b980a67a0b4aaaab7019b.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As there's already a rst file with workqueue markups, containing
part of them, move the other definitions, in order to avoid
warnings with Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/core-api/workqueue.rst | 2 ++
 Documentation/driver-api/basics.rst  | 9 ---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/core-api/workqueue.rst b/Documentation/core-api/workqueue.rst
index 00a5ba51e63f..541d31de8926 100644
--- a/Documentation/core-api/workqueue.rst
+++ b/Documentation/core-api/workqueue.rst
@@ -396,3 +396,5 @@ Kernel Inline Documentations Reference
 ======================================
 
 .. kernel-doc:: include/linux/workqueue.h
+
+.. kernel-doc:: kernel/workqueue.c
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 1ba88c7b3984..54f8d5ca7475 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -55,15 +55,6 @@ High-resolution timers
 .. kernel-doc:: kernel/time/hrtimer.c
    :export:
 
-Workqueues and Kevents
-----------------------
-
-.. kernel-doc:: include/linux/workqueue.h
-   :internal:
-
-.. kernel-doc:: kernel/workqueue.c
-   :export:
-
 Internal Functions
 ------------------
 
-- 
2.26.2

