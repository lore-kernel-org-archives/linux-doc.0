Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DD5E784AC
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 11:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236806AbjJBLzT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjJBLzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 07:55:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08B6C6;
        Mon,  2 Oct 2023 04:55:15 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id AD15C2185D;
        Mon,  2 Oct 2023 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1696247714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=cXP3JiF+EQbM+S5+0X9A18gN9X5JXHPAvhvjb53mfSw=;
        b=XlNN1Z9NnAC8IcRg6h4Adi5Q27XVsfQDERFLL0cf3+wPyhgZ1uQLHTf1kycxOrWe7U/LDk
        ZQEQuk0nfKZRG1vWTVJEKFspqV6lcQi/PZ1Pdm49OGItrnA/ERNmVYZ/G5l1X5dncte713
        QKD5uQqZrxVvijWMxlBCRo6B1jv2L50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1696247714;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=cXP3JiF+EQbM+S5+0X9A18gN9X5JXHPAvhvjb53mfSw=;
        b=TJEOngsuFIj+LkaPrXngS6rFpOIODxO8RxfmsOAK9V/iuSkKaAU/gQxVi1M36qAAeHxQ72
        i4kvZSM7fGoocgDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88E2E13434;
        Mon,  2 Oct 2023 11:55:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id Y5vJH6KvGmU7FAAAMHmgww
        (envelope-from <chrubis@suse.cz>); Mon, 02 Oct 2023 11:55:14 +0000
From:   Cyril Hrubis <chrubis@suse.cz>
To:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     ltp@lists.linux.it, Cyril Hrubis <chrubis@suse.cz>
Subject: [PATCH v3 0/3] Fix sched-rt sysctl files & update docs
Date:   Mon,  2 Oct 2023 13:55:50 +0200
Message-ID: <20231002115553.3007-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

New in v3:
 - Spelling fixes as requested by Ingo
 - added third patch that replaces all cases of realtime with real-time
   in the docs

Cyril Hrubis (3):
  sched/rt: Disallow writing invalid values to sched_rt_period_us
  docs: scheduler-rt: Clarify & fix sched_rt_* sysctl docs
  docs: scheduler-rt: Use real-time instead of realtime

 Documentation/scheduler/sched-rt-group.rst | 40 ++++++++++++----------
 kernel/sched/rt.c                          |  9 ++---
 2 files changed, 26 insertions(+), 23 deletions(-)

-- 
2.41.0

