Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DEFAC7DF87
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Jun 2018 12:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751784AbeFDMKj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Jun 2018 08:10:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:56751 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751473AbeFDMKi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Jun 2018 08:10:38 -0400
Received: from localhost.localdomain ([122.224.77.194]) by mail.gmx.com
 (mrgmx003 [212.227.17.184]) with ESMTPSA (Nemesis) id
 0MfEZG-1ffq621n6g-00OsP3; Mon, 04 Jun 2018 14:10:29 +0200
From:   Chengguang Xu <cgxu519@gmx.com>
To:     ceph-devel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     zyan@redhat.com, idryomov@gmail.com, corbet@lwn.net,
        Chengguang Xu <cgxu519@gmx.com>
Subject: [PATCH] doc: update description of ceph mount option
Date:   Mon,  4 Jun 2018 20:10:05 +0800
Message-Id: <20180604121005.24471-1-cgxu519@gmx.com>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:nbMRJmjZ+RpZrcI1h2Ezo84sc4OfcbJaXvJ14O6aFnJ742WvbcW
 dBfrfYuW4AstcHjfvc5OLeXN9vg6GAn+dxjOHCTseoGZCCm1cbBGigOwBpOUnj3ezzke78N
 NOd94A3lC7H92T71eZy+wE2UMkj5C/RM5EMWACOI6if1waYp2JTqZnycLNIKQqdPw58Mjdv
 kdOpq08RZZPzV/ftnF3hg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9QAink2Zcbc=:3B//Pkld2dAH9oFqH+LZST
 ugoOZoOzhnx758D+kD7JQxVp6vcFqjpmWAoh4pUoZaaXHyf5JAI246l8DwZRQJYVmEQ7l6B+4
 ehbyHIKO9aoFuL2aBoTcfUKTa2zbIC2tZtWCg2f+s4NFFlHNM1J0kXii4hCXHxSWtvYMb/JeL
 6A86ODWnjqrCqZUPcxvqCStULoImLA5cScc+LvKAigcAAbr4KGWMvlmlt5pwoUaFGbk2NuXx+
 j7UpG/pIPCr2IlV2Fl3L3K/UHpkoyb83K3NE4N/eBXB+73aVy4wlnmik5p8XHTBBh2lcYr0xg
 FK/VUUv4yxqp8K1GWTXF41ypwq+Pr8HxKecA8yt7KKme0Wh/9QpfoPiee9AlKGQSw6yyOoD4S
 +bj1TtqxCcak1+IaQO0Pm1E/hNOSaAuCi6DFNRx/wax4EMwNV65v92ibS39cVB4RdsOUVjYA/
 7a0hYcl5VRdYq3fJ48h+bFtmRVLR7MpJiLxL3tqMYyqlq3kBqcFuqAAxtqJpJnmjjd5+f2Mjb
 /2K4C9FhZgt9N1u8nfCPUPLu6HuwGe7Yx/aSp/1/eyiVQQrctAfMxMbRG4tE1BoDwBsiHKkVu
 4Cg7aEA3fbXEMOFvyPslvmmQ11NeWryQzJQu33nPzdVamYgZXyAxDzgDNpnAd2D+sB578tG4B
 kQWh7Xso1f1uVIlIrJemwV2sbaXYMyv0iO1m2yidO5GjD6ul0NVpyMzp2Pr1rqjqWhZOaDonj
 pebVqRg8TGD1LgySzV6ODbQrFbaAF8BxR2LadgFC74ROxCIWe2o3IoXeS0Q=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Based on code, default value of rsize/wsize is 16 MB.

Signed-off-by: Chengguang Xu <cgxu519@gmx.com>
---
 Documentation/filesystems/ceph.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/ceph.txt b/Documentation/filesystems/ceph.txt
index d7f011ddc150..8bf62240e10d 100644
--- a/Documentation/filesystems/ceph.txt
+++ b/Documentation/filesystems/ceph.txt
@@ -105,15 +105,13 @@ Mount Options
 	address its connection to the monitor originates from.
 
   wsize=X
-	Specify the maximum write size in bytes.  By default there is no
-	maximum.  Ceph will normally size writes based on the file stripe
-	size.
+	Specify the maximum write size in bytes.  Default: 16 MB.
 
   rsize=X
-	Specify the maximum read size in bytes.  Default: 64 MB.
+	Specify the maximum read size in bytes.  Default: 16 MB.
 
   rasize=X
-	Specify the maximum readahead.  Default: 8 MB.
+	Specify the maximum readahead size in bytes.  Default: 8 MB.
 
   mount_timeout=X
 	Specify the timeout value for mount (in seconds), in the case
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
