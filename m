Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 83A5E7DD41
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 17:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbeKHCl6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 21:41:58 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57241 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731309AbeKHCl5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 21:41:57 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20181107171040euoutp02367a3fab6098e181d698d767406e175d~k5rWhJQWt0487204872euoutp024
        for <linux-doc@vger.kernel.org>; Wed,  7 Nov 2018 17:10:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20181107171040euoutp02367a3fab6098e181d698d767406e175d~k5rWhJQWt0487204872euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1541610640;
        bh=BF9hoi/P6lu2L1mT8SlOWIzqeTeONOgqLJnUK9e/KhI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CCuRQsm1xSq7BKr7QlZC0SWfErDz9esIRSZi7HwKMcJ+IexEIYxVD2eVqhbXiejqR
         A98of7BFkI10SQsLRkNg3TwqgLWIXN+jNGpSs2T0hn7Yik4uI2iKooK+sdzK5g41xl
         jfJm0SIpxf2B7FGIeQ3SCLShgPDKJVGEo7I9BXs0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20181107171039eucas1p1f7da3604dfa56e36035b5192c1090cfb~k5rV4loGI2717527175eucas1p1o;
        Wed,  7 Nov 2018 17:10:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 1E.C9.04806.F8C13EB5; Wed,  7
        Nov 2018 17:10:39 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20181107171038eucas1p1eb5dce12a1f5f7a3587f82f8396fa075~k5rVNCsD63086130861eucas1p1T;
        Wed,  7 Nov 2018 17:10:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20181107171038eusmtrp1a70f419c79491a1bc563b329f56f2a5f~k5rVBLpjv2472724727eusmtrp1j;
        Wed,  7 Nov 2018 17:10:38 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-0b-5be31c8f5cf6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 0B.23.04128.E8C13EB5; Wed,  7
        Nov 2018 17:10:38 +0000 (GMT)
Received: from AMDC3778.DIGITAL.local (unknown [106.120.51.20]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20181107171038eusmtip232ba2cb2ca2ddcc4ff68e8e4b7bc662d~k5rUdVEtr0340803408eusmtip2S;
        Wed,  7 Nov 2018 17:10:37 +0000 (GMT)
From:   Lukasz Luba <l.luba@partner.samsung.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     rui.zhang@intel.com, edubezval@gmail.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, corbet@lwn.net, b.zolnierkie@samsung.com,
        krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 04/11] Doc: thermal: new irq-mode for trip point
Date:   Wed,  7 Nov 2018 18:09:46 +0100
Message-Id: <1541610593-28542-5-git-send-email-l.luba@partner.samsung.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541610593-28542-1-git-send-email-l.luba@partner.samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSa0hTYRjHfXd2zo7L6WlqvngLBoJKabcPB4pICjpYUvilaB9y5cHb5mXH
        S5akRHlLrdTMtHmbYi1FndNseJ2WqDUVp8tL2nQQZovRFAoscp5J337/5/88/+fh5cURYSfq
        jcclptLyRIlUhPG53e9/6w8/8l0TH9l46kl2VLahpHkwD5A1Nj+ydkSPkrWGOZScnGznkQs5
        vqR6bUfV5zZyyRntC4y0FY8Assk4zSEf9I3wSLOpBDvjSrXUtADqbdVnHqXsXedQalUBRi3N
        9WJUZ2M2pSwpQ6mhH70cqkSjApRN7X+Zf41/KpqWxqXT8tDTUfzY70NmTvK28JZpcYmXAxRu
        hcAZh8QJaMmd5xYCPi4kXgI4+tOKsGITwM2GAcAKG4BrXSu8vZEegw1jjWYAh5+voHZjd0TR
        7lIIcBwjQmCPKsXe40FUA2jrV/LsAiGWABwvVyL2AXfiLNQatbupXCIAtrbqOXYWEOFwoK8U
        Ybf5w3l9wS47ExdgzYxlNwgSOh6stg07TjoHzaZOwLI7/DaqcdR94URZEZdlBn7MV2EsZ8G8
        sR5Hz0k4PDqN2q9GiCDYpg21IyTCYMN9B7rCT5b99mZkB0u7nyFsWQDzc4VsRiDUFE1xWD4A
        m1sqHNkUXK6ocDxoDYDl1R+wx+Bg1f9ddQCogBedxshiaOZ4Ip0RwkhkTFpiTMjNJJka7Hyl
        ib+jWz2gf/uGDhA4ELkIprpMYiEqSWcyZToAcUTkISh+vSoWCqIlmbdpedJ1eZqUZnTAB+eK
        vAR3nL6IhUSMJJVOoOlkWr7ncnBn7xyQcS9l+Ykl4ZW0VeZzxXPxl6IyjBt06F18k37WfcN6
        BVmNurotHZ99yB+PNGYIrBPeU5luC4F3PSKPBS/KwT4zHeibZTBalzcCjOtf+bmGqgjUTxL/
        Z0Gx4nZR2SFQKsayw0s164PVKr86rVOXNvtSfUT81pvzgfVOwlRLRYqIy8RKjgYjckbyD2vm
        eXZGAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsVy+t/xe7p9Mo+jDU7cVrbYOGM9q8WTA+2M
        FvM+y1rMP3KO1WL+lWusFufPb2C3uNUgY7HpMZC3sG0Ji8XlXXPYLD73HmG0WHr9IpNF694j
        7BZPHvaxOfB5rJm3htFj56y77B6L97xk8ti0qpPN4861PWwem5fUeyzum8zqcfDdHiaPvi2r
        GD0+b5IL4IrSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3S
        t0vQy3hz8AlTwR+hioe377A3MM7l72Lk5JAQMJHYceUzWxcjF4eQwFJGiR/XfrNBJMQkJu3b
        zg5hC0v8udYFVfSJUeJn813mLkYODjYBPYkdqwpB4iIC8xkljm66DFbELPCMUWLl9JdMIN3C
        As4Su67vApvEIqAqsXbtObA4r4CXxP69k5ghNshJ3DzXCWZzCnhLzLv8FqxeCKjm+6z1bBMY
        +RYwMqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjJRtx35u2cHY9S74EKMAB6MSD6/GjofR
        QqyJZcWVuYcYJTiYlUR4e1c/ihbiTUmsrEotyo8vKs1JLT7EaAp01ERmKdHkfGAU55XEG5oa
        mltYGpobmxubWSiJ8543qIwSEkhPLEnNTk0tSC2C6WPi4JRqYLThyfe9oTX568T9Kjk9HlV3
        zbb8yjva8Dr2yOZG9kwW1p/n1lS8POgg5e/LZnisoPuzueDqBZm177c4/GwN9tj5N3aqrcqc
        E2+rl7xN57yc2WDG3VpfffxKlci5+PB71mKTFx42nVux+tOKLdqOe/wqGouX7msQbBXOcF06
        TWHnmnD/KcG/A5VYijMSDbWYi4oTASUF5VOqAgAA
X-CMS-MailID: 20181107171038eucas1p1eb5dce12a1f5f7a3587f82f8396fa075
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20181107171038eucas1p1eb5dce12a1f5f7a3587f82f8396fa075
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181107171038eucas1p1eb5dce12a1f5f7a3587f82f8396fa075
References: <1541610593-28542-1-git-send-email-l.luba@partner.samsung.com>
        <CGME20181107171038eucas1p1eb5dce12a1f5f7a3587f82f8396fa075@eucas1p1.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thermal trip point gets new flag in DT: irq-mode.
Trip point may have a new explicit flag which indicate
IRQ support when the temperature is met (so the thermal framework
deos not need to set polling for it).
It is useful for 'passive' cooling trip point,
which now will not be register for polling the temperature.

Update documentation about irq-mode for trip points.
The new sysfs file shows 1 if the trip point supports IRQ.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 Documentation/thermal/sysfs-api.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/thermal/sysfs-api.txt b/Documentation/thermal/sysfs-api.txt
index 9113997..e405724 100644
--- a/Documentation/thermal/sysfs-api.txt
+++ b/Documentation/thermal/sysfs-api.txt
@@ -272,6 +272,7 @@ Thermal zone device sys I/F, created once it's registered:
     |---trip_point_[0-*]_temp:	Trip point temperature
     |---trip_point_[0-*]_type:	Trip point type
     |---trip_point_[0-*]_hyst:	Hysteresis value for this trip point
+    |---trip_point_[0-*]_irq:	Trip point supports triggering irq
     |---emul_temp:		Emulated temperature set node
     |---sustainable_power:      Sustainable dissipatable power
     |---k_po:                   Proportional term during temperature overshoot
@@ -365,6 +366,10 @@ trip_point_[0-*]_type
 	thermal zone.
 	RO, Optional
 
+trip_point_[0-*]_irq
+	Boolean which indicate that the trip point triggers irq.
+	RO, Optional
+
 trip_point_[0-*]_hyst
 	The hysteresis value for a trip point, represented as an integer
 	Unit: Celsius
@@ -544,12 +549,16 @@ method, the sys I/F structure will be built like this:
     |---available_policies:	step_wise fair_share
     |---trip_point_0_temp:	100000
     |---trip_point_0_type:	critical
+    |---trip_point_0_irq:	1
     |---trip_point_1_temp:	80000
     |---trip_point_1_type:	passive
+    |---trip_point_1_irq:	1
     |---trip_point_2_temp:	70000
     |---trip_point_2_type:	active0
+    |---trip_point_2_irq:	0
     |---trip_point_3_temp:	60000
     |---trip_point_3_type:	active1
+    |---trip_point_3_irq:	1
     |---cdev0:			--->/sys/class/thermal/cooling_device0
     |---cdev0_trip_point:	1	/* cdev0 can be used for passive */
     |---cdev0_weight:           1024
-- 
2.7.4

