Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE71B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Apr 2019 12:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbfDBMS2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Apr 2019 08:18:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53273 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfDBMS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Apr 2019 08:18:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id q16so3133238wmj.3;
        Tue, 02 Apr 2019 05:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m0Yhf7dLwYQMZuyIsm9m43WayyXUoQ3uc+OIUwK7dbk=;
        b=RdJqhpL+iitoRk4N8hVlc/TvISqG3GFegUUM+atjhkqHmi+FgnE5wcCoLP64+to9Rk
         ziZLyJE2KA38huIXxHGxiQBGKGE9CHyKLlhiTF9F9gu9rqM7O+U7L7r76ybcy6939DMt
         FwEQeBagKMWZmFA77qeVw2kcHnzSh1cXHXKt/sX700UPHcr9XS1H8W9OBTGBLVHYEYfg
         rR0tsQs6VHCf+9sSfZf8R8+Sfuq0HM7qaBa6+8ak6WZsY13VD0/0sLzQRnwDzPl5Kjyb
         DH+ufmiNuOhpxEp4Q0kwrgejOe2ijP+cTk77sKFWXo5THZPbFSx2sQijsY2f5Zr620rj
         0/hw==
X-Gm-Message-State: APjAAAV/95OQcyPZ4bR7G47FKzlQ0ITViw+qwB65Tkv2Br/gu2IGIGCZ
        gleTzepjmiVZGyVwMJekpExrP7CFGPo=
X-Google-Smtp-Source: APXvYqyqFujw4wovWdVjUtN+36ti0++nf85+9MErPq7N1QB3eYmj7XzfpK/2lTgmdD4sBFSVBlhPvA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3425970wmk.108.1554207506462;
        Tue, 02 Apr 2019 05:18:26 -0700 (PDT)
Received: from localhost ([90.85.130.193])
        by smtp.gmail.com with ESMTPSA id 61sm46715482wre.50.2019.04.02.05.18.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 05:18:25 -0700 (PDT)
From:   Christina Quast <cquast@hanoverdisplays.com>
Cc:     trivial@kernel.org, Christina Quast <cquast@hanoverdisplays.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: doc: my_chip has no element ioport
Date:   Tue,  2 Apr 2019 14:16:48 +0200
Message-Id: <20190402121649.26536-1-cquast@hanoverdisplays.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

chip->ioport is dereferenced in two places, but the struct is
defined as follows:

struct mychip {
	struct snd_card *card;
	struct pci_dev *pci;

	unsigned long port;
	int irq;
};

Signed-off-by: Christina Quast <cquast@hanoverdisplays.com>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 6b154dbb02cc..132f5eb9b530 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -324,7 +324,7 @@ to details explained in the following section.
               strcpy(card->driver, "My Chip");
               strcpy(card->shortname, "My Own Chip 123");
               sprintf(card->longname, "%s at 0x%lx irq %i",
-                      card->shortname, chip->ioport, chip->irq);
+                      card->shortname, chip->port, chip->irq);
 
               /* (5) */
               .... /* implemented later */
@@ -437,7 +437,7 @@ Since each component can be properly freed, the single
   strcpy(card->driver, "My Chip");
   strcpy(card->shortname, "My Own Chip 123");
   sprintf(card->longname, "%s at 0x%lx irq %i",
-          card->shortname, chip->ioport, chip->irq);
+          card->shortname, chip->port, chip->irq);
 
 The driver field holds the minimal ID string of the chip. This is used
 by alsa-lib's configurator, so keep it simple but unique. Even the
-- 
2.20.1

