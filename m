Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2F6C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 17:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243525AbhLFRm3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 12:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhLFRm2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 12:42:28 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD5EC061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 09:39:00 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 11C972ED;
        Mon,  6 Dec 2021 17:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 11C972ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638812339; bh=IppmNtzXxG5mSRQVDlW1rtVUxsgIbUBpB9siXVfBNRA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V7aLpAOm5tK22suPb+vN8W4EvvInsxQOxoyGtI5a4MW7ll/4HiYlxvVSbSpbyBO1r
         1Mbrbu9LPGY6vgE4KAkVez5uI8Qma6JXc8t3JF4+m8zckpHTH3kMlJaN7ozRsNicD7
         EgcFsecLZkvWLU6bqGxdRuAY0HDpVDjx3mvoo3ez15QeC9PZiNffk7Q0xinwAHYiaL
         WsdaN62fCEkXRW7I9UlvGmj0HgEz45QcKaB4DbUeIugl95ANMogBpnKuUsRcImS4U4
         BSW6bhmZPWP1RRhd3jWXoyUhlRsJl4EcIGNDWyuEF62Dou3W2mdV5QkNav1rk+hfh0
         Xbw72eiEnPAyw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>,
        Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: css missing
In-Reply-To: <Ya4rbTf5fZm6xG7o@casper.infradead.org>
References: <Ya4YvBcsxXLhjwRj@casper.infradead.org>
 <b4db5978-c6cd-edf0-fcd8-bb20aa0e2cbf@gmail.com>
 <Ya4rbTf5fZm6xG7o@casper.infradead.org>
Date:   Mon, 06 Dec 2021 10:38:58 -0700
Message-ID: <8735n54or1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> Jon, do you want to hurry that patch into Linus' tree before 5.17?

Yeah, I guess I should do that, thanks for the prod.

jon
