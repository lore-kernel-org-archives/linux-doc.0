Return-Path: <SRS0=3K0Z=BU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25555C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 10 Aug 2020 03:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E64F1206A5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Aug 2020 03:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZZA48cM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHJDgC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Aug 2020 23:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgHJDgC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Aug 2020 23:36:02 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34ABC061756
        for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2020 20:36:01 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a79so4429205pfa.8
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2020 20:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JFAWZL3XKX6Rdo4RbRzrFxaKT9BePCdBiZQrkEkEJNk=;
        b=hZZA48cMt/V39oIeRhUZvKftiP1Y3WtJ1M8Mti87hTjJtv8KE0ug9COHh/NLqA7zJH
         Fb1Uk/7lPM+p20gG2EFRi0nljC8aCLw4p7IWAButFyFB1+fCO/rBDfab4Htb9lQhtxA5
         6NvoKqFvPb6rIIhtjIg/vX7RwmgHz7AwVE63AIov0RDCynq9kKArBKX1TfzpQoKhTwRB
         amGbugjkzHEQy1JbBVAEvm9bDntOSp4DAESPBUlGPcL3cIJKo1P7Jnt1hqLPQIiT9tPE
         Mi3X8nsqEP/G0uQzoxUogVUSsLhFilijQukOPXyEIKD7ESyzZShmSoQeAPMj3GXjpK/P
         g05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JFAWZL3XKX6Rdo4RbRzrFxaKT9BePCdBiZQrkEkEJNk=;
        b=jPamRFN6faSxpyRC7WJNDam/8hUQ0UF1mPnrxm/XccifS+e3dbr77XqoRLRblW7rk7
         JgUhW7kzKXcHZXEravw58tOjCRV6aakzQZwe9IShNRi2goxxYCQquiKZMlAJKH9Lmozb
         qfhXUguxRZDneYKGAJlkZ94OLGOwRNawXKQUxCOHqaePrcds1r/E0ZhpOQp+xTszE8dt
         hyJggx5HDmEIjLSnS53hXQdigrjQoq2a6bXsCcfK5mDhVNNfaWwKLPvz1W9y7YsBORyY
         6gGoLZQtYA6g9CGVWlLyTF2t/ODU1Tkl2VSaBJqE1LWjtHs1CpX6ZnBR/Yi+fTs3HQkN
         PUrA==
X-Gm-Message-State: AOAM531e08/q1SnoCzigD/wIIjdj4mWoPoTFLxLdbVsQZXDhywyRyZaX
        0Iv2UzjF6S1A1/S5/nRh454=
X-Google-Smtp-Source: ABdhPJw0cvnU+p29bHW4t3kYfsJFAKfg5Jwve+8dj/jgXDaeWWIoWs86vkwnoX7x8comgAKVcdf/WA==
X-Received: by 2002:a63:ce15:: with SMTP id y21mr20841600pgf.163.1597030561176;
        Sun, 09 Aug 2020 20:36:01 -0700 (PDT)
Received: from localhost.localdomain ([49.207.62.124])
        by smtp.gmail.com with ESMTPSA id n1sm14390378pfu.2.2020.08.09.20.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:36:00 -0700 (PDT)
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     Julia.Lawall@lip6.fr
Cc:     gregkh@linuxfoundation.org, Gilles.Muller@lip6.fr,
        nicolas.palix@imag.fr, michal.lkml@markovi.net, corbet@lwn.net,
        cocci@systeme.lip6.fr, linux-doc@vger.kernel.org,
        Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH v2] documentation: coccinelle: Improve command example for make C={1,2}
Date:   Mon, 10 Aug 2020 09:05:54 +0530
Message-Id: <20200810033554.11212-1-sylphrenadin@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Modify coccinelle documentation to further clarify
the usage of the makefile C variable flag by coccicheck.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

---
Changes in v2:
        - Change the message tone to imperative as suggested by Markus
Elfring
	- Add examples for using a specific file and explain in detail
the usage of the C variable, as suggested by Julia Lawall
---
 Documentation/dev-tools/coccinelle.rst | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6c791af1c859..bbcb4f7e8b5c 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -175,13 +175,20 @@ For example, to check drivers/net/wireless/ one may write::
     make coccicheck M=drivers/net/wireless/
 
 To apply Coccinelle on a file basis, instead of a directory basis, the
-following command may be used::
+C flag is used. The C flag is a variable used by the makefile
+to select which files to work with. This flag can be used to
+run scripts for the entire kernel, a specific directory,
+or for a single file. For example, to check drivers/bluetooth/bfusb.c,
 
-    make C=1 CHECK="scripts/coccicheck"
+The value 1 is passed to the C flag to check for files that make considers
+need to be recompiled.::
 
-To check only newly edited code, use the value 2 for the C flag, i.e.::
+    make C=1 CHECK="scripts/coccicheck" "drivers/bluetooth/bfusb.o"
 
-    make C=2 CHECK="scripts/coccicheck"
+The value 2 is passed to the C flag to check for files regardless of
+whether they need to be recompiled or not.::
+
+    make C=2 CHECK="scripts/coccicheck" "drivers/bluetooth/bfusb.o"
 
 In these modes, which work on a file basis, there is no information
 about semantic patches displayed, and no commit message proposed.
-- 
2.17.1

