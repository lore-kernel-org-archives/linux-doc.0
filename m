Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 907F97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 15:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730803AbfG3Pwk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 11:52:40 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42836 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731002AbfG3Pwk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 11:52:40 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so30045789pff.9
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtTBSxKVGkXm5joRk17n+qSFBzsiaHvI4NuQZRyF/Fg=;
        b=RAtHM/md668sWkFc+1tpmyHKAutDo90221bbOJHgQzdqiv2i8Qpgivpck0tm/vR2xx
         AMtMtoCtb4vybHpgtEgX8CdC5v+KNmiFZTiH2GCFAAhBiPR8rHX5JWlAgUcXPjyHiLte
         Cbl9BHaalOZmEcCJLLs/82N+YFfrcMV9PD1v13OFG0ooS5mGJ90iCwl50WQz9ZNaNM3y
         UyQ+/R8yn7p2FXwN78kDjWVNHZanqrHwrneE4TFz1ircTL9AZ4O544XjlPCBzfy2Q1xx
         PasayHDr9hJbEHp8gB5RoJeH/t9c0yftEx+5A25D56T7yHyA7AFtXBmkvF2Hp8x18oRH
         GJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtTBSxKVGkXm5joRk17n+qSFBzsiaHvI4NuQZRyF/Fg=;
        b=IfApLjIcaBFSlRjLUlZFpA5O6XnEL0NB4ruGUFM1xQGExfMVpz7rtMctgcl0MgepjP
         pbjvLvLfm6Gm17Jd8ycUPc0n+XmQHLiKilw6QrAZN+8vI8RB2ISuvGR5fnJ8zRoqZeB3
         6o5B4/abjCCYmpuKsnol5E+iYLjxzhOsK7U+FODLBHfa4yQ6qxnHfn4bEPHX0J+yensH
         w1zQjKrL+1sJwcxLtZlo9nGvp9BXWK3xxdz/ce+gTa2wJCROKaRIls3OxhtMXkL+Jq2h
         G/mv97KxKZ9gj5j+WjLMrkw+VpmiMYUbzpcaDcbhRMVjMCbyNeDlti/0NxHv8I2m5zK/
         jb6w==
X-Gm-Message-State: APjAAAX0sYQ2tG0CcNKYEl8/xiV0k55UZcvRuAKeBdqGmgsyNHbFZMj3
        h6uvY4F3t1xhKrJ+r8+LviY=
X-Google-Smtp-Source: APXvYqxAFfBtlg1l2w4yWmER2V4Yrtdm7GslobdW/IsitUtrmmRIm+xDh33YMdU7xsBgQFXk5teSzw==
X-Received: by 2002:a65:4489:: with SMTP id l9mr112861883pgq.207.1564501959699;
        Tue, 30 Jul 2019 08:52:39 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com ([2620:15c:211:200:5404:91ba:59dc:9400])
        by smtp.gmail.com with ESMTPSA id q1sm76758814pfg.84.2019.07.30.08.52.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 08:52:39 -0700 (PDT)
From:   Mark Salyzyn <salyzyn@android.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, Mark Salyzyn <salyzyn@android.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        Vivek Goyal <vgoyal@redhat.com>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        linux-unionfs@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v11 1/4] overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
Date:   Tue, 30 Jul 2019 08:52:22 -0700
Message-Id: <20190730155227.41468-2-salyzyn@android.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190730155227.41468-1-salyzyn@android.com>
References: <20190730155227.41468-1-salyzyn@android.com>
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
v11 - Rebase

v10:
- return NULL rather than ERR_PTR(-EPERM)
- did _not_ add it ovl_can_decode_fh() because of changes since last
  review, suspect needs to be added to ovl_lower_uuid_ok()?

v8 + v9:
- rebase

v7:
- This time for realz

v6:
- rebase

v5:
- dependency of "overlayfs: override_creds=off option bypass creator_cred"
---
 fs/overlayfs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index e9717c2f7d45..9702f0d5309d 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -161,6 +161,9 @@ struct dentry *ovl_decode_real_fh(struct ovl_fh *fh, struct vfsmount *mnt,
 	if (!uuid_equal(&fh->uuid, &mnt->mnt_sb->s_uuid))
 		return NULL;
 
+	if (!capable(CAP_DAC_READ_SEARCH))
+		return NULL;
+
 	bytes = (fh->len - offsetof(struct ovl_fh, fid));
 	real = exportfs_decode_fh(mnt, (struct fid *)fh->fid,
 				  bytes >> 2, (int)fh->type,
-- 
2.22.0.770.g0f2c4a37fd-goog

