Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A17ED7D90D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Nov 2019 18:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfKBSkf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 2 Nov 2019 14:40:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46702 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfKBSkf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Nov 2019 14:40:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id b3so7013414wrs.13
        for <linux-doc@vger.kernel.org>; Sat, 02 Nov 2019 11:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kragniz.eu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qdnCZdWddclGH/M82OOZNX5o0Sz7VcqJqLNhFXWogM=;
        b=XlDpXknG0rjKQ/6mwcKMyp9x19gH4LAkQpksTprJA7GF90xwpCjLaPqUBAZZm1Ruq+
         wIJ8x7oQoSriDliGfFsBJFmjk0iF2TbAnqM+MVrBcvzaYmchiGeJs4/J9JUvfRdGxMe0
         HwC+Xx9mfivXgzuIb6/++gavMi1gRePTXZK9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qdnCZdWddclGH/M82OOZNX5o0Sz7VcqJqLNhFXWogM=;
        b=J9vWPGKHQ6lOKGC0D0I32TU1Orq+a6jS27AIiP1WScmnQc0o/4C7p4/SD/8uvtWTrp
         dCzbh+daZ5XowApCNJFE5T3x97lBRUTl9gsESEXCqkZXhjMJN7gOcgxBG4TKCCjYEig1
         rXGtsUltA4thKayvYAz+rTIQI9OtqmuA1ZxsLa3pF0HGrasAaiiyyfC1ZIgv1pkYR1me
         Jw4YxjrxWtKHN5IrZ7we6rzrWYlOR8bA2o8IwaYjEMZUYhT30IdGCayFnu52xbHjyBia
         E9o+EqRoIekSrRP4jxF8rUmoY72orm/LxLHEVmXCF7Lbs0WXDSpTsg6tcJOv+1rftwib
         1OTA==
X-Gm-Message-State: APjAAAWUpRo/yzoa1PVV8h0q9zSTCN57JDESDPh/+mc+fHz7nlMV7hr+
        yBNsLJs42OQ9Y6Dwqe1lEdkZA9GQagFKEg==
X-Google-Smtp-Source: APXvYqxVHNDgIw1CEvYiU+IQ8nERCitTwJtlTtr9h7hKHNVLgcMvE92IqO+CF9nOD2DjxZSZe/Mz7A==
X-Received: by 2002:a5d:4684:: with SMTP id u4mr12611320wrq.352.1572720033399;
        Sat, 02 Nov 2019 11:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.245])
        by smtp.gmail.com with ESMTPSA id u4sm3202638wrq.22.2019.11.02.11.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 11:40:32 -0700 (PDT)
From:   Louis Taylor <louis@kragniz.eu>
To:     mchehab@kernel.org
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Louis Taylor <louis@kragniz.eu>
Subject: [PATCH] scripts/sphinx-pre-install: fix Arch latexmk dependency
Date:   Sat,  2 Nov 2019 18:45:11 +0000
Message-Id: <20191102184511.82011-1-louis@kragniz.eu>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Arch Linux, latexmk is installed in the texlive-core package.

Signed-off-by: Louis Taylor <louis@kragniz.eu>
---
 scripts/sphinx-pre-install | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 68385fa62ff4..470ccfe678aa 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -520,6 +520,7 @@ sub give_arch_linux_hints()
 		"dot"			=> "graphviz",
 		"convert"		=> "imagemagick",
 		"xelatex"		=> "texlive-bin",
+		"latexmk"		=> "texlive-core",
 		"rsvg-convert"		=> "extra/librsvg",
 	);
 
-- 
2.23.0

