Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D07D7E3DF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387933AbeITWIL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34946 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387855AbeITWIK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id g2-v6so4591143plo.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Kixk0uqAIkMWS9YrOweAApK1Z6SPQYN33DNf134KWzM=;
        b=SU+rpAGThh5wY0Yo+yecfVW7Rh4VwD8po3ka0l027pnk4LOFoptpHij4nDsAi2HP9X
         03KiMsC3vLmyA7ZFP44FjOVsrsxRpe4QqYTM1uTeNfsrZHQCYnqmFC+9ccsu/6iatT3+
         jiV/7cNJD9I5czE41qzb/p5oflsTQCboR69VQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Kixk0uqAIkMWS9YrOweAApK1Z6SPQYN33DNf134KWzM=;
        b=hG15bEWza0D0gQzOvUU72yvi9XHneVvwb5nX4pfGebpoIq9Br1O8Lc3SgNRygfCeMz
         7fJRzX2XAMJZgiGoL4zGcoiE0XUUYbzw6wUt34aoyUYBfZ9LQS8PTCxetLx8Ywv3fefb
         qVqK0gNFgQqbMB++O+/0xIyyL1mk6Yjp0wI9xbjVcL0elW7vXK39sp1NRdsmy8prRjAM
         4IKlGepxJ1WxGrBfsQZVuy9XuNI82nlUjfzmfo00cmfJ3bS/WDqe9ezVBDqSJFK/6DHk
         KVJxY/b3A6mYitXH/3zyJ3gsGaRHgss0naxiBo86PVUGFNAHCiv4leuvDIpiy7n80MqE
         +law==
X-Gm-Message-State: APzg51A3zGBj5mkf2wl0tLp+DKzLZrLdiKDDbzgVtmIApY5Ev7DNwTog
        +oP3e1lYRDFmkAEKy1i+nQuZEg==
X-Google-Smtp-Source: ANB0Vdb9GPUu3UrDvbhcpttjYsI4VmLhhFDFbU0cFxEKRIXfxqgKmpjXA7AOB99LFcmuKfS+OmbQSg==
X-Received: by 2002:a17:902:7145:: with SMTP id u5-v6mr40573989plm.259.1537460635285;
        Thu, 20 Sep 2018 09:23:55 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id 6-v6sm45011908pfr.115.2018.09.20.09.23.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:23:48 -0700 (PDT)
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
Subject: [PATCH security-next v2 11/26] LSM: Introduce LSM_FLAG_LEGACY_MAJOR
Date:   Thu, 20 Sep 2018 09:23:23 -0700
Message-Id: <20180920162338.21060-12-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds a flag for the current "major" LSMs to distinguish them when
we have a universal method for ordering all LSMs. It's called "legacy"
since the distinction of "major" will go away in the blob-sharing world.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/lsm_hooks.h  | 3 +++
 security/apparmor/lsm.c    | 1 +
 security/selinux/hooks.c   | 1 +
 security/smack/smack_lsm.c | 1 +
 security/tomoyo/tomoyo.c   | 1 +
 5 files changed, 7 insertions(+)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 543636f18152..38cbefabff71 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2039,8 +2039,11 @@ extern char *lsm_names;
 extern void security_add_hooks(struct security_hook_list *hooks, int count,
 				char *lsm);
 
+#define LSM_FLAG_LEGACY_MAJOR	(1 << 0)
+
 struct lsm_info {
 	const char *name;	/* Populated automatically. */
+	unsigned long flags;	/* Optional: flags describing LSM */
 	int (*init)(void);
 };
 
diff --git a/security/apparmor/lsm.c b/security/apparmor/lsm.c
index 7fa7b4464cf4..4c5f63e9aeba 100644
--- a/security/apparmor/lsm.c
+++ b/security/apparmor/lsm.c
@@ -1607,5 +1607,6 @@ static int __init apparmor_init(void)
 }
 
 DEFINE_LSM(apparmor)
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.init = apparmor_init,
 END_LSM;
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 469a90806bc6..615cf6498c0f 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7203,6 +7203,7 @@ void selinux_complete_init(void)
 /* SELinux requires early initialization in order to label
    all processes and objects when they are created. */
 DEFINE_LSM(selinux)
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.init = selinux_init,
 END_LSM;
 
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 1e1ace718e75..4aef844fc0e2 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -4883,5 +4883,6 @@ static __init int smack_init(void)
  * all processes and objects when they are created.
  */
 DEFINE_LSM(smack)
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.init = smack_init,
 END_LSM;
diff --git a/security/tomoyo/tomoyo.c b/security/tomoyo/tomoyo.c
index a280d4eab456..528b6244a648 100644
--- a/security/tomoyo/tomoyo.c
+++ b/security/tomoyo/tomoyo.c
@@ -551,5 +551,6 @@ static int __init tomoyo_init(void)
 }
 
 DEFINE_LSM(tomoyo)
+	.flags = LSM_FLAG_LEGACY_MAJOR,
 	.init = tomoyo_init,
 END_LSM;
-- 
2.17.1

