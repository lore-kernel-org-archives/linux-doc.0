Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81545C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 14:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiJTORd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 10:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiJTORc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 10:17:32 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4635BC83;
        Thu, 20 Oct 2022 07:17:30 -0700 (PDT)
Message-ID: <296210f9-95a7-8935-bb8a-4f5dc0f99096@lirui.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1666275448;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v2/a2A9H+jPByfqm3ebdbhb9+vJ417kQVx5ZVEKwnYc=;
        b=Ya2eHkVFdlaoVhARMEyGd0rl+n+NynG+7ITzvRUNm8zq6gr7YEoyDpG0C4Ly5jOXu1bfz9
        AsrLuQSxq0uq3FkTkYrdH+Y6AfGCIVtkdQu/Rna9eqVv/EsXHuRjlOtcf1g0Z8wxYunYpi
        623obQ1ZoImUVERZkDtTFwPf8F+1zqz7jsq4FigOCFgvRiKGoiESJv5guibBg66pyKDWr5
        iKCB/mZB42et67Z3uXi6yEuO+4bgiu/+wROhbBen/uIb5Tv51DQwbL/BUAiac+J+9p8PtE
        8PyH9h2NgnlBlxvq/wVn7FWBrcRvYIK5JxK6IZohVH+SNsaZn3bugaHUTpK/Cg==
Date:   Thu, 20 Oct 2022 22:17:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] docs/zh_CN: Add staging/xz Chinese translation
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>
Cc:     Wu XiangCheng <wu.xiangcheng@linux.dev>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1666181295.git.me@lirui.org>
 <52f8c1c138d0c2d799c57bba1b7c4cac4c0bf899.1666181295.git.me@lirui.org>
 <804134df-e984-6ebe-6fb2-c52d91974f8b@loongson.cn>
 <63950114-5716-4de6-3c5f-1910c2c628be@lirui.org>
 <87pmembng6.fsf@meer.lwn.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rui Li <me@lirui.org>
In-Reply-To: <87pmembng6.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022/10/20 22:04, Jonathan Corbet wrote:
> Rui Li <me@lirui.org> writes:
>
>> Thanks for your reminding. I ran the check patch script before sending
>> this patch.  However, the original file Documentation/staging/xz.rst
>> seems not has SPDX-License-Identifier header.
> You cannot know what the license of the source file is, since it hasn't
> been declared there.  What you *do* know, though, is that it must be
> GPLv2 compatible.  Your translation can thus be strictly GPLv2.  My
> suggestion in such cases would be to put:
>
> .. SPDX-License-Identifier: GPL-2.0
>
> into translations of documents that lack an SPDX line of their own.
>
> Thanks,
>
> jon
Thanks for your advice. I will add the GPLv2 license if the file lacks of license
declaration.

-- 
Rui Li    0x77E6D821D7AE84FE

