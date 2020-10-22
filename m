Return-Path: <SRS0=90uN=D5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ACCC5DF9D
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 07:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B1924196
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 07:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ku/7Poc7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507030AbgJVHm1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Oct 2020 03:42:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:35458 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506906AbgJVHm1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Oct 2020 03:42:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1603352545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FBBqK8HW3BIG0quz5o+GZ5G2pN19linyD06f3Ehf/3E=;
        b=Ku/7Poc7X6u54p4uLBdhgxlQmb+7ztGf4Y5XEcudfV9uDHBPLfP+yYzYjwltr+6HoxAx00
        U8V2bJtnD3lNNDInjMXYmr+eYx10+JmswutopyP/xpQsysO6ymER2ClLDV3NEERFMUEHlX
        yGSnKxIue8rBtuqwUSMoyv8L2q/GI+g=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BDAE6B1A0;
        Thu, 22 Oct 2020 07:42:25 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org
Cc:     Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/5] xen: event handling cleanup
Date:   Thu, 22 Oct 2020 09:42:09 +0200
Message-Id: <20201022074214.21693-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Do some cleanups in Xen event handling code.

Juergen Gross (5):
  xen: remove no longer used functions
  xen/events: make struct irq_info private to events_base.c
  xen/events: only register debug interrupt for 2-level events
  xen/events: unmask a fifo event channel only if it was masked
  Documentation: add xen.fifo_events kernel parameter description

 .../admin-guide/kernel-parameters.txt         |  7 ++
 arch/x86/xen/smp.c                            | 19 ++--
 arch/x86/xen/xen-ops.h                        |  2 +
 drivers/xen/events/events_2l.c                |  7 +-
 drivers/xen/events/events_base.c              | 90 +++++++++++++------
 drivers/xen/events/events_fifo.c              |  9 +-
 drivers/xen/events/events_internal.h          | 70 ++-------------
 include/xen/events.h                          |  8 --
 8 files changed, 100 insertions(+), 112 deletions(-)

-- 
2.26.2

