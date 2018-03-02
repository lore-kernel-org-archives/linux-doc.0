Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2E3F7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 13:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1424439AbeCBNRE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 08:17:04 -0500
Received: from mail-pl0-f66.google.com ([209.85.160.66]:38539 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424506AbeCBNRA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 08:17:00 -0500
Received: by mail-pl0-f66.google.com with SMTP id m22-v6so2172746pls.5;
        Fri, 02 Mar 2018 05:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/c/v8m0ONk5DalxCyAZvPiHHkI8OSDThXBbg8q/HPPg=;
        b=rkDtTcEHSIKmXeueIRjnDe/07a0WsYsBMys+50Ir4aKcorY3UPQu2Ucj+Gy1cbWn4g
         ERbUH41Of0RxiZoRn2rgVQyzeCSr0d9ea+hRr4vXqyVaesbSv/wMC1pUdxtyet49ZqD3
         SW/2D+4zbV8WEL17oQP1+wLG4guGstIM7AhgdD53/sk9BXVp5ZJFNeQo22W96rsqaYNo
         wnDSzOSFrf2Nhh8hlboH8naV4FchhFNlJVxr0yU4DSdIGzMpajICs+BhrbsXe/Ytc44W
         3IFco0CbmtNFD6XTGBBUSSW0/yfSlIfND3IDd4byOIuMS6h8x0c60AZzGMvXLWoMOAsn
         5zTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/c/v8m0ONk5DalxCyAZvPiHHkI8OSDThXBbg8q/HPPg=;
        b=jI5Y4dhA2HVEEfUjKQQX8NVGpI/++C2xdej/F1K/KFnztr6QTf2/7sZJz3nQjbLT7s
         lipdfzglX/6mYXG1IGqgOBLueH/EvcvpKIYfoTv2ALtqoYEOQGC1sFY13//0FLuDvkSm
         m+Wz+WHfI3ZtEUS21NmnjQMyB1v5i/9L/4+kly6abR4Mzu4t/LwRT/rlvbJx1LF4B2fV
         Cs+l5CqhOmI+j1dI2GLmhX25eVKKhkUHgF48FSmuddl7cAIeaDswQy4AM+Frk0LiDM4T
         6lgxUs9l7kvTU+cdIDxqp/Us6Huhl5tKA4jmLR6sONMzQoyLsgw+Uvte+971Ilp3uKun
         GSgg==
X-Gm-Message-State: APf1xPBKzdDDPL+iF294N4gKBsX4Pnw41cMypsrrChhRLQkx+3Fcpkxr
        u4Hn0ZYP9c5uBHB6AAndLdfQ5Q==
X-Google-Smtp-Source: AG47ELvPffTjbzAMVu37MSafOjhLKZ+oRcUJQCdivuscfY9mwnF66nDp26nbeuVTXzPHNrP6/6Jqgg==
X-Received: by 2002:a17:902:8214:: with SMTP id x20-v6mr5198339pln.182.1519996619444;
        Fri, 02 Mar 2018 05:16:59 -0800 (PST)
Received: from mordor.localdomain ([183.82.17.184])
        by smtp.gmail.com with ESMTPSA id k66sm13089399pfb.123.2018.03.02.05.16.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Mar 2018 05:16:58 -0800 (PST)
Date:   Fri, 2 Mar 2018 18:46:53 +0530
From:   Aishwarya Pant <aishpant@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Julia Lawall <julia.lawall@lip6.fr>, linux-doc@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: document sysfs interface
Message-ID: <20180302131653.GA24934@mordor.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Descriptions have been collected from git commit logs.

Signed-off-by: Aishwarya Pant <aishpant@gmail.com>
---
 .../ABI/testing/sysfs-driver-hid-logitech-hidpp       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-logitech-hidpp

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-logitech-hidpp b/Documentation/ABI/testing/sysfs-driver-hid-logitech-hidpp
new file mode 100644
index 000000000000..d8f831f2d6b5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-logitech-hidpp
@@ -0,0 +1,19 @@
+What:		/sys/bus/hid/drivers/logitech-hidpp-device/<dev>/range
+Date:		Jan, 2016
+KernelVersion:	4.6
+Contact:	linux-input@vger.kernel.org
+Description:
+		(RW) This attribute controls the amount of 'turn' permitted in
+		Logitech G920 wheel. Reading from the file shows the current
+		range of the steering wheel. Writing a value within the min and
+		max boundary sets the range of the wheel.
+
+What:		/sys/bus/hid/drivers/logitech-hidpp-device/<dev>/builtin_power_supply
+Date:		Apr, 2017
+KernelVersion:	4.12
+Contact:	linux-input@vger.kernel.org
+Description:
+		Presence of this file indicates that HID++ driver is capable of
+		handling battery properties in the kernel. This way, upower can
+		add a udev rule to decide whether or not it should use the
+		internal unifying support or the generic kernel one.
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
