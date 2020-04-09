Return-Path: <SRS0=w6yw=5Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79ABC2BA19
	for <linux-doc@archiver.kernel.org>; Thu,  9 Apr 2020 21:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75B05208FE
	for <linux-doc@archiver.kernel.org>; Thu,  9 Apr 2020 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586467325;
	bh=u60WH+x0e0iq4HTVQItM5Z+hGRW7Itf6Qjmd2opgtgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=iXTuq01SIDZ1ok92lX6LTV6MZv44Al4zDbQe9EThzHG3KnSZK0vIG5n2rDciCAvRV
	 6I1uQsW/sZ+9CjEG6ke8YcB8XGErjcmsH7+9+bgjOviLko2JHbAR0ASUbEhWZmQFwV
	 DIrkqIUFVjFOSB0DZi970j9DRutDqMW33OxB5W7k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgDIVWE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Apr 2020 17:22:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbgDIVWE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Apr 2020 17:22:04 -0400
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 249932087E;
        Thu,  9 Apr 2020 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586467324;
        bh=u60WH+x0e0iq4HTVQItM5Z+hGRW7Itf6Qjmd2opgtgo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HKbY4FBsQ6Hvjh5j0D7ztzlLwb2JH9zCq0yA3DsF5yU0hjB0sbAAl/CjnWpZrhCba
         J4OH2MFggONrL3hIVjbUoG8Aq9IuvMu+7F+wkrWG9Wa2GX5aT7PF1AA4LFvpBWvCiG
         S1XGKXuOv3bQLAE1q7sJQ/D79COYdI3AKn38bwCM=
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        rdunlap@infradead.org, talgi@mellanox.com, leon@kernel.org,
        jacob.e.keller@intel.com, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 2/2] docs: networking: add full DIM API
Date:   Thu,  9 Apr 2020 14:21:59 -0700
Message-Id: <20200409212159.322775-2-kuba@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409212159.322775-1-kuba@kernel.org>
References: <20200409212159.322775-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Add the full net DIM API to the net_dim.rst file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
---
 Documentation/networking/net_dim.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/networking/net_dim.rst b/Documentation/networking/net_dim.rst
index 1de1e3ec774b..3bed9fd95336 100644
--- a/Documentation/networking/net_dim.rst
+++ b/Documentation/networking/net_dim.rst
@@ -168,3 +168,9 @@ usage is not complete but it should make the outline of the usage clear.
 	INIT_WORK(&my_entity->dim.work, my_driver_do_dim_work);
 	...
   }
+
+Dynamic Interrupt Moderation (DIM) library API
+==============================================
+
+.. kernel-doc:: include/linux/dim.h
+    :internal:
-- 
2.25.1

