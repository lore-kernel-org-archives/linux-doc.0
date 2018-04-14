Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A4BC67DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751087AbeDNB1t (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:49 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:34487 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeDNB1s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:48 -0400
Received: by mail-it0-f65.google.com with SMTP id t192-v6so6717628itc.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m/2kybhTGVLbwHzmv7+iGLr3MKrQuKNH1URzwkPwSh4=;
        b=Yez/9W0q2EZUY2eV+rWuSqU2duoUccAlca4yRn97hHgyuIEAZE/DsTYuxbaEwxIKDW
         gLqFmP3lfYKoUkTAZTCGfJ63TP5JCzcu15etVarRzKCOUGvYSL/fr1E+qYLUGWD3HQ70
         T+6GEFow/UmV5/0XinzGfCa9qrrD/rGiKwp8VzUhzhfLNDPSKb3K8rbTCajSKcO29ufg
         E0LWMZMurpHKt2J//RuQTzt/LaISk6ZumrET9+9CsUgfQ2T9Xxs+YHQ4CODM1wFvnEE1
         Hph7BN7rYKiPK7gDmTS0ljVcLcZ4tBg9Hi7YHrRpJABjcUlLrM7NFZzzIOmWL0xPpKWO
         aw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m/2kybhTGVLbwHzmv7+iGLr3MKrQuKNH1URzwkPwSh4=;
        b=EccmJvTlqH19GfNXkj+E0n9OUxpb02lmve/S3tS9rxuRw74XYr9D9rj40rPUMdBZvd
         RRY/ZnpsZDV10NP5VjW5U6xNRIJDD+ADKo7AN32uKiTkJA//VMTjLbCCZn1qnsqZ+rxJ
         Cj+9uFrZLw8YC5pejcxix/XNYTHdm1/Mzyw+8VTGlvGwHQP1+Zx0oSNeN/g9/ntnyEXY
         z1N0za/42TCck72YkUn0XAWo8oGGr78jcwycqc1/jPB/yAa0+6LgekT5lG6pczbux9En
         StRXEfcMJ5U4QAYWUnaNSxjjsd1lbAS2dwWjSURGnSbhR3BeoAFLpD/vk2iyPwVzCvuG
         qDQQ==
X-Gm-Message-State: ALQs6tDPJkuAfKHa9YeT9VLx1pPgNAanaWCy0/SJDldHOiNwp1eurxPm
        i2MaoSJ5Kd/AFu5DmK0Jojo=
X-Google-Smtp-Source: AIpwx48+Apn1mQ6CZk5i+Ip1eD2l/KmLNl6jn3B+TDJL96ETcwCm05hfy125SpgZaCRGKkSRdvMb+A==
X-Received: by 2002:a24:4391:: with SMTP id s139-v6mr7973399itb.18.1523669268168;
        Fri, 13 Apr 2018 18:27:48 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:47 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 3/5] FireWire: clean up core-transaction.c kernel-doc
Date:   Fri, 13 Apr 2018 18:27:20 -0700
Message-Id: <20180414012722.17420-4-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Clean up kernel-doc warnings in <drivers/firewire/core-transaction.c>
so that it can be added to a Firewire/IEEE 1394 driver-api chapter
without adding lots of noisy warnings to the documentation build.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
To: linux1394-devel@lists.sourceforge.net
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/firewire/core-transaction.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- linux-next-20180413.orig/drivers/firewire/core-transaction.c
+++ linux-next-20180413/drivers/firewire/core-transaction.c
@@ -410,6 +410,14 @@ static void transaction_callback(struct
 
 /**
  * fw_run_transaction() - send request and sleep until transaction is completed
+ * @card:		card interface for this request
+ * @tcode:		transaction code
+ * @destination_id:	destination node ID, consisting of bus_ID and phy_ID
+ * @generation:		bus generation in which request and response are valid
+ * @speed:		transmission speed
+ * @offset:		48bit wide offset into destination's address space
+ * @payload:		data payload for the request subaction
+ * @length:		length of the payload, in bytes
  *
  * Returns the RCODE.  See fw_send_request() for parameter documentation.
  * Unlike fw_send_request(), @data points to the payload of the request or/and
@@ -604,6 +612,7 @@ EXPORT_SYMBOL(fw_core_add_address_handle
 
 /**
  * fw_core_remove_address_handler() - unregister an address handler
+ * @handler: callback
  *
  * To be called in process context.
  *
@@ -828,6 +837,7 @@ EXPORT_SYMBOL(fw_send_response);
 
 /**
  * fw_get_request_speed() - returns speed at which the @request was received
+ * @request: firewire request data
  */
 int fw_get_request_speed(struct fw_request *request)
 {
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
