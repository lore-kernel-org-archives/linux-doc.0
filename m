Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A72887E3AC
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 16:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387920AbeITWIK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:08:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41050 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387690AbeITWII (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 18:08:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id b12-v6so4584246plr.8
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BZjzkTJ7R/6jxPCxq75uSj94glR2mULSvjebOSVz4jc=;
        b=MxXn5o1wdwyUuv3gmjvXz9NVRRSlP+x+Rz1IVveFVDlxx49jM8QkeGYTj+2lEj19Ck
         HyUGyqGRAHYTsoLpAVKXVO3oJSRTrQ9g04aCFM8tAsox+vUhAOv4lOGgT8jRe5nnyqaU
         q7TJK3kweWHBAT0eHuHhh9/o7VuN3z88+piyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BZjzkTJ7R/6jxPCxq75uSj94glR2mULSvjebOSVz4jc=;
        b=UDXtetGwrGp7+dT8Q+qqE12IZV6eK+E9vKmlhH6JlqTjpDJMXvjSljWQVg2lxBuZQJ
         9mXixQ8lN5+0MVTDN8M+RVLUTAZWxEa4D6dN7Tj2NRBuvXUQVNMJZ0Djfs6ZU9hgX2Il
         FtLMmDxNqMtzYihSRIIllB6LhfBIC1hdAPfC3gf7ZUGDJ/GxhZx4i+ZJ9gA5cO4wg93O
         taAk+HB6rVGzcU8+T0V6iL0RtJrhwWDs5Rs/6Q4BkRNO3BUVYAD5ThH2jsbArdLTeFjX
         UiHT6AXHqF4siNecUOv2sIz7HfNeHHs1zros3Oh77/1iPLmh0Y/diD+i13FVEf2Ed2RD
         baBA==
X-Gm-Message-State: APzg51D738+LOV1BmukAfWzz5b+PsekrrEj1l6xB4vwApTn0bYGxhpk4
        kBQztHZ5Rupd90AM5HDQ4mMjYw==
X-Google-Smtp-Source: ANB0VdZa8WAKhEBDZi6pTa87ak2DeTsRv+3CPD5AU53nh1/hTxqKn+W2wCm+b3ddirMYd5z3LH/PfQ==
X-Received: by 2002:a17:902:6b:: with SMTP id 98-v6mr4400899pla.258.1537460633220;
        Thu, 20 Sep 2018 09:23:53 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id c1-v6sm31903041pfi.142.2018.09.20.09.23.47
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
Subject: [PATCH security-next v2 10/26] LSM: Don't ignore initialization failures
Date:   Thu, 20 Sep 2018 09:23:22 -0700
Message-Id: <20180920162338.21060-11-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180920162338.21060-1-keescook@chromium.org>
References: <20180920162338.21060-1-keescook@chromium.org>
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

