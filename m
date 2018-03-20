Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 387657D0DA
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 19:57:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751320AbeCTT5C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 15:57:02 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:38121 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeCTT5B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 15:57:01 -0400
Received: by mail-it0-f65.google.com with SMTP id 19-v6so3938969itw.3;
        Tue, 20 Mar 2018 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MbvCS2K1U5hNLKeKPqa8/PY3MJAqo5oT8gosQ7oE24E=;
        b=Sw9ms1a/4x935V+4C9xgbfwm7hgpLwcbOlxGBwFk8+uupTXhnXbljG19+XJ/RekQD9
         rk0NPIdCzhypECupnSruHAQlAcbaFJNDRGAk/f5uZdPFRlArxncREJuCPNv2mHcdf0kR
         VfVRNcAUkh79Z/xt4XMbkYHqlkfJc5fNQbvUp+rk4snHQ0r9CBUBXqEWj2fwZJb3Q2qb
         28rvFsoG1DGbJyuWAupeWTXNJyqNGqTM4Wj2IaYIUwIH8oRyFRfYEABShbkoHakQwRdT
         sbsjH9zwHyWBwgm48rcyOGKiKX6sw5ZDfad59gPS/PxN+ryOi7D1z07LqlMMyTJazcWR
         Bz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MbvCS2K1U5hNLKeKPqa8/PY3MJAqo5oT8gosQ7oE24E=;
        b=EEermaHH1FR2M8V4fdJ/euO6p4AEEmUJX2hLPYoY1XkBF5Ies64V0w0CKV2p5eQADq
         KkI2IXYZDx2ZShlJD63cDGU3QsG4DEuFsM4Zso+U5Tbz7UVMdshDghXYJqpF489M/RX4
         lmFqArxpqhy3kmMQ5qcfrmd493/CdFaFDQ58zP5VmuJfI0l+M9o4lHqTNCrspZM2FC0g
         EvfHfBY/cA1K+xiWv+eWMi92cwrj0FFDKAutwDd+cyS139g0QNAhUa88xy5X9cAGRNik
         DMSwirOXvAFBRYAw7hq+XZFmSUzWrJmjIgWw+sl1V/q3QysIpde+x7uwzrlBgUF15G8M
         pSJg==
X-Gm-Message-State: AElRT7FsCuxQ4SW6z1eZiMvgry6GW/sbbFYR5dHwMdDsk0GmI2RTM2TV
        1yRt/4tCeqJpmxnPcZaAffk=
X-Google-Smtp-Source: AG47ELuOHOsNntEYmGN1Yy2U6typzJzMcaJE+JbOd5PKpwlPXovdm8V5u0NU+1jqP7flD+qe11zLkw==
X-Received: by 2002:a24:7bce:: with SMTP id q197-v6mr1073029itc.145.1521575820878;
        Tue, 20 Mar 2018 12:57:00 -0700 (PDT)
Received: from localhost ([104.39.53.110])
        by smtp.gmail.com with ESMTPSA id n41sm1612949ioi.62.2018.03.20.12.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Mar 2018 12:57:00 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     corbet@lwn.net, yamada.masahiro@socionext.com, slyfox@gentoo.org,
        tony.luck@intel.com, bjorn.forsman@gmail.com,
        mudongliangabcd@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fix one dead link in ia64/xen.txt
Date:   Tue, 20 Mar 2018 15:56:58 -0400
Message-Id: <20180320195658.17498-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.16.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 Documentation/ia64/xen.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
index a12c74ce2773..464d4c29b8b5 100644
--- a/Documentation/ia64/xen.txt
+++ b/Documentation/ia64/xen.txt
@@ -26,8 +26,8 @@ Getting and Building Xen and Dom0
     DomainU OS  : RHEL5
 
  1. Download source
-    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable.hg
-    # cd xen-unstable.hg
+    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable
+    # cd xen-unstable
     # hg clone http://xenbits.xensource.com/ext/ia64/linux-2.6.18-xen.hg
 
  2. # make world
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
