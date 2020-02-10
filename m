Return-Path: <SRS0=rYvz=36=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5776AC35254
	for <linux-doc@archiver.kernel.org>; Mon, 10 Feb 2020 03:33:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EE092082E
	for <linux-doc@archiver.kernel.org>; Mon, 10 Feb 2020 03:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LPXf0Pu+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJDdz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Feb 2020 22:33:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38796 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgBJDdz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Feb 2020 22:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=oRncvvmdgzXVF74B2wNtnPNmk7OdUtgqFN0vjqZU07o=; b=LPXf0Pu+YReu2OTEL9wFRRRWR+
        5iNe32ZB4twnDYQ9AsDk8e1nwrEJVPAqEOwmJ/F3vgizml83pkXK/7zKYhr3LEDb/et26QQiutLov
        taJkGTJ9z3E+l0tFA6RKcJ1RLI4qVszeriQST7yy/S6vceUJ2OlFidvMlWUKwtFgfX1DFH8epelmX
        6oFzm0c0AFOPKLsiZ8VOvHcPEsfY11pDJDAYMac8/IORVi4LVgdDvnD//ErjWl5EAMzqTyzgSoKJp
        +Tafanbwkcur9WLTZb+7GJb8FoNSQWTQIExvnB6PU6RR+7KUCR1hygf8fZ4F11v6cTBNPvycytqHp
        OFkh6idQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j0zpZ-0001kt-Ra; Mon, 10 Feb 2020 03:33:53 +0000
To:     Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: fuse: fix Sphinx directive warning
Message-ID: <1f114330-bd67-bc07-912e-90432786b6b4@infradead.org>
Date:   Sun, 9 Feb 2020 19:33:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix a documentation warning due to missing a blank line after a directive:

Documentation/filesystems/fuse.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org
Cc: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/fuse.rst |    1 +
 1 file changed, 1 insertion(+)

--- lnx-56-rc1.orig/Documentation/filesystems/fuse.rst
+++ lnx-56-rc1/Documentation/filesystems/fuse.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 ==============
 FUSE
 ==============

