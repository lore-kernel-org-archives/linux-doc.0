Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117DCECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 16:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiH2Q3I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 12:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiH2Q3G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 12:29:06 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494639924F
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 09:29:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B6C722E0;
        Mon, 29 Aug 2022 16:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B6C722E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1661790545; bh=3Bi0B1wCSW08eq/YIPwOMqzymj/1NcTN+JIc+MOrnnM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RXIX2GxwTbn+SUVsDyw31XAFQYZIqUZxR6o1mi/GpwpE/DCsZPtMGzR0BGn14PgXN
         UvJbB2VHuEslCFDIlby0s7+fTMYKUiu7obPEzlb4Jp9bbdI99XKLKIz935lpi/RQQi
         JDiHtTdLklaWqgYeZtXpA6ydRO/x4UOU6RzlFhIi1uBb0yJ1KuAoF6r8icZArDxTgr
         GvISYS7UoGDeo9grDAbXoz+axTvAfWnx48yUz26cWiCbLQmDwkxiTwMXPXIo0fMwGh
         ZlcrDBziv/8uHicI2gWoqSnPid8ays9yQ7CvNA6cneguBNY+LlUQoacquNxPBuMR/J
         fLb/z34/cOT8g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, xiyou.wangcong@gmail.com,
        hidave.darkstar@gmail.com, tekkamanninja@gmail.com,
        leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v1 0/3] docs: zh_CN/TW: Update and remove some old
 documents
In-Reply-To: <cover.1661431365.git.siyanteng@loongson.cn>
References: <cover.1661431365.git.siyanteng@loongson.cn>
Date:   Mon, 29 Aug 2022 10:29:05 -0600
Message-ID: <871qszqai6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v1:
>  Update the translation of io_ordering to 6.0-rc2.
>  Remove IRQ(Only zh_CN) and oops-tracing, Because they already have a new translation.
>  In this way, zh_CN no longer has homeless documents. >_<
>
> Yanteng Si (3):
>   docs/zh_CN: Update the translation of io_ordering to 6.0-rc2
>   docs/zh_CN: Remove IRQ and oops-tracing
>   docs/zh_TW: Remove oops-tracing
>
>  Documentation/translations/zh_CN/IRQ.txt      |  39 ----
>  .../translations/zh_CN/driver-api/index.rst   |   2 +-
>  .../zh_CN/driver-api/io_ordering.rst          |  60 +++++
>  .../translations/zh_CN/io_ordering.txt        |  67 ------
>  .../translations/zh_CN/oops-tracing.txt       | 212 ------------------
>  .../translations/zh_TW/oops-tracing.txt       | 212 ------------------
>  6 files changed, 61 insertions(+), 531 deletions(-)
>  delete mode 100644 Documentation/translations/zh_CN/IRQ.txt
>  create mode 100644 Documentation/translations/zh_CN/driver-api/io_ordering.rst
>  delete mode 100644 Documentation/translations/zh_CN/io_ordering.txt
>  delete mode 100644 Documentation/translations/zh_CN/oops-tracing.txt
>  delete mode 100644 Documentation/translations/zh_TW/oops-tracing.txt

Applied, thanks.

jon
