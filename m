Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C888FC4727E
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BEB920782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993209;
	bh=A7lLnKa6YyaQtK0OX9oslHuXqmGCRzRwzf23PGqcyNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GD/6+bZUBUa/U/rt8h4VRbQ6kOg0PaMmOfYwg5PER6FIBLTckArTvuoZ1nGcGY1WL
	 h2Xw2hpWMtrSvftAA1TOTjUshqCcXHc9i6HLmMrTi0Q2OHN9xbJ/jXl0pLxC2ewN/j
	 Opuf3NDzL4tFnY/N3RXrJUTJuwj7fHXbeSOG0CaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgJFOGa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:06:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:33310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88DB1221E8;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=A7lLnKa6YyaQtK0OX9oslHuXqmGCRzRwzf23PGqcyNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FLIJBHjXP4tQqLH8f7Zx0MdCgakBfymVE62vPKezw23ZYMLqSvdTnTpAT8BiAsNWd
         UF3v3zRYCYXZguxRqaA5VUQw6gVYk5qS/F9vz4b3xt84u7QuvyNf9Lem7NtDebCIrc
         qodtyltH15IfX8geX+AIVPVHv4ivOy2cBQGVAOfs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019G0-FU; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 34/52] docs: pstore-blk.rst: fix kernel-doc tags
Date:   Tue,  6 Oct 2020 16:03:31 +0200
Message-Id: <47312ffe217bdb4d77f03889a360addb48fffd22.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There is currently a problem with kernel-doc tags from blk.c:

	.../Documentation/admin-guide/pstore-blk:239: ./fs/pstore/blk.c:175: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
	Declaration is 'register_pstore_device'.
	.../Documentation/admin-guide/pstore-blk:239: ./fs/pstore/blk.c:432: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
	Declaration is 'register_pstore_blk'.
	.../Documentation/admin-guide/pstore-blk:242: ./include/linux/pstore_blk.h:43: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
	Declaration is 'pstore_device_info'.

Basically, the internal parts is shown with :export:, instead
of :internal:. Yet, there are some other exported docs that
aren't at the document, because they lack :identifiers:.

So, instead, let's just use :export: at the kAPI part of
the documentation.

Acked-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/pstore-blk.rst | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 296d5027787a..6898aba9fb5c 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -154,17 +154,11 @@ Configurations for driver
 Only a block device driver cares about these configurations. A block device
 driver uses ``register_pstore_blk`` to register to pstore/blk.
 
-.. kernel-doc:: fs/pstore/blk.c
-   :identifiers: register_pstore_blk
-
 A non-block device driver uses ``register_pstore_device`` with
 ``struct pstore_device_info`` to register to pstore/blk.
 
 .. kernel-doc:: fs/pstore/blk.c
-   :identifiers: register_pstore_device
-
-.. kernel-doc:: include/linux/pstore_blk.h
-   :identifiers: pstore_device_info
+   :export:
 
 Compression and header
 ----------------------
@@ -237,7 +231,7 @@ For developer reference, here are all the important structures and APIs:
    :internal:
 
 .. kernel-doc:: fs/pstore/blk.c
-   :export:
+   :internal:
 
 .. kernel-doc:: include/linux/pstore_blk.h
    :internal:
-- 
2.26.2

