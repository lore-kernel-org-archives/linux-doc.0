Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 605337D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 03:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfGQDOk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 23:14:40 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:48032 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728047AbfGQDOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 23:14:36 -0400
Received: by mail-pl1-f202.google.com with SMTP id j12so11252365pll.14
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 20:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=UEDqcbhewLjuqENwZ85B/xbrNZKpwQFH/0eCwyVdkGc=;
        b=MEXCEEEPk/KuaWu/bxTbcr5Sv+ljjVJ5OJVxaekxPizc/h96zVyZZfexEYA9SVYpCV
         mjNK6v82DvgDgHKwdyC4kOKNH2VJ/VJDJ+Y8EGV/S4OPONugktXp7uenWF6BpIWIsCSn
         gk3QV/pTD0f1Ot1c4jFr0WyU7r3ZDFKJwWEsD3c0beg4TGWOT/qN2B8YjkmGYp7ZfOmq
         VZNWdX98/zP1yYpmKExnU7XInexP5ArSxTe3Q8MMV4Xbp5bv4dbT2Sr0GFZ3Fhvphn9r
         fMeA8QrxkD9RtLezfb49TUuBcKK3TcBeIUT8g6TVdU4YZSjYdoI3P20T9kvbW+psLYnL
         0yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=UEDqcbhewLjuqENwZ85B/xbrNZKpwQFH/0eCwyVdkGc=;
        b=rMiabPe5YCq7lB4f7/4Yvly6v0visTf/LvBoVVWf1/qkcCWO2L/hpED2rGiqAQgFUo
         9VfJPcu5vzujnyNbqCe/TxtKmroXz09blQ7n2atgJv0jD3gtWYkXD7qta0iVhCTSo+uQ
         BHTDAo9WkA267aek7oA73OjG8Znzvh6IeOjQlysd6NfqmB3YGqPr+gfD7Q6qVkloI6Ap
         9oYHaJlDB55e6YIv2piXWKyt2igWL3cFj9D1mhP30bGQ4rP5cZtES4BFi6wbsYoUHtzD
         5hT+nxw3NwfweOCyG/z9IfPlAoEb/WE/szZIfp+dHMGUOW70b1sEMZNZjqYa+JZI5peN
         dWSQ==
X-Gm-Message-State: APjAAAVAygCTlRylVr1l3D+DfBRwVzb3DzYyCYJ093Xzzf1FNl9B45UJ
        lsCAvRUz53sI1A2+Nzk4YfY8HUFG624=
X-Google-Smtp-Source: APXvYqx7EouYm/UBart6k3P8SNvF4Tt8Vrp1xqHYavJUzIKt18aw8pMHkXoYXAv17A98VxuiVijQcGClnME=
X-Received: by 2002:a65:55c7:: with SMTP id k7mr6163284pgs.305.1563333275476;
 Tue, 16 Jul 2019 20:14:35 -0700 (PDT)
Date:   Tue, 16 Jul 2019 20:14:06 -0700
Message-Id: <20190717031408.114104-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v2 0/2] Casefolding in F2FS
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

These patches are largely based on the casefolding patches for ext4
v2: Rebased patches again master, changed f2fs_msg to f2fs_info/f2fs_err

Daniel Rosenberg (2):
  f2fs: include charset encoding information in the superblock
  f2fs: Support case-insensitive file name lookups

 fs/f2fs/dir.c           | 133 ++++++++++++++++++++++++++++++++++++----
 fs/f2fs/f2fs.h          |  24 ++++++--
 fs/f2fs/file.c          |  10 ++-
 fs/f2fs/hash.c          |  34 +++++++++-
 fs/f2fs/inline.c        |   6 +-
 fs/f2fs/inode.c         |   4 +-
 fs/f2fs/namei.c         |  21 +++++++
 fs/f2fs/super.c         |  86 ++++++++++++++++++++++++++
 include/linux/f2fs_fs.h |   9 ++-
 9 files changed, 303 insertions(+), 24 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

