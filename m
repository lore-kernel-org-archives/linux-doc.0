Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0853EC43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F34A22247
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602591334;
	bh=WPnTGKEVQNENdM9VtW0rexICCGE8BPIBZcU+b1gSzLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=zhlPS3/CvKVJjepZ3PR9X/ty9B+oQHcijqBp5yA79W+fTGx3KjUPs+5OV7BGFE/0N
	 PR5SydoUVYRwP3fyzZnV2FpXtCBKJGu8ZOVBpOWzlLfEQ0ljgNSm8Yc1bC/EC9+WNC
	 oV/FJ3hbBguLCLWln3XTQZ4m24Fj1FCsPjFAp1rA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgJMMO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:14:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726908AbgJMMO4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 08:14:56 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C8C822265;
        Tue, 13 Oct 2020 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602591295;
        bh=WPnTGKEVQNENdM9VtW0rexICCGE8BPIBZcU+b1gSzLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZTYMaspF0YAp9EOwC36Ax05x/2v4x8cmwDYdOOiMeAsvyeKw4ve4mkvKqR/MTwkO0
         Afkd/w9YEkwf6akN0O9xJNo9W1xtQRmDDUAGFiuK4MdHVFxiLtGLV0N2rkwBN9A/DH
         5KVwNIC/plM50hH0GKRBeOHbKitmbKkN0jMSbDFc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSJCe-006Co9-U8; Tue, 13 Oct 2020 14:14:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v2 09/24] docs: kasan.rst: add two missing blank lines
Date:   Tue, 13 Oct 2020 14:14:36 +0200
Message-Id: <48293b76fddce2b2914592677bf5efdbb5b34859.1602590106.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602590106.git.mchehab+huawei@kernel.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

literal blocks should start and end with a blank line,
as otherwise the parser complains and may do the wrong
thing, as warned by Sphinx:

	Documentation/dev-tools/kasan.rst:298: WARNING: Literal block ends without a blank line; unexpected unindent.
	Documentation/dev-tools/kasan.rst:303: WARNING: Literal block ends without a blank line; unexpected unindent.

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/dev-tools/kasan.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index c09c9ca2ff1c..2b68addaadcd 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -295,11 +295,13 @@ print the number of the test and the status of the test:
 pass::
 
         ok 28 - kmalloc_double_kzfree
+
 or, if kmalloc failed::
 
         # kmalloc_large_oob_right: ASSERTION FAILED at lib/test_kasan.c:163
         Expected ptr is not null, but is
         not ok 4 - kmalloc_large_oob_right
+
 or, if a KASAN report was expected, but not found::
 
         # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
-- 
2.26.2

