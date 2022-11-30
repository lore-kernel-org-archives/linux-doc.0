Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18655C352A1
	for <linux-doc@archiver.kernel.org>; Wed, 30 Nov 2022 18:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiK3SVJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Nov 2022 13:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiK3SUt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Nov 2022 13:20:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701B51AF21;
        Wed, 30 Nov 2022 10:19:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E07D761D41;
        Wed, 30 Nov 2022 18:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF0DC433C1;
        Wed, 30 Nov 2022 18:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669832357;
        bh=bK39FsjBF/+0kLaurZ9wMrHdi5SfqFphkImLrVtOP4g=;
        h=From:To:Cc:Subject:Date:From;
        b=OidmiENukGHG7vHWGYtvFXe2r/wPC9Zv30zcRkHTjouKPzQG5Q8x473R7wWNhRLiM
         AFTzPSYCqspzwp1eZuNIGKDJGaTo5X+b2TV1Wv7gpEho5O37OlG20QMQE8FpxKzf1w
         0YfBbSbNmqHeJAqgV6UaF0nkWnNf8vJ51QPjO6+l1hGgvQZPIhGFCbFooxk/vk0uoU
         qpznDdSQ7N3JEvevhR+oO/7IN9n5o4SUGnN3UZQAB2zYfmZQPtNAncCdPIu10GSOXm
         dbWtWeYjGr47IfW0ccoA6uy8k5XySa3AsdPfY2BLD9K6K6GnL9VnSvwSgvSZHiYmwy
         MLNduUzDp7nIg==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/3] Add osnoise/options options
Date:   Wed, 30 Nov 2022 19:19:08 +0100
Message-Id: <cover.1669832184.git.bristot@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After adding the osnoise/options file, a set of on/off options
came to my mind, most based on discussions while debugging problems
with Juri and Clark.

The PANIC_ON_STOP option facilitates the vmcore generation to aid
in the latency analysis using a crash dump.

The OSNOISE_PREEMPT_DISABLE and OSNOISE_IRQ_DISABLE options refine
the type of noise that the osnoise tracer detects, allowing the
tool to measure only IRQ-related noise, or NMI/HW-related noise,
respectively.

Each patch has a description of the options and the last patch
documents them in the osnoise documentation file.

[1] https://lore.kernel.org/r/cover.1668692096.git.bristot@kernel.org/

Changes from V3:
  - Fix documentation (Bagas Sanjaya)
  - Optmize the preempt disable option (Steven Rostedt)
Changes from v2:
  - rebased on top of linux-trace.git/ftrace/core
  - removed the patches already added to the ftrace/core
Changes from v1:
  - Changed the cover letter topic
  - Add Acked-by Masami to the first patch
  - Add the PANIC_ON_STOP option
  - Add the OSNOISE_PREEMPT_DISABLE and OSNOISE_IRQ_DISABLE options
  - Improved the documentation

Daniel Bristot de Oliveira (3):
  tracing/osnoise: Add PANIC_ON_STOP option
  tracing/osnoise: Add preempt and/or irq disabled options
  Documentation/osnoise: Add osnoise/options documentation

 Documentation/trace/osnoise-tracer.rst | 20 +++++++++-
 kernel/trace/trace_osnoise.c           | 52 +++++++++++++++++++++++---
 2 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.32.0

