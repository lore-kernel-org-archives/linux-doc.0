Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 767E87DF8C
	for <lwn-linux-doc@archive.lwn.net>; Fri, 25 May 2018 19:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967936AbeEYT0b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 25 May 2018 15:26:31 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41999 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968127AbeEYT0a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 May 2018 15:26:30 -0400
Received: from localhost.localdomain ([37.4.249.126]) by
 mrelayeu.kundenserver.de (mreue105 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 0LiUtY-1fuXlH3taG-00cgJs; Fri, 25 May 2018 21:25:32 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Eric Anholt <eric@anholt.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Phil Elwell <phil@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 6/6] arm64: defconfig: Enable RPi voltage sensor
Date:   Fri, 25 May 2018 21:24:39 +0200
Message-Id: <1527276279-23876-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
References: <1527276279-23876-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:x4I0zvYeC2jJfgUcstAWs/kEK7+7jo4lPy5PxIUN/HRbIsvSHGk
 w6Vr12fnBFMbpDKYDiNCl+3cldgmCxjxRCDPH8dcsc3ZKl2rXrohKmwuRNzzVdVycPf2hEX
 qgSVfNOeNoqm+jWBvB5nD0B5Y1m63MOhQJ+5RONyJDBiffQjKJ0h1EDK7bCe71gVN3A9j44
 DlkKdXTyYDz266Qt44KfA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:4fl/Btrs52g=:mOXCSvMDlLD/gg83qJZduc
 Igq54Zdbx3Aby7X7DKL0T5liXZVWg3jatRnm+63+FqF60LdWXYTREMg5CMC2sY5QA+Xda6aKm
 tQlxzLjyKsriU3y9cdLxfkoQHFUv/AlrVd4Ns8KD8PNSbyTv8wJoxH0tIUYQl6HGXLgVf5s/F
 Qn7ZzoX3dDkQJ/KXuSGxLvrD3goIr/F1j+Ae2bmf/M2ws/jMOPg/q6uwMYYcKvSEf+vdPWA7r
 ypWPq/i8uxFR1VJC0euXN+gvZluT0AMaT5PQmXHkuORgxqQ1Zp+Ft0Hh58qaujiS6hOTPkDp0
 oXlaz/0Y8iSmw0xgZCtMlTtpYdD5oWxOtZtEyZyAIs/FF+zdpiU+nRVraAiy2Dwa2OsRB6pH4
 9LDfcnGa40uhySloRhoPC+gSmLkVoWRPtkChstttRBapzlwGy/hbFf7Ffq54RQ6A/6MquMtUx
 nmIB3JxYmnIyGomE/c0fzpwDK65H0YdzVQX7LxQMOSKQSAR/T2+FPYYI/6WV6axZDgc+SdSqm
 KpGP8N3tilOvdK3tNZMI7fS0uwr8yVwpvzSZKIFO/pehTXd4sulW4cFtTfKSVEqyny6fk7uWp
 nEWgaNvjXo2nmO26T6mmTEVI1ycIGaKJk6LQHhkgeySpPfV4UtENIepKaC4oHjSP96p1enban
 4NpyGrxKaEPL78jS35jyRtnkwUuFliJhlJhG1N8qxRjdqLVvFran7FcPNyLnRKjWiqeA=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The patch enables the hwmon driver for the Raspberry Pi.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3299505..e5c7198 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -353,6 +353,7 @@ CONFIG_BATTERY_BQ27XXX=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_INA2XX=m
+CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
