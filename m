Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42DFA7D08D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 01:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbeJBHpG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 03:45:06 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:39462 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbeJBHpF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 03:45:05 -0400
Received: by mail-it1-f193.google.com with SMTP id w200-v6so1095656itc.4
        for <linux-doc@vger.kernel.org>; Mon, 01 Oct 2018 18:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N6emET198pDiEm6Vd06hKtPFfJd7JvMik8xEi2V7KFs=;
        b=SV3VHMjmobqNp5GRVov5pkKZyWI6AY64iPse0eS4cnfn/VMAqhdoH/LkwTwoblVtVJ
         MtvqXBS1EGe2yoIEZ1k8Ga425P7CpJVh7zMiRi/2YgFEed91VEBUEl8E4lu0uxduZc6k
         6Fo6pQyQa58xOWZJsPV+IX9wjRlnnuTSDL71E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N6emET198pDiEm6Vd06hKtPFfJd7JvMik8xEi2V7KFs=;
        b=X0Qjye4AVE+CAr2OTCzEZCkgNmvFEU7tCT8Cr/fv+MbHKYe0br3dfPcw/0rvMHt4SP
         WeQp+S5N0hbqXbCrzG52CYSGKhq4vQaEFjM8MwHqqPJbcibZa5PuR8xUM/bB+ZC+stWO
         I8WpwIjevaHwwavgCsrsmTLuH3ITv1xBFmdlTSDM7hiNuxoaT8CXif01plcbgMn3j9vF
         7pTXkGv5XdTHEp9Z6/xTRzFkv/QRptvObvwwtLXs81PvKoULpeU/nVn9Wmy5w82bSsow
         kAezuQQ+4J/o+3JxM6uPVqZleC2Kd8VIW0S8fufXGanKkblaTxnOrJD7Elby4QIqGQU1
         9Csg==
X-Gm-Message-State: ABuFfognwWriDp/zXIx3KHDCSZyT+P/1PagNcHEOCbUXUywhl7ezO6XV
        BIrFr8R2CeVvRNb5IoVgM6GVAQ==
X-Google-Smtp-Source: ACcGV61tBdvqbTJs1/3KRT+jxW1fP3TEMHRIzvS7NuxvEGl9MOvzhramlGCUoZEt8l2l94zl44HwKQ==
X-Received: by 2002:a63:c608:: with SMTP id w8-v6mr12440039pgg.16.1538442273937;
        Mon, 01 Oct 2018 18:04:33 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id w2-v6sm17058281pfk.140.2018.10.01.18.04.27
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
Subject: [PATCH security-next v4 29/32] LSM: Introduce enum lsm_order
Date:   Mon,  1 Oct 2018 17:55:02 -0700
Message-Id: <20181002005505.6112-30-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181002005505.6112-1-keescook@chromium.org>
References: <20181002005505.6112-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation for distinguishing the "capability" LSM from other LSMs,
it must be ordered first. This introduces LSM_ORDER_MUTABLE for the
general LSMs, LSM_ORDER_FIRST for capabilities, and LSM_ORDER_LAST for
anything that must run last (e.g. Landlock may use this in the future).

Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
---
 include/linux/lsm_hooks.h |  7 +++++++
 security/security.c       | 18 ++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 63a6caaee8e6..62bc230826e0 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -2041,8 +2041,15 @@ extern void security_add_hooks(struct security_hook_list *hooks, int count,
 
 #define LSM_FLAG_LEGACY_MAJOR	BIT(0)
 
+enum lsm_order {
+	LSM_ORDER_FIRST = -1,	/* This is only for capabilities. */
+	LSM_ORDER_MUTABLE = 0,
+	LSM_ORDER_LAST,
+};
+
 struct lsm_info {
 	const char *name;	/* Required. */
+	enum lsm_order order;	/* Optional: default is LSM_ORDER_MUTABLE */
 	unsigned long flags;	/* Optional: flags describing LSM */
 	int *enabled;		/* Optional: set based on CONFIG_LSM_ENABLE */
 	int (*init)(void);	/* Required. */
diff --git a/security/security.c b/security/security.c
index 44c23d23158e..dac379518e60 100644
--- a/security/security.c
+++ b/security/security.c
@@ -140,7 +140,8 @@ static void __init parse_lsm_order(const char *order, const char *origin)
 		bool found = false;
 
 		for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-			if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
+			if (lsm->order == LSM_ORDER_MUTABLE &&
+			    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0 &&
 			    strcmp(lsm->name, name) == 0) {
 				append_ordered_lsm(lsm, origin);
 				found = true;
@@ -158,6 +159,12 @@ static void __init prepare_lsm_order(void)
 {
 	struct lsm_info *lsm;
 
+	/* LSM_ORDER_FIRST is always first. */
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (lsm->order == LSM_ORDER_FIRST)
+			append_ordered_lsm(lsm, "first");
+	}
+
 	/* Parse order from commandline, if present. */
 	parse_lsm_order(chosen_lsm_order, "cmdline");
 
@@ -166,9 +173,16 @@ static void __init prepare_lsm_order(void)
 
 	/* Add any missing LSMs, in link order. */
 	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
-		if ((lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
+		if (lsm->order == LSM_ORDER_MUTABLE &&
+		    (lsm->flags & LSM_FLAG_LEGACY_MAJOR) == 0)
 			append_ordered_lsm(lsm, "link-time");
 	}
+
+	/* LSM_ORDER_LAST is always last. */
+	for (lsm = __start_lsm_info; lsm < __end_lsm_info; lsm++) {
+		if (lsm->order == LSM_ORDER_LAST)
+			append_ordered_lsm(lsm, "last");
+	}
 }
 
 /* Is an LSM allowed to be initialized? */
-- 
2.17.1

