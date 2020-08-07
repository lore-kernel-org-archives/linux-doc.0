Return-Path: <SRS0=iD3b=BR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BCCC433DF
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 11:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88F3B2177B
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 11:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6A9/7dd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgHGLCq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Aug 2020 07:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgHGKzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 06:55:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86564C06179F
        for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2020 03:55:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 128so724548pgd.5
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2020 03:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mQD91896fqSImQlNI/D1wRvbkGKkNIM/QmIoYxf+jig=;
        b=E6A9/7ddfeasTHEroC50Tvr1p4SczIVGHSmEQP35KNoOMEWeViQ/KRuUNFmwVJjmmt
         lBYJWIovym8wP5YXZI9Gc7myabHnIwmWMzmdHQ/+6fUttIFuxqRmyJ+8Pn/OvjRoZOa/
         rIbc9ocpWC/TG3Te9WP4Gl/8M3egRw+A2/imnI+c7jBkh0C98bn3PvoRovk4yWuy5EsS
         qYBcog7ya1aTvmi1jyqk3e7+Z3AtD28UZf5+XLrgR/moQPCu+mmK0+D9/ZW6P1o4nD09
         iFuvxiD05YdkygG+mZSvIb4esjtQq/7Ur6MW1BhMW/CixkKj8cnv8G/uQv7JtFpTVfjp
         ndVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mQD91896fqSImQlNI/D1wRvbkGKkNIM/QmIoYxf+jig=;
        b=gs9Sf2I3uNl+kxLy68SfTtYCkRM/GXNLLMJMYOWtUyhrMrY+AStqQw+68ihAJQSz3I
         Fca8mHY+LukGnhtVwy7KM7YUVNJDC2Sk2OmOtHFTRlVqNX5PkJjo/7IKo6x2myDsNGEP
         inFEXaZY+9OBZbO3SzQHPhoG0wIAoWSyHLiR4XvIYdZJzM6+fypDeBqPrXUiZmD53uZu
         VnV7vrBC57Ee8Sw5KAhY80/a2hb+XCWzxE9od9sixsxn4XAxR+wlBTiHAucsnMf/3jdK
         xjrLADzaKsubZDBgyRvwQwxRSy+225yBi4OEx5XndMsBN3kBzwC3FYIZNbETL8P83PtX
         XE3w==
X-Gm-Message-State: AOAM530HFQusG2wHycA5tIOmwiKWQriwzScdhAgNDWMGrrId3H9LDW2B
        8jPuBKMaXnL/5ghsRwI1LAk=
X-Google-Smtp-Source: ABdhPJz0u2aQIMgnqf737ni1/xJSYiS47HjMakimVVtVcxfHQwGSLfzd2KgUIPPEfrfN0lt8zzOgSQ==
X-Received: by 2002:a63:f04d:: with SMTP id s13mr10884524pgj.100.1596797700866;
        Fri, 07 Aug 2020 03:55:00 -0700 (PDT)
Received: from localhost.localdomain ([106.51.107.165])
        by smtp.gmail.com with ESMTPSA id w2sm10221548pjt.19.2020.08.07.03.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:55:00 -0700 (PDT)
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
To:     Julia.Lawall@lip6.fr
Cc:     gregkh@linuxfoundation.org, Gilles.Muller@lip6.fr,
        nicolas.palix@imag.fr, michal.lkml@markovi.net, corbet@lwn.net,
        cocci@systeme.lip6.fr, linux-doc@vger.kernel.org,
        Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH] documentation: coccinelle: Improve command example
Date:   Fri,  7 Aug 2020 16:24:45 +0530
Message-Id: <20200807105445.16712-1-sylphrenadin@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch modifies the coccinelle documentation to add further
description for the usage of the C variable flags by coccicheck.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6c791af1c859..dfc5d390307b 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -177,9 +177,12 @@ For example, to check drivers/net/wireless/ one may write::
 To apply Coccinelle on a file basis, instead of a directory basis, the
 following command may be used::
 
+To check only recompiled files, use the value 1 for the C flag, i.e.::
+
     make C=1 CHECK="scripts/coccicheck"
 
-To check only newly edited code, use the value 2 for the C flag, i.e.::
+To check sourcefiles regardless of whether they are recompiled or not, 
+use the value 2 for the C flag, i.e.::
 
     make C=2 CHECK="scripts/coccicheck"
 
-- 
2.17.1

