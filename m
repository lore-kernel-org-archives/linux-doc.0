Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B3A87D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 10:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbfACKav (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 05:30:51 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:62240 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfACKav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jan 2019 05:30:51 -0500
Received: from 79.184.255.240.ipv4.supernova.orange.pl (79.184.255.240) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.183)
 id c28f833effb394de; Thu, 3 Jan 2019 11:30:49 +0100
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH] cpuidle / Documentation: Update cpuidle MAINTAINERS entry
Date:   Thu, 03 Jan 2019 11:30:07 +0100
Message-ID: <11211688.O9o76ZdvQC@aspire.rjw.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Update the MAINTAINERS entry for cpuidle by making it clear that it
is not just drivers and adding a documentation record to it.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 MAINTAINERS |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-pm/MAINTAINERS
===================================================================
--- linux-pm.orig/MAINTAINERS
+++ linux-pm/MAINTAINERS
@@ -3945,13 +3945,14 @@ S:	Supported
 F:	drivers/cpuidle/cpuidle-exynos.c
 F:	arch/arm/mach-exynos/pm.c
 
-CPUIDLE DRIVERS
+CPU IDLE TIME MANAGEMENT FRAMEWORK
 M:	"Rafael J. Wysocki" <rjw@rjwysocki.net>
 M:	Daniel Lezcano <daniel.lezcano@linaro.org>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
 B:	https://bugzilla.kernel.org
+F:	Documentation/admin-guide/pm/cpuidle.rst
 F:	drivers/cpuidle/*
 F:	include/linux/cpuidle.h
 

