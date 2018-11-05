Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E71E7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 15:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729657AbeKFBGL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 20:06:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60092 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729019AbeKFBGL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Nov 2018 20:06:11 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 05B1F30024A1;
        Mon,  5 Nov 2018 15:45:53 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8896B1057050;
        Mon,  5 Nov 2018 15:45:22 +0000 (UTC)
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
        Manfred Spraul <manfred@colorfullife.com>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v10 0/4] ipc: Increase IPCMNI limit & IPC id generation modes
Date:   Mon,  5 Nov 2018 10:43:42 -0500
Message-Id: <1541432626-27780-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 05 Nov 2018 15:45:53 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v9->v10:
 - Drop v9 patches 1 & 2 because they have been merged upstream.
 - Minor twist to fix checkpatch warnings.
 - Add a new ipcid_mode sysctl parameter (new patches 3 & 4) to control
   how the IPC ids are being generated.

v7 patch: https://lkml.org/lkml/2018/5/7/666
v8 patch: https://lkml.org/lkml/2018/6/18/706
v9 patch: https://lkml.org/lkml/2018/9/7/1141  

There are users out there requesting increase in the IPCMNI value to
more than 32k. This patchset does that by using a boot kernel parameter
"ipcmni_extend" to increase the IPCMNI limit from 32k to 8M when that
boot command line option is specified.

To reduce the chance of id reuse, a new sysctl parameter ipcid_mode is
added for changing the way an IPC id is being generated. Currently,
three modes are supported - legacy, delete and cyclic. They differs
in the way the identifier and sequence number within an id are being
generated. This new mode is per IPC namespace.

The IPC id mode can be changed dynamically at run time, but extending
the IPCMNI number can only be done at boot time.

Patch 1 adds a "ipcmni_extend" boot command line parameter to extend
the IPCMNI limit from 32k to 8M.

Patch 2 changes how the sequence number within an id is being generated
to reduce the chance of id reuse with "ipcmni_extend".

Patch 3 decouples the new sequence generation mode into a new sysctl
parameter "ipcid_mode" so that it can be used even if "ipcmni_extend"
isn't specified.

Patch 4 adds a cyclic mode to "ipcid_mode" to allocate identifier
cyclically as well.

Waiman Long (4):
  ipc: Allow boot time extension of IPCMNI from 32k to 8M
  ipc: Conserve sequence numbers in extended IPCMNI mode
  ipc: Make the new sequence number generation mode available to all
  ipc: Add a cyclic mode for id generation

 Documentation/admin-guide/kernel-parameters.txt |  3 ++
 Documentation/sysctl/kernel.txt                 | 23 ++++++++++++
 include/linux/ipc_namespace.h                   | 14 +++++++
 ipc/ipc_sysctl.c                                | 25 ++++++++++++-
 ipc/msg.c                                       |  3 +-
 ipc/namespace.c                                 |  2 +
 ipc/sem.c                                       |  3 +-
 ipc/shm.c                                       |  3 +-
 ipc/util.c                                      | 41 +++++++++++++++------
 ipc/util.h                                      | 49 ++++++++++++++++++++-----
 10 files changed, 140 insertions(+), 26 deletions(-)

-- 
1.8.3.1

