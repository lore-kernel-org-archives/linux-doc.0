Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C92C2BBD1
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 08:10:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42F8B221E7
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600330223;
	bh=zPE/AFw/AYHzhVfHZoq0r1MfFFFQVYbMr9oiJC8TWKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Lr1DMvtzG/UayzCJ/yjzquQn9sDtyHfDTuFV7ArWbYYfHvrk0Klku6r2EKb9qdxSL
	 RhfGXWO1XXJpGFNS6XhczF93TA2WG4EHT2NAPLEDqpsPzjX5S0dchKJIU6MsCWVNLp
	 OhEVh1jYrfvTX3nM9YZ/ee+InCFcyqIZW0vsTzqs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIQIGe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:06:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgIQIGJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:06:09 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB001206B2;
        Thu, 17 Sep 2020 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600329870;
        bh=zPE/AFw/AYHzhVfHZoq0r1MfFFFQVYbMr9oiJC8TWKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PU5+IVwoAgk3FGhTblFkZ6XliAG+0KS85B1828eN/oTC0R8hPRJZd3LiYiY6Dgg2r
         tjZRh4ppnIpTkuNNK/Im2xgLO1JwaU4+4gWnIWgwIH9oDrx0ZcNwxc9jJKNoFF28LI
         2OfnfKLHUXOTEWe8Z6IBYHR822QaHexqC77zjtf0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kIou4-0051LQ-8q; Thu, 17 Sep 2020 10:04:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] docs: kasan.rst: add two missing blank lines
Date:   Thu, 17 Sep 2020 10:04:25 +0200
Message-Id: <53f6987c1a4b032ff636a95e3fce53ff8bfef630.1600328701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600328701.git.mchehab+huawei@kernel.org>
References: <cover.1600328701.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

literal blocks should start and end with a blank line,
as otherwise the parser complains and may do the wrong
thing, as warned by Sphinx:

	Documentation/dev-tools/kasan.rst:298: WARNING: Literal block ends without a blank line; unexpected unindent.
	Documentation/dev-tools/kasan.rst:303: WARNING: Literal block ends without a blank line; unexpected unindent.

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

