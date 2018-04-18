Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EBF997DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 10:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751836AbeDRKcG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 06:32:06 -0400
Received: from ns391626.ip-176-31-99.eu ([176.31.99.217]:44761 "EHLO
        ns391626.ip-176-31-99.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751870AbeDRKcF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 06:32:05 -0400
X-Greylist: delayed 499 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Apr 2018 06:32:05 EDT
Received: by ns391626.ip-176-31-99.eu (Postfix, from userid 1000)
        id 69A8B15FBBF; Wed, 18 Apr 2018 12:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigexec.com; s=mail;
        t=1524047510; bh=Of270wz88M3APV/Znv67CNkAuZL51pmttuxdTKUq9rI=;
        h=From:To:Cc:Subject:Date;
        b=ag60pbHM219Da1iFsBsEJcOeV7AtIBIp6/I1fOAI2DBcFg87v768/zXEYTw/xOtQr
         OipUEWWt5YzThkMPgOTB3ndtPGfG9eT1TB6z9Qstb1hgPEE3G9ft3q1RWZHqVFMSWR
         8Vl6S6m95xD0DZVQ3xhB4+j6IJEbPtzwzOqCsOqQ=
From:   Olivier Gayot <olivier.gayot@sigexec.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Trivial Patch Monkey <trivial@kernel.org>,
        Olivier Gayot <olivier.gayot@sigexec.com>
Subject: [PATCH] docs: ip-sysctl.txt: fix name of some ipv6 variables
Date:   Wed, 18 Apr 2018 12:31:34 +0200
Message-Id: <1524047494-32679-1-git-send-email-olivier.gayot@sigexec.com>
X-Mailer: git-send-email 2.1.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The name of the following proc/sysctl entries were incorrectly
documented:

    /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_number
    /proc/sys/net/ipv6/conf/<interface>/max_hbt_opts_number
    /proc/sys/net/ipv6/conf/<interface>/max_dst_opts_length
    /proc/sys/net/ipv6/conf/<interface>/max_hbt_length

Their name was set to the name of the symbol in the .data field of the
control table instead of their .proc name.

Signed-off-by: Olivier Gayot <olivier.gayot@sigexec.com>
---
 Documentation/networking/ip-sysctl.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 5dc1a040a2f1..b583a73cf95f 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -1390,26 +1390,26 @@ mld_qrv - INTEGER
 	Default: 2 (as specified by RFC3810 9.1)
 	Minimum: 1 (as specified by RFC6636 4.5)
 
-max_dst_opts_cnt - INTEGER
+max_dst_opts_number - INTEGER
 	Maximum number of non-padding TLVs allowed in a Destination
 	options extension header. If this value is less than zero
 	then unknown options are disallowed and the number of known
 	TLVs allowed is the absolute value of this number.
 	Default: 8
 
-max_hbh_opts_cnt - INTEGER
+max_hbh_opts_number - INTEGER
 	Maximum number of non-padding TLVs allowed in a Hop-by-Hop
 	options extension header. If this value is less than zero
 	then unknown options are disallowed and the number of known
 	TLVs allowed is the absolute value of this number.
 	Default: 8
 
-max dst_opts_len - INTEGER
+max_dst_opts_length - INTEGER
 	Maximum length allowed for a Destination options extension
 	header.
 	Default: INT_MAX (unlimited)
 
-max hbh_opts_len - INTEGER
+max_hbh_length - INTEGER
 	Maximum length allowed for a Hop-by-Hop options extension
 	header.
 	Default: INT_MAX (unlimited)
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
