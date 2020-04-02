Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588E8C2D0F3
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:38:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D0C92077D
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XymilC0+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389967AbgDBRis (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 13:38:48 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:40094 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389887AbgDBRir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 13:38:47 -0400
Received: by mail-pg1-f202.google.com with SMTP id x136so3609714pgx.7
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NI0Kiq/sBep8uH+bGoMdp+/XVSJu96oWCrFI/ppsJuU=;
        b=XymilC0+8zjoS6aqUQvbDKpbxG1xuxlcy5XK1oX8f86l5HbkEmItujb3V3DieUwDsS
         6F6hPVDf7oSlFi+YtCIgpd6I96IGdaQM1ZCYhokBEAKJOYwltiqJa0ffhCx04UqnxMFO
         Uw70OqmKkpPbMqlQxgpysWe9N7BAz71tYLeHhZxlhBvmrl+Gq/J277bG3lILRQkz1cBh
         dngvfNsA3HPxtUIXDCGGnW+r6bTsyXhYiXpQDboV+OlckctH17+fRoWTEjpNVQeK9iqN
         xt7hMa2CY+DCQvDbGhGimiLE6tED+OzmOzwfM68A8JGwdcxM449sZQuv1g42RXXO5bU+
         vGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NI0Kiq/sBep8uH+bGoMdp+/XVSJu96oWCrFI/ppsJuU=;
        b=SgGJmeAsz0XPR3UhUfx0GMXecFXO8yHHE6+NWrYIWvONVo4ZsqcQxkiGO9ci4PUO90
         gGpyvSt7L9dEJde2AmLRVCIRXbR3inyVnU/Pum/1zIVGMWaLUiNJ2L8m7++sCPCCaVYQ
         4xYX3S+6sdFAVvt55wd/41ypfJU/8ca2alLD1I2G832qJoCkZAyXtQmv7oJGY8cG+/UE
         toYO6J2dkQv7WqGIVRld/ISHKaQlAUFHLBBYTZcu3L94+KUm+Zr0TXHOtBWR9998JvTk
         roE7/lOz5u9dIxu+3HtAusc5IDBMaLCrGYwiIpCQHMmuLfPzdEI0XzS/gSX5cgJMyRFh
         aDmg==
X-Gm-Message-State: AGi0PuaIe7rrAiOQWNIKFlc9Wok3DC+yhFtKBEUDmfPMByWlk9Pwg+f/
        icZBgzgH2W1R215mQY9EZ+qhDQ9EN6f/
X-Google-Smtp-Source: APiQypJ1XJpXWlwo1vDKom37brStxOJ9dfhZWzCVQIEnxK21Q6WUr6jX8FGkVEAoDrUEJjPjFmJEdIktzwfj
X-Received: by 2002:a17:90a:8085:: with SMTP id c5mr4557030pjn.186.1585849126457;
 Thu, 02 Apr 2020 10:38:46 -0700 (PDT)
Date:   Thu,  2 Apr 2020 10:38:42 -0700
Message-Id: <20200402173842.96013-1-maskray@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH] Documentation/llvm: fix the name of llvm-size
From:   Fangrui Song <maskray@google.com>
To:     corbet@lwn.net, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The tool is called llvm-size, not llvm-objsize.

Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
Signed-off-by: Fangrui Song <maskray@google.com>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index d6c79eb4e23e..eefbdfa3e4d9 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
 additional parameters to `make`.
 
 	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
-	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
-- 
2.26.0.rc2.310.g2932bb562d-goog

