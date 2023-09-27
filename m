Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0EAE810BF
	for <linux-doc@archiver.kernel.org>; Wed, 27 Sep 2023 10:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjI0K3f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Sep 2023 06:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjI0K3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 06:29:34 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E58413A;
        Wed, 27 Sep 2023 03:29:33 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id F3A351F8BF;
        Wed, 27 Sep 2023 10:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1695810572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=rP7S0ANGoMb7Uz5mjWZ/A4o8VAuP1EC/g6JTEYjPOt4=;
        b=quIdHtqa2DXfk0tQV34H9Q6e3vypWHU0PlMiwAxsy3pWaE08Fjmb0PXabLQ2AJZZDuui0R
        fmjHlbmZdlBbZAgvG4b1C7sNLswT7BZstO0zhayXFfRkluPxUwzm8XM1iTGMlohg5X3e6x
        o1AI0ZZRGJBb95khkYktalpPpgQ5Wbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1695810572;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=rP7S0ANGoMb7Uz5mjWZ/A4o8VAuP1EC/g6JTEYjPOt4=;
        b=8e5VrNfUxbpzsKj9DcHYXMO70/tqhn7AfS98RrYlMfkpZY5gdyYLWVCu2St4PjnQZ+VPrm
        e82eU5egmSIoiHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9CA213479;
        Wed, 27 Sep 2023 10:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4DSONAsEFGWkMwAAMHmgww
        (envelope-from <chrubis@suse.cz>); Wed, 27 Sep 2023 10:29:31 +0000
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
Subject: [PATCH v2 0/2] Fix sched-rt sysctl files & update docs
Date:   Wed, 27 Sep 2023 12:30:10 +0200
Message-ID: <20230927103012.9587-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- First patch fixes sched-rt sysctl files to disallow writing invalid
  values

- Second patch is new in v2 and clarifies and fixes the documentation
  for these files and is actually independent of the first patch

Cyril Hrubis (2):
  sched/rt: Disallow writing invalid values to sched_rt_period_us
  docs: scheduler-rt: Clarify & fix sched_rt_* sysctl docs

 Documentation/scheduler/sched-rt-group.rst | 14 ++++++++------
 kernel/sched/rt.c                          |  9 +++++----
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.41.0

