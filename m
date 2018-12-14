Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C5427D8BA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 17:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbeLNRfm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 12:35:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39469 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbeLNRfh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 12:35:37 -0500
Received: by mail-wr1-f65.google.com with SMTP id t27so6215314wra.6
        for <linux-doc@vger.kernel.org>; Fri, 14 Dec 2018 09:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CN1SdvFOtxRNOhBTScq9GG/zR6hniZxeAvKJmAvclro=;
        b=fhE3rzcYuPBtkZvqLZ5s/SCO8lwsFJLcGWzuig16XHjHsjt1wouVsgwQYtDTpxPjhb
         NCbls59FImQtbsJTQ4WjQVVILujOoiPgM+7RZY6UKm8BWlgSjXr1nyhIk9drJg4xJ7g3
         h6s3tRjiIb5DByFNfInpDO76o+3hJMoT41598=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CN1SdvFOtxRNOhBTScq9GG/zR6hniZxeAvKJmAvclro=;
        b=mO2nHjlKWPO3fkBZsB71GnOHTBMu8esdzwge1dIY/30C7kTcULOdQO+RmcrVcc8bhT
         ruZJLxiBGCziudA6+SO9HfbW2gtJ3V/+6phO6EcOvka3pjgCxkLl0kFss8+zh4VVTvq/
         9YmdXu4R3FAPYk4YeybVH9a2IW/z0jkWboUYl0l71IpOTsH5i1qz/CF4GSvwW8RWVtPd
         vSofagz8Q6sEuDSpchpV3khkacN4Ih2+vMok2IUJ4G+nsHDH6e9TJuPhmZtHWiuXSKpT
         RLGXH36iS0yp63HRUqAmZPRddzbL3aCQUjRxM9BqJrbH4dsmlH3uVsiKhc4mXa6MCiIV
         lMsg==
X-Gm-Message-State: AA+aEWZQIIe/59z6Za8aFzNVJxJWOpQr56xHWz5PHrAvUu/hCVTy3UnS
        YIexLsDw2M3SBIL85+KANRHV4A==
X-Google-Smtp-Source: AFSGD/XJE9iY3WRzuqSCEAcUpjQCS7zl6Htdighv0PFPINuVJ0VbidcXIg/zdQIXAza2F65MAdokyQ==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr3372055wrq.15.1544808935617;
        Fri, 14 Dec 2018 09:35:35 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id 199sm6259772wmh.21.2018.12.14.09.35.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 14 Dec 2018 09:35:35 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, joe@perches.com,
        gregkh@linuxfoundation.org, himanshujha199640@gmail.com
Cc:     apw@canonical.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, niklas.cassel@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] checkpatch: add Co-developed-by to signature tags
Date:   Fri, 14 Dec 2018 18:35:28 +0100
Message-Id: <1544808928-20002-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544808928-20002-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <1544808928-20002-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As per Documentation/process/submitting-patches, Co-developed-by is a
valid signature.

This commit removes the warning.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 93e84c9..b737ca9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -468,6 +468,7 @@ our $logFunctions = qr{(?x:
 
 our $signature_tags = qr{(?xi:
 	Signed-off-by:|
+	Co-developed-by:|
 	Acked-by:|
 	Tested-by:|
 	Reviewed-by:|
-- 
2.7.4

