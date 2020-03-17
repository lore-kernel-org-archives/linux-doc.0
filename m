Return-Path: <SRS0=98ua=5C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E15C2BB1D
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 13:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC7A020757
	for <linux-doc@archiver.kernel.org>; Tue, 17 Mar 2020 13:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584450701;
	bh=92ammI6uJRb3AZ8FcF6Fkf3W17Lp//0sZz89b0+sTMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=fqWwwWolDzCDyoa6jQT+bT/rfIcDygRfDXlKSBgCkl/2spxY71epGBg0LYz3q88UE
	 kqoM69BuY5tmAsG90ZIJn0GoCv1/ZwD9h3BXHmToLBOc8Y8XGTzc9ciM5nn/Vhjq1X
	 zJ9U+y8863SODsmWjvAG954v05eZpLzstE1r0rLE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgCQNK4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Mar 2020 09:10:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgCQNK4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Mar 2020 09:10:56 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 486B7206EC;
        Tue, 17 Mar 2020 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584450655;
        bh=92ammI6uJRb3AZ8FcF6Fkf3W17Lp//0sZz89b0+sTMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RRSzq/DjBIREptoAJ5kZbOdC7cO76YDgciz5tpSEnxjBfmMeLnwpFhIQ2YYY6N77I
         pMQf4eKM4gpgiCzMYXFIQKT08RJNEYSQjU6mKoRS37VmDv/8I8Is/mDgkh176WYhnc
         D8UfSo6SPJMfqtoE+7oLERAedMLmV+UVUa2/xjtk=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jEBzh-0006Rp-FV; Tue, 17 Mar 2020 14:10:53 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 01/12] MAINTAINERS: dt: update display/allwinner file entry
Date:   Tue, 17 Mar 2020 14:10:40 +0100
Message-Id: <3f84175b93dd54db4565abf560b59644f7245894.1584450500.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584450500.git.mchehab+huawei@kernel.org>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
split Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
into several files. Yet, it kept the old place at MAINTAINERS.

Update it to point to the new place.

Fixes: f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display pipeline to schemas")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be44251d1e04..9f3ce3f8df56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5552,7 +5552,7 @@ M:	Chen-Yu Tsai <wens@csie.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/gpu/drm/sun4i/
-F:	Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
+F:	Documentation/devicetree/bindings/display/allwinner*
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
-- 
2.24.1

