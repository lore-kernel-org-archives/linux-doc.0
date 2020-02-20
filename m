Return-Path: <SRS0=o7tk=4I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A879FC11D27
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 21:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E9AC208CD
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 21:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tycho-ws.20150623.gappssmtp.com header.i=@tycho-ws.20150623.gappssmtp.com header.b="fPbfSEvN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729111AbgBTVkb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Feb 2020 16:40:31 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39069 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgBTVkb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Feb 2020 16:40:31 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so2063463plp.6
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2020 13:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tycho-ws.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdMXiwQ30NtFiXHtEOV93iERJEGx/98ZsoX3dNQE1dU=;
        b=fPbfSEvNBWFRQJpPerpnQOFFuOaBUykwN5G3Mb0OQ7ESFAV1G/GfvLFLh4E3x3/orj
         QZCmolJ9+ZBm5kA1lEKjya5v3YRWAUVVCgsmHJw/YllODFWn0M7bvPEZKPWO774L79om
         s55nEDeEVHyK7FWNTHPn5gY3+LQCa6Bo1B7oaST1i7SlzC8KFee1OwVT9Ej3jyChQNsS
         j7X2PGbnxZTx1QHEbBQkl0Fz6gXj4H5hsbWYgzwl/xDvjDJORlmfK/IRMcOaxh7BRY0t
         0hqAwWZ6QzKEjbrElt6rupJuyeLob1dQGRK0IGhyLqaJtqJlFOiVp+fNqn0EVfy+KHLd
         wZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdMXiwQ30NtFiXHtEOV93iERJEGx/98ZsoX3dNQE1dU=;
        b=ovl+hOdG3F7pirwcGvpyWGA47OEOCgysb6/WC4Nk4iu/5M9V0Ay+u/GyWsy8ColCJT
         pCNC+bP3sD4VSO6TbGi9xIqJNVR5Z+Zj2XxmplVUTzBwoQsxQnW0b/5BlHwBjGXNHuHx
         TOyy5tJC1JRoAtT9wmD3t6oknc/nNZT2SmvmGVAq6fZXxbS4lDWFR+9E3NAsimeUDsLE
         D1uOu4/D0Or0l+OQsuYWMwIf7iX+s0a4bCC0HmiSQaIj1P8QK/pJlgmt4nJyIDDHC7Jk
         qi/f482t34J+Ic2Z1pkrz7VWgjFk+OWNKKqJEXvbqzvxkPSY8HsAgpD8C1vv8JtRDqYM
         oE+w==
X-Gm-Message-State: APjAAAXKeB8vBV/0ZTgDXL334Ea0iam9Rv4s0tdPNqnnR9jDtFl/aTk3
        S1qFu6k3dZ/1lL87zCvUTbd1QK6psNrNdA==
X-Google-Smtp-Source: APXvYqxoWg8UWtAn7qZl+URGKHfmSgJlNhTD6bwEWpMBVPmnFq43cZPNxCZ2yrsn44C6bIEQW6nsKQ==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id o14mr6116479pjq.11.1582234830293;
        Thu, 20 Feb 2020 13:40:30 -0800 (PST)
Received: from cisco.hsd1.co.comcast.net ([2001:420:c0c8:1008::8b3])
        by smtp.gmail.com with ESMTPSA id h3sm386289pjs.0.2020.02.20.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 13:40:29 -0800 (PST)
From:   Tycho Andersen <tycho@tycho.ws>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tycho Andersen <tycho@tycho.ws>
Subject: [PATCH] doc: fix filesystems/porting.rst whitespace
Date:   Thu, 20 Feb 2020 14:40:09 -0700
Message-Id: <20200220214009.11645-1-tycho@tycho.ws>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If we start with spaces instead of tabs, rst seems to get confused and
italicize some things (presumably because of the `*'s).

Instead, let's switch to using leading tabs as we do elsewhere in the file.

Signed-off-by: Tycho Andersen <tycho@tycho.ws>
---
 Documentation/filesystems/porting.rst | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index f18506083ced..898e1d0c6e98 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -57,12 +57,13 @@ Turn your foo_read_super() into a function that would return 0 in case of
 success and negative number in case of error (-EINVAL unless you have more
 informative error value to report).  Call it foo_fill_super().  Now declare::
 
-  int foo_get_sb(struct file_system_type *fs_type,
-	int flags, const char *dev_name, void *data, struct vfsmount *mnt)
-  {
-	return get_sb_bdev(fs_type, flags, dev_name, data, foo_fill_super,
-			   mnt);
-  }
+	int foo_get_sb(struct file_system_type *fs_type,
+		       int flags, const char *dev_name, void *data,
+		       struct vfsmount *mnt)
+	{
+		return get_sb_bdev(fs_type, flags, dev_name, data, foo_fill_super,
+				   mnt);
+	}
 
 (or similar with s/bdev/nodev/ or s/bdev/single/, depending on the kind of
 filesystem).
@@ -181,10 +182,10 @@ can be used as examples of very different filesystems.
 iget4() and the read_inode2 callback have been superseded by iget5_locked()
 which has the following prototype::
 
-    struct inode *iget5_locked(struct super_block *sb, unsigned long ino,
-				int (*test)(struct inode *, void *),
-				int (*set)(struct inode *, void *),
-				void *data);
+	struct inode *iget5_locked(struct super_block *sb, unsigned long ino,
+				   int (*test)(struct inode *, void *),
+				   int (*set)(struct inode *, void *),
+				   void *data);
 
 'test' is an additional function that can be used when the inode
 number is not sufficient to identify the actual file object. 'set'
-- 
2.20.1

