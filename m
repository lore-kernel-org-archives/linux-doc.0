Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4229EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 19:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235923AbjGNTd4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbjGNTdy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 15:33:54 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9478C134;
        Fri, 14 Jul 2023 12:33:53 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 375835BF;
        Fri, 14 Jul 2023 19:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 375835BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689363233; bh=XrwUNsrDD4G8r0dxWJ6Vqopqm3NgtmcD8H87YSEoWjs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=eKq3ruyagSs0urS0hOd9sTUJZ5RWY0NO20KGwwGlhEL6VNgm/IaXRZ33OOW6EEBEd
         4i/QIGx2OdwBzHfpl15XtXNk5BhgS1elU3Ac2WgfdDg/x5Xg2CS4scJqpa/i8pyxi7
         Gy2tNLLL3UNFUGwjBOF8LCFoa2lfStiKIgqAGPAJ0DGQSzSGJ4J+hz7CAhSCUbqWFK
         KV2Ckc1ADIF1qshzXd5ZBFLfwSTfzlTcNUwbRASovd/jHjClNWfwr0LBc2jH87VgsO
         xp11UJUIunGQ3xI73IBnSibyhxg9fYnsG0pfWrwyUEIgewqMBxBmsv6qO8nehNE73K
         UEDWFC67DJuUw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] docs: add more driver-model infrastructure interfaces
In-Reply-To: <20230627064523.16618-1-rdunlap@infradead.org>
References: <20230627064523.16618-1-rdunlap@infradead.org>
Date:   Fri, 14 Jul 2023 13:33:52 -0600
Message-ID: <87a5vyz3rz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Add bus, class, and device data structures and enum constants to the
> Driver-Model Structures section and add function interfaces to the
> Device Drivers Base section of the Device drivers infrastructure chapter.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> ---
>  Documentation/driver-api/infrastructure.rst |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Applied, thanks.

jon
