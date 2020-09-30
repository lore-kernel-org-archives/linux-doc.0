Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0B3C47420
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95E5D2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472445;
	bh=8l322xMRtGPypOdLbQzXYtchEXuXc9pVzePOtmUf3FQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cojTmwiVeDPXSiA50YJC+ubWM8X40pDRz14vic2XqS2JzuTiYekp8FLwPgWPHm5Qi
	 A+BbTlPM+oJvRQbKss1aDcOfnMVxyVbDLg8jq8NkFUjYCikjRaFkmX2Dmn9vbdSjFa
	 Cg3T+lejrTvnfb+Xsiwslv8LYdH2sJBr5nSJwvdo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730415AbgI3N1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:27:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:39164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730241AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A8E2238A1;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=8l322xMRtGPypOdLbQzXYtchEXuXc9pVzePOtmUf3FQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AKJZmTRT+hK7Pyx5HiEzmMKdLhmoIiszMA75dnqwwBhvNuLppDaU1HEGiy1BaP7ze
         FyEFrP11yankR345vRxkncEutxjo7bV+PieGa72SarRYTnpZzlO29R6kGDmk58aANa
         r8w8ZAW+mgO/SOhMoh14PK4uQu7TW8Gyu+AguMxU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XKb-D3; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>,
        Jens Axboe <axboe@kernel.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 38/52] docs: block: typec_bus.rst: get rid of :c:type
Date:   Wed, 30 Sep 2020 15:25:01 +0200
Message-Id: <c54f21c6406b86099b537fdde1b0ab35b0ea770d.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :c:type macros are not used properly there, as reported
by Sphinx 3:

	./Documentation/block/blk-mq.rst:112: WARNING: Unparseable C cross-reference: 'hctx->dispatch'
	Invalid C declaration: Expected end of definition. [error at 4]
	  hctx->dispatch
	  ----^

Also, they won't be generating any cross references.

So, replace them by a literal markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/block/blk-mq.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/block/blk-mq.rst b/Documentation/block/blk-mq.rst
index 86a632af02b0..a980d23af48c 100644
--- a/Documentation/block/blk-mq.rst
+++ b/Documentation/block/blk-mq.rst
@@ -110,9 +110,9 @@ block layer removes requests from the associated software queues and tries to
 dispatch to the hardware.
 
 If it's not possible to send the requests directly to hardware, they will be
-added to a linked list (:c:type:`hctx->dispatch`) of requests. Then,
+added to a linked list (``hctx->dispatch``) of requests. Then,
 next time the block layer runs a queue, it will send the requests laying at the
-:c:type:`dispatch` list first, to ensure a fairness dispatch with those
+``dispatch`` list first, to ensure a fairness dispatch with those
 requests that were ready to be sent first. The number of hardware queues
 depends on the number of hardware contexts supported by the hardware and its
 device driver, but it will not be more than the number of cores of the system.
-- 
2.26.2

