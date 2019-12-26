Return-Path: <SRS0=8M+Y=2Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAAAFC2D0DA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Dec 2019 14:06:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1B4C20CC7
	for <linux-doc@archiver.kernel.org>; Thu, 26 Dec 2019 14:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1577369196;
	bh=x9GnX+PrHTeZXUG6Uj8Jm/KjIXvJqw/p0hApKo59wvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gEJDNpOHxowQpLKs13fW9n1BEMinHzaM7idLIAehxdUAKK2/+zmlIABrVmo9pQ7U/
	 lYajes+14j8JVloiKAVlxJlTcpKVp3r5eknOTBfy2h0NqUFTrbub6JFb89YqXw1aZH
	 O/pBcoaT3qctxna0Vmye2w/54Ld7ZS9AlIY4kxUg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfLZOGc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Dec 2019 09:06:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:52316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfLZOGc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Dec 2019 09:06:32 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35B4D2053B;
        Thu, 26 Dec 2019 14:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577369192;
        bh=x9GnX+PrHTeZXUG6Uj8Jm/KjIXvJqw/p0hApKo59wvI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bp7yi+9GC0df1Iehwg+jJ8ETW6VDesuF+VUJtt02+kkfr13LPgGBPUzUxzn+k225N
         3BwMymTuTjRfNpQ2LQE87Q6vAyXOw+bcIKde8mxRiluhHQkyNVL87EGosYjO8vjWow
         iJCsauPflxJDl9WXCU4L7dJJif3y1djnMofTAQR0=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Tim Bird <Tim.Bird@sony.com>, Jiri Olsa <jolsa@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Tom Zanussi <tom.zanussi@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/22] tracing: Accept different type for synthetic event fields
Date:   Thu, 26 Dec 2019 23:06:25 +0900
Message-Id: <157736918549.11126.5446647426786150440.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <157736902773.11126.2531161235817081873.stgit@devnote2>
References: <157736902773.11126.2531161235817081873.stgit@devnote2>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make the synthetic event accepts a different type field to record.
However, the size and signed flag must be same.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 0 files changed

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index f62de5f43e79..dae2c25b209a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -4110,8 +4110,11 @@ static int check_synth_field(struct synth_event *event,
 
 	field = event->fields[field_pos];
 
-	if (strcmp(field->type, hist_field->type) != 0)
-		return -EINVAL;
+	if (strcmp(field->type, hist_field->type) != 0) {
+		if (field->size != hist_field->size ||
+		    field->is_signed != hist_field->is_signed)
+			return -EINVAL;
+	}
 
 	return 0;
 }

