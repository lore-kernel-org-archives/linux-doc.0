Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09094C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 12 Dec 2022 16:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbiLLQlA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Dec 2022 11:41:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbiLLQkd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Dec 2022 11:40:33 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Dec 2022 08:38:30 PST
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E98C15A19
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 08:38:30 -0800 (PST)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202212121637250d0d8d49f59a63a3a7
        for <linux-doc@vger.kernel.org>;
        Mon, 12 Dec 2022 17:37:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1vAJzLeJNGgmxOrj/60MKDysZQML2TAd12qLdKnNzTg=;
 b=H328/QFib50NvLSLJQ/fe7dL+n31eoGcyPfK/JA2+/ihbJPgDCYQqBzdZboiau9QBveU1u
 u5e3Q7hZvgEB5P9KGJlz0C/LQFtVLBOGED0BQtkkINIz/o5gSyfpK6P/FuQq/ISDUy3k83E1
 +8imE4N4Sjqfl6H+n5Akpp0r7V9/U=;
From:   "A. Sverdlin" <alexander.sverdlin@siemens.com>
To:     linux-doc@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Manfred Spraul <manfred@colorfullife.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: kernel-hacking: discourage from calling disable_irq() in atomic
Date:   Mon, 12 Dec 2022 17:37:15 +0100
Message-Id: <20221212163715.830315-1-alexander.sverdlin@siemens.com>
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
called in atomic context and remove the comment allowing to do so "with
care" from the function header itself.

disable_irq() calls sleeping synchronize_irq(), it's not allowed to call
them in atomic context.

Link: https://lore.kernel.org/lkml/87k02wbs2n.ffs@tglx/
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 Documentation/kernel-hacking/locking.rst                    | 4 ++--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 ++--
 kernel/irq/manage.c                                         | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

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
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 40fe7806cc8c9..2054de5bf3c53 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -722,8 +722,6 @@ EXPORT_SYMBOL(disable_irq_nosync);
  *	This function waits for any pending IRQ handlers for this interrupt
  *	to complete before returning. If you use this function while
  *	holding a resource the IRQ handler may need you will deadlock.
- *
- *	This function may be called - with care - from IRQ context.
  */
 void disable_irq(unsigned int irq)
 {
-- 
2.34.1

