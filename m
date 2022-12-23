Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F81C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Dec 2022 11:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiLWLa0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Dec 2022 06:30:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbiLWLaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Dec 2022 06:30:24 -0500
X-Greylist: delayed 71 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Dec 2022 03:30:22 PST
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707E63B40E
        for <linux-doc@vger.kernel.org>; Fri, 23 Dec 2022 03:30:21 -0800 (PST)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20221223112907f763511268b491fc2e
        for <linux-doc@vger.kernel.org>;
        Fri, 23 Dec 2022 12:29:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xslShCd5gPqP/2+ekZx5ArPRn3E72uetbLlpOQ+muGs=;
 b=CurpmO2NpxWWhKR/0ZjYld2Qur8hyZFdGNgeBRDqnzBjV3zdPjwCKdgNhx1SFXpELKXyV3
 YNXYFSA5RTDMVQAlAdmVqcMShbwdvzwPIfIdn7hEVf1Q4t6pTS48RZ8G5whsc8bcwq2z/Qvp
 ccfnbuHtoh7bRXuFFNrzTG0gt769E=;
From:   "A. Sverdlin" <alexander.sverdlin@siemens.com>
To:     linux-doc@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Manfred Spraul <manfred@colorfullife.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: kernel-hacking: discourage from calling disable_irq() in atomic
Date:   Fri, 23 Dec 2022 12:28:59 +0100
Message-Id: <20221223112859.937196-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Correct the example in documentation so that disable_irq() is not being
called in atomic context.

disable_irq() calls sleeping synchronize_irq(), it's not allowed to call
them in atomic context.

Link: https://lore.kernel.org/lkml/87k02wbs2n.ffs@tglx/
Reviewed-by: Manfred Spraul <manfred@colorfullife.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: Dropped changes to manage.c because of already applied
https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/kernel-irq-managec-disable_irq-might-sleep.patch

 Documentation/kernel-hacking/locking.rst                    | 4 ++--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 6805ae6e86e65..95fd6e0900d92 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1274,11 +1274,11 @@ Manfred Spraul points out that you can still do this, even if the data
 is very occasionally accessed in user context or softirqs/tasklets. The
 irq handler doesn't use a lock, and all other accesses are done as so::
 
-        spin_lock(&lock);
+        mutex_lock(&lock);
         disable_irq(irq);
         ...
         enable_irq(irq);
-        spin_unlock(&lock);
+        mutex_unlock(&lock);
 
 The disable_irq() prevents the irq handler from running
 (and waits for it to finish if it's currently running on other CPUs).
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 51af37f2d6210..bfbada56cf351 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1309,11 +1309,11 @@ se i dati vengono occasionalmente utilizzati da un contesto utente o
 da un'interruzione software. Il gestore d'interruzione non utilizza alcun
 *lock*, e tutti gli altri accessi verranno fatti così::
 
-        spin_lock(&lock);
+        mutex_lock(&lock);
         disable_irq(irq);
         ...
         enable_irq(irq);
-        spin_unlock(&lock);
+        mutex_unlock(&lock);
 
 La funzione disable_irq() impedisce al gestore d'interruzioni
 d'essere eseguito (e aspetta che finisca nel caso fosse in esecuzione su
-- 
2.34.1

