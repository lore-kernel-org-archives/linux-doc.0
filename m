Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7410C47092
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D1D613E6
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 14:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhFBOe4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Jun 2021 10:34:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:57146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230072AbhFBOez (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Jun 2021 10:34:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92CF4613BA;
        Wed,  2 Jun 2021 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622644392;
        bh=s/wgIaVQR6lDrLW+qk98jfRJCvEVrPpqAZJQ/3YepTE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lTgtmJarvMZZybwLukK6PkwBeTne57J7M3C/bNoUX6yUc4ZKI4an1IfPVNeumgHfa
         7rMYD3UQKVg1seGl9/JEHWg5WgF9iV/CdpptXqb+kVGHWVNJutlV7yO7CaWuliH1K5
         Zo9/w5xnDLUi1av2bW/LDvUkzYj2NJl5sOpdjeYF3G/aw/4X7deuMNPStW+6LA/68g
         JX4xBjIvZcHnC/dpJJi+QFdpmsUOl34yK1iOiC9XHDlD/hrcJByJCMZjeFjbsTRjj0
         b0ooYMOhxUjz08eMSLtRacGyJoKTaGypG9oNm3IcfPhhCxp2HKvpUKr1hLJiCpFAhF
         cRmywPXrtpidA==
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Documentation: tracing: Add per-group/all events enablement desciption
Date:   Wed,  2 Jun 2021 23:33:09 +0900
Message-Id: <162264438901.302580.10697703336929432947.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <162264438005.302580.12019174481201855444.stgit@devnote2>
References: <162264438005.302580.12019174481201855444.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add ftrace.event.<GROUP>.enable and ftrace.event.enable bootconfig
description in the boot-time tracing document.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Documentation/trace/boottime-trace.rst |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 89b64334929b..8053898cfeb4 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -99,6 +99,12 @@ These options are setting per-event options.
 ftrace.[instance.INSTANCE.]event.GROUP.EVENT.enable
    Enable GROUP:EVENT tracing.
 
+ftrace.[instance.INSTANCE.]event.GROUP.enable
+   Enable all event tracing within GROUP.
+
+ftrace.[instance.INSTANCE.]event.enable
+   Enable all event tracing.
+
 ftrace.[instance.INSTANCE.]event.GROUP.EVENT.filter = FILTER
    Set FILTER rule to the GROUP:EVENT.
 

