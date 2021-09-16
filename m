Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3412C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEF5D61214
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbhIPJBn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:36142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235458AbhIPJBX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:01:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D493961354;
        Thu, 16 Sep 2021 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631782803;
        bh=VU1FdXfqgwu2xC6IKLl/1hUB4FG2TU42WbTm0oHgE54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AXT6N/DlrE3BQvPqrYwCH49iHwVC+qvwgGXh2B1+gEd/oxBtuU1uWtBn+HtKRJfx/
         VZl4uoCoiXF8PARxTQaSTpSSPctvEPNzGPH1M+zSdPOTD3zAcrZh6f5n+QDOvkJB0I
         HaMd2u956CVZuHQ3n9Gd45/D3gFI+x9MLIzq4ckaQJtG33Xje8w5ZnVMCmRDEsMCid
         BuJ8xruJTMJ2XUljyLvKkRZ0q9hfW3Q+ZAmCeX+vuhhpcr3pgiYMWXvECENVzrtUUO
         8Ja1mpmRf8HA+9+ynrWi85fbiHKCuKKpGbhQBA431u+D6vLiOnOrne4JAsYwAKv2JD
         efsTx+2FKNhLg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnFR-001qke-1z; Thu, 16 Sep 2021 11:00:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/30] ABI: sysfs-class-gnss: use wildcards on What definitions
Date:   Thu, 16 Sep 2021 10:59:44 +0200
Message-Id: <80b7f60a6bac7bb1938d60dca509d75dff3c2c62.1631782432.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631782432.git.mchehab+huawei@kernel.org>
References: <cover.1631782432.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An "N" upper letter is not a wildcard, nor can easily be identified
by script, specially since the USB sysfs define things like.
bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
to convert it into a Regex.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-class-gnss | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-gnss b/Documentation/ABI/testing/sysfs-class-gnss
index c8553d972edd..9650f3a7fc03 100644
--- a/Documentation/ABI/testing/sysfs-class-gnss
+++ b/Documentation/ABI/testing/sysfs-class-gnss
@@ -1,4 +1,4 @@
-What:		/sys/class/gnss/gnssN/type
+What:		/sys/class/gnss/gnss<N>/type
 Date:		May 2018
 KernelVersion:	4.18
 Contact:	Johan Hovold <johan@kernel.org>
-- 
2.31.1

