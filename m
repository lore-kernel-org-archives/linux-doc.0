Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 64E837D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 23:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbeKGI3B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 03:29:01 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36316 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387612AbeKGI3B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 03:29:01 -0500
Received: by mail-pg1-f194.google.com with SMTP id z17-v6so6483007pgv.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 15:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXcFcbAp4U6rfBVC+DckoAio735dKa50uXkwgyQSrys=;
        b=MGYq7IVLjHNtDi1RjL00w4I8U1UNzYGUroZaOT8g9eYlI9xUY1HQL1xlFExxN3mtAL
         O7YlyX+2FvCHhp+GdPWhIjPq6/omXno7ySEYiLNdsErcAePLFDIiyGDVi5yoXJ8knkih
         5dML6nZA3vbskrD+ASqmQBbkIFu0k+3sRi+CZcM9qfVCuuGGi5P/psEP9H8kaBIsSPoW
         QavuAWIaUr70Sh+kWuMTkXT3WIO68Mc2cQRGswNcPbJWDaNsDwpzoc2RP2EyKc5MErFM
         Vcjx4YmxyFZ6oqUBmnJC9L3O9+Hj7B/x3bhG4+61jERkvsEIl6rEBLllPWHv8AIJp3R/
         zvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oXcFcbAp4U6rfBVC+DckoAio735dKa50uXkwgyQSrys=;
        b=Bta0AwyMALt+U0SfAkIp7H1MinW7q5zcAkvohIE/rSOlLT1wzRpBRqq+IPbOr07sPB
         FVp8yfwoUz5+4gf8D45sQVQUJS26sImkKw5R9ucmyEV/rmZM7G8EWVEYQtNg/A83hQ/v
         vqvl82CdXwrh0RYJZPk8wVjefbhD8LNzzte+je1eVr41pEyUrmNXcdsBDvPqFHDvS2Lq
         gxx7kWamssXIScujpNNfIUfXZPv8P+kjv3lGysJ+llnsAR7sZiKueUrpNP1ICWOKbApD
         Rp6mnNP9Y8z6HOUw3A+4tsqwHbg+QouJ6BG0Gd6KmsS/LUHLvl7PaoZg8hlp2zHB5dit
         wHUw==
X-Gm-Message-State: AGRZ1gL/AxhcYhUvPaEb5bIW0ZJwx2osVM2bwh46hKZx5/egoQweiLAh
        fJF1Gc+aPVOgjWk5TYUB551RSA==
X-Google-Smtp-Source: AJdET5eOROEQp05uY73W2tyFCMUI7xYIz7P2+BEmg8YjZoCpssDWXcqaBHlTWPuF5MrRHL1iBTOs/Q==
X-Received: by 2002:a63:a51b:: with SMTP id n27mr2791633pgf.17.1541545286708;
        Tue, 06 Nov 2018 15:01:26 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id p15-v6sm66167157pfj.72.2018.11.06.15.01.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Nov 2018 15:01:25 -0800 (PST)
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
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@android.com
Subject: [PATCH v8 1/2] overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
Date:   Tue,  6 Nov 2018 15:01:14 -0800
Message-Id: <20181106230117.127616-1-salyzyn@android.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
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
Cc: kernel-team@android.com
---
v8:
- rebase

v7:
- This time for realz

v6:
- rebase

v5:
- dependency of "overlayfs: override_creds=off option bypass creator_cred"

 fs/overlayfs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index efd372312ef1..3ac9dc8f6cc0 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -163,6 +163,9 @@ struct dentry *ovl_decode_real_fh(struct ovl_fh *fh, struct vfsmount *mnt,
 	if (!uuid_equal(&fh->uuid, &mnt->mnt_sb->s_uuid))
 		return NULL;
 
+	if (!capable(CAP_DAC_READ_SEARCH))
+		return ERR_PTR(-EPERM);
+
 	bytes = (fh->len - offsetof(struct ovl_fh, fid));
 	real = exportfs_decode_fh(mnt, (struct fid *)fh->fid,
 				  bytes >> 2, (int)fh->type,
-- 
2.19.1.930.g4563a0d9d0-goog

