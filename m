Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6AD2A7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 00:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbeIEEaI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 00:30:08 -0400
Received: from mail-io0-f195.google.com ([209.85.223.195]:45184 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbeIEEaI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 00:30:08 -0400
Received: by mail-io0-f195.google.com with SMTP id e12-v6so4503266iok.12;
        Tue, 04 Sep 2018 17:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VSH6WWnVk9sEDLCnZGRBaLDKlQFBhen2jcknD9FOAD4=;
        b=oDp0GeqbyiYr0p4j82C6bJkaRFCKYZRWYWudo0lU3zdgbrs6CnmvxEJAKD5y0hUViu
         qRRdH8zyMwUep91aoKSK5Q2RQwnspASAaTmjQWz9/bRG7Na5UhYB3ZvWPNPIaEG3DhDu
         DsTOHexA/4pGlewBpNChIikfa9khL6mse69Pg746cHad0yB9TmH8vYZ/cDzSzag0nfLa
         VGPVcsHNFYOFgKkTDQf/T+QebeIGpu5A7I2xa0YxPQ9lM2oD/BRSAr3EnTeiVzSfWrXv
         CgmldX2voFPugCS3jZ0zjJ4h5uhLyrvRaQmxObmqVlFA4PtCv0vsHkmn3z3xgB1l8ybW
         SAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VSH6WWnVk9sEDLCnZGRBaLDKlQFBhen2jcknD9FOAD4=;
        b=K4B0OE9wAGs709vzbDrKQKOs5JiYylvVDA62t6KOeewpShzJw2L768UpUFMlTe3HW7
         pdoqwjqwQlT0Rgo1uH/+EjjzixtrFA+qYqKpBjPUeLmoeqkd4VtW5BMRSobbfXr4ysiz
         leqWuUY8MkdDnK21biP6lJWb4cCP8V9C+qUUB8sSahWzIzbFFzi7bUkQxh4ZTDLpugI6
         L5M9EBSMf40aDmXDP18bTtdt556/Fs+XT/xE2w1grN+OHw4XUFG8gzFLoNzSklFqZC0p
         WGP2/YnVxNDA/8SRlgHGgdP/Puy+MiU6Xvyy2bszJ2h/unPIsfTtqObiU4mBYZUfVzCB
         rfZQ==
X-Gm-Message-State: APzg51AjSY3/zPStpe7DYNaUsgb+npRx50V02ShSZSqZ7EjRxI0on1ZW
        xciCnGlcEPEexU7Wn8UCo63rIIS0
X-Google-Smtp-Source: ANB0Vdb50/NpPnYbOn7clbafxPKrJwyKJ0PpM586hknHs5/X7bN9Ctb4lxPiDEQ2VEIwknIRXjKEPA==
X-Received: by 2002:a6b:3a0b:: with SMTP id h11-v6mr23840814ioa.278.1536105760120;
        Tue, 04 Sep 2018 17:02:40 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id m13-v6sm285687itm.40.2018.09.04.17.02.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:39 -0700 (PDT)
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
Subject: [PATCH v4 3/5] FireWire: clean up core-transaction.c kernel-doc
Date:   Tue,  4 Sep 2018 17:02:23 -0700
Message-Id: <20180905000225.10733-4-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20180905000225.10733-1-rd.dunlab@gmail.com>
References: <20180905000225.10733-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Clean up kernel-doc warnings in <drivers/firewire/core-transaction.c>
so that it can be added to a Firewire/IEEE 1394 driver-api chapter
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
 drivers/firewire/core-transaction.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

--- linux-next-20180904.orig/drivers/firewire/core-transaction.c
+++ linux-next-20180904/drivers/firewire/core-transaction.c
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
