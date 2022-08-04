Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518E9C19F2C
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 08:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239014AbiHDI16 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Aug 2022 04:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiHDI15 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Aug 2022 04:27:57 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C554E1275E
        for <linux-doc@vger.kernel.org>; Thu,  4 Aug 2022 01:27:56 -0700 (PDT)
Date:   Thu, 4 Aug 2022 16:27:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1659601675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/WX5B31tQ907msGuYNjSL8T/0nXndja25We6EMCLAHo=;
        b=qMJ1dt2eucb52n+/ODxKzbuArp5qhcrRjyDPdLTUeqBksxkqoy5qFXI46e2hBkDlZ3pF9a
        sKWSUhbU1j2LkW7Ua6f4zsz7NsxqT1Xs8TIqQKPVvYSPcWpvNOmLxRPE2dU84iLpaykfCe
        ElZ/XLHAe/W7dJnHoV60FFuU0xQYTv0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     YanTeng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/2] docs/zh_CN: Update two file in zh_CN/process to 5.19
Message-ID: <YuuC/A1blhskY+OR@bobwxc.mipc>
References: <cover.1659406843.git.bobwxc@email.cn>
 <42fd6e8d-62ab-911c-f84c-9b47eacd9b4d@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42fd6e8d-62ab-911c-f84c-9b47eacd9b4d@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

话说 YanTeng Si 于 2022-08-04 (四) 14:37:16 +0800 曰过：
> 
> 在 2022/8/2 11:02, Wu XiangCheng 写道:
> > Hi all,
> > 
> > This set of patches aims to
> > 
> >      * Update zh_CN/process/email-clients.rst to 5.19
> >      * Update zh_CN/process/submitting-patches.rst to 5.19
> > 
> > Also deep clean these two files. I highly recommend to use a word-by-word
> > diff viewer like VS Code or Emacs to read such big diff files.
> > 
> > Note:
> > 
> >      Due to the special content of PATCH 2/2, checkpatch.pl will give a
> >      lot of warnings and errors, all be fine.
> 
> However, with some build warnings.  :)
> 
> 
> sphinx_2.4.4 ❯ make htmldocs
> 
> ...
> 
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:18:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:153:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:163:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:168:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:179:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/5.Posting.rst:197:
> WARNING: undefined label: cn_email_clients (if the link has no caption the
> label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/8.Conclusion.rst:17:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/howto.rst:98: WARNING:
> undefined label: cn_submittingpatches (if the link has no caption the label
> must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/howto.rst:334: WARNING:
> undefined label: cn_submittingpatches (if the link has no caption the label
> must precede a section header)
> linux-next/Documentation/translations/zh_CN/process/submit-checklist.rst:14:
> WARNING: undefined label: cn_submittingpatches (if the link has no caption
> the label must precede a section header)
> 
> 
> Thanks,
> 
> Yanteng

Yes, have been fixed here. Forgot to remove prefix _ when grep, ha.
v2 will be sent after rc1.

Thank you ;)

	Wu

> 
> > 
> > Thanks!
> > 
> > Wu XiangCheng (2):
> >    docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19
> >    docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19
> > 
> >   .../zh_CN/process/email-clients.rst           | 263 ++++---
> >   .../zh_CN/process/submitting-patches.rst      | 701 +++++++++---------
> >   2 files changed, 518 insertions(+), 446 deletions(-)
> > 
> 

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

