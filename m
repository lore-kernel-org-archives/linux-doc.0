Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38C4C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Nov 2022 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbiKQNq2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbiKQNq1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 08:46:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCE171F0B;
        Thu, 17 Nov 2022 05:46:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67DAC61E27;
        Thu, 17 Nov 2022 13:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489A9C433D6;
        Thu, 17 Nov 2022 13:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668692785;
        bh=3Sxz7fxN4gSLjSoX02+VILF8oOb72Wcsgx5xk9uwibA=;
        h=From:To:Cc:Subject:Date:From;
        b=fkkTimUIJZoVnQrLrlxgDXHcL0BLQCDhVbmqKkF6aPga6YdFEfjfvwU+/B0MaucIH
         Rj9fnNAvpeSSBcO+0c23nmw6HRhwycUuQTZNk6+zZ43+3a6ri3xP6oi6WMrZtwxFT7
         5FMv3xfaE1YeAa39JbLZXzWEvBQRoEDg0LHFaHB3Ba0BjOC3uBJxnMAj6ylthiGucq
         /sCVISJztQkkpTOY/ulJ/r7zdDA84PISoAca2khniqSlyNgGZ/IiKssMi5x1eFqice
         zlBIen7yjngGtTGgmVa2VpErHtlden0mN2Yz/Djvvg5y8vYwT03f+Ak6ONn6oqLNv/
         FTJJFkNspZQ3A==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Allow osnoise tracer to run without workload
Date:   Thu, 17 Nov 2022 14:46:16 +0100
Message-Id: <cover.1668692096.git.bristot@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The osnoise tracer is not only a tracer and a set of tracepoints,
but also a workload dispatcher.

In preparation for having other workloads, e.g., in user-space,
add an option to avoid dispatching the workload.

By not dispatching the workload, the osnoise: tracepoints become
generic events to measure the execution time of *any* task on Linux.

Daniel Bristot de Oliveira (4):
  tracing/osnoise: Fix duration type
  tracing/osnoise: Add osnoise/options file
  tracing/osnoise: Add OSNOISE_WORKLOAD option
  Documentation/osnoise: Add osnoise/options documentation

 Documentation/trace/osnoise-tracer.rst |  12 ++
 kernel/trace/trace_osnoise.c           | 200 ++++++++++++++++++++++++-
 2 files changed, 205 insertions(+), 7 deletions(-)

-- 
2.32.0

