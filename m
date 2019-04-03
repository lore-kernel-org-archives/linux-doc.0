Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 938627D099
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 22:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbfDCWKe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Apr 2019 18:10:34 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:41564 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbfDCWKe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Apr 2019 18:10:34 -0400
Received: from 79.184.254.219.ipv4.supernova.orange.pl (79.184.254.219) (HELO aspire.rjw.lan)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id 8aca4a233a5e8d07; Thu, 4 Apr 2019 00:10:32 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux PM <linux-pm@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Borislav Petkov <bp@suse.de>
Subject: [PATCH 4/4] admin-guide: pm: intel_epb: Add SPDX license tag and copyright notice
Date:   Thu, 04 Apr 2019 00:08:18 +0200
Message-ID: <8068055.vE1LsT4ZeF@aspire.rjw.lan>
In-Reply-To: <4546107.fVFrecLk33@aspire.rjw.lan>
References: <4546107.fVFrecLk33@aspire.rjw.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Add an SPDX license tag and a copyright notice to the intel_epb.rst
file under Documentation/admin-quide/pm.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 Documentation/admin-guide/pm/intel_epb.rst |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: linux-pm/Documentation/admin-guide/pm/intel_epb.rst
===================================================================
--- linux-pm.orig/Documentation/admin-guide/pm/intel_epb.rst
+++ linux-pm/Documentation/admin-guide/pm/intel_epb.rst
@@ -1,7 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
 ======================================
 Intel Performance and Energy Bias Hint
 ======================================
 
+:Copyright: |copy| 2019 Intel Corporation
+
+:Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
+
+
 .. kernel-doc:: arch/x86/kernel/cpu/intel_epb.c
    :doc: overview
 

