Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A753F7E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 23:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751773AbeCHXln (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 18:41:43 -0500
Received: from mout.gmx.net ([212.227.17.20]:54899 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751613AbeCHXlc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 18:41:32 -0500
Received: from latitude ([88.153.6.235]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MC7em-1elJjN1KFs-008qtD; Fri, 09
 Mar 2018 00:41:05 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/8] MAINTAINERS: GPIO: Add Documentation/driver-api/gpio/
Date:   Fri,  9 Mar 2018 00:40:17 +0100
Message-Id: <20180308234024.24145-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:Ogh2i7vV+Zkm1enYb+V5gERBV10RaCyzAq29AKm20O+quXsBD/P
 7wa8LVxhMzlL+tO9jkzGOeBF+vFJDCFywP+GOAtnJt2DCmINntuGenUFbr7dxF8guuNsE7B
 I5SRwB04ydOQxABqHk9nePd4dIUIpcylTkUg05otcm7cUor3WUZVc8zrg8FBNujm5lBB1kG
 xzoBvZGvFnPlfR09raHkA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2hSDu3wEgrY=:StJKNtAli/2KcQ5tIcHyYM
 MJ4cQsWt64aRlweYqOxa6YRtwM9BAdkMpvGu8gdowAGc79j1cWExxaOo5+hcEjP+mKZt8Aogk
 4s3kjPCcirX4dsq/ewN8uzT+1g9nRgmlf08g0JeOcU5zC80t/Yu3htF/AibO20Rq0xuvJqbuQ
 mX3pIsSaMcZMWcMcf/h2842UCe1rc9GuvMp0x/X5pgo4xXJUh7HrhvER6tHKdF/6afcB/sukZ
 lBAZoy2yH2pYW8jZPMHSB91ujLeDBrBA3/ac0/nMgh5gRdhcaFPyhQaIfYPfcFnuofMU4pQa9
 zm9GUXAtoPZy/HbD9pn3nh5JWULOKa0iDjn+j+I2a1KmHKfcApKTp/byQXe3Ak3umKWf3lzT6
 HM/JKtoFmrd7h1QX4cMkQFM02Fgviy1BC9O2wtfu1YoYWrYIZ+VL9SnjEuFP5XI+pA169pcNf
 TfprYUtnMKrWiecnb52K1MdEBHj/CoWpUxiK6J635otAppPm7Nu7xMlpunByt9w3bZqbP6inY
 OsgeGCXcrKoFrLuI4PQAmjD8aKLRRTDTol1ZJx8Ht0uw6J9Xte4Dj1k5SPSXojJ0eQRgFq4mo
 XWxXmisUXlPK2z/YoKDonFpw6B/M5A4mDYGSe3QFk6mM2086J9+zzfTC3oiB1rzaxcf8/dh1A
 QHWYSxX+p5XiTl9YuibVEN3Z6QbSD5pr09TjBFnq/9wxBzRzNJbrKj0mxnkGPqU7RZNGaticT
 YWRG2VEBVPEH+gg4g4T7e2BE57tOV4SKwBgoZvU6j9gsmi14/NR4RCNc3BugC18JfJOL4mmYn
 /gbNoQtFmcc1RD+RyRgvXzh0G8mj/ABrJYkzULJEGahAvPUkVQ=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Steer patches to Documentation/driver-api/gpio/ into the right
direction.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6a89d31e4a4..313c0907020c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6029,6 +6029,7 @@ L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/
+F:	Documentation/driver-api/gpio/
 F:	Documentation/gpio/
 F:	Documentation/ABI/testing/gpio-cdev
 F:	Documentation/ABI/obsolete/sysfs-gpio
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
