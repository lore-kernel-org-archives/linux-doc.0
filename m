Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5FA557E281
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 17:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1424941AbeCBRa2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 12:30:28 -0500
Received: from mail-pl0-f68.google.com ([209.85.160.68]:41130 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424482AbeCBRa0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 12:30:26 -0500
Received: by mail-pl0-f68.google.com with SMTP id k8-v6so6055011pli.8;
        Fri, 02 Mar 2018 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=MlwqGeWm+30Gcz4ESfQ5RJ13l1zwKyXd8hmqynLVt7U=;
        b=u/SaX+AOgAYVB4HVRE7BaQ+8bEpTDnuQ0g1lIf1zutpnoX2ZjwLHQjUxhsSLiafCeU
         rm4GmukT7BBKLNVIny/mY+BO1M1wQHtK4YjsOZ/5VzsfdJgCJZBzryYyH6oDmD15/T67
         8xTSWI0iL27rYak5J5XGACswXQVWI9t1zNloPWszg1dDNxNc5uwGCrYX94jBmUlhTbdA
         f1ddBs1yCtf+qTEnBx2G43zfxrOud5IB4GwwCEsBcxcdsfIPsRYPkPdoylB604fFtcD0
         jDvxBzsx3cOWC2cNdg1qFAeLlWmY8hE/XAQ9I3BQrbCsrehRcjOabCDXbpr6Zt2QWGOc
         u9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=MlwqGeWm+30Gcz4ESfQ5RJ13l1zwKyXd8hmqynLVt7U=;
        b=SmuVvuf9Lp+JLcv+YcDN25P/z40LcxgWi9DEkJkP6Nxyr9iMYxmJeZJ0L+ONoojgds
         vHOzpW+d/u6prqp+ZmuN54gVpEuw51/KXun9I3fGvkQ4m36InSUHg90A0C64PsnmORHC
         +zNblzCwLG8PFfvbYm8NuSDqFGmF0frX2PXYwas2V5NkJVK7timoGAzMafSevpTHJyOp
         TOa7yR53qyp4XiN9jQsvq/7OTR7hxV6pBBP0hqu6YEwEzcE3ylyW//KqO5tZDKglLs2C
         rsKi/JBG4v2p/UzKT1re+lQCo4NI2O+oze3b+BqWGlN/NRUpZpiKiiZORWV7u0wZv2eq
         mXSQ==
X-Gm-Message-State: APf1xPB4KoXXUBEHUq/Kvgc2tXZiksUHqbjU2x3qJaMGC+AmWYl8AEDc
        C5L5zu4QjAICKbTuoPpnzsY=
X-Google-Smtp-Source: AG47ELvnKpOPD6lI3E9ZFOgw+vEw5Hs151/cvor9LGvYchCYCKA6JNvHmR5t4LN4LaNXs6E4WnGYlQ==
X-Received: by 2002:a17:902:7045:: with SMTP id h5-v6mr5945160plt.217.1520011825937;
        Fri, 02 Mar 2018 09:30:25 -0800 (PST)
Received: from mordor.localdomain ([183.82.17.184])
        by smtp.gmail.com with ESMTPSA id n14sm14480742pfj.154.2018.03.02.09.30.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Mar 2018 09:30:24 -0800 (PST)
Date:   Fri, 2 Mar 2018 23:00:19 +0530
From:   Aishwarya Pant <aishpant@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: [PATCH] Input: trackpoint: document sysfs interface
Message-ID: <20180302173019.GA27660@mordor.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Descriptions have been collected from git commit logs, code commits and
the TrackPoint System Version 4.0 Engineering Specification.

Signed-off-by: Aishwarya Pant <aishpant@gmail.com>
---
 .../ABI/testing/sysfs-devices-platform-trackpoint  | 115 +++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-trackpoint

diff --git a/Documentation/ABI/testing/sysfs-devices-platform-trackpoint b/Documentation/ABI/testing/sysfs-devices-platform-trackpoint
new file mode 100644
index 000000000000..df11901a6b3d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-platform-trackpoint
@@ -0,0 +1,115 @@
+What:		/sys/devices/platform/i8042/.../sensitivity
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Trackpoint sensitivity.
+
+What:		/sys/devices/platform/i8042/.../intertia
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Negative inertia factor. High values cause the cursor to
+		snap backward when the trackpoint is released.
+
+What:		/sys/devices/platform/i8042/.../reach
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Backup range for z-axis press.
+
+What:		/sys/devices/platform/i8042/.../draghys
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) The drag hysteresis controls how hard it is to drag with
+		z-axis pressed.
+
+What:		/sys/devices/platform/i8042/.../mindrag
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Minimum amount of force needed to trigger dragging.
+
+What:		/sys/devices/platform/i8042/.../speed
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Speed of the trackpoint cursor.
+
+What:		/sys/devices/platform/i8042/.../thresh
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Minimum value for z-axis force required to trigger a press
+		or release, relative to the running average.
+
+What:		/sys/devices/platform/i8042/.../upthresh
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) The offset from the running average required to generate a
+		select (click) on z-axis on release.
+
+What:		/sys/devices/platform/i8042/.../ztime
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) This attribute determines how sharp a press has to be in
+		order to be recognized.
+
+What:		/sys/devices/platform/i8042/.../jenks
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Minimum curvature in degrees required to generate a double
+		click without a release.
+
+What:		/sys/devices/platform/i8042/.../skipback
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) When the skipback bit is set, backup cursor movement during
+		releases from drags will be suppressed. The default value for
+		this bit is 0.
+
+What:		/sys/devices/platform/i8042/.../ext_dev
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Disable (0) or enable (1) external pointing device.
+
+What:		/sys/devices/platform/i8042/.../press_to_select
+Date:		Aug, 2005
+KernelVersion:	2.6.14
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) Writing a value of 1 to this file will enable the Press to
+		Select functions like tapping the control stick to simulate a
+		left click, and writing 0 will disable it.
+
+What:		/sys/devices/platform/i8042/.../drift_time
+Date:		Dec, 2014
+KernelVersion:	3.19
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) This parameter controls the period of time to test for a
+		‘hands off’ condition (i.e. when no force is applied) before a
+		drift (noise) calibration occurs.
+
+		IBM Trackpoints have a feature to compensate for drift by
+		recalibrating themselves periodically. By default, if for 0.5
+		seconds there is no change in position, it's used as the new
+		zero. This duration is too low. Often, the calibration happens
+		when the trackpoint is in fact being used.
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
