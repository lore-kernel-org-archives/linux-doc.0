Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A183AC28B2B
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 01:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242547AbiHSBKF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Aug 2022 21:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbiHSBKE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 21:10:04 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72485D51DE
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 18:10:02 -0700 (PDT)
Date:   Fri, 19 Aug 2022 09:09:42 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660871400;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ypweWn8SQsg6nZgCKHGhdHTfswBUgFLJqoBelYOQllI=;
        b=MAVlkbZ2DdM3zFjY/13KOtn5mB4W7/Oqs9rEVdfsiFidv0TJudDd6z0V/t+h/ZzAYZ+AeS
        XBJ3aVl5sLAG194XcAOeuAVNDLD0RRn74TPuHdyxUivVJng+ch/6vt/AzsEpxZ8TMO4mFB
        Mxe/qoH+zg/r88paTCHpR9i1e4A427Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Li Yang <leoyang.li@nxp.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH] docs/zh_CN: Fix two missing labels in zh_CN/process
Message-ID: <Yv7i1tYMvK9J/NHj@bobwxc.mipc>
References: <87fshtbgoy.fsf@meer.lwn.net>
 <cover.1659406843.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fshtbgoy.fsf@meer.lwn.net>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

* Add back still referenced labels in submitting-patches.rst and
  email-clients.rst.
* Fix a typo.

Fixes: fdb34b18b959 ("docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19")
Fixes: d7aeaebb920f ("docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19")
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---

Hi Jon,

I'm sorry that actually v2 of this set[1] has not been sent yet, still some
problems need to be fixed.

Please also apply this short patch to fix them.

Thanks,
	Wu

[1]: https://lore.kernel.org/linux-doc/87fshtbgoy.fsf@meer.lwn.net/T/#t


 Documentation/translations/zh_CN/process/email-clients.rst    | 2 ++
 .../translations/zh_CN/process/submitting-patches.rst         | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/email-clients.rst b/Documentation/translations/zh_CN/process/email-clients.rst
index fa113f071855..34d51cdadc7b 100644
--- a/Documentation/translations/zh_CN/process/email-clients.rst
+++ b/Documentation/translations/zh_CN/process/email-clients.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
+.. _cn_email_clients:
+
 :Original: Documentation/process/email-clients.rst
 
 :译者:
diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
index 26565abcbd8d..f8978f02057c 100644
--- a/Documentation/translations/zh_CN/process/submitting-patches.rst
+++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
@@ -2,6 +2,8 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
+.. _cn_submittingpatches:
+
 :Original: Documentation/process/submitting-patches.rst
 
 :译者:
@@ -100,7 +102,7 @@ xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令
 你的补丁修复了一个缺陷，需要添加一个带有URL的标签指向邮件列表存档或缺陷跟踪器
 的相关报告；如果该补丁是由一些早先邮件列表讨论或网络上的记录引起的，请指向它。
 
-当链接到邮件列表存档是，请首选lore.kernel.org邮件存档服务。用邮件中的
+当链接到邮件列表存档时，请首选lore.kernel.org邮件存档服务。用邮件中的
 ``Message-ID`` 头（去掉尖括号）可以创建链接URL。例如::
 
     Link: https://lore.kernel.org/r/30th.anniversary.repost@klaava.Helsinki.FI/
-- 
2.30.2


-- 
Wu XiangCheng	0x32684A40BCA7AEA7

