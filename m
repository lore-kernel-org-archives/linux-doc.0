Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8BD57D581
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 20:29:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbeIHBLr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 21:11:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37300 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726032AbeIHBLr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Sep 2018 21:11:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 305F2401EF2C;
        Fri,  7 Sep 2018 20:29:11 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7F42027EA4;
        Fri,  7 Sep 2018 20:29:08 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     "Luis R. Rodriguez" <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Takashi Iwai <tiwai@suse.de>, Davidlohr Bueso <dbueso@suse.de>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v9 0/4] ipc: IPCMNI limit check for *mni & increase that limit
Date:   Fri,  7 Sep 2018 16:28:53 -0400
Message-Id: <1536352137-12003-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 07 Sep 2018 20:29:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Fri, 07 Sep 2018 20:29:11 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v8->v9:
 - Rebased to 4.19-rc2 (changes needed only in patches 3 & 4).
 - Drop patch 5 "ipc: Add a new ipcmni_compat sysctl to fall back to
   old behavior" as this patch may not really be needed.
 - Move 1 byte from sequence number to index in extended mode leading
   to 8M IPCMNI limit in extended mode.
 - Change some macro names to avoid name collision.

v6 patch: https://lkml.org/lkml/2018/4/27/1094
v7 patch: https://lkml.org/lkml/2018/5/7/666
v8 patch: https://lkml.org/lkml/2018/6/18/706

The sysctl parameters msgmni, shmmni and semmni have an inherent limit
of IPC_MNI (32k). However, users may not be aware of that because they
can write a value much higher than that without getting any error or
notification. Reading the parameters back will show the newly written
values which are not real.

The real IPCMNI limit is now enforced to make sure that users won't
put in an unrealistic value. The first 2 patches enforce the limits.

There are also users out there requesting increase in the IPCMNI value.
The last 2 patches attempt to do that by using a boot kernel parameter
"ipcmni_extend" to increase the IPCMNI limit from 32k to 8M if the users
really want the extended value.

Waiman Long (4):
  ipc: IPCMNI limit check for msgmni and shmmni
  ipc: IPCMNI limit check for semmni
  ipc: Allow boot time extension of IPCMNI from 32k to 8M
  ipc: Conserve sequence numbers in extended IPCMNI mode

 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 include/linux/ipc_namespace.h                   |  1 +
 ipc/ipc_sysctl.c                                | 42 ++++++++++++++++++--
 ipc/util.c                                      | 29 +++++++++-----
 ipc/util.h                                      | 51 +++++++++++++++++++++----
 5 files changed, 107 insertions(+), 19 deletions(-)

-- 
1.8.3.1

