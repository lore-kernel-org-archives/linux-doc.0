Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB59EE4981
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378926AbjHRRUD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378921AbjHRRTu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:19:50 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8FD3AB9
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 10:19:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 732C96A2;
        Fri, 18 Aug 2023 17:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 732C96A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692379188; bh=AQnyVjh3S8EAsp+c/jRmNapnhkT8MUtQ98C8lSgwiLk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=pqr+htpT7YojmMeqYhAqy0qzqkTIJXioEIS+AqeceDK0DqirLM0XvxRPp6CAJaVyY
         QFhWVXRLnhyi1Z2U7WdhjTGpQnw4FwnNJDqlFalvFXHLW8JymcdnwJjRcasUl/6URT
         RqVKMc9hjGODv/kRYzkynKItWO7RLeZIiLmrWwBwBkxjSiVFRnmoC2CLNhQjMedYm0
         Vbf0AIS88grhNhlrmGSWoVZvljMUGmDM/VcV2VPy5JnCwgfRlseTwi90Rgd1Zwys0Q
         UZxbn45wO3AygO5p6u+myxfE/wyaWQHZrLbN2P7U0FoOj4jixEW+H6/xUXM3WaodEU
         CWK9GnI95VcOw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, Carlos Bilbao <carlos.bilbao@amd.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] doc: Always check kernel-doc
In-Reply-To: <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
References: <20230817144142.903553-1-willy@infradead.org>
 <87cyzkmh26.fsf@meer.lwn.net> <ZN+m9Bb7P+uH/TN8@casper.infradead.org>
Date:   Fri, 18 Aug 2023 11:19:47 -0600
Message-ID: <871qg0mfnw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> I would suggest that we still have quite a lot of kernel-doc which is
> not incorporated into .rst files, which seems like a shame.  Does anyone
> have time to write a script that finds every file with kernel-doc in
> it, then finds which of those files do not have ".. kernel-doc::"
> lines in Documentation/ ?

Something like scripts/find-unused-docs.sh, maybe? :)

jon
