Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC80CC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 28 Apr 2022 18:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349698AbiD1ShE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Apr 2022 14:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350876AbiD1ShD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Apr 2022 14:37:03 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF62BC857
        for <linux-doc@vger.kernel.org>; Thu, 28 Apr 2022 11:33:48 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:3d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7CC8C2BD;
        Thu, 28 Apr 2022 18:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7CC8C2BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1651170828; bh=ehCRRU2deE1d6YhU7fw8O7oCX8ZmQfMG0tim4glijhg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ijs45oFJ1Lk9MtdY6UoiObfABG+Vbhzt8I8KrY92H6pWQjZ/PvjGFjrxxOtFZpRXc
         PGeK6awynW4yZm/AA1So6rOOD9B7eiizowJeqawxfOs57bh+X+wagGGqGz/98gwWeh
         ULyXgc0V6iTnHun1zKfuLkW6hjXXP5qpEbwIGzj5WhZESwd5LWYbBmEVfgtzYY7Cne
         If48jxAUN3ry4jPC/nMhXE+jfg1thll3kduZChGzj8msu7UJOYpn2raYJN11P7jd9E
         omnN/4TENfSIk6d+n/9TjR2lFF2Q0vUsj6OcPAs4JYBtoKktkU8OpWEEPx7/oCGCrC
         /OgwVth2H39uA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/2] docs/zh_CN: add hmm and numa translation
In-Reply-To: <cover.1650794774.git.siyanteng@loongson.cn>
References: <cover.1650794774.git.siyanteng@loongson.cn>
Date:   Thu, 28 Apr 2022 12:33:47 -0600
Message-ID: <87y1zp5a7o.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v2:
> * Pick Alex's Reviewed-by tag.
> * Modify some word under Alex's advice.
>
> v1:
> * Translate .../vm/hmm.rst and .../vm/numa.rst into Chinese.
>
> Yanteng Si (2):
>   docs/zh_CN: add vm hmm translation
>   docs/zh_CN: add vm numa translation
>
>  Documentation/translations/zh_CN/vm/hmm.rst   | 361 ++++++++++++++++++
>  Documentation/translations/zh_CN/vm/index.rst |   4 +-
>  Documentation/translations/zh_CN/vm/numa.rst  | 101 +++++
>  3 files changed, 464 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/hmm.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/numa.rst

Series applied, thanks.

jon
