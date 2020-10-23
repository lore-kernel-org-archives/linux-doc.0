Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE64AC55179
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:36:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 668F9208C3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470996;
	bh=uokSk4pb8ToMUj5rUXCAVXVqGG2ogix2a2/PzZOFXVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ET+UCtdy1hqzKAzcwVnDhV295Zx3pGqACBvgR6r3XK4TC7B6dyYvz4Ne7b2hYeY0S
	 8lM/CFvILs+Ej8Hh/f5p/wz2g7BR8pVnC2yx/as72NNtXicS9EgALsayXQ0pEKcMMD
	 AaPIJFn3w3CxIC0ePFiM8Vx3DIwMZqHRmxiAG8Js=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464535AbgJWQgV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:36:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751848AbgJWQdu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 608A5241A4;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=uokSk4pb8ToMUj5rUXCAVXVqGG2ogix2a2/PzZOFXVQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M2qOfeVwTtP16JZow33scpZCClWc89cCAUezcHPYIgRJ09HbNzTdz0eOBrQ5IJ0tC
         4W4f47wZwspglPx2u9PPGBbTQJ+pD34Hg8ftaq8X9Smr5FVwtb2152kvA0zJPPXeQo
         mFlDKAicPxr3IHE9onsNg3qwamQ2F1YXwgHkwDDY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002Ax2-9l; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 37/56] pstore/zone: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:24 +0200
Message-Id: <576a3e3c27b84d0e36ced89840872ec3f251b2b2.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documented struct is psz_head and not psz_buffer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 fs/pstore/zone.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index 3ce89216670c..46a1610c06fa 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -23,7 +23,7 @@
 #include "internal.h"
 
 /**
- * struct psz_head - header of zone to flush to storage
+ * struct psz_buffer - header of zone to flush to storage
  *
  * @sig: signature to indicate header (PSZ_SIG xor PSZONE-type value)
  * @datalen: length of data in @data
-- 
2.26.2

