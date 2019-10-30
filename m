Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A5697D917
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 17:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfJ3RHI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 13:07:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46974 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfJ3RHH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 13:07:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id 193so720068pfc.13
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMuH4Tmqws5nmsyjv5QNUlDTiwl+gmCyW0G4vi9p60Y=;
        b=i+zTzHBWB2Ma47wxrrvHx4AP/6Xg47x5ZXOXbKie74NAhyf8CRNB696Ix9Tau1Tjmv
         8p73T41VcrHgHFWlUv1PDQTBhNFH2PmpjXoKe5UUDastxvpiW+k+fULlPodzTrxQYk79
         JPSNix7l7u2Yxag9tlyq8GNoGKVLVgzUIazbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vMuH4Tmqws5nmsyjv5QNUlDTiwl+gmCyW0G4vi9p60Y=;
        b=LBt7fpBvFDgM9GPsx/LtJPxSjCFHuxENiRGIc5ndxGDa0kph2b0Fzdp5MsjUQugm3u
         qhTEb/2P7IQtOHJ6Q2QpQm6M7X9/uSp8I+N26LEvJkWYjpMT7nl4oIUqIjl9+wDsojXO
         U0oVzSq3Hw4ebAlNN4INFn9WK2+NTe0G0H+g+UfnUI0QIjYlkFKJvHdnOBHPsvUdVtTv
         Tt0SHom8aVSAwi78MmTHIGpXb0hdYUAXqTVqZkNstOCKzIgFd+8emIbZ3nnvZ0LzTGP1
         0S1LN7fofqi8MMeLNYxBsMrA3UVnwxQKCh4KqyS+W7qibyFBENzXhiFATxGC5+sv3AZq
         4dMQ==
X-Gm-Message-State: APjAAAVBdqSUrg+Easb/8aOYvvHziG8tYnPQlPyoKXn27pDY5dsOaz8z
        kxdRYEbxvSCrHjmX9CRNEZ/g9Q==
X-Google-Smtp-Source: APXvYqxKO214ezv7g2i9PQtIFuSBB+X2aTkrxmXXCsp3Bq6tMZJ5EPHImzS/jVHHuqsi9bOw5W/gIg==
X-Received: by 2002:a17:90a:cb02:: with SMTP id z2mr345481pjt.86.1572455225570;
        Wed, 30 Oct 2019 10:07:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id y1sm485065pfl.48.2019.10.30.10.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 10:07:04 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Eric Biggers <ebiggers@google.com>
Cc:     Gwendal Grignou <gwendal@chromium.org>, Chao Yu <chao@kernel.org>,
        Ryo Hashimoto <hashimoto@chromium.org>, sukhomlinov@google.com,
        groeck@chromium.org, apronin@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-doc@vger.kernel.org,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        linux-fscrypt@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
        linux-ext4@vger.kernel.org
Subject: [PATCH] Revert "ext4 crypto: fix to check feature status before get policy"
Date:   Wed, 30 Oct 2019 10:06:25 -0700
Message-Id: <20191030100618.1.Ibf7a996e4a58e84f11eec910938cfc3f9159c5de@changeid>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This reverts commit 0642ea2409f3 ("ext4 crypto: fix to check feature
status before get policy").

The commit made a clear and documented ABI change that is not backward
compatible.  There exists userspace code [1] that relied on the old
behavior and is now broken.

While we could entertain the idea of updating the userspace code to
handle the ABI change, it's my understanding that in general ABI
changes that break userspace are frowned upon (to put it nicely).

NOTE: if we for some reason do decide to entertain the idea of
allowing the ABI change and updating userspace, I'd appreciate any
help on how we should make the change.  Specifically the old code
relied on the different return values to differentiate between
"KeyState::NO_KEY" and "KeyState::NOT_SUPPORTED".  I'm no expert on
the ext4 encryption APIs (I just ended up here tracking down the
regression [2]) so I'd need a bit of handholding from someone.

[1] https://chromium.googlesource.com/chromiumos/platform2/+/refs/heads/master/cryptohome/dircrypto_util.cc#73
[2] https://crbug.com/1018265

Fixes: 0642ea2409f3 ("ext4 crypto: fix to check feature status before get policy")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/filesystems/fscrypt.rst | 3 +--
 fs/ext4/ioctl.c                       | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 8a0700af9596..4289c29d7c5a 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -562,8 +562,7 @@ FS_IOC_GET_ENCRYPTION_POLICY_EX can fail with the following errors:
   or this kernel is too old to support FS_IOC_GET_ENCRYPTION_POLICY_EX
   (try FS_IOC_GET_ENCRYPTION_POLICY instead)
 - ``EOPNOTSUPP``: the kernel was not configured with encryption
-  support for this filesystem, or the filesystem superblock has not
-  had encryption enabled on it
+  support for this filesystem
 - ``EOVERFLOW``: the file is encrypted and uses a recognized
   encryption policy version, but the policy struct does not fit into
   the provided buffer
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index 0b7f316fd30f..13d97fb797b4 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1181,8 +1181,6 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 #endif
 	}
 	case EXT4_IOC_GET_ENCRYPTION_POLICY:
-		if (!ext4_has_feature_encrypt(sb))
-			return -EOPNOTSUPP;
 		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 
 	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

