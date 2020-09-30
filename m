Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290A4C4727E
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA832075F
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601472477;
	bh=KEhDi0VPgM7hCIhR/9xG2Kx3ZY+OBLtU3k7jdAK2xak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=FKFJfp+oNq/AhbFKvuMmLbUu31dMp7exdWwict2ZAob3qQZYgZLgxpMY2kj/ukoFx
	 wSMLd51MGVmvhtvPv0xFt//rGpWBJXy4cawn4z21aiW6UeZOcYtp7AidpyWVPIG823
	 3PYvXDf1K8CEV84o3aTlkjWosaUhODbq7Wb5bDRk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbgI3N1p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:27:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730228AbgI3NZW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB0C820759;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472321;
        bh=KEhDi0VPgM7hCIhR/9xG2Kx3ZY+OBLtU3k7jdAK2xak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wlJANg0GOqkONoLFaERzXXRasoKCQRkh86SxOYUOWKzxw0WRy8jHMHK8VulU3JOYF
         ZNzJfkdFYqMxU/HUkniVr7t3K4DXgkNeOzbSbveuFQTiTZnlHiOUp1QKcX8LlyQE/1
         wyjGA157Ti/LiAkFvcEqmyImBS3EDa9XjcWoMyYU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6h-001XKD-0x; Wed, 30 Sep 2020 15:25:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 31/52] docs: device_link.rst: remove duplicated kernel-doc include
Date:   Wed, 30 Sep 2020 15:24:54 +0200
Message-Id: <432ab85d294936e5e9f39524efc7a3a55cd3df2e.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The infrastructure.rst file already includes the external
symbols from drivers/base/core.c.

Duplicating 3 functions there causes namespace collisions:

	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_state'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_add'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_del'.
	Documentation/driver-api/device_link.rst: WARNING: Duplicate C declaration, also defined in 'driver-api/infrastructure'.
	Declaration is 'device_link_remove'.

So, drop the reference, adding just a mention to the functions
associated with device_link.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/device_link.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/driver-api/device_link.rst b/Documentation/driver-api/device_link.rst
index 76950d061632..ee913ae16371 100644
--- a/Documentation/driver-api/device_link.rst
+++ b/Documentation/driver-api/device_link.rst
@@ -317,5 +317,4 @@ State machine
 API
 ===
 
-.. kernel-doc:: drivers/base/core.c
-   :functions: device_link_add device_link_del device_link_remove
+See device_link_add(), device_link_del() and device_link_remove().
-- 
2.26.2

