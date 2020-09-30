Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62EA4C4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27FBF2075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472426;
	bh=uaW4C+I+Tu+DdiBRbypIkyBAmHzHYL3ISOLOIWi0ZTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=oodHiZ8ChF0WJBH65hryJKJj9kzNMqXk164IU9ukhUi+RiCKTvTBfxg7g/dDkvl2P
	 xflstU4ICF1Xbl5gdv4ACAIl9e+5IbxXbhBcVlyCZx8yP2818eGxJfpu3udL9LXgRq
	 u+ut5bEEDNdDI0gAK+BSnM3g4dScDDSelroIdDtE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730555AbgI3N0w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730260AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 737B32076E;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=uaW4C+I+Tu+DdiBRbypIkyBAmHzHYL3ISOLOIWi0ZTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=txyZ7e7tvItqe+4qMtr18WsfTNM+djtdIA9FszFy+d/iBOmEdLCPDEnWCublpsouR
         xYA7EFIJcPV7fEXFnNX734LWNoL8H+STz4O9ncJl2kbqIWI5awdN5Sd1Wv+ixM5tJv
         mtXCpQopmWqzjm/49Qc+1w2ECWgTf8TOylTrQfKM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XKn-Ju; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>,
        Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 42/52] docs: libata.rst: fix a wrong usage of :c:type: tag
Date:   Wed, 30 Sep 2020 15:25:05 +0200
Message-Id: <0730caf6e54c355d4560e23eece296993d4908c2.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The usage of :c:type: to reference to a struct member is wrong,
as pointed by Sphinx 3:

	./Documentation/driver-api/libata.rst:511: WARNING: Unparseable C cross-reference: 'qc->complete_fn'
	Invalid C declaration: Expected end of definition. [error at 2]
	  qc->complete_fn
	  --^

Instead, let's use :c:expr: for such purpose.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/libata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/libata.rst b/Documentation/driver-api/libata.rst
index e2f87b82b074..d477e296bda5 100644
--- a/Documentation/driver-api/libata.rst
+++ b/Documentation/driver-api/libata.rst
@@ -508,7 +508,7 @@ also complete commands.
 
 2. ATA_QCFLAG_ACTIVE is cleared from qc->flags.
 
-3. :c:func:`qc->complete_fn` callback is invoked. If the return value of the
+3. :c:expr:`qc->complete_fn` callback is invoked. If the return value of the
    callback is not zero. Completion is short circuited and
    :c:func:`ata_qc_complete` returns.
 
-- 
2.26.2

