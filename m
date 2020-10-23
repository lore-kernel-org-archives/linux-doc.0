Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C949CC55179
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72A9F241A3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470983;
	bh=ik6XN/F9Yil/xxoz9W54cw08G8P+2xMgKORme/cmGbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GBJ5VIxrgHotpWgVEd9uMe63Ih4xu6L7XHXXRW6RDnmmIDHQkSvATgmupycLzLQHA
	 VWwdfxbIco6v6LFZ7bpBpqr41zdxoBUGr0ZZlt4RiXhio0vP5SkK2Syw8uFMF607jE
	 /6/NfjdCbvFxjdc0R+Jf/R+BiBH23O0Ej01Nmysk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465798AbgJWQgW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:36:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751853AbgJWQdu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:50 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CDBB246BC;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=ik6XN/F9Yil/xxoz9W54cw08G8P+2xMgKORme/cmGbE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kCRWEuzHM6GkSZ1YvcZDl2Wletm6F+MvgN8ayvb3mjkVpHEM4BcByqkPa+uJ8O69E
         l1DvvtayM6aC40idBS6fnyZshtpsIMqYay6TK3FtPAejKfT46t82VeMsusJ5bjLD4+
         g6n4VqbwA6INoTLs8l/xkwZ2BSDmPp8tRMpKWYlA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002AxH-Dm; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 42/56] lib/crc7: fix a kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:29 +0200
Message-Id: <a8da359243b9b76f53e545682f1897e1c2b81963.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A function has a different name between their prototype
and its kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 lib/crc7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crc7.c b/lib/crc7.c
index 6a848d73e804..3848e313b722 100644
--- a/lib/crc7.c
+++ b/lib/crc7.c
@@ -51,7 +51,7 @@ const u8 crc7_be_syndrome_table[256] = {
 EXPORT_SYMBOL(crc7_be_syndrome_table);
 
 /**
- * crc7 - update the CRC7 for the data buffer
+ * crc7_be - update the CRC7 for the data buffer
  * @crc:     previous CRC7 value
  * @buffer:  data pointer
  * @len:     number of bytes in the buffer
-- 
2.26.2

