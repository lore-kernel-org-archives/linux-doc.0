Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101D2C4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B97BF20782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993230;
	bh=KEhDi0VPgM7hCIhR/9xG2Kx3ZY+OBLtU3k7jdAK2xak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=kNtalZbXaqVROXt84L46OouqxIKmB4AEAUq6fLftwClcxehDzujtKMFDGhNSwJmSv
	 e5Zpdj6oVrGZ16uVycFMttLlYghQSO8w/isIaxRYwxIr9GMm4K9+HccjjvXx45aoMs
	 Q4f630V43lr1H0k87jwcxO47epI/LjNGbtVwDeKo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgJFOHA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:07:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:33530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgJFODz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:55 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49F2B21D20;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993034;
        bh=KEhDi0VPgM7hCIhR/9xG2Kx3ZY+OBLtU3k7jdAK2xak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=juHJUVtP5boXy8II5k5SE/FcwgBGvZhSpIW9lu4Eziz6HZbQEZtt9EQ+nsjEdBv7w
         Oye/ag5Hekz6+zneaYUwksS3bR/GmmfdZ14NQnXTouxKKx1prz/bOw5QsZZdI1YV8D
         xUd8Rc0hiIUD13fs2/tvegdVD098urOU3RsPauck=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019Fr-D4; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 31/52] docs: device_link.rst: remove duplicated kernel-doc include
Date:   Tue,  6 Oct 2020 16:03:28 +0200
Message-Id: <952d83bbbbb0040a95fa3a869b8441a1cb9314b8.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The infrastructure.rst file already includes the external
symbols from drivers/base/core.c.

Duplicating 3 functions there causes namespace collisions:

	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_state'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_add'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_del'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_remove'.

So, drop the reference, adding just a mention to the functions
associated with device_link.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/device_link.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/driver-api/device_link.rst b/Documentation/driver-api/device_link.rst
index 76950d061632..ee913ae16371 100644
--- a/Documentation/driver-api/device_link.rst
+++ b/Documentation/driver-api/device_link.rst
@@ -317,5 +317,4 @@ State machine
 API
 ===
 
-.. kernel-doc:: drivers/base/core.c
-   :functions: device_link_add device_link_del device_link_remove
+See device_link_add(), device_link_del() and device_link_remove().
-- 
2.26.2

