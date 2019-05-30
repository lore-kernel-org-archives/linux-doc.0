Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97FF17D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 May 2019 00:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfE3Ax2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 20:53:28 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:40923 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727248AbfE3Ax1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 20:53:27 -0400
Received: by mail-qt1-f201.google.com with SMTP id 37so3531866qtc.7
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 17:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=;
        b=tq0C+xLpxnScJrE7KGvLRNW1EvyW7w8fxZLYhMG38iqb6B65iu+pJNUwkSmSw9Wsl3
         /9PNywbClVW9JA9DR/Dh1tSwsF6mMdgLrRvRMdWic+A+8I5sxRkeLEB1Ob2MAWWJm9jL
         6ev53ORFgvokwK4cHk17Y7Ckh2RQmG74ba2tYgemlhSg7VkheKlADWDbsqwFIwOUSizD
         ZYBWe2VO+7gH+pPgHLcdOlhkOX4cS9lzTtfup83L3evOB0ATtVcM/T1mPq4hDcSUF5Uc
         u/Y86bsvfsu8KvdNmkA/2KSKxTBI0UsTGqIlC4MAGZr2YM/9PfAUtAnGcsXxF7iTVQkS
         YuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=;
        b=GwAfAv7ibIQzV26NPWsOvlD9U2q/7U+SR3tcQQf74ZuHYnsYPkByvXQZVm9DRnr+Ue
         Pb09Zy0Z4juZ99CPcZgEu/1GmyjitPE9WMIyFWlK3VOYWXUCa5FIIeiYJRKwdW8fphhh
         f5stnjEoeclzgGMV7HB5kb2UUBFucpIWzIEPFTY089TPjPmKkt++jnIwPZ9mO8Kne1Kf
         sbZwmS9HikE9S8SMYQpIBi2o7kWEttrr1jPXqLqMu1hm3NI+AGU+BMhx9wcIpZMosMYR
         uWALub51Nb4yaYySgjIDZLGZd7K27Aur0wvPb+7ccyRJOCkW0M3xA37D4tQ4l60bgtRQ
         2phQ==
X-Gm-Message-State: APjAAAX1BaqjvBO0helgTb8UqRCdfwj149spG7S39MEsXAvr0pln97Ad
        432eejDApPfqr5Wk37l17KAJmb7gg6Q=
X-Google-Smtp-Source: APXvYqzdUz6c4pIj7GBI7bppXtBGbR717H7HlhysYDM55NbncVD1VFEeIv2JijSIJKEof8AzW57Fcs/wZys=
X-Received: by 2002:a37:660b:: with SMTP id a11mr723548qkc.342.1559177606029;
 Wed, 29 May 2019 17:53:26 -0700 (PDT)
Date:   Wed, 29 May 2019 17:49:05 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-4-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 3/4] f2fs: Fix accounting for unusable blocks
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

Fixes possible underflows when dealing with unusable blocks.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/f2fs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9b3d9977cd1ef..a39cc4ffeb4b1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1769,8 +1769,12 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 
 	if (!__allow_reserved_blocks(sbi, inode, true))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		avail_user_block_count -= sbi->unusable_block_count;
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (avail_user_block_count > sbi->unusable_block_count)
+			avail_user_block_count = 0;
+		else
+			avail_user_block_count -= sbi->unusable_block_count;
+	}
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
 		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
@@ -1970,7 +1974,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count;
+	unsigned int valid_node_count, user_block_count;
 	int err;
 
 	if (is_inode) {
@@ -1997,10 +2001,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 
 	if (!__allow_reserved_blocks(sbi, inode, false))
 		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
+	user_block_count = sbi->user_block_count;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		valid_block_count += sbi->unusable_block_count;
+		user_block_count -= sbi->unusable_block_count;
 
-	if (unlikely(valid_block_count > sbi->user_block_count)) {
+	if (unlikely(valid_block_count > user_block_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
-- 
2.22.0.rc1.257.g3120a18244-goog

