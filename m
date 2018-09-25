Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A8607D57F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 25 Sep 2018 00:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbeIYGXf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 25 Sep 2018 02:23:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36523 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728675AbeIYGXe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Sep 2018 02:23:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id b7-v6so2503158pfo.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 17:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BZjzkTJ7R/6jxPCxq75uSj94glR2mULSvjebOSVz4jc=;
        b=BNNbG8uPI9yLlnm9bM2zwXaCF/XBmEWbJjn9xZEAbieTjylutvTpiIRrB09MnUUyPB
         CHDp1Xjdcd8xVUMX0nGtNfDuCF2qNnyHOiMsfxG5c4sosLkTI51FzQMHbCY/pFTyDjnB
         +bek+O4WCxBfiN1CLFKM5JlOlTajjUiCxIY/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BZjzkTJ7R/6jxPCxq75uSj94glR2mULSvjebOSVz4jc=;
        b=fhBNyAmOM9XZMQGYbt2reymeM0RFGMe0p7tGya+gv9/8Y6RGDx8pDBAAiBunj5G9xK
         Us0r/tAykTAnbGL1grYheIzS7QhH95CFC7kzT73BZisNC7qqP/fhH9nk0EXZTzEK0sgt
         IKjbDTTHkkmEZMCyzt6tU6EC+MbvnYC2xSqIGtnAUU2453dOcDe34KaRDXJ24C4ikSyu
         KMxHbDn9mDq0HUfGuAlD9Fy8uWRaMKAY8SO5AAp/pINIe8V7hNk8a9xkm4JYeQVLd8BT
         CEimLVFl3/Y7Od9gjq4EjwGayShVzKiOQN1E3549Row9lu4uHZIO3LsbklDsxAqySkl0
         AIgQ==
X-Gm-Message-State: ABuFfojryj/cD6fKuh7fqhVK2JVssVWvenD+ynZMoouB/UP4sc0NlOn+
        h0oSbatPNgBFJiZOD4vTdjqbzg==
X-Google-Smtp-Source: ACcGV61weHh6Rkf3lXBEDGSwP3d0UGjz94RyIHcmJKttOEiM08pEeVvVuUzhZO2jIDRZz+1wFEgwjQ==
X-Received: by 2002:a63:f941:: with SMTP id q1-v6mr870290pgk.213.1537834728294;
        Mon, 24 Sep 2018 17:18:48 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id z25-v6sm605485pfl.58.2018.09.24.17.18.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Sep 2018 17:18:42 -0700 (PDT)
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
Subject: [PATCH security-next v3 10/29] LSM: Don't ignore initialization failures
Date:   Mon, 24 Sep 2018 17:18:13 -0700
Message-Id: <20180925001832.18322-11-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180925001832.18322-1-keescook@chromium.org>
References: <20180925001832.18322-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

LSM initialization failures have traditionally been ignored. We should
at least WARN when something goes wrong.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 security/security.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/security.c b/security/security.c
index ee49b921d750..1f055936a746 100644
--- a/security/security.c
+++ b/security/security.c
@@ -55,10 +55,12 @@ static bool debug __initdata;
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

