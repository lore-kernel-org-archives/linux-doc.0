Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F070C7DE7E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbeIYGXm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43928 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728799AbeIYGXl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id q19-v6so9248423pgn.10
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gU8yPNVAJgM0Xsl0Xg5cYn4RlLsSLFMLd0v2DDJ1qcc=;
        b=DsyIjfnmbUEIcckKSghwPU6vbUtA3jFBt7UXg0nenJyyTmedsS/1ngyUfKFE3uSifv
         6L3u3gAq24e8/rqldOC3FwmzYXXN8NvXuASwSOrovYWebTiwfT7r4sRg8UivsYBScKb9
         eVlnvx/ruLqfPFRcXrZHXO6xD4nqtaLFlFC7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gU8yPNVAJgM0Xsl0Xg5cYn4RlLsSLFMLd0v2DDJ1qcc=;
        b=s8pi/DMRTXjsZEk5Pq5TOdQ0HTMOxnmwmBZpdC1trJs/TP1XKGfm3Cm2Duh2QdvWBz
         D2+6vvfRYKUAhYZAGoEE1EvaXsv1SAy5qK4Dye0nSgBt0tuB4IJb+5TlixWbULz6i21u
         NOxc7R8mHFMB3kh1SjwXe2dH4VlKKIIaAPnx1H2I0mMgzle0xrYO6waZNiEhyQ9xfTTT
         IaxYIwk+RmdaFD7PnDvqH9Zmf+mqzDzDKpDdzmmTAytnl19iJYLxSIdsgd6brDzSLX2t
         8bfHy2SYn7ptxugvx3hFKOrWM7Iz18OETRcAsXAGRI0PmTp4Q2UvcqlrF6SPL0KBcTdD
         MwYw==
X-Gm-Message-State: ABuFfogMFPBLIWc82WNpNLg6KSS1u6yFeXWv5l49NPpSF6bJL373DuHI
        45aGLSuD2AwUJfotkokwuOb9Dg==
X-Google-Smtp-Source: ACcGV61G2pnFUw/Q4F1NXTTg0KFo8jl0iUqoLOz6In9fV1XKgsmQsPAANPdQEU1hs8nNzJ7dovGUTg==
X-Received: by 2002:a63:4281:: with SMTP id p123-v6mr907162pga.91.1537834735149;
        Mon, 24 Sep 2018 17:18:55 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id v2-v6sm516945pgf.58.2018.09.24.17.18.47
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
Subject: [PATCH security-next v3 23/29] LSM: Introduce "lsm.order=" for boottime ordering
Date:   Mon, 24 Sep 2018 17:18:26 -0700
Message-Id: <20180925001832.18322-24-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a way to reorder LSM initialization using the new "lsm.order="
comma-separated list of LSMs. Any LSMs not listed will be added in builtin
order.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 security/security.c                             | 14 +++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 67c90985d2b8..c7c1a0d253ee 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2288,6 +2288,12 @@
 			CONFIG_LSM_ENABLE, and any per-LSM CONFIGs and
 			boot parameters.
 
+	lsm.order=lsm1,...,lsmN
+			[SECURITY] Choose order of enabled LSM
+			initialization. Any builtin LSMs not listed here
+			will be implicitly appended to the list in builtin
+			order.
+
 	machvec=	[IA-64] Force the use of a particular machine-vector
 			(machvec) in a generic kernel.
 			Example: machvec=hpzx1_swiotlb
diff --git a/security/security.c b/security/security.c
index e38df0314f5e..f1c3581d870f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -44,6 +44,7 @@ char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_lsm_enable;
 static __initdata const char *chosen_lsm_disable;
+static __initdata const char *chosen_lsm_order;
 static __initdata const char *chosen_major_lsm;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
@@ -160,11 +161,14 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 	kfree(sep);
 }
 
-/* Populate ordered LSMs list from builtin list of LSMs. */
+/* Populate ordered LSMs list from commandline and builtin list of LSMs. */
 static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* Parse order from commandline, if present. */
+	parse_lsm_order(chosen_lsm_order, "cmdline");
+
 	/* Parse order from builtin list. */
 	parse_lsm_order(builtin_lsm_order, "builtin");
 
@@ -324,6 +328,14 @@ static int __init choose_major_lsm(char *str)
 }
 __setup("security=", choose_major_lsm);
 
+/* Explicitly choose LSM initialization order. */
+static int __init choose_lsm_order(char *str)
+{
+	chosen_lsm_order = str;
+	return 1;
+}
+__setup("lsm.order=", choose_lsm_order);
+
 /* Enable LSM order debugging. */
 static int __init enable_debug(char *str)
 {
-- 
2.17.1

