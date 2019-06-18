Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A56A7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Jun 2019 18:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbfFRSva (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Jun 2019 14:51:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51856 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbfFRSv3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jun 2019 14:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NMu/v002NyjPb7lxcrvrsfcxSTZZB6mI258wHNga6OY=; b=OIYHcuvqvF9aSOOtDW51r0eIcY
        bdBdAaHiU1UFIryE7bSm6GEhsyIzqf9MunrdVluutv5YhwWK5xaFwPCpdrAGxjJNEUrYLfs1220bU
        D4+9S2P1kM1eroDbvIMM37BAsAnHsst/f7wlX91liK7C4Ko4xjNWdElUgZZeFy/2P2rLKGqBJB7pt
        CIlffXz7KsFXKNEiHz7VHWu2Zuk86LOOR0vHN6P3UwXZCX5haGUHC02RsWi+TbbkE1LbiZXNn4jmu
        r7Q2cke5tPgRQweU5EUlm7/NcIYRRH6+T/IY9edaY2qmR7ed7tQIpv5+M+aBKEaFOy+BLgVj8Cw2g
        07rPADxw==;
Received: from 177.133.86.196.dynamic.adsl.gvt.net.br ([177.133.86.196] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdJCa-0006RM-0s; Tue, 18 Jun 2019 18:51:28 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hdJCW-0006UN-DZ; Tue, 18 Jun 2019 15:51:24 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian@brauner.io>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Roman Gushchin <guro@fb.com>
Subject: [PATCH 5/6] docs: signal: fix a kernel-doc markup
Date:   Tue, 18 Jun 2019 15:51:21 -0300
Message-Id: <bcc2015820536766a8a57097c2b9eaaaff1686c8.1560883872.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <a83ea390bc28784518fce772b4c961ea1c976f14.1560883872.git.mchehab+samsung@kernel.org>
References: <a83ea390bc28784518fce772b4c961ea1c976f14.1560883872.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel-doc parser doesn't handle expressions with %foo*.
Instead, when an asterisk should be part of a constant, it
uses an alternative notation: `foo*`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 91b789dd6e72..10a826855b59 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -349,7 +349,7 @@ void task_clear_jobctl_pending(struct task_struct *task, unsigned long mask)
  * @task has %JOBCTL_STOP_PENDING set and is participating in a group stop.
  * Group stop states are cleared and the group stop count is consumed if
  * %JOBCTL_STOP_CONSUME was set.  If the consumption completes the group
- * stop, the appropriate %SIGNAL_* flags are set.
+ * stop, the appropriate `SIGNAL_*` flags are set.
  *
  * CONTEXT:
  * Must be called with @task->sighand->siglock held.
-- 
2.21.0

