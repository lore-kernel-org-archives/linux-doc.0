Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE24C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 02:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfJGChF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Oct 2019 22:37:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45165 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfJGChF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Oct 2019 22:37:05 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so7630288pfb.12
        for <linux-doc@vger.kernel.org>; Sun, 06 Oct 2019 19:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=lwqzc5T0Op0g75fzdU3jI+whEvZq+YJJoahBgQLxWIQ=;
        b=P9dONoYKHFkl9QDP9YiMOgv4swaTXm/4yBjHWW9xQrqXmociSitmBeztvA794kasJO
         QUDVuQtZf8kCu3Zu/QIwqyx47TqKXJMIHWH2sj8Y6wWDgyL22j0oBaQiA763tHbd95S0
         40hUBoAHAlzC8L+34a1MD/oCwVsBO/7lEFm+X9BccOAoBrrs3nZdxB/M4+lYGGMCCmwP
         Ed+Ut5Jzph3tcFO8ILql5//CExJMOK/Nv/by1FFU++eVR6mpc/uApibNWQ1SVmLwLd4w
         Ttf+R1vjttDtRlibH8bQuvpVhryxc3ZuXnPcnnIONAl9hz4uH5taL2U8lL+CnFfJAYgb
         RTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=lwqzc5T0Op0g75fzdU3jI+whEvZq+YJJoahBgQLxWIQ=;
        b=HYNRGZYsSbayqetsH4Ev70wIKaJAk1ueOV1vs+VJwt43oX5xTBEgci9AFsAD/ivryS
         iBXxetgAvrzQseAp9E1bagijKD9IeB/Qqb1Bvwdyggy112nRHfywoctDbqVMP7/BPWf8
         mI/j1esyS0BmSp4wHKseDoHk9X0a1S9egfB56V6op/lyZHQOgsH4EIgbQg5S6xCYImB4
         Zzba2MhvHvjRwmyilnmy2IlJ9eJFLEzmSB/1UQjjflI5oECoI3tVoirHZFvKsBX4Gv4L
         sX3xsE4QStdxqqnL23GOxDMgMPpxBnfb5ESijALEC2xv36ZB0pEQ/kUk7DP6CayZqW3o
         F2jw==
X-Gm-Message-State: APjAAAWwMzE3PGVMbzSuTOquN80fKYUslNDy9QVlWNKhlnK+aAARPPm9
        sXYYkxqz4kjFaKTUGXdAD3oEHojU2Ka0kA==
X-Google-Smtp-Source: APXvYqyVf9X2xKEGegS5B0Le8Q8EaxngcZ+etrkTd1lIfnNmxiN8cybS+uS9+VuhOkZrntQck0pMdA==
X-Received: by 2002:a63:fc5f:: with SMTP id r31mr27741299pgk.55.1570415824419;
        Sun, 06 Oct 2019 19:37:04 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-165.syd.xi.com.au. [103.85.37.165])
        by smtp.gmail.com with ESMTPSA id l192sm19577079pga.92.2019.10.06.19.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 19:37:03 -0700 (PDT)
Date:   Mon, 7 Oct 2019 13:36:57 +1100
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: [PATCH] hwmon: docs: Extend inspur-ipsps1 title underline
Message-ID: <20191007023657.GA24341@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx is generating a build warning as the title underline
of this file is too short.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/hwmon/inspur-ipsps1.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/inspur-ipsps1.rst b/Documentation/hwmon/inspur-ipsps1.rst
index 2b871ae3448f..292c0c26bdd1 100644
--- a/Documentation/hwmon/inspur-ipsps1.rst
+++ b/Documentation/hwmon/inspur-ipsps1.rst
@@ -1,5 +1,5 @@
 Kernel driver inspur-ipsps1
-=======================
+===========================
 
 Supported chips:
 
-- 
2.21.0

