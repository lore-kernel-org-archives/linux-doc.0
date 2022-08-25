Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CD1ECAA25
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 18:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243418AbiHYS6y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 14:58:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243554AbiHYS6w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 14:58:52 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22986BD1F5
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 11:58:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBB4031A;
        Thu, 25 Aug 2022 18:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CBB4031A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1661453931; bh=9XQMaVksEkd2zGqAEVyc13fvAAOtzBaJjXNSFj3g3CU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KkHpNdlTte90YsqNP1K2r/jCDO6Y/BKkI8Y2kJfTX493ZTiFkO292ttStLZwxZA7s
         Z0a/iVuJ2SQ//RTx0k7fdiFpPMZErLdzR3l4KFgTY5OyFkJbnnn6ehTt1g/eV4kUxz
         4gCPv75Wm5ZZCtujTfMt5tfOY2Cff+9DeQ5EkuyV2ttKWBNvBqnSyV93NVLs1nJjzu
         hQhOmfV3p/qJYX8vebtePwU3Kv1IEQEs/2YFVmO50z7IohkwB/WoV2nSGq8GebFK19
         GVJpeB4eQj8/gOyp5nq7vjoFpaDML267Pf9AI0mrqSYeQvXHUmBUM3+5MBmrvNIFMa
         /5NVHIyTgW/Rw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Li Yang <leoyang.li@nxp.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs/zh_CN: Fix two missing labels in zh_CN/process
In-Reply-To: <871qt4ywzp.fsf@meer.lwn.net>
References: <87fshtbgoy.fsf@meer.lwn.net>
 <cover.1659406843.git.bobwxc@email.cn> <Yv7i1tYMvK9J/NHj@bobwxc.mipc>
 <871qt4ywzp.fsf@meer.lwn.net>
Date:   Thu, 25 Aug 2022 12:58:51 -0600
Message-ID: <87wnawxi8k.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> writes:

> I am totally confused by this patch.  Those labels are present in
> docs-next; where do you think this patch is necessary?

Apologies, I was even more confused than I thought; was looking at the
wrong branch.  I've applied the patch now, thanks.

jon
