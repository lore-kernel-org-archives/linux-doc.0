Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6E4C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E67F420E65
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590351;
	bh=Y9QvYhwmylLepDr4WBayu7UyzAFqpAQtn0CzdLkgOfs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=W/HssBLW6IcbC+32akjsKHHC/d7RfAsXz8yoNV1pL4DmpApi8a+tZaB+ok09+CdHI
	 6t5edV5IFDpEuzmHwFvnTK91kT1/7uLxwPJn7nvwG8gOaGp3X/hmnUYvoKe2OVF3iP
	 nls9GOqv2uxtvZtol2DSzAXeaeyVA4TCxtKarbbI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbgJML7K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:59:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:58060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727543AbgJMLyo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:44 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2D032242B;
        Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=Y9QvYhwmylLepDr4WBayu7UyzAFqpAQtn0CzdLkgOfs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1qGsKhv0mO12mSIbPhW1tUVP5MXr9PPgpC560OG2chYFIQTWuvzMRvrzSdCtJwehL
         T9Tb9q0srhr71keUonuvOIFE4GEieIZ6jtC4jd6fXJIjRBl9L8fL/Zoj0hKPGs4tVg
         N3jEyQJlb9odbEHah7qv9P4zo5sbAEDMjy6UlBxc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVG-0L; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 46/80] docs: it_IT: hacking.rst: fix a typo on a markup
Date:   Tue, 13 Oct 2020 13:54:01 +0200
Message-Id: <559a9c69eb9446c23baa7eb075f923bfc23001f8.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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

