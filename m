Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D56C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 16:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BD0C610A2
	for <linux-doc@archiver.kernel.org>; Thu,  8 Apr 2021 16:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhDHQ74 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbhDHQ7z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Apr 2021 12:59:55 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD6CC061760
        for <linux-doc@vger.kernel.org>; Thu,  8 Apr 2021 09:59:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 240EC52B9;
        Thu,  8 Apr 2021 16:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 240EC52B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617901184; bh=Aut0mMKu6FfizQq6eV//pc9izg5Ue7ZpTizPneXW5D8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Bthi0ppdLPjqwRmn5dQ6ctas0ZGUb/PQxEnpXAOQUtGfWoSKJ3p23qeUDgj4as67Y
         D9qFh+rPNT472V2Ff64PXEL8jBFZJGTInGUqBQlUytaba601jB1iPgQk86f3QZ9oeP
         ECcs6ETp/WGB0KXTTB69P6NOH5UO1/dU6Eq/sghTuwabdA4dUcq9kUKm34qBRpRsCl
         20NNjL8RzWYOQNgo08Q3JkpgueXPu8GXMRFh+unGMPEmkDLaLZzi5TRDlNcHPMd/IX
         xe9P5yE0TU+54DB0oYbU22WlXz04PHN92WxUBcM34j7fl0rw7+f53w4L2CIz0U98GL
         wFo5TWqHozAWA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 5/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/contributing.rst
In-Reply-To: <20210408141024.GA8507@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
 <20210408141024.GA8507@bobwxc.top>
Date:   Thu, 08 Apr 2021 10:59:43 -0600
Message-ID: <874kgg1zls.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Add new translation
>   Documentation/translations/zh_CN/doc-guide/contributing.rst
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> v4 only changed some word in [Patch 5/8] under Yanteng Si's advices.
> Thanks!
>
>  .../zh_CN/doc-guide/contributing.rst          | 238 ++++++++++++++++++
>  1 file changed, 238 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/contributing.rst

It's generally best not to send a new version of just one patch in a
series; it makes things harder on the maintainer side.  If you could,
please, send me a new version of the entire series (as a new email
thread) with all the tags added; then this looks like it's about ready
to merge.

Thanks,

jon
