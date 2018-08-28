Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0A6E87DE70
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 16:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbeH1Upz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 16:45:55 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39894 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbeH1Upz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Aug 2018 16:45:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id j8-v6so975566pff.6
        for <linux-doc@vger.kernel.org>; Tue, 28 Aug 2018 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0CexIovvIoUkk1mBRlhD4MwFzMs0anqIHT31g/3XOo=;
        b=KwdSnbpfrf54n8IulUN1cxWu8rzOT/+8CfVP0p6e/RQzN0yymkANl/V2HbShoH8801
         aA4JuGYTFlxuA4MNAIfTDu/dslyed6B6doCOcJA0ltHu/1+TBeeUvpCpC6MTgVjT8H1U
         TsKZHpo3AEJj6cUHpOzNX2tqP+Bc/1tedi4ncedDv4A8pNLXhmeu+UxOtxMA+cNwJ9dF
         GCfs2swFjiJf2JAtMrtHcItHCw1blFM9e+Ckh0y/tb+7lq+MXY/CpofUCG4CeS6jt874
         ZVxx1yqrK4wwj7pasVNetNganYaiSZl6fFrPn8PwCrvZ2lH67Zf92cFPkRRh0ZydGsbD
         o8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0CexIovvIoUkk1mBRlhD4MwFzMs0anqIHT31g/3XOo=;
        b=haeEWMthB6x9Ny/Hzu8G3tZQ5XZt5KJb205Ls5pRdz1z6/77f+Xns6wgaifqYo6m3P
         G0F241QWocj4nFyG7jtFtZCiRDLgb1/8eShcP2CsnTWaco9OV2qqpMwf9jFhJ3DNVsbX
         7Dj4QHaTfsqpqpNQmhTyxoU65OrowX6Ys0+qiLv4It0fHzWQWes3SFApoovfMCml2WI8
         pMrj30IE5QMC9hvLztSPolqjuk3LyW603dBx3NmL/eI/OkbCphIJyPq4xBdiyNazwmx+
         SWIgYsCrugZmUlWI6rk4iTlTiesiSDJH6KHf52D5Z1sRxQX46X8dKFKdLjzmDPpNPdJk
         5gaQ==
X-Gm-Message-State: APzg51DpHkWbF6+BkaGSzguHLjHfM0woLcb3dyUXoN+xnlbfh+uAii8b
        PIOxQ9N+5YnxR6I8XBZueTKAHA==
X-Google-Smtp-Source: ANB0VdYDsCzV7vmjD08tdu8Ac3FXRv+v5WCRWn8VYmSA/cnLHM5T7Hp1X9akw4isHsoaB+dAIPVWuw==
X-Received: by 2002:a63:27c1:: with SMTP id n184-v6mr2291054pgn.298.1535475203580;
        Tue, 28 Aug 2018 09:53:23 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id 82-v6sm3270584pfw.159.2018.08.28.09.53.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Aug 2018 09:53:23 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v5 2/3] overlayfs: check CAP_MKNOD before issuing vfs_whiteout
Date:   Tue, 28 Aug 2018 09:53:16 -0700
Message-Id: <20180828165319.211563-1-salyzyn@android.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Assumption never checked, should fail if the mounter creds are not
sufficient.

Signed-off-by: Mark Salyzyn <salyzyn@android.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: Eric W. Biederman <ebiederm@xmission.com>
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Smalley <sds@tycho.nsa.gov>
Cc: linux-unionfs@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

v5
- dependency of "overlayfs: override_creds=off option bypass creator_cred"
---
 fs/overlayfs/overlayfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index 7538b9b56237..bf3a80157d42 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -176,7 +176,7 @@ static inline int ovl_do_rename(struct inode *olddir, struct dentry *olddentry,
 
 static inline int ovl_do_whiteout(struct inode *dir, struct dentry *dentry)
 {
-	int err = vfs_whiteout(dir, dentry);
+	int err = capable(CAP_MKNOD) ? vfs_whiteout(dir, dentry) : -EPERM;
 	pr_debug("whiteout(%pd2) = %i\n", dentry, err);
 	return err;
 }
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

