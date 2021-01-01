Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7685AC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jan 2021 04:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48DB3221FB
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jan 2021 04:09:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbhAAEJW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Dec 2020 23:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbhAAEJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Dec 2020 23:09:22 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A27C061575;
        Thu, 31 Dec 2020 20:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=OqvIin7mG6sS3qRBldYmcPyHinQIXfN1ATTSfvNtxTA=; b=akKUIq/fEiXwIR3pzpgvqB1MPY
        7yNghcLG4PKTWiLJ+kbHYE5eSOWIHOTTdPBlMWigaOzFTG5/FA4+SoTQRT9jyCvaO3odtjzo/tDkz
        4Z9vRMrWl53i+IxRwD+TvstNB0ff/5uvc9BTlRdTcDrpqr/WESYIr4yTGoS4CUw4+gromr7mtBK/+
        ZydUeoltGeTq71n1xCiEi7WOWVYm3beFRma0b++1ZW7FIeL2bYX7YNiEGqGDcga9/3qNN4MQBhBTp
        t52/qOBV1mL4n49dat5UluCbZ4gNtvmnYHIyaXakLhP4FNEllRhC7XRdFjgSbvPpCglQxJS2S28O/
        XZa+xRoA==;
Received: from [2601:1c0:6280:3f0::2c43] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kvBjy-0006KQ-Pe; Fri, 01 Jan 2021 04:08:39 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation/admin-guide: kernel-parameters: hyphenate comma-separated
Date:   Thu, 31 Dec 2020 20:08:31 -0800
Message-Id: <20210101040831.4148-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hyphenate "comma separated" when it is used as a compound adjective.
hyphenated.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
v2: rebase & resend

 Documentation/admin-guide/kernel-parameters.txt |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- lnx-511-rc1.orig/Documentation/admin-guide/kernel-parameters.txt
+++ lnx-511-rc1/Documentation/admin-guide/kernel-parameters.txt
@@ -1385,7 +1385,7 @@
 
 	ftrace_filter=[function-list]
 			[FTRACE] Limit the functions traced by the function
-			tracer at boot up. function-list is a comma separated
+			tracer at boot up. function-list is a comma-separated
 			list of functions. This list can be changed at run
 			time by the set_ftrace_filter file in the debugfs
 			tracing directory.
@@ -1399,13 +1399,13 @@
 	ftrace_graph_filter=[function-list]
 			[FTRACE] Limit the top level callers functions traced
 			by the function graph tracer at boot up.
-			function-list is a comma separated list of functions
+			function-list is a comma-separated list of functions
 			that can be changed at run time by the
 			set_graph_function file in the debugfs tracing directory.
 
 	ftrace_graph_notrace=[function-list]
 			[FTRACE] Do not trace from the functions specified in
-			function-list.  This list is a comma separated list of
+			function-list.  This list is a comma-separated list of
 			functions that can be changed at run time by the
 			set_graph_notrace file in the debugfs tracing directory.
 
@@ -2421,7 +2421,7 @@
 			when set.
 			Format: <int>
 
-	libata.force=	[LIBATA] Force configurations.  The format is comma
+	libata.force=	[LIBATA] Force configurations.  The format is comma-
 			separated list of "[ID:]VAL" where ID is
 			PORT[.DEVICE].  PORT and DEVICE are decimal numbers
 			matching port, link or device.  Basically, it matches
@@ -5145,7 +5145,7 @@
 
 	stacktrace_filter=[function-list]
 			[FTRACE] Limit the functions that the stack tracer
-			will trace at boot up. function-list is a comma separated
+			will trace at boot up. function-list is a comma-separated
 			list of functions. This list can be changed at run
 			time by the stack_trace_filter file in the debugfs
 			tracing directory. Note, this enables stack tracing
@@ -5348,7 +5348,7 @@
 	trace_event=[event-list]
 			[FTRACE] Set and start specified trace events in order
 			to facilitate early boot debugging. The event-list is a
-			comma separated list of trace events to enable. See
+			comma-separated list of trace events to enable. See
 			also Documentation/trace/events.rst
 
 	trace_options=[option-list]
