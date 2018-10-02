Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D422A7D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 00:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbeJBHf5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:35:57 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:47087 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbeJBHfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:35:54 -0400
Received: by mail-io1-f68.google.com with SMTP id t7-v6so227321ioj.13
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 17:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K1XTJXjK49GiJvBFHIQ6HySNgoRQIO0gyRIiFVtrpKY=;
        b=YIt6FxHVK8PbWusfi7ridvtj3ywiiRjZ9k4mElJPd0mcdUi9swGjTyW6CaMK77W0Rr
         alkknzxtqujWc7chNfVSuyXGutmVEelQHRKcv0hSf0rQv5vAE785qqtUWOPdfYT3M9F9
         KjPNoYoDVcMVOykeOslk0McbZvnE+Q/2dlt/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K1XTJXjK49GiJvBFHIQ6HySNgoRQIO0gyRIiFVtrpKY=;
        b=UZilkNDRmTvqICV1VRKZdRN27cGwgGROxqMiDPg+lvURX+flFvbuzigmSA/vjGeSFp
         2z8wF5Cy11B9+EM3RsyErrq4oONleGHF8z/w9BwLhx/6C/Kt40pi2c/tpL/ASYfPY37Z
         RJYDv6WhhZULjlf8PznpNYEmpHbceEpmvPydsyb0w2MgU7qrFTC31VHHj0vGWaLv/UT/
         3to0Y0vq0T+8Ata3ktU/Fso3CpjjjYeCKIgTNW9Rj0w1OZBADbYYlFJ9rTpVKyYKyIj6
         Y7s5UDJvTeIfOehzqYb913rOgcy5VKpLvJb/3r09E5JsNhisYKdUhhHz81HxcveAjoRJ
         0AIQ==
X-Gm-Message-State: ABuFfohgb87OA65xAduI77WxB4/K9Dd5KMgFcF21O179JUFHwQRv44yD
        e+g7wUliMJmaotpE8B/Vgc3Srw==
X-Google-Smtp-Source: ACcGV609gSM2JpNc/Rt2M9UcwHkXUuitgqeqgvSyYHhJ+dWt6GRu/42fmQXhZa8KRJRC7Yv8QbNXHg==
X-Received: by 2002:a17:902:29e3:: with SMTP id h90-v6mr14180190plb.215.1538441725371;
        Mon, 01 Oct 2018 17:55:25 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id d132-v6sm21379072pgc.93.2018.10.01.17.55.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Oct 2018 17:55:20 -0700 (PDT)
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
Subject: [PATCH security-next v4 26/32] LSM: Introduce "lsm.order=" for boottime ordering
Date:   Mon,  1 Oct 2018 17:54:59 -0700
Message-Id: <20181002005505.6112-27-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a way to reorder LSM initialization using the new "lsm.order="
comma-separated list of LSMs. Any LSMs not listed will be added in builtin
order.

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 security/security.c                             | 14 +++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0d10ab3d020e..7e01b7a1e73d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2286,6 +2286,12 @@
 			at boot time. This overrides any omissions from
 			CONFIG_LSM_ENABLE.
 
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
index 0510bb8e0af0..6fafad44b85e 100644
--- a/security/security.c
+++ b/security/security.c
@@ -44,6 +44,7 @@ char *lsm_names;
 /* Boot-time LSM user choice */
 static __initdata const char *chosen_lsm_enable;
 static __initdata const char *chosen_lsm_disable;
+static __initdata const char *chosen_lsm_order;
 static __initdata const char *chosen_major_lsm;
 
 static __initconst const char * const builtin_lsm_enable = CONFIG_LSM_ENABLE;
@@ -152,11 +153,14 @@ static void __init parse_lsm_order(const char *order, const char *origin)
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
 
@@ -316,6 +320,14 @@ static int __init choose_major_lsm(char *str)
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

