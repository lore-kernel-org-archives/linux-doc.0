Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6915B7DD50
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbeIEEaG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:06 -0400
Received: from mail-io0-f194.google.com ([209.85.223.194]:34939 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:06 -0400
Received: by mail-io0-f194.google.com with SMTP id w11-v6so4547523iob.2;
        Tue, 04 Sep 2018 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RMbQkNHOjlzsAz0F2KLrkolNU3NAjpHNiCDLf5uDawE=;
        b=pSl4j0286UwchfB8BwzaF0n3hwmSPh0Z66gQxMyi3b2yVvlTO5m+Jgvkl9QPhyPzTp
         36NrcvCOJ7lkR3rt4hv2knOIu2rtaJ4DuKXRuO/R4d4OGkISTZOdg0gYk+0japoTXh/D
         Sp9IsSPMkGbC5g4gNc9DCLyIRBGFaYvJ9YgRY3ik0MvGmyCBxfl9VslljZWQyRND0SH3
         wfeVXWhlo/4pE4A5eYgg1V0LpGJ8muQk2EDEsCOOLdtL9tVDiAphMZSLX+bIyGQTe/Wd
         qjkDfq1o3Nxa8fSOgfUD85q75eTtCoEJI93fRe/3qJGC/CaEuTGuIglEG3JoWe8D9HEc
         SYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RMbQkNHOjlzsAz0F2KLrkolNU3NAjpHNiCDLf5uDawE=;
        b=HuMZ0ZLvIBk5V70Q9TKxRGBQ7oaDQ24UpcwrBe6zSqmRpW5cA5ZKVnrajHaHLps4G/
         SLUnZ7hmeefRJxcay6jPNu80eqMpV3K9axAZDKSk995AS+gkH5PJAmUtEyh14yuB5JWz
         flSvBnghVx4ERTxhxhZkAfahJki0yqRSRDZryUBWMYOPwqQ4XdMIex7lhZ/a2zcsyJkW
         ojOsG3jweE0z0CGWmmtyPRTHrZPYL+72l4cXNR9+xOXa4vFiMbaRlDTkBw80nwHRSiqs
         JDmGymj2yo7umHfT3pVirNArZ1y/bLa0jUDmPhokoeCN6jxHFMVPIjOwM5xeI7aRWi57
         gWAA==
X-Gm-Message-State: APzg51Ac5mMTci9pBxJfyhD0+kHJNKQEnwpdmYo3+A0Qt9w3h7SKpnPO
        nlefp9+csAmECgZAlrG51W0=
X-Google-Smtp-Source: ANB0VdaNquegGQpBuYuKsnMWULPaQOzzdpofumu5YtwFW9HoU5umdtHFaGWMnlCxJgUR4cGqWl0APA==
X-Received: by 2002:a5e:da49:: with SMTP id o9-v6mr23742333iop.215.1536105758074;
        Tue, 04 Sep 2018 17:02:38 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:37 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 2/5] FireWire: clean up core-iso.c kernel-doc
Date:   Tue,  4 Sep 2018 17:02:22 -0700
Message-Id: <20180905000225.10733-3-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Clean up kernel-doc warnings in <drivers/firewire/core-iso.c> so that
it can be added to a Firewire/IEEE 1394 driver-api chapter
without adding lots of noisy warnings to the documentation build.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 drivers/firewire/core-iso.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- linux-next-20180904.orig/drivers/firewire/core-iso.c
+++ linux-next-20180904/drivers/firewire/core-iso.c
@@ -337,9 +337,16 @@ static void deallocate_channel(struct fw
 
 /**
  * fw_iso_resource_manage() - Allocate or deallocate a channel and/or bandwidth
+ * @card: card interface for this action
+ * @generation: bus generation
+ * @channels_mask: bitmask for channel allocation
+ * @channel: pointer for returning channel allocation result
+ * @bandwidth: pointer for returning bandwidth allocation result
+ * @allocate: whether to allocate (true) or deallocate (false)
  *
  * In parameters: card, generation, channels_mask, bandwidth, allocate
  * Out parameters: channel, bandwidth
+ *
  * This function blocks (sleeps) during communication with the IRM.
  *
  * Allocates or deallocates at most one channel out of channels_mask.
