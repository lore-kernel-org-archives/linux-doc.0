Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C6FC4743C
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:43:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D2EA61411
	for <linux-doc@archiver.kernel.org>; Fri,  4 Jun 2021 17:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhFDRpT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 13:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFDRpS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 13:45:18 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D7BC061767;
        Fri,  4 Jun 2021 10:43:32 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2FED9199E;
        Fri,  4 Jun 2021 17:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2FED9199E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622828612; bh=mwmDacof7klZLepp8UTwylCU5oT1cliCxNI1kzn1U9E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Vy6aWDTQQSNkOZN+W6wWy+hWIO5CApSaZpUqfvSL7OrJm9Nkk3JHvknVHqrY3d8Gl
         Fkjse9UX365hI3K8PUPTXqXwRRLFdoiadkJeG/hVa17p6fq/4u/xH7tK17j6/5uA/d
         JfG7KtlUv3RUXV+iw8apDHc6fTb020qPez8+vP1IhUOnwwL+PqbpCdUd7oLqZXAyXS
         j2sfBxAQR15YdNRzKrLyh16izUnyIJuORpJ7qdFJocGnyqpJy2YgT9CaWtnYx/t1T4
         IbV8DKhBjC6eJbNPOc2SqS+YdhYiurNWR6KUJIOdF81UbakY/iK5m5QFq4jxwYaZVU
         XSfrYpyl8CWFg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        rdunlap@infradead.org, ira.weiny@intel.com, jack@suse.cz,
        lihao2018.fnst@cn.fujitsu.com, tytso@mit.edu
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: convert dax.txt to rst
In-Reply-To: <20210531130515.10309-1-igormtorrente@gmail.com>
References: <20210531130515.10309-1-igormtorrente@gmail.com>
Date:   Fri, 04 Jun 2021 11:43:31 -0600
Message-ID: <878s3pikzg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Igor Matheus Andrade Torrente <igormtorrente@gmail.com> writes:

> Change the file extension and add the rst constructs to integrate this
> doc to the documentation infrastructure and take advantage of rst
> features.
>
> Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
> ---
>  Documentation/filesystems/dax.rst   | 291 ++++++++++++++++++++++++++++
>  Documentation/filesystems/dax.txt   | 257 ------------------------
>  Documentation/filesystems/index.rst |   1 +
>  3 files changed, 292 insertions(+), 257 deletions(-)
>  create mode 100644 Documentation/filesystems/dax.rst
>  delete mode 100644 Documentation/filesystems/dax.txt

Applied, thanks.

jon
