Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C0C47D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 14:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfADO3C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 09:29:02 -0500
Received: from mout.gmx.net ([212.227.15.15]:43319 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbfADO3B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 09:29:01 -0500
Received: from localhost.localdomain ([113.116.156.175]) by mail.gmx.com
 (mrgmx003 [212.227.17.184]) with ESMTPSA (Nemesis) id
 0Lcjgd-1h3zyq3275-00kATP; Fri, 04 Jan 2019 15:28:32 +0100
From:   Chengguang Xu <cgxu519@gmx.com>
To:     jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Chengguang Xu <cgxu519@gmx.com>
Subject: [PATCH] doc: fix typo in Documentation/hwmon/f71882fg
Date:   Fri,  4 Jan 2019 22:27:22 +0800
Message-Id: <20190104142722.24824-1-cgxu519@gmx.com>
X-Mailer: git-send-email 2.17.2
X-Provags-ID: V03:K1:xz1/smTw/HBcidYnmIVKOVUA11+I73xEF+Hgk0j1DsVZx5Gylfa
 OUNmnWoTwqL2vVr/lm1has9rOnnLRUWN9PamObOaf3rP27d3F3NJzTslI9a6L+gL/6vFmYr
 arv1b7bNWo8kJMOrEU4gbnD9kMDreGjwHBkd2TH8oYf83HhyVEyaPyerfOMKG4+unJlImbU
 /L8QxHxrlZqvGHZA7XqjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G/u/0qwK0+o=:/HIXn5qiGRbPCT5I5eZx4j
 r+hpV1LRKHz2lcTfKkqhR5q7sJm6C4IgvfPxiLE8j3t07k3eqJ5FzeovTrB4kBwegQa9z4Rei
 CiUz0JVKVFYrCzhEDJ4dbQXPhuAbo2TouhicOZ1MLUdriFog5Zn9X+rDLZArErltI80eCa/WS
 JwsZ7froge31B2YIbtGJnqmlqTYvvhhugcFmXKfm+0hYNu2rZ74OE1hT+QD3HheajgqILfwPe
 0MG+BhOGtVEtUbnsls+Hx3V723Tx4/Im5tQDrBh5ALefw5EM0ecY9s6+ISHaUwy8iHzPEL4/k
 BIq1CQRVePfFnvxNfqHs5XolIo+6rrHxovCaWfC6Y3EhXoQvAA8CErlEidUIKVvvy46h7vcUn
 ZEDvbMG1Ac1yQbT2hpo79j+b8hE53cZcKcOoRMAKpL7XW63JmdT9vIaxKBIl7sNjYaVRZfQci
 rarwWbbLNrJlfCC7DWZ4a17KRUo5tYtovH6/KbSUvgYB1gkpqUNwsMA68e6a5UTOEVKOvrrNm
 8efYbMj7Og79TdkXP2LTl4SpWifBoh/TBDcOuK7EpdnbeHfFUoe0viblBVFw7ECMY8e6KwVO9
 l0/DQDz9jpsmO2CCzZvOiS8hxvh1FnxyFJ6DKYOjG8ECk+fywEKDAaKsGmUemFGcSIC9COG2A
 lm8O0dUknv3ErVUcAgARUks1oVhL2lRqb2jofzM3Fdw/OYJTsCXl7XabV/uTfwQ8huljTl/El
 Fkq7npiWAxjeFj/8zvN8ck9jKMRnfrs9PHXqu2zEdIJU6bFv9g6+shW0ooR10lCXjTCyVLEpy
 GUsWT33hynzNl5lbElolaCu0pMcrBJCk7i+De9Cp3mBUkb2J3GN+WIzU2MzJwzxltTfJvSHzz
 uhi5KqGKapbZEnmXN3DYJkqJGBJDhX/LV1aebjv6k=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just fix a typo in Documentation/hwmon/f71882fg.

Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
---
 Documentation/hwmon/f71882fg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/f71882fg b/Documentation/hwmon/f71882fg
index de91c0db5846..4c3cb8377d74 100644
--- a/Documentation/hwmon/f71882fg
+++ b/Documentation/hwmon/f71882fg
@@ -94,7 +94,7 @@ Note that the lowest numbered temperature zone trip point corresponds to
 to the border between the highest and one but highest temperature zones, and
 vica versa. So the temperature zone trip points 1-4 (or 1-2) go from high temp
 to low temp! This is how things are implemented in the IC, and the driver
-mimicks this.
+mimics this.
 
 There are 2 modes to specify the speed of the fan, PWM duty cycle (or DC
 voltage) mode, where 0-100% duty cycle (0-100% of 12V) is specified. And RPM
-- 
2.17.2

