Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 58CEC7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 18:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387714AbeKFDnC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 22:43:02 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45130 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387705AbeKFDnC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Nov 2018 22:43:02 -0500
Received: by mail-pg1-f196.google.com with SMTP id y4so4146821pgc.12
        for <linux-doc@vger.kernel.org>; Mon, 05 Nov 2018 10:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IcHeJPDy1T6WJ8Fq/KWMAHt8XXMgVqCQgxCpPKbKBJs=;
        b=M9wXyYqIKEgqQIEmct5wd2kPiiSHE43E9Lkvrp7BmJdE9NKWkYx3+QVjmoU0tCY9uk
         M+wRAz4dAVV+MkuPtJ7+hPsAb2/On0bruoOvwk0/A3DGI4ZX0qg3siPeJrJwF4aOSt/6
         sk/MXZNbtGWdPd6udNfraOmG5pTpChd1Yc2ayv/EhfyZsuMvlpcsedktv7YAoOpG5gAe
         4mEkvdOKN1edoo+LaV9Uk4IgLd2+hFuqYj4cDNfukkyddBk4z7L1wYH4fklyLzq0deYA
         U0sQbHUuJTgDPhZOYqfdpKV3l1Cv0oJfo/0P/Rcogh/MF/1yzLlaz1vnufZbJU0B9Xxp
         n5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcHeJPDy1T6WJ8Fq/KWMAHt8XXMgVqCQgxCpPKbKBJs=;
        b=uJHXow8/B0SXv44iyWZB63LJFVu3CEnmR1IcUM9uLFMlvVxSnphnxIlxWEBDvlYPxh
         geaLKdgzaBP6psRXh0tfyke9JNSufcUcXZf2Z5KiK0IzlJFSXK2PIud8G7w0faWeP6M7
         DCTQtfbqTlZG6YpQc5V2zvJmla/ekPj02PbNOv2EGSicch1KqeRDA5cML248fopY+rdJ
         gBm0pF/ToR/l+ApUW4i3ZoavJOoC7tl5h0fVpbnceOuBQQKS8KbpY8yL/yAdYcERnhDw
         CcUDJFi+E72NCARtqhCwF7afJAtT6X/7dowi8BzVibJ7O3Orf0Plgz5XwgHMF7Lnl0Sh
         bJsw==
X-Gm-Message-State: AGRZ1gJA//bdmqmoc1QGHCuYMt2KbKhuKrmdz+FZ1wRwE5wOJIdi1qLq
        krbrA5x4mQ4Rfe2Tzq7XqU/ieA==
X-Google-Smtp-Source: AJdET5dPPg2osdD85x9UsEy7rRMx/EolrukFiEW+nL0YW6oFDOO7veYp8k3xlVrauHis73nim8zf5A==
X-Received: by 2002:a62:7d10:: with SMTP id y16-v6mr22939181pfc.245.1541442127796;
        Mon, 05 Nov 2018 10:22:07 -0800 (PST)
Received: from nebulus.mtv.corp.google.com ([2620:0:1000:1612:b4fb:6752:f21f:3502])
        by smtp.gmail.com with ESMTPSA id s184-v6sm53788626pfb.46.2018.11.05.10.22.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 10:22:07 -0800 (PST)
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
Subject: [PATCH v6 1/2] overlayfs: check CAP_DAC_READ_SEARCH before issuing exportfs_decode_fh
Date:   Mon,  5 Nov 2018 10:21:41 -0800
Message-Id: <20181105182146.233025-2-salyzyn@android.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <20181105182146.233025-1-salyzyn@android.com>
References: <20181105182146.233025-1-salyzyn@android.com>
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

v5:
- dependency of "overlayfs: override_creds=off option bypass creator_cred"

v6:
- rebase
---
 fs/overlayfs/namei.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/overlayfs/namei.c b/fs/overlayfs/namei.c
index efd372312ef1..aa012b6bd46e 100644
--- a/fs/overlayfs/namei.c
+++ b/fs/overlayfs/namei.c
@@ -163,6 +163,11 @@ struct dentry *ovl_decode_real_fh(struct ovl_fh *fh, struct vfsmount *mnt,
 	if (!uuid_equal(&fh->uuid, &mnt->mnt_sb->s_uuid))
 		return NULL;
 
+	if (!capable(CAP_DAC_READ_SEARCH)) {
+		origin = ERR_PTR(-EPERM);
+		goto out;
+	}
+
 	bytes = (fh->len - offsetof(struct ovl_fh, fid));
 	real = exportfs_decode_fh(mnt, (struct fid *)fh->fid,
 				  bytes >> 2, (int)fh->type,
-- 
2.19.1.930.g4563a0d9d0-goog

