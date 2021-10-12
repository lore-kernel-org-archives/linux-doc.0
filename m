Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC4FC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 19:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 700CD60D43
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 19:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhJLTzo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Oct 2021 15:55:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:53212 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232145AbhJLTzo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Oct 2021 15:55:44 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0ECDA867;
        Tue, 12 Oct 2021 19:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0ECDA867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1634068422; bh=8iW/it4FrsP1pnzxjlWccQGlw1PLWBAUj00avlN0Rdc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=G4TwyUs9fMgsxGmU5T21FgSVVhJWwHqvySTQbj9Jrx2EtdSU9aZ9XteHf/3fVlXPp
         UZZ+i/xumX4b8v9JEYwH2pPRWnIcMCRUrkjnOrnvqiUynN+3GQKIuCJwpLdX9U8mwN
         eRCEXkp3bRetdMNSMX01h2YWbSooIP6z46Sh9iVGuLp4GtxOyVMtkSgR9KAJDGd8CC
         UsTiiw6NpvHK6SGHJRHyXi1/l7bDw2kxCr0/6gGlnGyl3WSt5tJG0Hnh97k6q4ENkn
         8hMGSA/5Oijc0kpfJGcIx+lz0/io8eh9Bblcx4VDpqw7msjP6KyT0pmidc1vE1iYQ8
         q67Al+Pa9yIig==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christoph Anton Mitterer <mail@christoph.anton.mitterer.name>
Cc:     linux-doc@vger.kernel.org
Subject: Re: some minor improvements to the mountinfo description
In-Reply-To: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
References: <20211007040001.103413-1-mail@christoph.anton.mitterer.name>
Date:   Tue, 12 Oct 2021 13:53:41 -0600
Message-ID: <87a6jeuiii.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Christoph Anton Mitterer <mail@christoph.anton.mitterer.name> writes:

> Hey there.
>
> Hope these minor patches help & thanks for considering.
>
> Wasn=E2=80=99t sure about the UTF-8 I'm using, but I've seen that some
> of the RST files already used =E2=80=A6 so I figured it would be okayish.

Both patches applied, thanks.

In the future, please, when you include a cover letter, say what the
patch series actually does in that letter.

Thanks,

jon
