Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6C687D0F3
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 03:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754761AbeCSDe4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 18 Mar 2018 23:34:56 -0400
Received: from merlin.infradead.org ([205.233.59.134]:44418 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754383AbeCSDez (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Mar 2018 23:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VzxgkovH5sgJvf5eCeH1AHc4q0x0VUgUpv1TPN7mYfs=; b=bx7cla0sb8Ie1Paz08NGm+byaP
        j6lmAdNZO+OQz+QEE8UZPVn3vKjSJsv7WLMOgwL8aMK3zxQdSXDQokonVfXbNzHsN81v4IAgbBrWB
        RTsMILGCN4C9OK8btSYjxJvtVJTEC5bihfyIMaw88hAMqTf0oOqb4o/yKDJV+NPMouM/5aerx7Qdp
        WE4JYESyQ/mXy0Jz3GbnMT0gpewc0KzzmmcE7RjLytX0hMJbXN91ooIxeMpVNVc/TCl6EVvWNh1zl
        /9gjNhoi4GSL1jaJCl8l8iWN2OuBlwzlN+IEeZTTh3H2qfBy9f69+Pk/DqPnWMsHD0i1CsWMeC9Yc
        +lL8+UJg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1exlZW-0005dw-0x
        for linux-doc@vger.kernel.org; Mon, 19 Mar 2018 03:34:55 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: another DECLARE transform needed
Message-ID: <79b77d61-d0e3-9b59-caa6-17ad93a281c7@infradead.org>
Date:   Sun, 18 Mar 2018 20:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey,

I've been struggling with this for awhile so I might as well just ask for help.

../include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
../include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'

This comes from:

struct phylink_link_state {
	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
	__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising);
	phy_interface_t interface;
	int speed;
	int duplex;
	int pause;
	unsigned int link:1;
	unsigned int an_enabled:1;
	unsigned int an_complete:1;
};

where __ETHTOOL_DECLARE_LINK_MODE_MASK() is basically a DECLARE_BITMAP():
(from include/linux/ethtool.h:)

/* number of link mode bits/ulongs handled internally by kernel */
#define __ETHTOOL_LINK_MODE_MASK_NBITS			\
	(__ETHTOOL_LINK_MODE_LAST + 1)

/* declare a link mode bitmap */
#define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)

I have tried multiple string substitutions but they have all failed, so if anyone
can make it work, please do so.

thanks.
-- 
Here's my current patch:
---
From: Randy Dunlap <rdunlap@infradead.org>

Add support for __ETHTOOL_DECLARE_LINK_MODE_MASK() as used in
<linux/phylink.h>.

../include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
../include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 scripts/kernel-doc |    2 ++
 1 file changed, 2 insertions(+)

--- lnx-416-rc6.orig/scripts/kernel-doc
+++ lnx-416-rc6/scripts/kernel-doc
@@ -1020,6 +1020,8 @@ sub dump_struct($$) {
 	$members =~ s/\s*CRYPTO_MINALIGN_ATTR//gos;
 	# replace DECLARE_BITMAP
 	$members =~ s/DECLARE_BITMAP\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[BITS_TO_LONGS($2)\]/gos;
+	# replace __ETHTOOL_DECLARE_LINK_MODE_MASK
+	$members =~ s/__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([a-zA-Z0-9_]+)\)/unsigned long $1\[BITS_TO_LONGS\(__ETHTOOL_LINK_MODE_MASK_NBITS\)\]/gos;
 	# replace DECLARE_HASHTABLE
 	$members =~ s/DECLARE_HASHTABLE\s*\(([^,)]+),\s*([^,)]+)\)/unsigned long $1\[1 << (($2) - 1)\]/gos;
 	# replace DECLARE_KFIFO


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
