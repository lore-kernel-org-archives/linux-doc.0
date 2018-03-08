Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F00F7E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 23:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751115AbeCHXlS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 18:41:18 -0500
Received: from mout.gmx.net ([212.227.15.19]:59351 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750857AbeCHXlR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 18:41:17 -0500
Received: from latitude ([88.153.6.235]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LyEJp-1eYlBi35zp-015Xnp; Fri, 09
 Mar 2018 00:41:11 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/8] Documentation: gpio: Move introduction to driver-api
Date:   Fri,  9 Mar 2018 00:40:19 +0100
Message-Id: <20180308234024.24145-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:TwEs7abHjTdQq9mYXNP744jhC/hLBDAHPYv1kxVTFArKYWY+i8x
 bauym80iLZfjoMQ1m37yzsqIdi4u8JCIigLla3SW+FHrAWkBPeKJHQfS7C140pnJSszoRZG
 PzT5lK7vl+MGQh/VoB5UxwiQy7tuSpBJYvHiCf92mPgPiZB69qsflbc7EIQejYh1zJzpYx8
 //zOh4jkVbeCPHiI5X08Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:vCb4CZ6r7j4=:wRpNFpHkMDmA1gvVF9JEZo
 IjB8Nt4cHgEE9Ty2Jn9zlS+4lMuhczVwt6vLECozS4gen2HBxZqRYMQZs4PLiQfDRor428VOt
 jrL/usHBeFf6yxb73MnePl/j9uNVHz5HCD7J7ahHrWnSod5zg1zslKpZvfcTB7jr3fL/nZUNS
 DRk1T1TTfn+yQwOvjgPcg7QmUWS51QreP/8LE/Jr14XCD2hzI3D/HXEcX4JyqIEFWlGSn+yQr
 P6uAgYznIM91h8KmIbvnIDYPunSRbZQ63pnG6qyVwNzwEkaudDdcjb0XuzbYo0EuIjB63Y+oq
 wfPQdFYB7N4TCAI2hGwQj0uu+S3L9HEFUq+QOrzxKIXVxEtQOfdJDMTKBQnXh+Ksq0Ad4bnbO
 EYKhSR5fuzwfqyB6W2iNaH3jC2yK/NDuguvUNVg9C1WAhEbFg2130Cw6LCdd9cO1LXsz0wiDR
 R4YTQqs6IzqqclRXCjbLr1+BGmpT34X3mFRdG3PURwno8vbnkDHti4Lk7YRjK2NfVXnOc/ltC
 dv6jEPY+qdQrriyaBoqlxI18v3vyavUUdqPGNv4+/FDDIBHAXhuUrYVWmE0o79XdDUqKOjwzl
 l48hOUUJ/eXuEkzRh83RX3Vx3fJ6QuH1GqbOW6KAXy4DrDyW0Ugk+pYp3+s++oDkNPj/hEPg3
 i04Vbeux4e+SAv3FMU3kXc6iy3GWqpNCROQ0EpIrbYrkCLGOGjSYgaco4bsLw+8OEVfZ5ijId
 02uEBDBytXtqyqMcHWTNwRssfUuhAJKgoLIKyy9Tz7pnSHnh6jwQUbPmGPkizq0wI/+RMhqMR
 q0BnMBiB2JikUt42kstYFKVO5v/hDOm19tHKC2KELhLTLwg4y8=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move gpio/intro.txt to driver-api/gpio/intro.rst and make sure it builds
cleanly as ReST.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/gpio/index.rst                    | 7 +++++++
 Documentation/{gpio/gpio.txt => driver-api/gpio/intro.rst} | 9 +++++++--
 Documentation/gpio/00-INDEX                                | 2 --
 3 files changed, 14 insertions(+), 4 deletions(-)
 rename Documentation/{gpio/gpio.txt => driver-api/gpio/intro.rst} (96%)

diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 6dd4aa647f27..db47d845f473 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -2,6 +2,13 @@
 General Purpose Input/Output (GPIO)
 ===================================
 
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   intro
+
 Core
 ====
 
diff --git a/Documentation/gpio/gpio.txt b/Documentation/driver-api/gpio/intro.rst
similarity index 96%
rename from Documentation/gpio/gpio.txt
rename to Documentation/driver-api/gpio/intro.rst
index cd9b356e88cd..74591489d0b5 100644
--- a/Documentation/gpio/gpio.txt
+++ b/Documentation/driver-api/gpio/intro.rst
@@ -1,3 +1,8 @@
+============
+Introduction
+============
+
+
 GPIO Interfaces
 ===============
 
@@ -9,9 +14,9 @@ Due to the history of GPIO interfaces in the kernel, there are two different
 ways to obtain and use GPIOs:
 
   - The descriptor-based interface is the preferred way to manipulate GPIOs,
-and is described by all the files in this directory excepted gpio-legacy.txt.
+    and is described by all the files in this directory excepted gpio-legacy.txt.
   - The legacy integer-based interface which is considered deprecated (but still
-usable for compatibility reasons) is documented in gpio-legacy.txt.
+    usable for compatibility reasons) is documented in gpio-legacy.txt.
 
 The remainder of this document applies to the new descriptor-based interface.
 gpio-legacy.txt contains the same information applied to the legacy
diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 179beb234f98..52fe0fa6c964 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -1,7 +1,5 @@
 00-INDEX
 	- This file
-gpio.txt
-	- Introduction to GPIOs and their kernel interfaces
 consumer.txt
 	- How to obtain and use GPIOs in a driver
 driver.txt
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
