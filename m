Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0384C3403B
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BEC7F24655
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581956456;
	bh=ZxaefBKyKeSkKD4GBmwPevYPRyvImqVY0fhEFDK7rp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Rt4XaWIMyykZ5xtYJKbbPP+hhG4czmcopwBAGf4z6FubKw97fSGPDHvUYqlFNzszI
	 k+cA0Y8cZg1lS74fYOxmoyYnEko2QcXiPph8GMo9L3v6Ui6njNHx8wAI0gE4yLm4u5
	 wC2HmYMjlwW1Zlx8B6MhPyErvYSUy6cYeFQxfXaw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbgBQQUz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 11:20:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55470 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgBQQUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=qG7uZEs5ZQjxVvahtWw+edjEtqyiOL4CWOMINZp7934=; b=jIpukE231DX1ILjjBvfd6tvqr2
        yXSoHBSg+66L1BXbQwLVh8VK/gkUrNrN35dJWko/hQhq45EOE57xjrRAnYzrULG4oGjyvRkftYwzH
        AVgRRSj2fTJ0xnhIjI8hKnVTWIhp7nNVkl55P5VwNEuulYWeIw/DM/yRV7fW6ZIAQrkYHYNF0Iuke
        mtRctHzbTU3+pjj4oY6JZqgEdgonzrC8ygar/Mu+ua+vBIh9yPxkc6VDeIGjh4LFml3q+a8TR7HNJ
        KdmuObk0U2ZQHAE2frmR8ouoFZXKVapzAWDvJ6mrlLNmPfPDCmEQpOA1JIH4NGjbWVU/3P7XY+Abf
        BoqHDKGQ==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8Y-00042K-De; Mon, 17 Feb 2020 16:20:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fqF-Fd; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 21/24] docs: powerpc: convert vcpudispatch_stats.txt to ReST
Date:   Mon, 17 Feb 2020 17:20:39 +0100
Message-Id: <73b1f05f20281a423718a4d3996a6f34d66e4622.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- Add a SPDX header;
- Use standard markup for document title;
- Adjust identation on lists and add blank lines where
  needed;
- Add it to the powerpc index.rst file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/index.rst                 |  1 +
 ...ispatch_stats.txt => vcpudispatch_stats.rst} | 17 ++++++++++++-----
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)

diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 0d45f0fc8e57..29b90b1b6f20 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -30,6 +30,7 @@ powerpc
     syscall64-abi
     transactional_memory
     ultravisor
+    vcpudispatch_stats
 
 .. only::  subproject and html
 
diff --git a/Documentation/powerpc/vcpudispatch_stats.txt b/Documentation/powerpc/vcpudispatch_stats.rst
similarity index 94%
rename from Documentation/powerpc/vcpudispatch_stats.txt
rename to Documentation/powerpc/vcpudispatch_stats.rst
index e21476bfd78c..5704657a5987 100644
--- a/Documentation/powerpc/vcpudispatch_stats.txt
+++ b/Documentation/powerpc/vcpudispatch_stats.rst
@@ -1,5 +1,8 @@
-VCPU Dispatch Statistics:
-=========================
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+VCPU Dispatch Statistics
+========================
 
 For Shared Processor LPARs, the POWER Hypervisor maintains a relatively
 static mapping of the LPAR processors (vcpus) to physical processor
@@ -20,25 +23,29 @@ The statistics themselves are available by reading the procfs file
 a vcpu as represented by the first field, followed by 8 numbers.
 
 The first number corresponds to:
+
 1. total vcpu dispatches since the beginning of statistics collection
 
 The next 4 numbers represent vcpu dispatch dispersions:
+
 2. number of times this vcpu was dispatched on the same processor as last
    time
 3. number of times this vcpu was dispatched on a different processor core
    as last time, but within the same chip
 4. number of times this vcpu was dispatched on a different chip
 5. number of times this vcpu was dispatches on a different socket/drawer
-(next numa boundary)
+   (next numa boundary)
 
 The final 3 numbers represent statistics in relation to the home node of
 the vcpu:
+
 6. number of times this vcpu was dispatched in its home node (chip)
 7. number of times this vcpu was dispatched in a different node
 8. number of times this vcpu was dispatched in a node further away (numa
-distance)
+   distance)
+
+An example output::
 
-An example output:
     $ sudo cat /proc/powerpc/vcpudispatch_stats
     cpu0 6839 4126 2683 30 0 6821 18 0
     cpu1 2515 1274 1229 12 0 2509 6 0
-- 
2.24.1

