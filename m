Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A3BC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 16 Nov 2022 16:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiKPQwC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 11:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239191AbiKPQvH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 11:51:07 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FEB2BA
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 08:50:03 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0DE1D37C;
        Wed, 16 Nov 2022 16:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0DE1D37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668617403; bh=1AJI3he6BIqP4gphxZuTIsgEHplvyb8muksKv7w/y6w=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SXJnhe4YnUPu6FBTw2pKuTQ1Sq9pdsaYn35yj5dDJRZ4s7a/emfTeHawo2/AQOP/B
         YdfDte5JjoJem8eWkpylbRpWicjXKQqKl3cG5cIB91GmHEKZ6kod5HWQCh+5F+p+NF
         slAAuPmjJ/tj6krWm/f4/QYV3A67MpvnFc50xcNt4ZErztEMFF+8IjdCD1oK4RWY37
         r9Zakr55GPED914x+fzLWk3y7ZDHICL9kBDhe8T+k+AV9RqPMjDSNAR7SXa4/l/BZG
         lphfabAIWm3QxlKKqKlx4LSbpurkMjSf8aszDLuHl01pUFntJb00h8hPghXTrnjm73
         iOT3i0RNqt0XQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Maxim Cournoyer <maxim.cournoyer@gmail.com>,
        linux-doc@vger.kernel.org
Cc:     Maxim Cournoyer <maxim.cournoyer@gmail.com>
Subject: Re: [PATCH] doc: add texinfodocs and infodocs targets
In-Reply-To: <20221116164026.21064-1-maxim.cournoyer@gmail.com>
References: <20221116164026.21064-1-maxim.cournoyer@gmail.com>
Date:   Wed, 16 Nov 2022 09:50:02 -0700
Message-ID: <87h6yykfnp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Maxim Cournoyer <maxim.cournoyer@gmail.com> writes:

> Sphinx supports generating Texinfo sources and Info documentation,
> which can be navigated easily and is convenient to search (via the
> indexed nodes or anchors, for example).

Can you tell me a bit more about the use case for this?  Nobody has
asked for it so far...  I'm not really opposed to adding it, but it
would be nice to know why.

> This change also causes the html output to appear under its own output
> sub-directory, which makes it easier to install, since it's clean from
> .doctrees or other output formats.

"This change also ... " is a red flag saying that you should have split
it into a separate patch.

That change may be a bit harder to accept, since it's a behavioral
change that will certainly annoy some people.  At a minimum, it would
have to be coordinated with the automated docs builds at kernel.org.
One could certainly make the case that we should have done things this
way from the beginning; I'm a bit reluctant to change it now.

Thanks,

jon
