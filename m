Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA67C3F6B0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Aug 2022 17:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344716AbiHRRcx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Aug 2022 13:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344668AbiHRRcr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 13:32:47 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A980CB777A
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 10:32:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2188B4E5;
        Thu, 18 Aug 2022 17:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2188B4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1660843966; bh=YLJUZpTuKnFoNFa0OcBGG6uQdexffUMqwo2/fjhIvTQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qRCul4PjfhetN+QKpOX5d3SScqiaHIKVyNJ5I99dN/kv/V+HJlXJ9BeRMJhLhTp8n
         Vmdb6gckMAbVbl10w/uwCS7ssqb1wny2VRuCJFYnVKatqQ+P1ZdB4okAeZfQ6fMebt
         fUHvsMIOmNXEcCzXJ9GL15CUMUSEu32o4LopTarasAPp0kc4MHTsgbTRPS0azIRePO
         QttFi7ienI+84G2KA96N68/X7GVDPL8p7XXATGVEE4fYQWMngCMIYhrbmaAvA0S/Du
         tL0wKKA7bMh21gTv7YB4txpdT6KROVyno5Z+h+WnV4eEedQnYw3uEWLcbHXIEidsEf
         P9aOMVay9KNbQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Li Yang <leoyang.li@nxp.com>, linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/2] docs/zh_CN: Update two file in zh_CN/process to 5.19
In-Reply-To: <cover.1659406843.git.bobwxc@email.cn>
References: <cover.1659406843.git.bobwxc@email.cn>
Date:   Thu, 18 Aug 2022 11:32:45 -0600
Message-ID: <87fshtbgoy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <wu.xiangcheng@linux.dev> writes:

> Hi all,
>
> This set of patches aims to
>
>     * Update zh_CN/process/email-clients.rst to 5.19
>     * Update zh_CN/process/submitting-patches.rst to 5.19
>
> Also deep clean these two files. I highly recommend to use a word-by-word
> diff viewer like VS Code or Emacs to read such big diff files.
>
> Note:
>
>     Due to the special content of PATCH 2/2, checkpatch.pl will give a
>     lot of warnings and errors, all be fine.
>
> Thanks!
>
> Wu XiangCheng (2):
>   docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19
>   docs/zh_CN: Update zh_CN/process/submitting-patches.rst to 5.19
>
>  .../zh_CN/process/email-clients.rst           | 263 ++++---
>  .../zh_CN/process/submitting-patches.rst      | 701 +++++++++---------
>  2 files changed, 518 insertions(+), 446 deletions(-)

Set applied, thanks.

jon
