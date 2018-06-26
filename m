Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AD0E7D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 10:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933720AbeFZKLK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 06:11:10 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:44174 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932629AbeFZKLJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 06:11:09 -0400
Received: from 79.184.255.183.ipv4.supernova.orange.pl (79.184.255.183) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83)
 id d4b0d2d258767803; Tue, 26 Jun 2018 12:11:07 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     Pawit Pornkitprasan <p.pawit@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: admin-guide: intel_pstate: Fix sysfs path
Date:   Tue, 26 Jun 2018 12:09:51 +0200
Message-ID: <2419155.1rRbCxiQ6f@aspire.rjw.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Fix an incorrect sysfs path in the intel_pstate admin-guide
documentation.

Fixes: 33fc30b47098 (cpufreq: intel_pstate: Document the current behavior and user interface)
Reported-by: Pawit Pornkitprasan <p.pawit@gmail.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 Documentation/admin-guide/pm/intel_pstate.rst |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: linux-pm/Documentation/admin-guide/pm/intel_pstate.rst
===================================================================
--- linux-pm.orig/Documentation/admin-guide/pm/intel_pstate.rst
+++ linux-pm/Documentation/admin-guide/pm/intel_pstate.rst
@@ -324,8 +324,7 @@ Global Attributes
 
 ``intel_pstate`` exposes several global attributes (files) in ``sysfs`` to
 control its functionality at the system level.  They are located in the
-``/sys/devices/system/cpu/cpufreq/intel_pstate/`` directory and affect all
-CPUs.
+``/sys/devices/system/cpu/intel_pstate/`` directory and affect all CPUs.
 
 Some of them are not present if the ``intel_pstate=per_cpu_perf_limits``
 argument is passed to the kernel in the command line.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
