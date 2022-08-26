Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0A9ECAAA3
	for <linux-doc@archiver.kernel.org>; Fri, 26 Aug 2022 00:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiHZAW4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 20:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiHZAWz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 20:22:55 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D530DA2860
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 17:22:53 -0700 (PDT)
Date:   Fri, 26 Aug 2022 08:22:41 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1661473372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qS92A75m6su8TyEWnu7pTV5knxtIDSrvc0xN99LPIXM=;
        b=DB9QjwOP2RGesIU7xWPs3VAsiHIIZNHxHFUGx/4L5zPAPmRr0b6z2GbrNnG0qYdKAgtqNW
        c7/7TF/yfDthFf79D7k7Qn39bxv3IZ5H7ywOzzCa4LbsixH3JdqQgHcPYJm0w0OofSFP4/
        L/qJhi8lX+Vykte9Y0g4z1FQ2sIzukk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com,
        corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        xiyou.wangcong@gmail.com, hidave.darkstar@gmail.com,
        tekkamanninja@gmail.com, leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v1 1/3] docs/zh_CN: Update the translation of io_ordering
 to 6.0-rc2
Message-ID: <YwgSUf95SFzQsPYp@bobwxc.mipc>
References: <cover.1661431365.git.siyanteng@loongson.cn>
 <c66f6d17c509c2c93f2afd30223c4bcf734f8317.1661431365.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c66f6d17c509c2c93f2afd30223c4bcf734f8317.1661431365.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-08-25 (四) 20:53:25 +0800 Yanteng Si 曰：
> Update to commit d1ce350015d8 Documentation: ("Add
> io_ordering.rst to driver-api manual").
> Move ../zh_CN/io_ordering.txt to ../zh_CN/driver-api/io_ordering.rst.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/driver-api/index.rst   |  2 +-
>  .../zh_CN/driver-api/io_ordering.rst          | 60 +++++++++++++++++
>  .../translations/zh_CN/io_ordering.txt        | 67 -------------------
>  3 files changed, 61 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/driver-api/io_ordering.rst
>  delete mode 100644 Documentation/translations/zh_CN/io_ordering.txt
> 

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

