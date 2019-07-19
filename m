Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B5687D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Jul 2019 00:03:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfGSADa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 20:03:30 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:51147 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfGSAD3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Jul 2019 20:03:29 -0400
Received: by mail-qt1-f202.google.com with SMTP id g30so25892563qtm.17
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2019 17:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=9DEv8u8NV9GsQdpVG3YSkd6Fwchyp0Tmy7aGf7fvO/A=;
        b=jlECP3AShHax5jtmkNgXohpyfl7vU5w7VHrgYsRWrEm2m4hlw/rYhIrWcKnQsgM/dy
         OZKUI6y+AIE/8YlhSPji2idKxN0l15EnM8rzrdMLZV0TLJnOlEsSZXi2fPES3upK7XOP
         P6Fu8zpLaXcgEM3opBWpKQlDf9WiVxWgEuUtKWlVO+u6rMYKgmPr9aRAZf59izPvrH50
         P2eNvCymoJmAshBV+K5iW9R/VnFb0MSoMnaF9QL2N6ZCJF1ZEOrMKEF0NoPv34W3YyUn
         QvkwFcFGXXB2EJ8HkYnTFjdiARmGNnuoUjeWQCsOvq9hLKU7Q6n//i3scNYe1DmFLOqQ
         8r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=9DEv8u8NV9GsQdpVG3YSkd6Fwchyp0Tmy7aGf7fvO/A=;
        b=P8pqojADXbzzQQrYcLS+x/XOd6KPAlNBasRntLrTBCgwLXsNuGXwY3Y5aTfrkaU/1Q
         of4EDpE8lUXo4gprhOhI5aiN08HLqJhQaQ6M6u5cOUrhj7hF9zAbuLGcHVcJPCm7C7Lj
         CF4MJKpldwQNEJ9Im7XC1jmHGEH4j3jL2D2sTlub1XFEoZSOXIC2mBe3VKYfEd3WD1Z0
         9ZzbsQijdQ/4l/dzM7X5mYQkK4kyd+6GRPClw740qJka+L95WPinKXqlxdmXVHPDySNn
         XJNw97prLSnDNkZHEZl0trJncQSQ9paD8QH19MREZuth1GkZ6e4DzT+b8wWxb84h6cVV
         8mYw==
X-Gm-Message-State: APjAAAXvWRr6Vwq6b6BRGuVzN20tiE6lq2Jqq9kjqJmd3q91sUK03gon
        /FEx6oDF2+pNTYFBrPSfgESBSopnnys=
X-Google-Smtp-Source: APXvYqwRtX2YZ4Wg80vezuYYq+k1K3TfOAWAb15xfWjTiHcPsAy8V60Fafp8iP5EMk8uQaIB6Ld5vnGMWuw=
X-Received: by 2002:ac8:2642:: with SMTP id v2mr32821422qtv.333.1563494608664;
 Thu, 18 Jul 2019 17:03:28 -0700 (PDT)
Date:   Thu, 18 Jul 2019 17:03:20 -0700
Message-Id: <20190719000322.106163-1-drosen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.657.g960e92d24f-goog
Subject: [PATCH v3 0/2] Casefolding in F2FS
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

v3: Addressed feedback, apart from F2FS_CASEFOLD_FL/FS_CASEFOLD_FL
    Added sysfs file "encoding" to see the encoding set on a filesystem
v2: Rebased patches again master, changed f2fs_msg to f2fs_info/f2fs_err

Daniel Rosenberg (2):
  f2fs: include charset encoding information in the superblock
  f2fs: Support case-insensitive file name lookups

 fs/f2fs/dir.c           | 126 ++++++++++++++++++++++++++++++++++++----
 fs/f2fs/f2fs.h          |  21 ++++++-
 fs/f2fs/file.c          |   9 +++
 fs/f2fs/hash.c          |  35 ++++++++++-
 fs/f2fs/inline.c        |   4 +-
 fs/f2fs/inode.c         |   4 +-
 fs/f2fs/namei.c         |  21 +++++++
 fs/f2fs/super.c         | 100 +++++++++++++++++++++++++++++++
 fs/f2fs/sysfs.c         |  23 ++++++++
 include/linux/f2fs_fs.h |   9 ++-
 10 files changed, 334 insertions(+), 18 deletions(-)

-- 
2.22.0.657.g960e92d24f-goog

