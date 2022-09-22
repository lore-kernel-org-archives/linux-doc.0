Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2C8C54EE9
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 20:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiIVUmG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Sep 2022 16:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiIVUmD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Sep 2022 16:42:03 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7E62BE01;
        Thu, 22 Sep 2022 13:42:03 -0700 (PDT)
Received: from meer.lwn.net (unknown [IPv6:2601:281:8300:73::5f6])
        by ms.lwn.net (Postfix) with ESMTPA id 7B7593485;
        Thu, 22 Sep 2022 20:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7B7593485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663879322; bh=mDxQXQ4NurBox4LsoF5to14jeYq+gAafXUk9PwOPWrk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Imj0aX1VxffoffDyE9sDm6f8S1Fqi7Gu4/og3bpqCvkvCTYVxBknNwT8FpGoZ68Dq
         J93aj1SSDQmctCdZ9dEeR7kwExw3gRaUQxXVN3Gkgnb+bdX3Y9RoADvHWv7H0Fs0RQ
         eUanToJFhiGDvD/7Hac6hLETLjD279hsQlvBT6o2icdaWQGL1fuZg3/pPl5y1QEfC4
         RxuyQuZ7xb97gUVzfnamsGFydj0Znm749J6xsjS2u2fL9YBN5jFRSGOkjElAxDs5qf
         mnSUNllJnGfT+dSIvVE+gVNMd0kX6V5MCrONS/4GBCpRJcVBLyhOtp+eg7dnoOnXX1
         e5mhF+WL9p/4g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Kees Cook <keescook@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 6/7] docs: Expand the front-page CPU-architecture section
Date:   Thu, 22 Sep 2022 14:41:37 -0600
Message-Id: <20220922204138.153146-7-corbet@lwn.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922204138.153146-1-corbet@lwn.net>
References: <20220922204138.153146-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Actually show the entries for individual architectures, since otherwise a
single line reading "CPU architectures" is not very enlightening.

We should really move all of the architecture directories under an arch/
directory, as we do with the top-level directory, but that's a task for
another day.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 6d01c2e38573..5a700548ae82 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -93,7 +93,7 @@ Architecture-specific documentation
 -----------------------------------
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
    arch
 
-- 
2.37.2

