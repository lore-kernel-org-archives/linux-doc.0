Return-Path: <SRS0=2giX=4Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7375AC3F2D1
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BB0C246A6
	for <linux-doc@archiver.kernel.org>; Fri, 28 Feb 2020 00:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582848435;
	bh=su/zdgqZWOIgoXteahy9y0RwSvWY0ZVcKuqUOz2jKsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=nrJCEs9AeceT4nVtu42K0EWBD7+oLIHw9PwSGioVQ9l/6ew0Yfeu8xpfbSgCKGLVE
	 CI2ucwPCO/Lu//2ASu9DAztfFZ+Bx6iITZOVuEhHrttwiwBFdkaU/jF6genhgLVGe+
	 4ur74FpVm0KqtaAZmJJP2G1/6IwZTl7pOTIoENA8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgB1AHO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:07:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:60362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730028AbgB1AHO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Feb 2020 19:07:14 -0500
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5053F246B6;
        Fri, 28 Feb 2020 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582848433;
        bh=su/zdgqZWOIgoXteahy9y0RwSvWY0ZVcKuqUOz2jKsQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0/f3qtgMZjsoNc3LGLQ1TSckFbOseuVrbPJeUglc9BQnSeKHlwhKYVsFsVPfvHKve
         3g9cLMtVCQglx1U8/ju4kIbNX7iQeFjyLeASO5jRe/Qs9J5wtkjd/e492jeS83GPLI
         N1LVSaSOrTN28CGikGS41WEUGAy0MZaRDVOfCymQ=
From:   Jakub Kicinski <kuba@kernel.org>
To:     corbet@lwn.net
Cc:     clm@fb.com, hannes@cmpxchg.org, tj@kernel.org, lizefan@huawei.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH doc 5/5] doc: cgroup: improve formatting of references
Date:   Thu, 27 Feb 2020 16:06:53 -0800
Message-Id: <20200228000653.1572553-6-kuba@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200228000653.1572553-1-kuba@kernel.org>
References: <20200228000653.1572553-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Annotate references to other documents to make them clickable.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/accounting/psi.rst              | 2 ++
 Documentation/admin-guide/cgroup-v1/index.rst | 2 ++
 Documentation/admin-guide/cgroup-v2.rst       | 8 ++++----
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
index 621111ce5740..f2b3439edcc2 100644
--- a/Documentation/accounting/psi.rst
+++ b/Documentation/accounting/psi.rst
@@ -1,3 +1,5 @@
+.. _psi:
+
 ================================
 PSI - Pressure Stall Information
 ================================
diff --git a/Documentation/admin-guide/cgroup-v1/index.rst b/Documentation/admin-guide/cgroup-v1/index.rst
index 10bf48bae0b0..226f64473e8e 100644
--- a/Documentation/admin-guide/cgroup-v1/index.rst
+++ b/Documentation/admin-guide/cgroup-v1/index.rst
@@ -1,3 +1,5 @@
+.. _cgroup-v1:
+
 ========================
 Control Groups version 1
 ========================
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 308d096af071..fbb111616705 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -9,7 +9,7 @@ This is the authoritative documentation on the design, interface and
 conventions of cgroup v2.  It describes all userland-visible aspects
 of cgroup including core and specific controller behaviors.  All
 future changes must be reflected in this document.  Documentation for
-v1 is available under Documentation/admin-guide/cgroup-v1/.
+v1 is available under :ref:`Documentation/admin-guide/cgroup-v1/index.rst <cgroup-v1>`.
 
 .. CONTENTS
 
@@ -1023,7 +1023,7 @@ All time durations are in microseconds.
 	A read-only nested-key file which exists on non-root cgroups.
 
 	Shows pressure stall information for CPU. See
-	Documentation/accounting/psi.rst for details.
+	:ref:`Documentation/accounting/psi.rst <psi>` for details.
 
   cpu.uclamp.min
         A read-write single value file which exists on non-root cgroups.
@@ -1391,7 +1391,7 @@ PAGE_SIZE multiple when read back.
 	A read-only nested-key file which exists on non-root cgroups.
 
 	Shows pressure stall information for memory. See
-	Documentation/accounting/psi.rst for details.
+	:ref:`Documentation/accounting/psi.rst <psi>` for details.
 
 
 Usage Guidelines
@@ -1631,7 +1631,7 @@ IO Interface Files
 	A read-only nested-key file which exists on non-root cgroups.
 
 	Shows pressure stall information for IO. See
-	Documentation/accounting/psi.rst for details.
+	:ref:`Documentation/accounting/psi.rst <psi>` for details.
 
 
 Writeback
-- 
2.24.1

