Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C4977D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 21:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbeKFGnE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 01:43:04 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42837 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387733AbeKFGnE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 01:43:04 -0500
Received: by mail-pf1-f194.google.com with SMTP id f26-v6so5023395pfn.9
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58heNhsNd2Ed5ZPyDRr/AVayIH7BTABiyfQZIUkpBPc=;
        b=b3VHmN+kB7Kq0VgoM+iUwfJb88ue4iMq0KjRTL7DKS+DbMYy2MbFxbYnJTmS3hMtOw
         2ebjs3BKCEELHkkZSAKSLSi0b7r34dF5w1wxEyFhUFGVdi1UcFeWYEhVZlmHIYI2vYjC
         ReiKhh906n55AFOo0VZikqYiKpqRVD25NqfWBZ9It5Mw8qrDweim4L1A/CpD1WlNCPRf
         4jp3eUhF2hFbLvkyJQJGyBxAK6BRPxBM0LJwMfErvQoyKh3nrV5y9qWS96V1L9di1USf
         0ESC7BiCDeylpdl7TPxoG9LLFkGhEyOi1RRY52V28BktInVWHNBDsAsyDXLbcB+vVCdj
         EAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58heNhsNd2Ed5ZPyDRr/AVayIH7BTABiyfQZIUkpBPc=;
        b=J27BPkZiefVtEPl42MfilRlPVsXLtl62L5aGxTLniKyKJPSJg0HQtClugxV/Zn5UEH
         tW/cru7syH8rCbyEegjimw4ndEI+vvvP7JGnhdfgrrPdpDnziUiE7MfTrTHlFdAL6JDw
         R1LBauV5zFogiSGo8ap8UkY3m1UWtYWt/jP9K1lb/pQSFMPl2Y9QMvNBWcm8HA9mu6vc
         lmDTyqYpX+octogK2b7Rk6W0EGAHMRame9YXsDue4G/Q8ol6m22CQiDada/8a8W7/3SB
         VQlbIIuOlHpK0V8Tk0GQX02zgTMzKiKP5QvbqYP2q8fPl0uWpXMDR67sUN1+Rf9aCQgu
         OLbQ==
X-Gm-Message-State: AGRZ1gKEcdrtw9prWH29gIF9ll17vvqP0XxebBShDRrA9FCnvV4IAnww
        Ym04jH6NQuEn14Z1uvmF5LP57w==
X-Google-Smtp-Source: AJdET5fWKh7YnCFVv8Tmccg1FC4k3xQww0Li07CbFLIZn3TwsBHEMiqLwNwdQutlfD6aN8/2u34Hew==
X-Received: by 2002:a63:cd17:: with SMTP id i23mr21532644pgg.13.1541452885688;
        Mon, 05 Nov 2018 13:21:25 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id l72-v6sm15182369pfi.149.2018.11.05.13.21.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 13:21:24 -0800 (PST)
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
Subject: [PATCH v7 1/2] overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
Date:   Mon,  5 Nov 2018 13:21:13 -0800
Message-Id: <20181105212117.135347-1-salyzyn@android.com>
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

