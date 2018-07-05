Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3C3317D071
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Jul 2018 10:39:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753464AbeGEKjJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Jul 2018 06:39:09 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41091 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753432AbeGEKjG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Jul 2018 06:39:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id y17-v6so1498230ljy.8;
        Thu, 05 Jul 2018 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8rw7w9DqbOVzRoWv3IofXi+XpT2Jy9iP38mSQE5f7qo=;
        b=tG+7YTOl2TiAUtQPWCulD5y05g2sGd2a5ybBO5xAgrlMJJPxDhP9obqQ8PME4QsYie
         RgTFKIKsz5Yx+mP99CJS9qAsoiGVO61SwkQ/lg5n6pdtiA4USxzwkQCoZJC4JqsP3+7E
         iiU0BogHHcJptnZ1wypzf1bvwQSynI6PlONUu8l7kXXCkpRJ3buZc54gfL7Eu43OGhlk
         oii3ZYrbusi+vroETDVdb60HRPxUdhsIjC5CJlzAz8gFhUMTo1ESFcR4oFTL72EokQfT
         zze9T99u53D4rdsRRKvC1sD+lLjnz1rpD6clHAwhn2rduEYwUdXoGsTPHubr/Bn8uCDz
         ZtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=8rw7w9DqbOVzRoWv3IofXi+XpT2Jy9iP38mSQE5f7qo=;
        b=ewP0y7GnbtGgclWf/RC0bri7TJ0q2BwlGUL0LmAh2CvlIqFjpTba1Ha+xD3FVGWbak
         WKBSsZg4KeZXy7KUpTTeVQTOTv+EJrdVGiLeyVEq3SVTVy3OAn0NCLyhFCRFqXvpYS85
         yBmYoIlewKdEJQDkWjefkr0IfC13TkWLBzGk8C8TG6j0zTqyxkNp7ttkNJJoe/ZqpRIn
         6Q5Q1eCqJmtRGCvsIrokCWZ3IKoG8z7gIELC4vurJf5n2rMgzZH3BW6SaARBI+AohEXw
         T21iKaelqpMQ0ahETQf40M7/HXgVFDx3S7Gh7z0pi+32TXbLo1ABYgqp7iqXsuHLfot2
         vqfg==
X-Gm-Message-State: APt69E2JPK2w+Y63M8RJzDL+1fCkjKR9tgwVZfGKZBi88K0xoLz0YXc/
        D7O6nzhWsSiPAfx19+keeek=
X-Google-Smtp-Source: AAOMgpdWSrEr6CrTZztj51gCAM4bkVQKdFDgQI04azqqUfcS1YlCD3/klmqtrMZVFV/lwBZoJRM0UQ==
X-Received: by 2002:a2e:5617:: with SMTP id k23-v6mr3845490ljb.86.1530787145268;
        Thu, 05 Jul 2018 03:39:05 -0700 (PDT)
Received: from xi.terra (c-8bb2e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.178.139])
        by smtp.gmail.com with ESMTPSA id n73-v6sm1348045lfn.60.2018.07.05.03.39.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jul 2018 03:39:03 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@xi.terra>)
        id 1fb1f3-00014z-UG; Thu, 05 Jul 2018 12:38:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
        linux-doc@vger.kernel.org, Chris Jakob <chris.jakob@gmail.com>
Subject: [PATCH 2/2] USB: serial: clean up kl5kusb105 documentation
Date:   Thu,  5 Jul 2018 12:38:33 +0200
Message-Id: <20180705103833.4095-3-johan@kernel.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180705103833.4095-1-johan@kernel.org>
References: <20180705103833.4095-1-johan@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove references to long-gone kl5kusb105 module parameters in the
usb-serial documentation.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 Documentation/usb/usb-serial.txt | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/usb/usb-serial.txt b/Documentation/usb/usb-serial.txt
index 349f3104fa4f..ab100d6ee436 100644
--- a/Documentation/usb/usb-serial.txt
+++ b/Documentation/usb/usb-serial.txt
@@ -418,15 +418,6 @@ Current status:
   why it is wise to cut down on the rate used is wise for large
   transfers until this is settled.
   
-Options supported:
-  If this driver is compiled as a module you can pass the following
-  options to it:
-  debug			- extra verbose debugging info
-  			  (default: 0; nonzero enables)
-  use_lowlatency	- use low_latency flag to speed up tty layer
-			  when reading from the device.
-			  (default: 0; nonzero enables)
-
   See http://www.uuhaus.de/linux/palmconnect.html for up-to-date
   information on this driver.
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
