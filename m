Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 448717E428
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbeITWIg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:36 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43828 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731552AbeITWIO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id j26-v6so4604226pfi.10
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W20mZjeWpWBoIrHvkqaSs3YTVsX8vIOCX/b5Cc7nYmw=;
        b=WERGcZTXyWf1nCFDOGSIpB8hfmOa0bbhhWFO2wRdBXSGkMEuA/iH4Li0TnT5n4KAgi
         TmNXvJgFJYHXo/oxLaZjFlO4CXpCNNWpJtjQ9VEL1b3Y5YqGx62bs8C+cfdYNpccdFXY
         2AnukDQH6UzWvYzA9UtUhyZRTGXFTVRNvrMGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W20mZjeWpWBoIrHvkqaSs3YTVsX8vIOCX/b5Cc7nYmw=;
        b=DVS9PI58+22Gw5x9+uUnaxMjcW26sS/ACJRzukVgnD2LVQvs9pni89xH3ayQ4p3S7D
         TugHpN4qyb0VGjEIJqsxL45AjbSpzoYTpeVqcWs12asOxfw0eo0yh2LC4ZuEMmlwxBP3
         aEafpBOdTAibN6hgdx4e3I4KkT8zAp0Dtndak/NoXGj3r3oTX13Sxf+IK7dWl9qwiXEm
         dRRjDR3pboVCwB3pPl90yA0zkOtiSU8GdRdhFv9iKV8cMQJw9TqLdYl3b5Xij1Nccu3Q
         OMa0joTaEIRsjo9UOJj0YeaElo+7jCqQA/k5LonRQq0+vGUaSiKXUhC/MWzmBOyeGa60
         BIUg==
X-Gm-Message-State: APzg51CPFjxbu+P2NtZYHxxFu5HD1tLwx6Xjj+5ukYzGFjIc7kmKQa1d
        ZHuVC6FgcRn54/EtiME6i0IL0bESpDU=
X-Google-Smtp-Source: ANB0Vdam9Mht/W82Wqzk3Qpmf8tdCdeW+fgC75kjNmiMi3CZZzjND6JyoY2+QCXQpiJ+G8RFEPhLNQ==
X-Received: by 2002:a63:bd01:: with SMTP id a1-v6mr37536231pgf.12.1537460639359;
        Thu, 20 Sep 2018 09:23:59 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id u17-v6sm53738170pfa.176.2018.09.20.09.23.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Sep 2018 09:23:55 -0700 (PDT)
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
Subject: [PATCH security-next v2 15/26] LSM: Introduce lsm.enable= and lsm.disable=
Date:   Thu, 20 Sep 2018 09:23:27 -0700
Message-Id: <20180920162338.21060-16-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This has identical functionality to the existing per-LSM enable handling,
but provides a centralized place to perform it. If multiple instances
of a parameter (either with the custom LSM-specific parameter or the
"lsm.{enable,disable}" parameter) for a specific LSM are on the boot
command line, the last one takes precedent.

Disabling an LSM means it will not be considered when performing
initializations. Enabling an LSM means either undoing a previous disabling
or a undoing a default-disabled CONFIG setting.

For example: "lsm.disable=apparmor apparmor.enabled=1" will leave
AppArmor enabled. "selinux.enabled=0 lsm.enable=selinux" will leave
SELinux enabled.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 47 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/security/security.c b/security/security.c
index 85533d4e534a..72d1ef2fc4cc 100644
--- a/security/security.c
+++ b/security/security.c
@@ -53,10 +53,29 @@ static bool debug __initdata;
 	} while (0)
 
 /* Mark an LSM's enabled flag, if it exists. */
+static int lsm_enabled_true __initdata = 1;
+static int lsm_enabled_false __initdata = 0;
 static void __init set_enabled(struct lsm_info *lsm, bool enabled)
 {
-	if (lsm->enabled)
+	if (!lsm->enabled) {
+		/*
+		 * If the LSM hasn't configured an enable flag, we
+		 * can use a hard-coded setting for storing the
+		 * state ourselves.
+		 */
+		if (enabled)
+			lsm->enabled = &lsm_enabled_true;
+		else
+			lsm->enabled = &lsm_enabled_false;
+	} else if (lsm->enabled == &lsm_enabled_true) {
+		if (!enabled)
+			lsm->enabled = &lsm_enabled_false;
+	} else if (lsm->enabled == &lsm_enabled_false) {
+		if (enabled)
+			lsm->enabled = &lsm_enabled_true;
+	} else {
 		*lsm->enabled = enabled;
+	}
 }
 
 /* Is an LSM allowed to be enabled? */
@@ -169,6 +188,32 @@ static int __init enable_debug(char *str)
 }
 __setup("lsm.debug", enable_debug);
 
+/* Explicitly enable an LSM */
+static int __init enable_lsm(char *str)
+{
+	struct lsm_info *lsm;
+
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (strcmp(str, lsm->name) == 0)
+			set_enabled(lsm, true);
+	}
+	return 1;
+}
+__setup("lsm.enable=", enable_lsm);
+
+/* Explicitly disable an LSM */
+static int __init disable_lsm(char *str)
+{
+	struct lsm_info *lsm;
+
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (strcmp(str, lsm->name) == 0)
+			set_enabled(lsm, false);
+	}
+	return 1;
+}
+__setup("lsm.disable=", disable_lsm);
+
 static bool match_last_lsm(const char *list, const char *lsm)
 {
 	const char *last;
-- 
2.17.1

