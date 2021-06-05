Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC236C49EC7
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C445F61449
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhFENUq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:20:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230111AbhFENU0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BB926144B;
        Sat,  5 Jun 2021 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899118;
        bh=7MNCqS85WVptZyVwk3d3+gKYM21WbnTb9lCPgJ99vFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W8+DvwMdMQk7Fijavimn7e/IKv54NBWvyRKiPcB3dd5zbugFMxwfx9CX9E60pB84h
         /Gvfvlsv/n3WDxGlxPXcdnF5PgkJJsSQ5cAxle/pGiUEJluRK9VwUdM1CGz9JOhAoJ
         hcsKXqMTvmIBJMLdV2wL+qkpG5udslUExUofgNqEMSZhIKfPePdkVl4rz2+XS3Sl4f
         46rszyuJugX2avp5s/U4iomiwfuIF+tK4Z/i376g1CkD4cgVT/PXvdRCDM978/fYm/
         w+otsUZcZsf42x51Zv/2jHnyphtDgCY0WQru7orKYiY19pGWjqNxcuZokM0Lfm5F+K
         Q+jI9v+vT+SJQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCC-008GG1-Cd; Sat, 05 Jun 2021 15:18:36 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Joe Pater <02joepater06@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 24/34] docs: kernel-hacking: hacking.rst: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:23 +0200
Message-Id: <14f2c87e818d4807d96c59052f30e2f48c194bf7.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 451523424942..df65c19aa7df 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -601,7 +601,7 @@ Defined in ``include/linux/export.h``
 
 This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
-:doc:`../core-api/symbol-namespaces`
+Documentation/core-api/symbol-namespaces.rst
 
 :c:func:`EXPORT_SYMBOL_NS_GPL()`
 --------------------------------
@@ -610,7 +610,7 @@ Defined in ``include/linux/export.h``
 
 This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
-:doc:`../core-api/symbol-namespaces`
+Documentation/core-api/symbol-namespaces.rst
 
 Routines and Conventions
 ========================
-- 
2.31.1

