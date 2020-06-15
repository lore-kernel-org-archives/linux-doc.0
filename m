Return-Path: <SRS0=jz+U=74=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1931BC433DF
	for <linux-doc@archiver.kernel.org>; Mon, 15 Jun 2020 06:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E421820738
	for <linux-doc@archiver.kernel.org>; Mon, 15 Jun 2020 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592203760;
	bh=Gw7wbqH2xsyBdC3kf/3jqvxF7UQqM1IL2xDyERsgPCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Ntx24CEL6kZlel4bUBIaN1sWPc04D89l7PJk5PhN0upRVRZR7dRQv2EdylSyYvSZO
	 9+E9T2Du2tXq3tH9uKjLkA2exNXDfkX6FbAq5pLmsH6tJRaWsR/OdqFvw4GBilLIN0
	 rZhQZENzK5PqbPWCp8ybahxB18326stR6Pe6pz54=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgFOGtT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:49:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:59944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728451AbgFOGrN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Jun 2020 02:47:13 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA8AA20882;
        Mon, 15 Jun 2020 06:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592203632;
        bh=Gw7wbqH2xsyBdC3kf/3jqvxF7UQqM1IL2xDyERsgPCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=neY+81W9unf+I5D/a/S2/OkIXQrXCo9MYqNQMXF0AY36dbwxxC/4MxavNW66GGbR2
         ukdAUi3u+XmTWqOmOdq8x/hvpCwLaY2ELe8cXOpLCEtvYGCPBZ5dqQFscHDdB2wO9I
         35pLQDirZpJePekog8qnYZ4htWw9LNrdJoNlM96E=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jkiti-009nnN-0n; Mon, 15 Jun 2020 08:47:10 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 19/29] docs: driver-model: remove a duplicated markup at driver.rst
Date:   Mon, 15 Jun 2020 08:46:58 +0200
Message-Id: <32a1f8cadbe2800e545add9913c5a12e2b131b31.1592203542.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The "::" markup is there twice, causing a warning:

    Documentation/driver-api/driver-model/driver.rst:233: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/driver-model/driver.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/driver.rst b/Documentation/driver-api/driver-model/driver.rst
index 7d5040f6a3d8..06f818b1d622 100644
--- a/Documentation/driver-api/driver-model/driver.rst
+++ b/Documentation/driver-api/driver-model/driver.rst
@@ -228,8 +228,6 @@ over management of devices from the bootloader, the usage of sync_state() is
 not restricted to that. Use it whenever it makes sense to take an action after
 all the consumers of a device have probed::
 
-::
-
 	int 	(*remove)	(struct device *dev);
 
 remove is called to unbind a driver from a device. This may be
-- 
2.26.2

