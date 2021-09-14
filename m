Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC86C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE10160F26
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234649AbhINUte (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:49:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:40322 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234523AbhINUta (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 16:49:30 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F3DDC6156;
        Tue, 14 Sep 2021 20:48:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F3DDC6156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1631652492; bh=25q3roP7moFr66dZAdbNxxrJLdL486o1EL3S3vBbRiY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZCbLP+A3kCkn5AB7Ec4A3M9JLEKRTyVp7t7f7PXl6teTrDKd8WE7tRtI5Iw0aWAVN
         u4q0c8Mel5/IS/majhpS9Hup6IjStzVmjiAproB4PJ9cXpZGGZ79vFOKNJQ66lSdph
         T59jD6PIa9RWn5jAtaOoXsB55r0U2TY1X72x0LbTnJAfsRIPzr+dqkfHbd9Iz05/Bo
         4t6WaCs2FBkvKiWpT9Q1C4UqG4yFgbXUCBz6TV+uwjZaEsPl6IN+5AIhRd7Kj0emPk
         PUauxm4lEWSkkWtPcXBwLHCORqdWNteCbjqTaV+KJGXzhltOipHaWZgZPh/K+6OvT2
         RQi7GaGnwS8Pg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Borislav Petkov <bp@alien8.de>
Cc:     X86 ML <x86@kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] doc: Add tip maintainer's handbook
In-Reply-To: <20210913153942.15251-1-bp@alien8.de>
References: <20210913153942.15251-1-bp@alien8.de>
Date:   Tue, 14 Sep 2021 14:48:11 -0600
Message-ID: <87h7emevec.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Borislav Petkov <bp@alien8.de> writes:

> From: Borislav Petkov <bp@suse.de>
>
> Hi Jon,
>
> here is the rest of the tip maintainer handbook "preachings" which are
> not generic enough to go into the main documentation but are tip-tree
> specific and are collected in a separate handbook.

Applied, thanks.

jon
