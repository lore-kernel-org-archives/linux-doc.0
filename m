Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E190B7DE7C
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbeIYGaM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:30:12 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39141 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbeIYGaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:30:10 -0400
Received: by mail-pf1-f193.google.com with SMTP id j8-v6so9926274pff.6
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OmKzimyohhf+zr/naGxorwDbJPy1b1KsUqv0GqD4+8g=;
        b=Mbq8PKJrbJf8ZmYeZ3v1vr3hrS7QR/UloEPJJy62xaaRSqyhqR35KPqeOStWYSIm4b
         90LegfQCpHdGAbEJxGXndnXOslYWoGmHB87W3qyr+Sfh0tq9/T7OZuG9OpWFQ/E58/qX
         6WsNIfQuyi+8VRbo9Ipi8NY/jRyj5fne5lrHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OmKzimyohhf+zr/naGxorwDbJPy1b1KsUqv0GqD4+8g=;
        b=Bk3/3fYkynNVGtvdSNdX4g1uSZA9D662F34l1d45YJ/V6K5xOwKOExo4RVHaTSC9DM
         SdqApBk1OCkR/vDSvhT88GaC5sF5MluZNLtFg2MEYSOQSRq7kmXfb8X3o48oyDcKun8/
         2YF51y5p4xGfc16zcyoEu2TZoVcvIUYAPWhFJQgMZOKN/qPlZ2fVk2L6MpByEDwSORUX
         LzQubscgyIVpzMcoQfbYes6js3j3CZgBIn2x7W5Y1IK+Nc+6LwI3gV0b0AwRKTEJcwbm
         2zhmiMjp+hwiYbALq/UPlYaYqSDR4S2SdJc20bEd9nbKPGbNGaV9lBhSA4SfJPBNa7uS
         5xCQ==
X-Gm-Message-State: ABuFfogBkiDmjr5RczKAhPM8eV1YsOGyy9O/1EkeSJ16Ka2PyXUEOq2R
        L+oSCjFk5oKX2zeQ2YfjK1OAGA==
X-Google-Smtp-Source: ACcGV60lZ0y5vkt0p1Pzl8z+uGPW4Sd3O8rQySRUYFSGxVZ7Mp1TS+0Z9TBRZ3Y2AG9ErbIpgrATow==
X-Received: by 2002:a63:bd01:: with SMTP id a1-v6mr963990pgf.12.1537835123026;
        Mon, 24 Sep 2018 17:25:23 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id p75-v6sm631227pfi.22.2018.09.24.17.25.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:25:20 -0700 (PDT)
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
Subject: [PATCH security-next v3 22/29] LSM: Introduce CONFIG_LSM_ORDER
Date:   Mon, 24 Sep 2018 17:18:25 -0700
Message-Id: <20180925001832.18322-23-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This provides a way to declare LSM initialization order via Kconfig.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/Kconfig    | 16 ++++++++++++++++
 security/security.c | 40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/security/Kconfig b/security/Kconfig
index 1a82a006cc62..7ec86dbdb6b8 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -286,5 +286,21 @@ config LSM_ENABLE
 	  changed with the "lsm.enable=" and "lsm.disable=" boot
 	  parameters.
 
+	  Note that any enabled exclusive LSM modules will be initialized
+	  based on LSM ordering, automatically disabling any following
+	  exclusive LSMs. See CONFIG_LSM_ORDER for more details on
+	  changing LSM initialization order.
+
+config LSM_ORDER
+	string "Default initialization order of builtin LSMs"
+	default "integrity"
+	help
+	  A comma-separated list of LSMs, in initialization order.
+	  Any LSMs left off this list will be link-order initialized
+	  after any listed LSMs. Any LSMs listed here but not built in
+	  the kernel will be ignored.
+
+	  If unsure, leave this as the default.
+
 endmenu
 
diff --git a/security/security.c b/security/security.c
index ef1ced0a3a50..e38df0314f5e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -47,6 +47,7 @@ static __initdata const char *chosen_lsm_disable;
 static __initdata const char *chosen_major_lsm;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
+static __initconst const char * const builtin_lsm_order = CONFIG_LSM_ORDER;
 
 /* Ordered list of LSMs to initialize. */
 static __initdata struct lsm_info **ordered_lsms;
@@ -130,14 +131,47 @@ static void __init append_ordered_lsm(struct lsm_info *lsm, const char *from)
 		   is_enabled(lsm) ? "en" : "dis");
 }
 
-/* Populate ordered LSMs list from hard-coded list of LSMs. */
+/* Populate ordered LSMs list from given string. */
+static void __init parse_lsm_order(const char *order, const char *origin)
+{
+	struct lsm_info *lsm;
+	char *sep, *name, *next;
+
+	if (!order)
+		return;
+
+	sep = kstrdup(order, GFP_KERNEL);
+	next = sep;
+	/* Walk the list, looking for matching LSMs. */
+	while ((name = strsep(&next, ",")) != NULL) {
+		bool found = false;
+
+		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
+			    strcmp(lsm->name, name) == 0) {
+				append_ordered_lsm(lsm, origin);
+				found = true;
+			}
+		}
+
+		if (!found)
+			init_debug("%s ignored: %s\n", origin, name);
+	}
+	kfree(sep);
+}
+
+/* Populate ordered LSMs list from builtin list of LSMs. */
 static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* Parse order from builtin list. */
+	parse_lsm_order(builtin_lsm_order, "builtin");
+
+	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if (strcmp(lsm->name, "integrity") == 0)
-			append_ordered_lsm(lsm, "builtin");
+		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+			append_ordered_lsm(lsm, "link-time");
 	}
 }
 
-- 
2.17.1

