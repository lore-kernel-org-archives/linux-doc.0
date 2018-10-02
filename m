Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 547677D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 01:04:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbeJBHpF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:45:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34576 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbeJBHpE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:45:04 -0400
Received: by mail-io1-f68.google.com with SMTP id k19-v6so304155iom.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 18:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0qW1uF7m4L1ZO2KeQqVjIZsOMVYw9XJu7Iz5ldDGsTM=;
        b=NDhrsbxuJpH8jCuXv4vA++uSz8lSj1sQmARm/JggoSeY5rzd+87LpdFJG6YVNE5JTC
         IuuqsE44RAfi7t/wqc2uh4MNhih7NpbPqGZRmhwOAB5T0RyMtBgOU7ui0H709C+WsAON
         wo4xmL7lr8nSw/gkCJpns1qLaabNLquiH0EM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0qW1uF7m4L1ZO2KeQqVjIZsOMVYw9XJu7Iz5ldDGsTM=;
        b=Do9zXFeqAWNVozmqZEPNYvAg3ux0rHIyrC+CEoCqdWqoHgO8kEXTW6Q2mX9J5k5dhC
         sd7l+wAB9bcd2W3j1fIOdyqkOkU4qh/vzpN/61BR73yOkxkG3ZZI5nLJwLeTf2D5vaav
         3leNjpi1ip+VrErig6M5pmdwStRncuE8UPqd9Mzz3B7S4vOeL6L0VJ3lxXq7pxrS7WAm
         0lu9Bky1ayXpk7bGYkBhZULHZ6bhOMwYjsZ/uCkc3YgYitWe/7h30of1SY+hBfIdfJsZ
         XzIut1M/TXlWVQwp/uYbMasaEYWuHq5dH5SISq6rwtN8hGfTu79xHntah2UgzCE3O+OH
         FvYQ==
X-Gm-Message-State: ABuFfoih5/OIO6TUtRSzez2x4Z05ABowEMJcNidEtUgt0zuuF3ZMDK2t
        ZUJSQp/dDxnYxuJpXr4vEufbTC0R6o4=
X-Google-Smtp-Source: ACcGV605gnobaiJmFA16xtbVu/9AcHEdLAn7xCklyTmVNdo6+1o9hZHdekNSMlFgBvkhB8xVoYqVcg==
X-Received: by 2002:a17:902:b212:: with SMTP id t18-v6mr14398304plr.136.1538442273074;
        Mon, 01 Oct 2018 18:04:33 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id p3-v6sm19540885pfo.130.2018.10.01.18.04.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 18:04:29 -0700 (PDT)
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
Subject: [PATCH security-next v4 20/32] LSM: Refactor "security=" in terms of enable/disable
Date:   Mon,  1 Oct 2018 17:54:53 -0700
Message-Id: <20181002005505.6112-21-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For what are marked as the Legacy Major LSMs, make them effectively
exclusive when selected on the "security=" boot parameter, to handle
the future case of when a previously major LSMs become non-exclusive
(e.g. when TOMOYO starts blob-sharing).

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 security/security.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/security/security.c b/security/security.c
index 455ba2767965..d7132c181ea6 100644
--- a/security/security.c
+++ b/security/security.c
@@ -103,14 +103,6 @@ static bool __init lsm_allowed(struct lsm_info *lsm)
 	if (!is_enabled(lsm))
 		return false;
 
-	/* Skip major-specific checks if not a major LSM. */
-	if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
-		return true;
-
-	/* Disabled if this LSM isn't the chosen one. */
-	if (strcmp(lsm->name, chosen_major_lsm) != 0)
-		return false;
-
 	return true;
 }
 
@@ -188,8 +180,24 @@ static void __init prepare_lsm_enable(void)
 	parse_lsm_enable(chosen_lsm_enable, set_enabled, true);
 	parse_lsm_enable(chosen_lsm_disable, set_enabled, false);
 
+	/* Process "security=", if given. */
 	if (!chosen_major_lsm)
 		chosen_major_lsm = CONFIG_DEFAULT_SECURITY;
+	if (chosen_major_lsm) {
+		struct lsm_info *lsm;
+
+		/*
+		 * To match the original "security=" behavior, this
+		 * explicitly does NOT fallback to another Legacy Major
+		 * if the selected one was separately disabled: disable
+		 * all non-matching Legacy Major LSMs.
+		 */
+		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) &&
+			    strcmp(lsm->name, chosen_major_lsm) != 0)
+				set_enabled(lsm, false);
+		}
+	}
 }
 
 /**
-- 
2.17.1

