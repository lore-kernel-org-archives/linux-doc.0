Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 123497D072
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Jul 2018 10:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753461AbeGEKjI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Jul 2018 06:39:08 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34308 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753430AbeGEKjG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Jul 2018 06:39:06 -0400
Received: by mail-lf0-f67.google.com with SMTP id n96-v6so6549907lfi.1;
        Thu, 05 Jul 2018 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WupKOhX6WufSUasTl2r858lE4aHqrMK+DCVBpP3jFyQ=;
        b=aRrBY+l3R3x8/Db3nti6Yu7PlG9reATWLA/iTNaotlQu+BKE8Y3ihGNE1JQMZ+kUjq
         HBp7jQMtrVAAei78GGfHjR6OihtyB/PuNsQXZ5115y6jddWGd09Ohz8Z1eSXZMURkX82
         f/bSfblBTMN9HCZeZktmAKwQmvnUgLcAVnz9zTe56rAc4SUShDC7hLtUsFY3j5E1fFsO
         j9guDtnrGUBAua95FX7fd5U9A4RZe47zWG8/0Hwnh7UEUyf1YpsH1p/jNJmeTf4XGnYJ
         +pdY+b7oylmUEi33I5yFPauGrSvrZnqmx0Dj+2uDxVlhe0slafLOHLW61EZfTburY3ZN
         ZgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=WupKOhX6WufSUasTl2r858lE4aHqrMK+DCVBpP3jFyQ=;
        b=sr300xwU5tv/88XyM1oT0n41mUuIi5j7iz7xHD44cPsj5h1dZmbnr7jm+/1UkOO2+/
         tGuLPyB5veqxjQ1HmrhEnkI/4JVgVFqTUckZtH7ZFEJ6WjJtHRsQka7RCnSXFSrB1mcU
         /BHEyd1qkspaVpooewJQXbCwGdl21JR0KCb7TUmkMU17vGtIxlb3QNqglIe+ZnMKmxpT
         +ezHGBvUfSJeGdJ/ynLNK4CzrY5vFiqJzsdOo9K6/BotmFbU8V6tRAFG4B4Sz7KKAzAH
         6xLYw0BdvJUjK/8kDV211k1lYxgMwXFiyyO7+mVkIZpMGgGBVpOyEQelJkJyNp4zfI5k
         k6fQ==
X-Gm-Message-State: APt69E1vpobwf1GdPnjtQkD6796obUAY2OJaqn2CzurFOiu1s3Z6GIvx
        QHaPtgDV+yokoj9tQPRboMY=
X-Google-Smtp-Source: AAOMgpeNJW2N5Bz6CAgIunORBkmVaYMC6UJ+5YUKkq6eJAC6OGSsyIuzG/gbQywoMxTIiVwJbhLQGA==
X-Received: by 2002:a19:cb44:: with SMTP id b65-v6mr4113455lfg.12.1530787144596;
        Thu, 05 Jul 2018 03:39:04 -0700 (PDT)
Received: from xi.terra (c-8bb2e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.178.139])
        by smtp.gmail.com with ESMTPSA id q19-v6sm905728lje.29.2018.07.05.03.39.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jul 2018 03:39:03 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1fb1f3-00014u-Rl; Thu, 05 Jul 2018 12:38:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
        linux-doc@vger.kernel.org, Chris Jakob <chris.jakob@gmail.com>
Subject: [PATCH 1/2] USB: serial: kl5kusb105: remove KLSI device id
Date:   Thu,  5 Jul 2018 12:38:32 +0200
Message-Id: <20180705103833.4095-2-johan@kernel.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705103833.4095-1-johan@kernel.org>
References: <20180705103833.4095-1-johan@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This driver was apparently never tested with an actual KLSI device. In
fact, even the device-id entry which was supposed to allow for this had
a typo in it.

Tests now reveal that the predicted firmware differences with the
PalmConnect adapters are real and that the driver does not support KLSI
devices with PID 0x000c, so let's remove the broken entry.

Reported-by: Chris Jakob <chris.jakob@gmail.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/kl5kusb105.c | 1 -
 drivers/usb/serial/kl5kusb105.h | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/usb/serial/kl5kusb105.c b/drivers/usb/serial/kl5kusb105.c
index 5046ffd53cde..5ee48b0650c4 100644
--- a/drivers/usb/serial/kl5kusb105.c
+++ b/drivers/usb/serial/kl5kusb105.c
@@ -67,7 +67,6 @@ static int klsi_105_prepare_write_buffer(struct usb_serial_port *port,
  */
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(PALMCONNECT_VID, PALMCONNECT_PID) },
-	{ USB_DEVICE(KLSI_VID, KLSI_KL5KUSB105D_PID) },
 	{ }		/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/kl5kusb105.h b/drivers/usb/serial/kl5kusb105.h
index 41c9bf60fbf0..dbe98d85ca8e 100644
--- a/drivers/usb/serial/kl5kusb105.h
+++ b/drivers/usb/serial/kl5kusb105.h
@@ -7,9 +7,6 @@
 #define PALMCONNECT_VID		0x0830
 #define PALMCONNECT_PID		0x0080
 
-#define KLSI_VID		0x05e9
-#define KLSI_KL5KUSB105D_PID	0x00c0
-
 /* Vendor commands: */
 
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
