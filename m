Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C041C55179
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD292222EA
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792965;
	bh=OS6l3+DaRazsYL4JvsK0xdMWh/5vKAMAwn+T81nsndo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=MlnFExuz1kz93a6ZRmVqSvRsqlBsw3Q4WHvBuQ8cN63pfkd5ytR+e0Fyx9RVpkSoo
	 9tQp3I4QxSspWHjC3meDtCa8r8nyUUpHEr3fdPb7P9aVponOPQE1mRVxSOu3IjEEm8
	 uj4p5YThwi29Q1OD3Caf7SKslw+oEyQPALSUgqG0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896025AbgJ0Jvm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:51:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:42148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896015AbgJ0Jvl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:41 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 024552225C;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792301;
        bh=OS6l3+DaRazsYL4JvsK0xdMWh/5vKAMAwn+T81nsndo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H+woGwDh16qUp3bh5c430ahGHQeuHcJZ5IH7/TmEzxZggocehNQnPUGDq4eHg3v+t
         WwA4TVelkI45J0wQMdhTj/stSP798ViwLf16TVB9HfZtqDy83wEEmHalkMuHWxETIY
         WcXyI8f1AteWncZgGN1cYWfP6TtPn4/ZnYgSjUfM=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdi-003FEX-VC; Tue, 27 Oct 2020 10:51:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/32] sphinx: conf.py: properly handle Sphinx 4.0
Date:   Tue, 27 Oct 2020 10:51:06 +0100
Message-Id: <d5abc30056dafeec0778a46263a45401bdc7f11e.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One of the checks for Sphinx 3+ is broken, causing some
C warnings to return back with Sphinx 4.0.x.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 376dd0ddf39c..7ee05fd4cb17 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -50,7 +50,7 @@ if major >= 3:
         support for Sphinx v3.0 and above is brand new. Be prepared for
         possible issues in the generated output.
         ''')
-    if minor > 0 or patch >= 2:
+    if (major > 3) or (minor > 0 or patch >= 2):
         # Sphinx c function parser is more pedantic with regards to type
         # checking. Due to that, having macros at c:function cause problems.
         # Those needed to be scaped by using c_id_attributes[] array
-- 
2.26.2

