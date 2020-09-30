Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B043C4727F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F4A2076B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472405;
	bh=2AmEVr7ULFfLwRA7VrgPAjt76ggBwbHZpNlcWAcdiQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GKGQIJ6Mjw0kian5EVCP//cx5jAZsaJss43V5Q4Qs5Ta0Qj2Z5VXXB8jul5d5uTgF
	 DrNC3wbxEXOojKP0GUaxaGQzLsbYGGN5mhnd8e9Wk7sRW/khlTQLpzAuWsoAlk1cm5
	 pPAoLIKfRcfpLVxEQ4JR1URwZZQnyvxM8nFIQLkk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbgI3N0f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:26:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:39182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730261AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B99521D41;
        Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=2AmEVr7ULFfLwRA7VrgPAjt76ggBwbHZpNlcWAcdiQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wQYCfgcU3UDk7mrFT1z8lOdGEgqFth1fJ3QXmVlyRdEBV6ksSE9oy2VKhVxj0PaUO
         rwIjVm7SJ/6yrlx+Eqgga7qlXSIQ1UkztzX1EHRDOrpSnuNf5jznZu64XzFUQJSu+J
         QxJHLj5Mk8Z6BvJKt28hQztnTDMmbX8l86fPCUYU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XKz-PK; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 46/52] docs: it_IT: hacking.rst: fix a typo on a markup
Date:   Wed, 30 Sep 2020 15:25:09 +0200
Message-Id: <741db941bc9e9818c26ba84a8cf119036bc3c4b0.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
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

