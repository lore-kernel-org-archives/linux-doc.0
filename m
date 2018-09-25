Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 556137D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:20:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbeIYGXh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:37 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46759 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbeIYGXg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id d8-v6so2958240pfo.13
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2edRK2AZFrxFBXiESIgGjfhpy0zSRex0q+D6nx3+uAQ=;
        b=Urp1Mw90h+P8UxAPse25ALToKoEoVGmrJLmAMfS65DsUAxVRC1H4HpNVY/p7NpXEqx
         u8W55R5zikND2gyQf/c+q8WvpnfXrVQkBtQTl5swRnfU2gB/jtqataQi8vMrvL7e72FO
         cWNBdupazSohrkGtbXwFjWCWa5x+DYeZKZs9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2edRK2AZFrxFBXiESIgGjfhpy0zSRex0q+D6nx3+uAQ=;
        b=e4fySGP5VNL4AGxUV3oL7QUUhmrxBg/TJck5Q4BJmk7kcdNZ3zhnYXb0KYgSYRTX1u
         uxQBfBwNEVGfYUvqO/iLrkv7uhMHP+Qqf0molWgwFtTd9iU+aW0BpZ1Vjr5j+7/hRBMj
         8FMypnwIOxwK6u/veV2RtNJXYFJ3wr59NzbQ2ojgY2seGsy+E45Y0Dd1XzHYlSZ+TMwT
         JrHj7ZGAyQtSu+wYCA4CX/oz9fsWsjWO7CJJ0uW4oO1PlFblyHEuyrTwVq3U2CXy2pWJ
         ogg03P6XQiGaXywE4fW7GKcUB9p9vC1CBV9DCi2a3SH6pSciBvgi6RPwTKIt+hA+2kVC
         YxXQ==
X-Gm-Message-State: ABuFfohgEtwwzkLLnWwhw8SVQnLrf9WmimYdpcmo1ULOA/TbfEYutxKe
        ubVH8PF+xdlB2HwjcJfPe1AYHg==
X-Google-Smtp-Source: ACcGV62vk1m1eX4nNjkskL5VB4G+9KlGlE6f28Ca6ufe2w21HkY1HPch0o1YcPxOFhnYqvYqiz6hPA==
X-Received: by 2002:a63:e04d:: with SMTP id n13-v6mr931731pgj.426.1537834730657;
        Mon, 24 Sep 2018 17:18:50 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c78-v6sm505844pfc.188.2018.09.24.17.18.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:48 -0700 (PDT)
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
Subject: [PATCH security-next v3 11/29] LSM: Introduce LSM_FLAG_LEGACY_MAJOR
Date:   Mon, 24 Sep 2018 17:18:14 -0700
Message-Id: <20180925001832.18322-12-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
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
index 543636f18152..5056f7374b3d 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2039,8 +2039,11 @@ extern char *lsm_names;
 extern void security_add_hooks(struct security_hook_list *hooks, int count,
 				char *lsm);
 
+#define LSM_FLAG_LEGACY_MAJOR	BIT(0)
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

