Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C02F67D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Dec 2018 12:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbeLCMd4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Dec 2018 07:33:56 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:44077 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbeLCMd4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Dec 2018 07:33:56 -0500
Received: from 79.184.252.87.ipv4.supernova.orange.pl (79.184.252.87) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.157)
 id 33005df1c76e39af; Mon, 3 Dec 2018 13:33:02 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>,
        Doug Smythies <dsmythies@telus.net>
Subject: [PATCH] cpuidle: poll_state: Disregard disable idle states
Date:   Mon, 03 Dec 2018 13:32:53 +0100
Message-ID: <4697959.rYJ3NsDDJG@aspire.rjw.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

When computing the limit of time to spend in the loop in poll_idle(),
use the target residency of the first enabled idle state deeper than
state 0 instead of always using the target residency of state 1.

This helps when state 1 is disabled for diagnostics, for instance.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/cpuidle/poll_state.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

Index: linux-pm/drivers/cpuidle/poll_state.c
===================================================================
--- linux-pm.orig/drivers/cpuidle/poll_state.c
+++ linux-pm/drivers/cpuidle/poll_state.c
@@ -20,8 +20,17 @@ static int __cpuidle poll_idle(struct cp
 
 	local_irq_enable();
 	if (!current_set_polling_and_test()) {
-		u64 limit = (u64)drv->states[1].target_residency * NSEC_PER_USEC;
 		unsigned int loop_count = 0;
+		u64 limit = TICK_USEC;
+		int i;
+
+		for (i = 1; i < drv->state_count; i++) {
+			if (drv->states[i].disabled || dev->states_usage[i].disable)
+				continue;
+
+			limit = (u64)drv->states[i].target_residency * NSEC_PER_USEC;
+			break;
+		}
 
 		while (!need_resched()) {
 			cpu_relax();

