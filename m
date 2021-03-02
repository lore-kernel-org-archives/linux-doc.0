Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E6EC433DB
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 740B664F1D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580285AbhCBSAl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:00:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:40638 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1835947AbhCBG31 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Mar 2021 01:29:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1614666521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=j2V5NygERdiceguHnu5PxJjcwzhQsg1hdbgSpQOj140=;
        b=GJ7wlEiVQYq3hfBIUFU62mMda6EhsM9sbZEdaLmFKtMt1VshXdwDMLnkhK/Vz67X/0h5Hy
        bEpL2a1xGKlB3n9SulDeSZcftikeMP31QsEJz2fAXsnEKw1ShdB81MMB8ZpH+ZGNYZvz2/
        9gWe6M8+DFvdVW4FadZO9XBif6fsEZA=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 03BBDAAC5;
        Tue,  2 Mar 2021 06:28:41 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     paulmck@kernel.org, mhocko@suse.com, peterz@infradead.org,
        Juergen Gross <jgross@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 0/4] kernel/smp.c: add more CSD lock debugging
Date:   Tue,  2 Mar 2021 07:28:34 +0100
Message-Id: <20210302062838.14267-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series was created to help catching a rather long standing
problem with smp_call_function_any() and friends.

Very rarely a remote cpu seems not to execute a queued function and
the cpu queueing that function request will wait forever for the
CSD lock to be released by the remote cpu.

This problem has been observed primarily when running as a guest on
top of KVM or Xen, but there are reports of the same pattern for the
bare metal case, too. It seems to exist since about 2 years now, and
there is not much data available.

What is known up to now is that resending an IPI to the remote cpu is
helping.

The patches are adding more debug data being printed in a hang
situation using a kernel with CONFIG_CSD_LOCK_WAIT_DEBUG configured.
Additionally the debug coding can be controlled via a new parameter
in order to make it easier to use such a kernel in a production
environment without too much negative performance impact. Per default
the debugging additions will be switched off and they can be activated
via the new boot parameter:

csdlock_debug=1 will switch on the basic debugging and IPI resend
csdlock_debug=ext will add additional data printed out in a hang
  situation, but this option will have a larger impact on performance.

I hope that the "ext" setting will help to find the root cause of the
problem.

Juergen Gross (4):
  kernel/smp: add boot parameter for controlling CSD lock debugging
  kernel/smp: prepare more CSD lock debugging
  kernel/smp: add more data to CSD lock debugging
  kernel/smp: fix flush_smp_call_function_queue() cpu offline detection

 .../admin-guide/kernel-parameters.txt         |  10 +
 kernel/smp.c                                  | 280 +++++++++++++++++-
 2 files changed, 277 insertions(+), 13 deletions(-)

-- 
2.26.2

