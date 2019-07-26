Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8923E7D917
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 11:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfGZLrd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 07:47:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47390 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfGZLrc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 07:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=m8kf/sPEYGMDUeP6JoO5tSRSz84bxy3DCh0yf5UUIs0=; b=iGohlSDAV5B4QjohSRDUM74DRr
        8BnV+fmqXiZHJSrIpfrZSm0RL9ohLH/3yVOcscMSeHvBnGvA0vJusylj5PsVjmp6PgJ/ZYeV7m9hH
        u9JVydoXGtFgGjqyzHlJlQ83Tm0NyJMgZblIIPL1GKlWkxXgLTj/fQ++1kJReUOSflozna3+Kmkre
        cNguW2QYAk3/eTPlsU0OSUEHAlC90HjESdB7WGTqiXGlogBGHSsf0FRCV5GJFE4l9wwIix2WMWTKI
        SZJNl2tbJmv3InbL4nlEb1eoiyO2KxzbnVPVo/toAhktp3enuLl2k9j1gIFN9A7C4gQ9bmYoyg4wv
        flBAcVuw==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqyh9-0003Bc-7R; Fri, 26 Jul 2019 11:47:31 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hqyh7-0000uE-49; Fri, 26 Jul 2019 08:47:29 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 6/7] docs: zh_CN: howto.rst: fix a broken reference
Date:   Fri, 26 Jul 2019 08:47:26 -0300
Message-Id: <cd296a4802f46a223522b31aebb16d0059c7d88a.1564140865.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564140865.git.mchehab+samsung@kernel.org>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There's a broken reference there pointing to the long gone
DocBook dir.

While I don't read chinese, Google translator translates it
to:
	"The generated documentation will be placed in
	 the Documentation/DocBook/ directory."

Well, we know that the output will be Documentation/output
dir. So, let's fix this one.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/translations/zh_CN/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index 5b671178b17b..c4ff8356b88d 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -147,7 +147,7 @@ Linux内核代码中包含有大量的文档。这些文档对于学习如何与
     关于补丁是什么以及如何将它打在不同内核开发分支上的好介绍
 
 内核还拥有大量从代码自动生成的文档。它包含内核内部API的全面介绍以及如何
-妥善处理加锁的规则。生成的文档会放在 Documentation/DocBook/目录下。在内
+妥善处理加锁的规则。生成的文档会放在 Documentation/output/目录下。在内
 核源码的主目录中使用以下不同命令将会分别生成PDF、Postscript、HTML和手册
 页等不同格式的文档::
 
-- 
2.21.0

