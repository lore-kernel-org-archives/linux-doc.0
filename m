Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EDC8B7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 05:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932890AbeCBFa0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 00:30:26 -0500
Received: from mail-pl0-f65.google.com ([209.85.160.65]:46569 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932845AbeCBFaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 00:30:24 -0500
Received: by mail-pl0-f65.google.com with SMTP id y8-v6so5053860pll.13;
        Thu, 01 Mar 2018 21:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=EKWbNuOaB7J+Nkp4GsAVxPYK91Ek95LW31erYN7HkVE=;
        b=Sgw5VvCcNApfPvul5v3huHki9GLQCPNnu5fSiIldAkCEY8hFF6oV9WBTbPzpDracIw
         QVHgTFZJJ6zTpSMgr/gWdhDU/opZZDDajhyD1WGrej4SJr40lnlIyHubR0SeEIsbZO/h
         QuQHySuOPDsesAtWkM5Rpax63tSJsIVJ46dbNYLt2IU8lGRoWqB7sGjgeMyZAevMPY71
         PsNBawwpwXE6UysdmD7uBvH/XRkOkSX+s+xRAtwUXLqtu6ZFCkGEttpkyb0MVKLouG0T
         UPTaJRf07CmcBKlAkj8y60qp2AL/VD0SMCqCN30eGPfYz1ox+My4cHKDN1sqFYnBr5rr
         nhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=EKWbNuOaB7J+Nkp4GsAVxPYK91Ek95LW31erYN7HkVE=;
        b=ik/od008QpdD++2LRtbesplThuPsqKGBT6iVSB3YStMjE59+YC60jf141NoYze1p7Z
         Mw9vjNtk+Lf44GfOra6UfNbGziFT73fale6RlUjf5SQ49weYKg/gKd1pecYkEK9ul9Wa
         /0VUyvMVHxf/5ZgVUUyQRlJfQrFEnHie/QSjzmI56tL8IQQLor/VeYCPK3IVqFQCNjV0
         GYlgKOqyjmUyA285Wq/sLFsXn7AeqEv9zrCyLrYyzg/oAhODm+wgkj8WXZ986YZKmX1B
         dzQ12/dJEHZVspg3Kr23smxRzMyAx8usrVUOWKKhpXyXaVwBMw7ShPUc0Q4sr2gKFJAK
         YP+g==
X-Gm-Message-State: APf1xPBDqMJIxJOEwZ7Ibbv93m/DNnYK+NLqsiqrIj04B6lGFsAeq+2+
        xvFeLqn7OVx6fNx8jrFG6l0=
X-Google-Smtp-Source: AG47ELsbq85IhgmMn9W7PEEwB9eO109LFup3U+V+2Zt5jXmegS7owg+qxwUlHb6ctQB+h6WocFgbfQ==
X-Received: by 2002:a17:902:6a17:: with SMTP id m23-v6mr4238642plk.342.1519968624008;
        Thu, 01 Mar 2018 21:30:24 -0800 (PST)
Received: from mordor.localdomain ([183.82.18.45])
        by smtp.gmail.com with ESMTPSA id h10sm3227242pgf.19.2018.03.01.21.30.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Mar 2018 21:30:22 -0800 (PST)
Date:   Fri, 2 Mar 2018 11:00:17 +0530
From:   Aishwarya Pant <aishpant@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: [PATCH] HID: ntrig: document sysfs interface
Message-ID: <20180302053017.GA23123@mordor.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add sysfs documentation for N-Trig touchscreens under Documentation/ABI.
Descriptions have been collected from code comments.

Signed-off-by: Aishwarya Pant <aishpant@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-ntrig | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-ntrig

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-ntrig b/Documentation/ABI/testing/sysfs-driver-hid-ntrig
new file mode 100644
index 000000000000..e574a5625efe
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-ntrig
@@ -0,0 +1,70 @@
+What:		/sys/bus/hid/drivers/ntrig/<dev>/activate_slack
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Number of contact frames ignored before acknowledging the
+		start of activity (activating touch).
+
+
+What:		/sys/bus/hid/drivers/ntrig/<dev>/decativate_slack
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Number of empty (no contact) frames ignored before
+		acknowledging the end of activity (deactivating touch).
+
+		When the last finger is removed from the device, it sends a
+		number of empty frames. By holding off on deactivation for a few
+		frames false erroneous disconnects can be tolerated, where the
+		sensor may mistakenly not detect a finger that is still present.
+
+
+What:		/sys/bus/hid/drivers/ntrig/<dev>/activation_width
+What:		/sys/bus/hid/drivers/ntrig/<dev>/activation_height
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		Threholds to override activation slack.
+
+		activation_width:	(RW) Width threshold to immediately
+					start processing touch events.
+
+		activation_height:	(RW) Height threshold to immediately
+					start processing touch events.
+
+
+What:		/sys/bus/hid/drivers/ntrig/<dev>/min_width
+What:		/sys/bus/hid/drivers/ntrig/<dev>/min_height
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		Minimum size contact accepted.
+
+		min_width:	(RW) Minimum touch contact width to decide
+				activation and activity.
+
+		min_height:	(RW) Minimum touch contact height to decide
+				activation and activity.
+
+
+What:		/sys/bus/hid/drivers/ntrig/<dev>/sensor_physical_width
+What:		/sys/bus/hid/drivers/ntrig/<dev>/sensor_physical_height
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RO) These are internal ranges not used for normal events but
+		useful for tuning.
+
+
+What:		/sys/bus/hid/drivers/ntrig/<dev>/sensor_logical_width
+What:		/sys/bus/hid/drivers/ntrig/<dev>/sensor_logical_height
+Date:		May, 2010
+KernelVersion:	2.6.35
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RO) The range for positions reported during activity.
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
