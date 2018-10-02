Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E066B7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbeJBHfv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:51 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:51878 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbeJBHfq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:46 -0400
Received: by mail-it1-f193.google.com with SMTP id 74-v6so993137itw.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qfu2i5vCbLXUhEgxVTjIKQVSKkT0aaheZInMAAU7pCg=;
        b=EN7ERBx7G3tMC/5w6RjPKfD+AauITpVAZP0y6FiAaakJrL+elpACCvX/EujWWyfkyV
         CJdnUgg7PIj75Z0CheloOsJ6M+vE8XPxuapNzS7I5lI6yfFOE1E0GXdivGI3mKpy5L72
         iGz+2LqYpFV5uD7Yaa1RCBrFqchmdl9z84roM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qfu2i5vCbLXUhEgxVTjIKQVSKkT0aaheZInMAAU7pCg=;
        b=Ax1SyAP8bT7l9OhSKyVeqV5CURLfWw3TzljykI0MxeEw0YsFH95JUn58VrLVVRjY/P
         zZ6zbW43TImeWbSlqkjXEA1b1PS3RQOmkuxmszqu6MLiOwpZrDGEFbB8519vRMyKULU9
         ZxvvJreoyivz1BnAFTp4ippt73i5J5F/HzaM7wqFFH4PTfTU3xkkKa9nWzsY0IGkOREA
         0ZfGPsVmPFUE2xhoT9xnemVqU9rjedW5tlKD2d19bkZqklcmvfE34HHlHpf6zqDsGZ3x
         VogyJ9C561AUqGd3ygXkDaiHEJkKHOJ+OuQ3bS99eaWO0HIabDaoP0VqX5osDYq+YPoB
         uwxA==
X-Gm-Message-State: ABuFfojkncWr1BxsORU9Ex01LEUjE1V1wnVgv3222N/NDI9HVxTJq2bo
        g+TZBGjgMYV2wlfSzCaJdul9XA==
X-Google-Smtp-Source: ACcGV62l9Phm+SSQ90SYg/dGHI3gTmsMXZ4QTSA7P5mRLR1+PMsps4PiKZ/PmWjFolewbfJk43Ehog==
X-Received: by 2002:a63:4e4e:: with SMTP id o14-v6mr12527508pgl.181.1538441717308;
        Mon, 01 Oct 2018 17:55:17 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id e7-v6sm24885837pfk.3.2018.10.01.17.55.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:13 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     James Morris <jmorris@namei.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        John Johansen <john.johansen@canonical.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        "Schaufler, Casey" <casey.schaufler@intel.com>,
        LSM <linux-security-module@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH security-next v4 10/32] LSM: Don't ignore initialization failures
Date:   Mon,  1 Oct 2018 17:54:43 -0700
Message-Id: <20181002005505.6112-11-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LSM initialization failures have traditionally been ignored. We should
at least WARN when something goes wrong.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
Reviewed-by: John Johansen <john.johansen@canonical.com>
---
 security/security.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/security.c b/security/security.c
index 395f804f6a91..2055af907eba 100644
--- a/security/security.c
+++ b/security/security.c
@@ -55,10 +55,12 @@ static __initdata bool debug;
 static void __init major_lsm_init(void)
 {
 	struct lsm_info *lsm;
+	int ret;
 
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
 		init_debug("initializing %s\n", lsm->name);
-		lsm->init();
+		ret = lsm->init();
+		WARN(ret, "%s failed to initialize: %d\n", lsm->name, ret);
 	}
 }
 
-- 
2.17.1

