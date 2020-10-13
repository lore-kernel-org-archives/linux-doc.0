Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97DE3C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:01:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 461BE20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 12:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590516;
	bh=L11eOxvDowjwlPTvkbhyZpdA60k6ulJgvpYz2/X3w3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=jrgAbd9JYxyl/iAPPLdrfitDdIFx9l6VW75jbzdK8G5byj4/+neNP6AJdkxYsq9g0
	 2HV6nhxEQI1tw71IisVbauceuECcU6v03AyOW5xf7lkBMjF2RFSz9DfD9zy+15yIX3
	 KwUboV1CBBxwsLIkvMlgErEGokLqrsJY15gEnrEo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgJMMBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 08:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727384AbgJMLyl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:41 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 247172224A;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590080;
        bh=L11eOxvDowjwlPTvkbhyZpdA60k6ulJgvpYz2/X3w3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PaoSoFdoXPSaPbwXufFHJaNA+SE6Ni+wKohK01N/B8G58TVGBgCiUII2/aXlcB/qY
         RXXxFqv60iXyTHNqu2iKKKQBX9DNLVNcMxjEMScmKzMgdAzPj8KWm8HwWWaHs9oaFc
         tIfk9w3LBy+k9cQAelrmfLJcbczu2LHpQ3FlcfFA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt4-006CU8-4M; Tue, 13 Oct 2020 13:54:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v6 21/80] media: cec-core.rst: don't use c:type for structs
Date:   Tue, 13 Oct 2020 13:53:36 +0200
Message-Id: <ab1d4be3fc17ed2f5423811e02591f7a2aabb4d5.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new C domain code on Sphinx 3 doesn't allow anymore
to use c:type:: for structs.

Now that cdomain.py has backward support, let's use
c:struct:: instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/cec-core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index 03016eeaf8f4..bc42982ac21e 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -98,7 +98,7 @@ Implementing the Low-Level CEC Adapter
 The following low-level adapter operations have to be implemented in
 your driver:
 
-.. c:type:: struct cec_adap_ops
+.. c:struct:: cec_adap_ops
 
 .. code-block:: none
 
-- 
2.26.2

