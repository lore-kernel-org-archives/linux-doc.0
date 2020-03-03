Return-Path: <SRS0=Succ=4U=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD93FC3F2C6
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FF4D215A4
	for <linux-doc@archiver.kernel.org>; Tue,  3 Mar 2020 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583250646;
	bh=b58Lf8CIoQjoi+5KNDLUj4N4cQ+YWTjbtqQDRGQKxws=;
	h=From:Cc:Subject:Date:In-Reply-To:References:To:List-ID:From;
	b=Y3ptKHf3UAJSDgL0x9yj3FBGhzSoChM7jBuusP/USh5we+jEahfjSbpgUqmXluwr2
	 5Akes1ju+SjBLeIssVmKhFOpEFbf9Jg1KsBKQ/dp82I42HVuxx0s4DvEKdod9RCnZ2
	 bskKGQNXU7Hw4Br0el0QO8uoaMkb3F0n0kfOoPzs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgCCPuq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 10:50:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:59900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729544AbgCCPup (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 10:50:45 -0500
Received: from mail.kernel.org (tmo-101-56.customers.d1-online.com [80.187.101.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D206620866;
        Tue,  3 Mar 2020 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583250645;
        bh=b58Lf8CIoQjoi+5KNDLUj4N4cQ+YWTjbtqQDRGQKxws=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xkuquamrzx0Hq70125iDbM1a9JbGUmNk0FyZmnQWU1j+FoZOvm4v9CfyIhgWpIGnp
         eO5lGTHse4xT9hrUqOHh+BdZUa2J7//E7PtKJBGWOXBN4iyyQNfSZqRMdIt3YIyP7+
         V15jfckffjPVGQ3DBxjDSKrdbOGElw1DKLlmHSL8=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1j99og-001ZP2-IF; Tue, 03 Mar 2020 16:50:42 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 6/9] docs: translations: it: avoid duplicate refs at programming-language.rst
Date:   Tue,  3 Mar 2020 16:50:36 +0100
Message-Id: <e733111f3599dff96524ad09ace5204ac6bb496b.1583250595.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As the translations document is part of the main body, we can't
keep duplicated references there. So, prefix the Italian ones
with "it-".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../it_IT/process/programming-language.rst    | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/translations/it_IT/process/programming-language.rst b/Documentation/translations/it_IT/process/programming-language.rst
index f4b006395849..c4fc9d394c29 100644
--- a/Documentation/translations/it_IT/process/programming-language.rst
+++ b/Documentation/translations/it_IT/process/programming-language.rst
@@ -8,26 +8,26 @@
 Linguaggio di programmazione
 ============================
 
-Il kernel è scritto nel linguaggio di programmazione C [c-language]_.
-Più precisamente, il kernel viene compilato con ``gcc`` [gcc]_ usando
-l'opzione ``-std=gnu89`` [gcc-c-dialect-options]_: il dialetto GNU
+Il kernel è scritto nel linguaggio di programmazione C [it-c-language]_.
+Più precisamente, il kernel viene compilato con ``gcc`` [it-gcc]_ usando
+l'opzione ``-std=gnu89`` [it-gcc-c-dialect-options]_: il dialetto GNU
 dello standard ISO C90 (con l'aggiunta di alcune funzionalità da C99)
 
-Questo dialetto contiene diverse estensioni al linguaggio [gnu-extensions]_,
+Questo dialetto contiene diverse estensioni al linguaggio [it-gnu-extensions]_,
 e molte di queste vengono usate sistematicamente dal kernel.
 
 Il kernel offre un certo livello di supporto per la compilazione con ``clang``
-[clang]_ e ``icc`` [icc]_ su diverse architetture, tuttavia in questo momento
+[it-clang]_ e ``icc`` [it-icc]_ su diverse architetture, tuttavia in questo momento
 il supporto non è completo e richiede delle patch aggiuntive.
 
 Attributi
 ---------
 
 Una delle estensioni più comuni e usate nel kernel sono gli attributi
-[gcc-attribute-syntax]_. Gli attributi permettono di aggiungere una semantica,
+[it-gcc-attribute-syntax]_. Gli attributi permettono di aggiungere una semantica,
 definita dell'implementazione, alle entità del linguaggio (come le variabili,
 le funzioni o i tipi) senza dover fare importanti modifiche sintattiche al
-linguaggio stesso (come l'aggiunta di nuove parole chiave) [n2049]_.
+linguaggio stesso (come l'aggiunta di nuove parole chiave) [it-n2049]_.
 
 In alcuni casi, gli attributi sono opzionali (ovvero un compilatore che non
 dovesse supportarli dovrebbe produrre comunque codice corretto, anche se
@@ -41,11 +41,11 @@ possono usare e/o per accorciare il codice.
 Per maggiori informazioni consultate il file d'intestazione
 ``include/linux/compiler_attributes.h``.
 
-.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
-.. [gcc] https://gcc.gnu.org
-.. [clang] https://clang.llvm.org
-.. [icc] https://software.intel.com/en-us/c-compilers
-.. [gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
-.. [gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
-.. [gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
-.. [n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
+.. [it-c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
+.. [it-gcc] https://gcc.gnu.org
+.. [it-clang] https://clang.llvm.org
+.. [it-icc] https://software.intel.com/en-us/c-compilers
+.. [it-gcc-c-dialect-options] https://gcc.gnu.org/onlinedocs/gcc/C-Dialect-Options.html
+.. [it-gnu-extensions] https://gcc.gnu.org/onlinedocs/gcc/C-Extensions.html
+.. [it-gcc-attribute-syntax] https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html
+.. [it-n2049] http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2049.pdf
-- 
2.24.1

