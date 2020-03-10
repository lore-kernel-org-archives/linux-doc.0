Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2A8C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:11:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DF7C21D56
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgCJRLf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:11:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:43970 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgCJRLf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:11:35 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 827DE537;
        Tue, 10 Mar 2020 17:11:34 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:11:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?572X5qWa5oiQ?= <luochucheng@vivo.com>
Cc:     =?UTF-8?B?546L5paH6JmO?= <wenhu.wang@vivo.com>,
        tekkamanninja@gmail.com, harryxiyou@gmail.com,
        mamurph@cs.clemson.edu, linux-kernel@zh-kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH]Documentation/filesystems/tranlastions : translate
 debugfs.txt into Chinese
Message-ID: <20200310111133.77c82b03@lwn.net>
In-Reply-To: <APYAegAGCACGbPjhiAJFp4qY.3.1583830104807.Hmail.luochucheng@vivo.com>
References: <AKQATgDuCEyGkPUNfXW4xKr3.1.1583829807989.Hmail.luochucheng@vivo.com>
 <APYAegAGCACGbPjhiAJFp4qY.3.1583830104807.Hmail.luochucheng@vivo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Mar 2020 16:48:24 +0800 (GMT+08:00)
罗楚成 <luochucheng@vivo.com> wrote:

> I 've sent the last email with wrong topic, this one is to fix it.

When something like that happens, please just resend the patch with the
correction applied, rather than forwarding it like this.  That way you
don't force maintainers 

> From: "罗楚成" <luochucheng@vivo.com>
> Date: 2020-03-10 16:43:27
> To: corbet@lwn.net
> Cc: "王文虎" <wenhu.wang@vivo.com>,tekkamanninja@gmail.com,harryxiyou@gmail.com,mamurph@cs.clemson.edu,linux-kernel@zh-kernel.org,linux-doc@vger.kernel.org
> Subject: [PATCH] arch_arm64_ fix typo in a comment.eml
> docs/zh_CN: translate Documentaion/filesystems/debugfs.txt to Chinese.
> 
> 
> Since debugfs is widely used in kernel development to help developers to debug their
> new features, it's necessary to translate it into Chinese to make debug easier for
> Chinese developers.
> 
> 
> Signed-off-by: luochucheng<luochucheng@vivo.com>

Also, while you're at it, a few other things:

 - Please put your full proper name in the signoff line, rather than just
   an account name.

 - The patch should have a diffstat showing what files you have touched;
   "git format-patch" should create that for you.

 - You need to add this file to the relevant index.rst file so that it is
   included in the docs build.

 - There appears to be some white-space damage in the patch; look at the
   code samples in particular.

Could you fix those things up and resubmit, please?

Thanks,

jon
