Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7365C43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5612620E65
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590351;
	bh=vrOfvePziKf+7l42JCBnb/pDEace0km6NriCAj45eBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=y98mo6EPeFqcMNBXd8/9Yl2l+qJISiDhP/4EVQyhWFNREvCvXHkQ7ClyRAVf5j0Rl
	 fWyCVOycSvkyXXIbZmGD9t2SMBlRUsll/H007Ln4q2cEsNGdCr1X2/dT6ZJ4V1nNSL
	 3iDZKvTZdXKuD/zwYHClasEeG9ed/iBtHaT8xmTI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgJML7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:59:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:58144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727552AbgJMLyo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:44 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 03F412242C;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=vrOfvePziKf+7l42JCBnb/pDEace0km6NriCAj45eBE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CJul3RkyFNw956A4Q0EziMFCVH/NxIt15+IjFN4Ool5dyWIZ6xZJSIok8Gr+s+n9v
         3hkA90SC1T9O4xJGEPQzHI11XXI2gYq+TB7u4BQ/2lj6T+mXNz5peuGLaolA5ay9uy
         AyuO1/+9RLNH4jDXWOFVVNUaIIF3r2zEBGFUBV+w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt6-006CWz-3a; Tue, 13 Oct 2020 13:54:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Alistair Popple <apopple@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v6 78/80] mm/doc: fix a literal block markup
Date:   Tue, 13 Oct 2020 13:54:33 +0200
Message-Id: <edbe13e8169c6c3dab86436d5c20f1d7744cdad8.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Literal blocks with :: markup should be indented, as otherwise
Sphinx complains:

	Documentation/vm/hmm.rst:363: WARNING: Literal block expected; none found.

Fixes: f7ebd9ed7767 ("mm/doc: add usage description for migrate_vma_*()")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/vm/hmm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index dd9f76a4ef29..09e28507f5b2 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -360,7 +360,7 @@ between device driver specific code and shared common code:
    system memory page, locks the page with ``lock_page()``, and fills in the
    ``dst`` array entry with::
 
-   dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+     dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 
    Now that the driver knows that this page is being migrated, it can
    invalidate device private MMU mappings and copy device private memory
-- 
2.26.2

