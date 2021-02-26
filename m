Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AEEC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 11:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C778664F14
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 11:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBZL0T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 06:26:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:60082 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhBZL0P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Feb 2021 06:26:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1614338728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=oeBa5dwQSjpXQzLYQYGEoVzkSCXLkRRKiXAJEhW1P8I=;
        b=f6niMuV1F3Ivi2wUE/zGN4IrPT40LcYGv2Pirmh7l0KftZvDngRdPPHnFC0O9eBj6Yh1kC
        3j/bAYOx4EWqQl64X2VGCnWs72axWZcqkMS8z1HrcZECO1omRhLaGIgfEDa+BWjD0qAd1n
        UlNcHxjK4wA2GZRAiMx4lbo2p13/e2U=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5A511B001;
        Fri, 26 Feb 2021 11:25:28 +0000 (UTC)
From:   Juergen Gross <jgross@suse.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     paulmck@kernel.org, mhocko@suse.com,
        Juergen Gross <jgross@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/3] kernel/smp.c: add more CSD lock debugging
Date:   Fri, 26 Feb 2021 12:25:18 +0100
Message-Id: <20210226112521.8641-1-jgross@suse.com>
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

Juergen Gross (3):
  kernel/smp: add boot parameter for controlling CSD lock debugging
  kernel/smp: prepare more CSD lock debugging
  kernel/smp: add more data to CSD lock debugging

 .../admin-guide/kernel-parameters.txt         |  10 +
 kernel/smp.c                                  | 193 +++++++++++++++++-
 2 files changed, 192 insertions(+), 11 deletions(-)

-- 
2.26.2

