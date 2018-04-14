Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BC06C7E88A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751111AbeDNB1r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:47 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:51192 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeDNB1q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:46 -0400
Received: by mail-it0-f67.google.com with SMTP id r19-v6so5357691itc.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MhV5UHEEqdWTGfWn3vWnZzmmxjFcCGQCq4N80Vr+688=;
        b=tVb/N5HEbVXA2I8wz+gyMNr+XdzxyKaWjDsIFEgRDX+zdJQQi4evvZkmBcH9DqiXqy
         hEb5Dtsjgt5eF0VJw/gJmUhEdelRaC0+uvUwDeqW50UxabwMUcJ8w6AouUoNr+75gsjb
         sORyPhQOV7+SWnPABIr62+tMLSibuVDVLuX8TcjYfYCuKYsXbmwj9jZUu79lL/Ggy/k8
         y6K1uY42/w/LwGHhqyGu7/cUORWEMSdcEYRp5N9mhkzWWA4vszawyFeItNjUbFoBEigA
         Ea7maM0LZmdIS91yW52RHnMKuRbYlc2vHlxSNqdbmf5+Azb6di6eYhNjQ5z9j961Gkxe
         PkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MhV5UHEEqdWTGfWn3vWnZzmmxjFcCGQCq4N80Vr+688=;
        b=cyVI7qZwgV/T4MkhoAs1+ljctvL33B0j4MBWFAvhoSH1pH8VCPkQdzdn0CXd/2tiTx
         s1mNFxYVDqRiBIqPsOCSC3PgUNnPilKq6d1EMWVMqfRY71S9wUQZPlP35d1spFRP8btX
         NsZRi4PjwpDnXmEYQUQmrKyJgaoh/kzGKtFRFhwWodEUQttltMrm+qxOYKfReI/L4RZx
         snO9hFEsGHFn6TxH8BPy1u0Fi85A4zn5w821Ggq0TJQMT+dzbsUfK8pR3DQ4eEoSr582
         CpHaua9bPk+xpZzvQVnIvqszJQ3CqMyMdOecUkfWU9FMNMPfpGZWWrtf9W+XEkGUvlnD
         kjrg==
X-Gm-Message-State: ALQs6tC3wUQiegW0o8BN4h2WmYWZ9ytL8XNpp9Z71iwZl7Jda96spATA
        AXnZDg7fq0cO5l9Q5QSUmNU=
X-Google-Smtp-Source: AIpwx48bg5FV8FbnTVyO5e3++djPyyL6JWiBYc639BWTQMDGuRKMB9HQ5dZOHapDc2hPMhdfGnaHtg==
X-Received: by 2002:a24:7305:: with SMTP id y5-v6mr8089925itb.143.1523669266228;
        Fri, 13 Apr 2018 18:27:46 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:45 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 2/5] FireWire: clean up core-iso.c kernel-doc
Date:   Fri, 13 Apr 2018 18:27:19 -0700
Message-Id: <20180414012722.17420-3-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Clean up kernel-doc warnings in <drivers/firewire/core-iso.c> so that
it can be added to a Firewire/IEEE 1394 driver-api chapter
without adding lots of noisy warnings to the documentation build.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: linux1394-devel@lists.sourceforge.net
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/firewire/core-iso.c |    7 +++++++
 1 file changed, 7 insertions(+)

--- linux-next-20180413.orig/drivers/firewire/core-iso.c
+++ linux-next-20180413/drivers/firewire/core-iso.c
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
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
