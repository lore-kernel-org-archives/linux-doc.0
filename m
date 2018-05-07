Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 684807DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 15:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752282AbeEGPlJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 11:41:09 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:41234 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751931AbeEGPlI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 11:41:08 -0400
Received: by mail-wr0-f194.google.com with SMTP id g21-v6so29216175wrb.8
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=4le+Nyz580qV7Zu4Xs9xypkA41QcV//9rNnMfCXQXlY=;
        b=kSAmd6SAJ9ByFkVYJz1g5imwqPBzU6ciOrHl8B7RD+0flb3eG8rvLW1pIQxhSsrm7u
         QUjjMvNKff12+vXPKDcuALTeerdYw3FYsb/EsGGwg5PiTZ4FFixVLu7rPUOCm8zCGe1y
         1yJyomhOmbEuF5y439ZalBzRMP1KXSxI0E6+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4le+Nyz580qV7Zu4Xs9xypkA41QcV//9rNnMfCXQXlY=;
        b=Svj0jN1boORjHfIlz3TUSdSXQqQHN2w7nYDcADEYoKjjo1DxplspnyLatV+2VF/ott
         0+y3BtUMU6SxCzjAikhp1J1N1e6oPAA4y+GD06NWz0yeEl7FIEt7jwRSAmOpUSbbiTXC
         ywoxGkqMXvKBgSPkyzW8OBTp21WsFuHiuhGOhL8kpvR/z5iNtGT+2cFTGodNtChxpG2K
         mZkoauzKHSMTirXnHBn0xoKr53kKzrvM9pkAdnH98uay/rGk7a278GiKZzzcbXkhPv5/
         P6gJ5QdBB12pPBaRFrbKfAmiJldeLhuGgbSP/K7V1t+U8P0nssmma21qdVqeKaQY5aXd
         Y0UQ==
X-Gm-Message-State: ALQs6tAxjzk8v13nMETFovW9wIwVsdKQw72Hu5lGJJmLga2UC+iKc4iB
        otHjESQrw79ofY6z1aSqxWZKbET1
X-Google-Smtp-Source: AB8JxZqgPtFsL6lwS3GnX1xLM9bVTHV7X1ESBjv5NTIqBstm/qKeKU4faUFO2Jv6CXV47KcNiG7wgg==
X-Received: by 2002:adf:84c3:: with SMTP id 61-v6mr31057367wrg.37.1525707667536;
        Mon, 07 May 2018 08:41:07 -0700 (PDT)
Received: from localhost.localdomain ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id m134-v6sm11283836wmg.13.2018.05.07.08.41.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 08:41:06 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH] certificate handling: Update references to the documentation
Date:   Mon,  7 May 2018 17:40:55 +0200
Message-Id: <1525707655-3542-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 94e980cc45f2b2 ("Documentation/module-signing.txt: convert to
ReST markup") converted the .txt doc. to ReST markup, but it did not
update the references to the doc. (including in MAINTAINERS).

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
---
 MAINTAINERS   | 2 +-
 certs/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index df6e9bb2559af..803d4b4ff5f1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3347,7 +3347,7 @@ M:	David Howells <dhowells@redhat.com>
 M:	David Woodhouse <dwmw2@infradead.org>
 L:	keyrings@vger.kernel.org
 S:	Maintained
-F:	Documentation/module-signing.txt
+F:	Documentation/admin-guide/module-signing.rst
 F:	certs/
 F:	scripts/sign-file.c
 F:	scripts/extract-cert.c
diff --git a/certs/Kconfig b/certs/Kconfig
index 5f7663df6e8e3..c94e93d8bccf0 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -13,7 +13,7 @@ config MODULE_SIG_KEY
 
          If this option is unchanged from its default "certs/signing_key.pem",
          then the kernel will automatically generate the private key and
-         certificate as described in Documentation/module-signing.txt
+         certificate as described in Documentation/admin-guide/module-signing.rst
 
 config SYSTEM_TRUSTED_KEYRING
 	bool "Provide system-wide ring of trusted keys"
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
