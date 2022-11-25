Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D62EC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Nov 2022 21:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiKYVUi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Nov 2022 16:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKYVUi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Nov 2022 16:20:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB6F2F3A5;
        Fri, 25 Nov 2022 13:20:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC609B82C23;
        Fri, 25 Nov 2022 21:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB5EC433D7;
        Fri, 25 Nov 2022 21:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669411234;
        bh=UofQ2Om5TKKPZw19SG+8wKH8TntN+ojXWrOiFhpkAis=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VuAbw/1nYj19+PgmBb5Y3Tlxzw3F5c8blP52lPX36dfvLIrNBuvnd6VvVcJnWuEjz
         eFFoRQPvsI4BTMUeG89I6iBWGnL32xONihx/6HnJM8GLhbYi6Flt0t0DL/NbprIc+q
         1AvJtEaBq+hwwJElK64wfyqyTJRik+TSted6iGwgv2y9htPBpp6vMLJs2+IKf+ZL0Z
         uUs8o3E3BN+0ELn+eBBxe2xV6w9iaYDS4udWHqLC2sqeGVy7ERe+I8vMwMK7h9qJOg
         Jd/OMx8G89ciDSgpTpmeJg3JJmzRz0QcJe9KZutZtDw3k4greXC5SkGAWGxUy7K3xn
         u5lfMBvzHhApw==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/3] tracing/osnoise: Add PANIC_ON_STOP option
Date:   Fri, 25 Nov 2022 22:20:22 +0100
Message-Id: <31f67f8f5ff4bc4e1549b34411f918423abcaa78.1669409262.git.bristot@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1669409262.git.bristot@kernel.org>
References: <cover.1669409262.git.bristot@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Often the latency observed in a CPU is not caused by the work being done
in the CPU itself, but by work done on another CPU that causes the
hardware to stall all CPUs. In this case, it is interesting to know
what is happening on ALL CPUs, and the best way to do this is via
crash dump analysis.

Add the PANIC_ON_STOP option to osnoise/timerlat tracers. The default
behavior is having this option off. When enabled by the user, the system
will panic after hitting a stop tracing condition.

This option was motivated by a real scenario that Juri Lelli and I
were debugging.

Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Bristot de Oliveira <bristot@kernel.org>
---
 kernel/trace/trace_osnoise.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 3f10dd1f2f1c..801eba0b5cf8 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -54,10 +54,11 @@
 enum osnoise_options_index {
 	OSN_DEFAULTS = 0,
 	OSN_WORKLOAD,
+	OSN_PANIC_ON_STOP,
 	OSN_MAX
 };
 
-static const char * const osnoise_options_str[OSN_MAX] = { "DEFAULTS", "OSNOISE_WORKLOAD" };
+static const char * const osnoise_options_str[OSN_MAX] = { "DEFAULTS", "OSNOISE_WORKLOAD", "PANIC_ON_STOP" };
 
 #define OSN_DEFAULT_OPTIONS	0x2
 unsigned long osnoise_options	= OSN_DEFAULT_OPTIONS;
@@ -1270,6 +1271,9 @@ static __always_inline void osnoise_stop_tracing(void)
 		trace_array_printk_buf(tr->array_buffer.buffer, _THIS_IP_,
 				"stop tracing hit on cpu %d\n", smp_processor_id());
 
+		if (test_bit(OSN_PANIC_ON_STOP, &osnoise_options))
+			panic("tracer hit stop condition on CPU %d\n", smp_processor_id());
+
 		tracer_tracing_off(tr);
 	}
 	rcu_read_unlock();
-- 
2.32.0

