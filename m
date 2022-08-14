Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C962C19F2D
	for <linux-doc@archiver.kernel.org>; Sun, 14 Aug 2022 00:12:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiHNAMb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Aug 2022 20:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiHNAMb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Aug 2022 20:12:31 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E32D1CFE5
        for <linux-doc@vger.kernel.org>; Sat, 13 Aug 2022 17:12:30 -0700 (PDT)
Date:   Sun, 14 Aug 2022 08:12:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660435947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SAgYBxmTsB1+9UAzDMlfpdbXgm+8wfNJ2UbDWo4ixhY=;
        b=Bc0YS+VWrlVvDJ55CSNc2cWQyxXG2f3lcZMPW2w6woLTy7ujIQ7SYb8Ndkgx2lzfLuJzfq
        wEQgFXGrrU+TE1oGcy9M1raA590JHYUyed7OOIhaa/jhVAl+yNwFyQ/HOA6RuyNfjCtvml
        NcW8PSW/2g0HQaeoiVJBW0zrXgItZV4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-doc.rst: move label "_kernel_doc" to top
Message-ID: <Yvg91r1izkJyY31M@bobwxc.mipc>
References: <Yvex3fQSXFX3alIu@bobwxc.mipc>
 <87zgg8w0ee.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zgg8w0ee.fsf@meer.lwn.net>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

话说 Jonathan Corbet 于 2022-08-13 (六) 10:53:13 -0600 曰过：
> Wu XiangCheng <wu.xiangcheng@linux.dev> writes:
> 
> > From: Wu XiangCheng <bobwxc@email.cn>
> >
> > "_kernel_doc" label which should refer to the entire document was in the
> > middle, move it to top. Also fix zh translation.
> >
> > Fixes: 46347502b099 ("Restructure kernel-doc.rst")
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  Documentation/doc-guide/kernel-doc.rst                    | 3 ++-
> >  Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> Rather than do this, is there any reason to not just delete the label
> entirely?  If anything references it, it can just name the file instead.
> But, as it happens, it's not even referenced anywhere...

Emmm, it's referenced. Remember to remove prefix '_' when grep.
Would you like to transfer all below references to path style?

$git grep -n "<kernel_doc>"
Documentation/process/submit-checklist.rst:64:11) Include :ref:`kernel-doc <kernel_doc>` to document global  kernel APIs.
Documentation/process/submit-checklist.rst:67:    :ref:`kernel-doc <kernel_doc>` and fix any issues.
Documentation/translations/it_IT/process/submit-checklist.rst:69:11) Includete commenti :ref:`kernel-doc <kernel_doc>` per documentare API
Documentation/translations/it_IT/process/submit-checklist.rst:71:    verificare i commenti :ref:`kernel-doc <kernel_doc>` ed eventualmente
Documentation/translations/zh_CN/process/submit-checklist.rst:59:11) 包括 :ref:`kernel-doc <kernel_doc>` 内核文档以记录全局内核API。（静态函数
Documentation/translations/zh_CN/process/submit-checklist.rst:61:    :ref:`kernel-doc <kernel_doc>` 并修复任何问题。
Documentation/translations/zh_TW/process/submit-checklist.rst:62:11) 包括 :ref:`kernel-doc <kernel_doc>` 內核文檔以記錄全局內核API。（靜態函數
Documentation/translations/zh_TW/process/submit-checklist.rst:64:    :ref:`kernel-doc <kernel_doc>` 並修復任何問題。

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

