Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFB2C4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F3EB20782
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993137;
	bh=Y9QvYhwmylLepDr4WBayu7UyzAFqpAQtn0CzdLkgOfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rakLPPthmh6xjDRzkEERud2gE1ryMKnC/Leoi5ZaLN2enFYRTyoD/qbXEq9r4OT8x
	 8CHuMg/FAhgaDSPHl2z32BEYKNZVJ7Q4i6fwN8CAGNsPxU7TJJ0s3LC2jCXhabz7IG
	 oPqDv1UxYyvr4rwtzLOrH25fRN5M0hKBZ2W1KDts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFOFg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:05:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:33310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF0ED235FC;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=Y9QvYhwmylLepDr4WBayu7UyzAFqpAQtn0CzdLkgOfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rv8Zi3L/nrUEDrdro2c06H87tJ1IqNl0fpK2NcTwdxo3HcAnjB0obEBWvD4KveIYz
         J5Y/p63qKrsB0OKnZXFUN6l7wtVDWsGN7R+LoRTq7+mgpYYrTbZtvvyFyxArp4eDNl
         iXqTiapP3+jzKnFo9aK3Oy6KFOKwmatpnDK2Harw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019Gb-UZ; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 46/52] docs: it_IT: hacking.rst: fix a typo on a markup
Date:   Tue,  6 Oct 2020 16:03:43 +0200
Message-Id: <d51742442aede0be7d2d29a368c33bf00a492872.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There's a missing "`", causing this warning:
	./Documentation/translations/it_IT/kernel-hacking/hacking.rst:404: WARNING: Unparseable C cross-reference: 'cpu_to_be32p(), che prende un puntatore\nad un tipo, e ritorna il valore convertito. L\'altra variante per\nla famiglia di conversioni "in-situ", come :c:func:`cpu_to_be32s'
	Invalid C declaration: Expected end of definition. [error at 14]
	  cpu_to_be32p(), che prende un puntatore
	ad un tipo, e ritorna il valore convertito. L'altra variante per
	la famiglia di conversioni "in-situ", come :c:func:`cpu_to_be32s
	  --------------^

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/translations/it_IT/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/it_IT/kernel-hacking/hacking.rst b/Documentation/translations/it_IT/kernel-hacking/hacking.rst
index 6aab27a8d323..3d30b69f1ec1 100644
--- a/Documentation/translations/it_IT/kernel-hacking/hacking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/hacking.rst
@@ -402,7 +402,7 @@ il valore convertito. Tutte le varianti supportano anche il processo inverso:
 :c:func:`be32_to_cpu()`, eccetera.
 
 Queste funzioni hanno principalmente due varianti: la variante per
-puntatori, come :c:func:`cpu_to_be32p(), che prende un puntatore
+puntatori, come :c:func:`cpu_to_be32p()`, che prende un puntatore
 ad un tipo, e ritorna il valore convertito. L'altra variante per
 la famiglia di conversioni "in-situ", come :c:func:`cpu_to_be32s()`,
 che convertono il valore puntato da un puntatore, e ritornano void.
-- 
2.26.2

