Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB2FC48BCD
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FAED613C5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 21:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbhFHV0L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:26:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30865 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234344AbhFHV0K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 17:26:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623187456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4gIQrxNh8rCNXWF5A+cmW2C8HVpKFKLZxYRvN1nK0FM=;
        b=Z5zdTwMIEzkafksXfKGo9itBDH9dsrnj3OuYFGhmPMMfBbb/jS8CE2FSWORh9Y0Mbxro5s
        Ao803AEZyEIYHnpzQaHfma2k5APTrL22smOTorJU8jkzvhK0h6I3cb7OlHda0TBCqzjfgO
        wv8V7g9+kr1Lk33nZig3XXSpg2vMsTI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Sz3DoWtbM0G65fQA0AuWdg-1; Tue, 08 Jun 2021 17:24:14 -0400
X-MC-Unique: Sz3DoWtbM0G65fQA0AuWdg-1
Received: by mail-oo1-f69.google.com with SMTP id n62-20020a4a53410000b0290246a4799849so13467049oob.8
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 14:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4gIQrxNh8rCNXWF5A+cmW2C8HVpKFKLZxYRvN1nK0FM=;
        b=MRZOpEH92TnIqiaLLVGbvj0SUc8av/0KOE03K0BZKeurgXMXVrhkWEutc1laL3ZdCZ
         4PJ+CJMUG6LqnY6nCzBc6Qq04av0+prYYwab7kkEDUNJMGIiqWMeI/RSrRBRQer9raym
         Q6mSIeN7SUHEUNnzVfJcopOc7Q7hymDzGss0nRfwGI32yKV+1Dm2YHTufadKUgINYgyN
         Rp39ohuoga1P7vEeJsAbD79SGQ6mwBqeFloAYmqMUHAKtepjFXOx6O72jiZ0ZdC0nQPd
         fG0x5TtkbmOz5FZ+oJZ3yPSZCol3ygeUpIDBT5MkgX+n1rayZliJwB6YrwzhOpo1bgcs
         WJfg==
X-Gm-Message-State: AOAM532ceBDld9zG9glR2MrQ71jgLUfydsyXXLrStrRWXVlB8dfTMJm3
        i/ocynbejB7XNeyxUW14+AC/WAfN8r56bWPIbR3oIrwXmfR0sy0TMqpI6hnddsKL/J+j0QVwxv6
        QNwRC6uCrU3qkFohsB5T+
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr4182072oic.123.1623187453959;
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXsoUQfchNBKnL8EdmQmEAp/5gAc1hlFks6ooIHfYu2jxHqDv442A3KNzBoqbETAUPGj1thg==
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr4182055oic.123.1623187453793;
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
From:   trix@redhat.com
To:     mdf@kernel.org, robh+dt@kernel.org, hao.wu@intel.com,
        corbet@lwn.net, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        gregkh@linuxfoundation.org, Sven.Auhagen@voleatech.de,
        grandmaster@al2klimov.de
Cc:     linux-fpga@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
        linux-staging@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH 05/11] fpga: change FPGA indirect article to an
Date:   Tue,  8 Jun 2021 14:23:44 -0700
Message-Id: <20210608212350.3029742-7-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 33e15058d0dc7..8cd454ee20c0c 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -7,7 +7,7 @@ menuconfig FPGA
 	tristate "FPGA Configuration Framework"
 	help
 	  Say Y here if you want support for configuring FPGAs from the
-	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
+	  kernel.  The FPGA framework adds an FPGA manager class and FPGA
 	  manager drivers.
 
 if FPGA
@@ -134,7 +134,7 @@ config FPGA_REGION
 	tristate "FPGA Region"
 	depends on FPGA_BRIDGE
 	help
-	  FPGA Region common code.  A FPGA Region controls a FPGA Manager
+	  FPGA Region common code.  An FPGA Region controls an FPGA Manager
 	  and the FPGA Bridges associated with either a reconfigurable
 	  region of an FPGA or a whole FPGA.
 
-- 
2.26.3

