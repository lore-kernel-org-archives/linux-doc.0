Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CC9CD8CB4
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 19:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbjJJTwd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 15:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbjJJTwd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 15:52:33 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B7294;
        Tue, 10 Oct 2023 12:52:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 887B12B2;
        Tue, 10 Oct 2023 19:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 887B12B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1696967550; bh=yqu35qN0zSjvX+i8vvGiatj5XADpd8uqu+QtekmJkQM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Qc10QfFtEyXtJSZZTDo2pPVGDQLYWpOviSU0EeFN+cdeMRSvayKfYItQGnRvP7N2f
         90wcQDJ1juh9dvcqlVUOQ51UCTuRIDwMxpmuId8AlIVSnCPdwakVbKC/cUy83/Vn9f
         5I+31EZwPgxbMCJjk7nSN6K9QJrbFCgG58ALUOv8VeS3OA853h/YrfD5SPklVoCJfK
         6qyClD4CUZISUuUge4AbauzfQJiyS9kgs4gbpQ6a345BYsEEmL/HW3BvJprKXFjYEU
         LabDAeiYJo3gCLJ81bYtOtiWm/BYqPeh3UlbJYZqkyFNisoPxNEMqw4NonomnWkJ4a
         bXyurvwvF8gPg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Hu Haowen <src.res.211@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs/zh_TW: update contents for zh_TW
In-Reply-To: <20231010-helping-pajamas-dee038@meerkat>
References: <20231010050727.49212-1-src.res.211@gmail.com>
 <87a5sq70uy.fsf@meer.lwn.net> <20231010-helping-pajamas-dee038@meerkat>
Date:   Tue, 10 Oct 2023 13:52:29 -0600
Message-ID: <87fs2i5k76.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

>> Putting your patches inline would be the right thing to do in any case.
>
> I'm not sure if your client is showing it differently, but to me the patch
> appears to be just like any other -- it's inline and properly formed.

OK, weird...looking at the raw message it's definitely inline; no idea
why notmuch is showing it as an attachment.

>> Rather than force another round, I've tried to the patch directly (but
>> see below), but it would be good to figure out why lore doesn't like it.
>> Konstantin, any ideas?
>
> If you like, we can migrate linux-doc to the new infrastructure and then you
> will probably see it on lore faster than it's delivered into your inbox. :)

Sure, I'd be happy to see it move anytime.

Thanks,

jon
