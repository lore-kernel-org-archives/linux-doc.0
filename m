Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 92FDE7E3B8
	for <lwn-linux-doc@archive.lwn.net>; Tue,  7 Aug 2018 15:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389071AbeHGRnU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 7 Aug 2018 13:43:20 -0400
Received: from merlin.infradead.org ([205.233.59.134]:49454 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732639AbeHGRnU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Aug 2018 13:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UlX391ggfhG0+L4Tqb1D4ZCEa9Bonhae3voBIXL1bBY=; b=a1A5IHnfbSADfbTT3FhnEK2X5S
        H08hkmqFPVPpqa7jfHfuSe02abSjwc9y9D7f8jyLgD81Vm2xBB/LAJd4i8Ds0sGBTz8HXE7Qk0po3
        +2IxROGcKwQW1QlgdwIYize+jNYvrgl0jrY06bcql3d/p0Mm5YMOCtVaFITtZPF7Os5y/NjO02tX5
        z7rTgNDOjmzUvZe+3b+KoGiSXfpamRspkNmKoQRPy3drGX9g9pOh+IB2h5huNyXgUdMyugdgGMSe8
        YG9dHo18mC7u8iuviJhAFyckz1JAPZuqALLfCF5Y2+aF/eZ8bdN9B2pj5mFz9TNg8cgfdxGGLlALH
        iQVwSsJA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fn3uM-0000sS-FU; Tue, 07 Aug 2018 15:28:26 +0000
To:     linux-media <linux-media@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: add ioctl number entry for v4l2-subdev.h
Message-ID: <7f05c67a-c8a7-e3a0-c76f-3b8acffdf41f@infradead.org>
Date:   Tue, 7 Aug 2018 08:28:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Update ioctl-number.txt for ioctl's that are defined in
<media/v4l2-subdev.h>.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/ioctl/ioctl-number.txt |    1 +
 1 file changed, 1 insertion(+)

--- lnx-418-rc8.orig/Documentation/ioctl/ioctl-number.txt
+++ lnx-418-rc8/Documentation/ioctl/ioctl-number.txt
@@ -274,6 +274,7 @@ Code  Seq#(hex)	Include File		Comments
 'v'	00-1F	linux/ext2_fs.h		conflict!
 'v'	00-1F	linux/fs.h		conflict!
 'v'	00-0F	linux/sonypi.h		conflict!
+'v'	00-0F	media/v4l2-subdev.h	conflict!
 'v'	C0-FF	linux/meye.h		conflict!
 'w'	all				CERN SCI driver
 'y'	00-1F				packet based user level communications


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
