Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 73F187D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 May 2019 00:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfE3AxI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 20:53:08 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:55864 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfE3AxI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 20:53:08 -0400
Received: by mail-yb1-f201.google.com with SMTP id e7so3330998ybk.22
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 17:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=;
        b=fbbGY86HQAvMyuGABmIV5PWAqyAjKpNYQPTVcYsDDwLMglTCo/RHkGXEHGjlPQlO1i
         1maBy1XlB8ZPwQF1a4O65dbNcWKaebodjcj8l91tKo7tj7lfzms/LmWum3fYAkSCF9+a
         1MduZ6NgfZ4J4RsrcjHMnjmUA/OLn/1xplY3+eg6JF39R9cjdd0UM4lb5tbyKLyN2Flw
         Imwh+pgUv75Np9AyNwYEWKPBO/FRJRrzAlqLSYPGQ2W1XvDlp+vOaZzMVcUBsMuVa0aF
         UhUtZx1Rwvk2/6sFkV3HlEKjNDlqDECo3ImPqfc4klHFAG5mtBhfs4Gt4xbiOYfl1x3s
         9mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=p0enTo1paGhtTCzKrRxNViLV0NJbbGkfixUzKcvFAIM=;
        b=P09h2rm3HTDm3C22MnJi/oCjY9CjE7khvmnn7DUOaMF3KWQLKAywgig8qLGAQRPLdN
         wQ5CZ/PP9CkCyeW4ueJ65JkpBa8EUWRuWyzPr3xSLLlKUEoAhPmDCM6zsbs8iEfaUEEN
         lWmlKeZVg6jmTYNweVOUJXKPiMx/USrmlVrI720cIyZmX3l0NhjbOrAbeiS2fI7GD07/
         oqxk+aA7AOu1mw9loMnjEkwQ4FPP06RL/IT+VXo8/lC890c52PAiLXUaMDN3reQq5MBR
         wbmLjqbsZtHeQOUN/DSqzdKiZ7od78ras7tpJhbutNQN1N8l0jXm+P0LL0qZrUxWNVaA
         5M9g==
X-Gm-Message-State: APjAAAWGevG0Tq/KzhTuI6824z6/mGqIQZwfGARwSuC0WXMRMJu1V9l5
        vVO/WmJ6xCqfofodMTvIeuVhJRir6Fo=
X-Google-Smtp-Source: APXvYqzWm35RV29MwLeQluK9gcDBYwAUwpZj3MTGP+M+S2CQ5CrRwwOROjnO+bcTCPD25gcsaXKtfsvXOEM=
X-Received: by 2002:a25:4050:: with SMTP id n77mr310800yba.77.1559177587174;
 Wed, 29 May 2019 17:53:07 -0700 (PDT)
Date:   Wed, 29 May 2019 17:49:02 -0700
Message-Id: <20190530004906.261170-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 0/4] F2FS Checkpointing without GC, related fixes
From:   Daniel Rosenberg <drosen@google.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-f2fs-devel@lists.sourceforge.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, kernel-team@android.com,
        Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The first patch adjusts the default allowable holes for checkpointing, and
the next two patches fix underflow issues related to inc_valid_block_count
and inc_valid_node_count. The final one adds a new feature for
checkpointing where the user can specify an acceptable amount of space to
lose access to up front in checkpointing=disable mode instead of requiring
garbage collection.

There is still a question around what to do when the current reserved
space is less than reserved. As it stands, when a block is deleted, if it
was an old block, the space is not actually given back, and is marked as
unusable. But current reserve may still rise towards reserve, which would
make freeing one block result in a net loss of one block, as opposed to no
change. Reserved and unusable serve the same function, so it may make
sense to just handle it as max(current_reserved, unusable), which
effectively removes the double counting. I'm leaving that until later.

Changes from v2:
Adjust threshold for initial unusable blocks
Patches to fix underflows
Added option to set a block limit in addition to a percent for initial
unusable space

Daniel Rosenberg (4):
  f2fs: Lower threshold for disable_cp_again
  f2fs: Fix root reserved on remount
  f2fs: Fix accounting for unusable blocks
  f2fs: Add option to limit required GC for checkpoint=disable

 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++
 Documentation/filesystems/f2fs.txt      | 19 +++++++-
 fs/f2fs/f2fs.h                          | 22 ++++++---
 fs/f2fs/segment.c                       | 21 +++++++--
 fs/f2fs/super.c                         | 62 ++++++++++++++++---------
 fs/f2fs/sysfs.c                         | 16 +++++++
 6 files changed, 115 insertions(+), 33 deletions(-)

-- 
2.22.0.rc1.257.g3120a18244-goog

