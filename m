Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEC8C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C7DD20E65
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590369;
	bh=oPoX8X7nBCC1BcLeb8+aEWPUBdSBf0obXU+F4t9M6tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gxzuR7DmBp2lk6doAkBnIFRCTfSzh6TY6UnEMj5WMcD/VxD+Uh1gm77x7C/nP9p25
	 /3ztu3p8pjo/C9C05b88PxJxNqvUBHEu4jC73+PXQQH4Ct+WPbq4ro60eb+skjfGjR
	 a+FYYYUGIo/r7BB9XWdxP+Cg+7H+ls3OFxfFbT1o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgJML72 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:59:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727529AbgJMLyn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:43 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EAE5A2242A;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=oPoX8X7nBCC1BcLeb8+aEWPUBdSBf0obXU+F4t9M6tg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uPiwHMz+MpFEru2/xVp/sY0vZBX+gl2tGTpxOIGZtiNE1N83enG0fiQxUfwvgx0IG
         cfOFS6FeEvZFCXBj+4Uo42MXnmc1bkYrbsTYzoa/uSleOIZ1F76FcTOG5tggkkCEWr
         q3f3ezhXJWEs9eYmPw/S8nbhwoKYNjuKh65yZyp8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVJ-1E; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Tomas Winkler <tomas.winkler@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 47/80] docs: mei.rst: fix a C expression markup
Date:   Tue, 13 Oct 2020 13:54:02 +0200
Message-Id: <e4d51ead21c166cc46eaf4082dcdc2ebf2d0b819.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx 3.x doesn't allow expressions using :c:func markup:

	./Documentation/driver-api/mei/mei.rst:41: WARNING: Unparseable C cross-reference: 'close(int fd)'
	Invalid C declaration: Expected end of definition. [error at 5]
	  close(int fd)
	  -----^

So, convert it into a :c:expr.

Acked-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/mei/mei.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/mei/mei.rst b/Documentation/driver-api/mei/mei.rst
index c800d8e5f422..71edf022a7fe 100644
--- a/Documentation/driver-api/mei/mei.rst
+++ b/Documentation/driver-api/mei/mei.rst
@@ -38,7 +38,7 @@ Because some of the Intel ME features can change the system
 configuration, the driver by default allows only a privileged
 user to access it.
 
-The session is terminated calling :c:func:`close(int fd)`.
+The session is terminated calling :c:expr:`close(fd)`.
 
 A code snippet for an application communicating with Intel AMTHI client:
 
-- 
2.26.2

