Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D936B7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 11:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752943AbeCTLHT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 07:07:19 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:43692 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752843AbeCTLFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 07:05:19 -0400
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; 
   d="scan'208";a="38002752"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Mar 2018 19:05:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
        by cn.fujitsu.com (Postfix) with ESMTP id 55ECE48AE76E;
        Tue, 20 Mar 2018 19:05:13 +0800 (CST)
Received: from localhost.localdomain (10.167.226.106) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.361.1; Tue, 20 Mar 2018 19:05:12 +0800
From:   Dou Liyang <douly.fnst@cn.fujitsu.com>
To:     <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
        <linux-acpi@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC:     <tglx@linutronix.de>, <mingo@redhat.com>, <corbet@lwn.net>,
        <rjw@rjwysocki.net>, <lenb@kernel.org>, <hpa@zytor.com>,
        <peterz@infradead.org>, Dou Liyang <douly.fnst@cn.fujitsu.com>
Subject: [PATCH 3/5] x86/smpboot: Make the check code more clear in prefill_possible_map()
Date:   Tue, 20 Mar 2018 19:04:30 +0800
Message-ID: <20180320110432.28127-4-douly.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
References: <20180320110432.28127-1-douly.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.106]
X-yoursite-MailScanner-ID: 55ECE48AE76E.A2F08
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: douly.fnst@cn.fujitsu.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In prefill_possible_map(), Kernel need to get the number of possible CPUs
to reset cpu_possible_map. The number is related to the options:

  -nosmp, maxcpus, possible_cpus, nr_cpus

... which need to be checked.

Currentlly, the check code mixed these options together in confusion and
hard to follow.

Isolate them, and check them linearly.

No functionary change, Prepare for cutting the number of possible CPUs

Signed-off-by: Dou Liyang <douly.fnst@cn.fujitsu.com>
---
 
Situations:

setup_possible_cpus == -1 |  setup_max_cpus == 0 |  CONFIG_HOTPLUG_CPU == y | 

        yes               |         yes          |         yes              |
        no                |         no           |         no               |

Test cases:
           Cases          |          the number of possible cpus
                          |       (the same with or w/o this patch)
case 1: no  | no  | no | -->  min (setup_possible_cpus, nr_cpu_ids, setup_max_cpus)
case 2: no  | no  | yes| -->  min (setup_possible_cpus, nr_cpu_ids)
case 3: no  | yes | no | -->  1                                    
case 4: no  | yes | yes| -->  1
case 5: yes | no  | no | -->  min (num_processors, nr_cpu_ids, setup_max_cpus)
case 6: yes | no  | yes| -->  min (num_processors + disabled_cpus, nr_cpu_ids)
case 7: yes | yes | no | -->  1 
case 8: yes | yes | yes| -->  1

 arch/x86/kernel/smpboot.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index ff99e2b6fc54..2fdda8567bf9 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1334,7 +1334,7 @@ early_param("possible_cpus", _setup_possible_cpus);
  * We do this because additional CPUs waste a lot of memory.
  * -AK
  */
-__init void prefill_possible_map(void)
+void __init prefill_possible_map(void)
 {
 	int i, possible;
 
@@ -1356,18 +1356,22 @@ __init void prefill_possible_map(void)
 			num_processors = 1;
 	}
 
-	i = setup_max_cpus ?: 1;
+	/* The SMP kernel could be acted as an UP kernel via nosmp/maxcpus=0 */
+	if (!setup_max_cpus) {
+		possible = 1;
+		total_cpus = num_processors + disabled_cpus;
+		goto set_cpu_possible_mask;
+	}
+
+	/* Possible CPUs could be overwrited via possible_cpus= */
 	if (setup_possible_cpus == -1) {
 		possible = num_processors;
 #ifdef CONFIG_HOTPLUG_CPU
-		if (setup_max_cpus)
-			possible += disabled_cpus;
-#else
-		if (possible > i)
-			possible = i;
+		possible += disabled_cpus;
 #endif
-	} else
+	} else {
 		possible = setup_possible_cpus;
+	}
 
 	total_cpus = max_t(int, possible, num_processors + disabled_cpus);
 
@@ -1378,15 +1382,16 @@ __init void prefill_possible_map(void)
 		possible = nr_cpu_ids;
 	}
 
-#ifdef CONFIG_HOTPLUG_CPU
-	if (!setup_max_cpus)
-#endif
-	if (possible > i) {
+#ifndef CONFIG_HOTPLUG_CPU
+	/* Possible CPUs could be reduced via max_cpus= */
+	if (possible > setup_max_cpus) {
 		pr_warn("%d Processors exceeds max_cpus limit of %u\n",
 			possible, setup_max_cpus);
-		possible = i;
+		possible = setup_max_cpus;
 	}
+#endif
 
+set_cpu_possible_mask:
 	nr_cpu_ids = possible;
 
 	pr_info("Allowing %d CPUs, %d hotplug CPUs\n",
-- 
2.14.3



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
