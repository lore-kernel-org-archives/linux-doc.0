Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22890C77B61
	for <linux-doc@archiver.kernel.org>; Thu, 27 Apr 2023 14:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243662AbjD0O2F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 10:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244055AbjD0O2E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 10:28:04 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7245B35A6;
        Thu, 27 Apr 2023 07:28:00 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 39BFD379;
        Thu, 27 Apr 2023 14:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 39BFD379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1682605679; bh=UIp0REyLGOn7wJ+G2v6qIA9DaWTOaAZ40J+wPVxc9ns=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LO4F3nQw27VpH1Xw9dXhsE9hQhLIz2/d7vSPm2ven8XcZg447H8gnKg997NAPyTc+
         /4bhpxkHCDo4+4OGYaK/5aB5e/I21hLokE/qtfxxKR1ThBgLlvJFLSVsWWG+Z2lxv4
         A7PbXxuzdC6p7LrsFLUwytao0RCPTD4jWcFZoWi3BeG+F72n3i5Mk5pH9WYVFo3mlQ
         d2gUh7PBSD8WNp8zF+gRbVLikvCEsLZiuH/ETkQ/SGiIDXlup8NL63eAlqKp6eM8qO
         MJj7Kxb+2ZcTHxYcM0nyz06VCT9DGV/tBp35vqiQzXT2m03LJx6uHxXH30kBAfT4pU
         PCVrZiDYctmvQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Costa Shulyupin <costa.shul@redhat.com>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: redirect from old arch to the new one
In-Reply-To: <CADDUTFwGHytziCux07cXO0eYDUXYh3Scp=Qm96N+1wAX3ELDeg@mail.gmail.com>
References: <20230427101241.1273752-1-costa.shul@redhat.com>
 <87ildhfobe.fsf@meer.lwn.net>
 <CADDUTFwGHytziCux07cXO0eYDUXYh3Scp=Qm96N+1wAX3ELDeg@mail.gmail.com>
Date:   Thu, 27 Apr 2023 08:27:58 -0600
Message-ID: <87a5ytflht.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Costa Shulyupin <costa.shul@redhat.com> writes:

> My initial focus is on addressing conceptual review comments with this
> first fix. Once that is done, I intend to submit fixes for the
> remaining architecture. Furthermore, I intend to courteously with
> redirects relocate additional subdirectories.  For example,
> consolidate subsystems.

Please do not top-post on kernel lists.

I'm not quite sure what "conceptual review comments" you're referring
to.  In any case, you have not answered my question: is there an actual
problem needing to be solved here?

Thanks,

jon
