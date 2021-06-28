Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43411C2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 09:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25FFE61C51
	for <linux-doc@archiver.kernel.org>; Mon, 28 Jun 2021 09:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhF1JtT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:49:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21577 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230256AbhF1JtS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jun 2021 05:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624873612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZRs4tYfw25lJATMG89W0nOHiRslwJKxjwjyDFNaXYBs=;
        b=RBxm1xTjc2/uXEtY+4Fwb9H0T6SnnIo/cUUefmLy2zkGaolz7C/JzXb7JkhghTnHQ+E03A
        zPY8hGqyt3TSw2OjNU0xOc3FUAIA2yP0oiYkAO3FW0vySfMyUzaxKMFJIOiBLY7rrU0ENT
        ck7/p0Q7j14NE8wYw+EIa9uREOBYe5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-rWShzbLmOT-lSV6vp4vxig-1; Mon, 28 Jun 2021 05:46:51 -0400
X-MC-Unique: rWShzbLmOT-lSV6vp4vxig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09535800C78;
        Mon, 28 Jun 2021 09:46:50 +0000 (UTC)
Received: from x1.bristot.me.homenet.telecomitalia.it (ovpn-113-121.rdu2.redhat.com [10.10.113.121])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7410060C5F;
        Mon, 28 Jun 2021 09:46:43 +0000 (UTC)
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH 0/4] trace: osnoise tracer fixes
Date:   Mon, 28 Jun 2021 11:45:46 +0200
Message-Id: <cover.1624872608.git.bristot@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixes problems reported by kernel test robot <lkp@intel.com>, and
a typo in the documentation.

No functional change.

Daniel Bristot de Oliveira (4):
  trace/osnoise: Fix 'no previous prototype' warnings
  trace/osnoise: Make interval u64 on osnoise_main
  trace/osnoise: Fix return value on osnoise_init_hotplug_support
  Documentation: Fix a typo on trace/osnoise-tracer

 Documentation/trace/osnoise-tracer.rst |  2 +-
 arch/x86/kernel/trace.c                |  3 ---
 include/linux/trace.h                  |  2 ++
 kernel/trace/trace_osnoise.c           | 24 +++++++++++++-----------
 4 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.31.1

