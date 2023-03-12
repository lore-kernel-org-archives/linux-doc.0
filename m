Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AC4C6FA99
	for <linux-doc@archiver.kernel.org>; Sun, 12 Mar 2023 20:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjCLURX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 12 Mar 2023 16:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCLURW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 12 Mar 2023 16:17:22 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864211CF77
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 13:17:21 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so150512pjz.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Mar 2023 13:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1678652240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci1g5tAeDNBEuhH1jXrQ1uQStWKKV42Sr6cMMYRU68c=;
        b=Te7Sj25L1Xre20HX7AR3yNOJBn+TmyS/B8aNWc3DC3+6WChcR747mbVq0AFAXsftx1
         Md9JZM/7IiSc3gxOn7PsExubTw65bvGF4FKnStN23TaegwMI4XqKbGjxjHlOntc9WP+V
         E4owFYDhSzmhvgNqx3M84PM6SIAzOjJLViN0bnIhOuH6JfxfRgqfP4gf/XYa/55ahRGV
         7aQw6Z47A/0WyN2ZK4JsU4dIqgZAuD33cF2R5wQmhZnZZ9kGSHiRaJkT6Y1I/JqA4I/y
         WCoKb0pHlNlweTncqqRHSvAQ/eIcbi5Ilw9vRdocasujmJtqIOidhFWRsehAtNkDTt5v
         ZXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci1g5tAeDNBEuhH1jXrQ1uQStWKKV42Sr6cMMYRU68c=;
        b=3QMwCF/qSSNVFOfVA3wDTlHBdIdTYLz1MlSFvxN/qxPUWHko+5fGnp/n8Z7kLREhML
         v99tIvPWL942ecYiJyI9wYICs6nLmFSfRRRREygs6EJwY/SSIrjyhTlZXT4okBMn6ZAz
         eXzCw2Hftg+5XC8U/puc7T3B7tWZWfhZLKABlBZdohKaBm/pPF2NBEkjG3SljuDXOYsH
         cwazOOPvKrlq5/M2E8jXKwsV2Um2B13PxX2yUh5mHoWKtEK16Qiirh1eU8KfS+yj3DFm
         6i0C10gkEELwPUQetrqR4X4GXAVkVpgf275yz/LQCYAV9yAcpjzjbgx7ihlI1nMpW29s
         nOCg==
X-Gm-Message-State: AO0yUKUY+qi9hFOAClL9nSG3QiX74TXTiAInFp/0YU4YanV1CF00rRZv
        zIeyVsmzYuplfsRc7fD1fUU2pBGEIzxbqJD1CWc=
X-Google-Smtp-Source: AK7set8GjlcdQO5S1OxAnbzhhK5X8rI+o7c5CpDo1J8OPfyVicnGyoPMHzTstbZh5hv9/iOAdRhDmg==
X-Received: by 2002:a17:903:244f:b0:1a0:450d:a45a with SMTP id l15-20020a170903244f00b001a0450da45amr1742213pls.31.1678652240593;
        Sun, 12 Mar 2023 13:17:20 -0700 (PDT)
Received: from carnotaurus.. (c-73-231-147-44.hsd1.ca.comcast.net. [73.231.147.44])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709028c8f00b0019aa4c00ff4sm3187594plo.206.2023.03.12.13.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 13:17:20 -0700 (PDT)
From:   Joe Stringer <joe@isovalent.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [PATCH linux-doc] docs/doc-guide: Clarify how to write tables
Date:   Sun, 12 Mar 2023 13:17:12 -0700
Message-Id: <20230312201712.367545-1-joe@isovalent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Prior to this commit, the kernel docs writing guide spent over a page
describing exactly how *not* to write tables into the kernel docs,
without providing a example about the desired format.

This patch provides a positive example first in the guide so that it's
harder to miss, then leaves the existing less desirable approach below
for contributors to follow if they have some stronger justification for
why to use that approach.

Signed-off-by: Joe Stringer <joe@isovalent.com>
---
 Documentation/doc-guide/sphinx.rst | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 23edb427e76f..9c2210b6ea3f 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -313,9 +313,25 @@ the documentation build system will automatically turn a reference to
 function name exists.  If you see ``c:func:`` use in a kernel document,
 please feel free to remove it.
 
+Tables
+------
+
+Tables should be written in cell grid form unless there is a strong
+justification for using an alternate format:
+
+.. code-block:: rst
+
+   +------------------------+------------+----------+----------+
+   | Header row, column 1   | Header 2   | Header 3 | Header 4 |
+   | (header rows optional) |            |          |          |
+   +========================+============+==========+==========+
+   | body row 1, column 1   | column 2   | column 3 | column 4 |
+   +------------------------+------------+----------+----------+
+   | body row 2             | ...        | ...      |          |
+   +------------------------+------------+----------+----------+
 
 list tables
------------
+~~~~~~~~~~~
 
 The list-table formats can be useful for tables that are not easily laid
 out in the usual Sphinx ASCII-art formats.  These formats are nearly
-- 
2.34.1

