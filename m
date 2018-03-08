Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7CDA07E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 23:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751616AbeCHXlc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 18:41:32 -0500
Received: from mout.gmx.net ([212.227.17.21]:53493 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751574AbeCHXla (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 18:41:30 -0500
Received: from latitude ([88.153.6.235]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mh9cj-1fFku70I8P-00MNU6; Fri, 09
 Mar 2018 00:41:10 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH 2/8] Documentation: driver-api: Move gpio.rst to gpio/index.rst
Date:   Fri,  9 Mar 2018 00:40:18 +0100
Message-Id: <20180308234024.24145-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:VDAzRHM8LKEcX/zaXEAkD04gHlvpcQUPyGpsUCn0SYmGuU26pg1
 gw6jBekiTEZaFSp73vpH73HJafjVYGXz+IzwcPOrLi9hFYVbD77VuzGhuenZ5ZNoCBNWVl/
 o5bRlyK175uKqS+OrmOf2Tgw5mUKgxXDSRFidbqTJKxyMEyiZy5sXeeWl6URxH1ekrgtB0u
 WDIhJedODgwbgtQ8Zwgwg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:yRef1sQjel0=:2CamwxpMHr8Uofyx3EiCiO
 LiZtqKc34knkDqPEbgsdy9uUdbFR73dtl0OEuU4dwr+i/ZLZCA4W7xi/fLk6ToomadERvPqGa
 ZYPRMLjpIkOuz+eY2IaxBNb+9hMMSd9//0A8KbtIidKXffSmpvfHP1616+Z4B6A9raF6gtko/
 CFzoXl9M+vHL5143y8hAdPo7R2SYDGxFwHUTylkET5KWUpph9gmVgpcwr7PS9JVJaS+guinS1
 BGE/pL3UEYJzdzp/50PX6jWVCLOjI5zDZi1GUame1kCEfRUgDhEwUk7+yM/9vRDvOf4Ouk+Fu
 bq04+M8eWe2k4Nd4fJz9UxwweEZXOrGHLgzcLVyaiX/OBQUCS7ozXkkZcDbRbl/eWxKJUGuEn
 Lsw6ja730fyFs9SGlm4eMF54AdmCh9KemOpTY539fcMMP9JN5ZqXYDWY2IiKBFa4CWN2bU9SC
 k5P5i/rfLw2nQ1XSi5A3QbQPBVR+rXUE49N1u4rcU3vnhe5f9e6m6BHky1sK+2aRk1lyJg2hJ
 4uIAP56pv/6KPjfsD7YEyMSZEw5jxdlTWelNfpnxu9A2LinxPRADgTCT/GmwP16IMULw3+L1I
 smo8+Emlr0MzvsKw9QDXVJJ7AqbosU4pKGI//JrK6bH2rYfQnn7pf07ZZ2whS3OLLKfGwOYUk
 OU9V3ZSvXrVwWmixXuWHO5KSriK1X4u7Wzqvu3lco+uVSCyScUrRAJ65Z5mOoQWozxZ0hX2xE
 UmJ6HFSTaL2rtnGPiVBJrWQ2+iDaZaMSYsNAUgP84AtMR3Ahpfh5YwyAx3XjiE0NTH8TvkYCf
 t7X2D5Ru3hqTROLM83EAYcRBku/fP0SUGIbhPc7LTfhDv2hI9w=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To make space for more files in the GPIO section, create a
Documentation/driver-api/gpio/ directory.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/{gpio.rst => gpio/index.rst} | 0
 Documentation/driver-api/index.rst                    | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/driver-api/{gpio.rst => gpio/index.rst} (100%)

diff --git a/Documentation/driver-api/gpio.rst b/Documentation/driver-api/gpio/index.rst
similarity index 100%
rename from Documentation/driver-api/gpio.rst
rename to Documentation/driver-api/gpio/index.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 62d056471c0d..9b54fb99d9ca 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -45,7 +45,7 @@ available subsections can be seen below.
    uio-howto
    firmware/index
    pinctl
-   gpio
+   gpio/index
    misc_devices
    dmaengine/index
    slimbus
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
