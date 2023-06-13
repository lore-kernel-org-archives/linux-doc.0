Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D9AC7EE2E
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 13:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238315AbjFMNAn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 09:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236464AbjFMNAm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 09:00:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBD7191
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 06:00:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8841635EF
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 13:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79AAC433D2;
        Tue, 13 Jun 2023 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686661240;
        bh=gqhjdmXTpBiAVW68HBds+hnWsKQm7Yc8GSe81z4kXRU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=I47wTEWG7rUyqCsGy0zpylblH8YaHXHe/M/Krtl7lRtj6GvUN608/u36tVNgo7JiA
         FRA5yGOVfobw2MCOh+kpDQCUeBogaQZ3HYKfMfUjPvBuP3m5BbjueKFNtWFlYw5oh4
         gvMWIycEaK+GDwzqYgKRxOyusNfM2lAidLkRlIy6Xxs1ArAn/gaVoFqB/5KbV2vyFl
         xdAQ6au0LI86ii3hRnbIDBi3tnRlXa+Hyf/Gv+e/qYYAXZWr5tULxoL2dNA0fyFV7T
         s8EWNKnyRjYMRywFByc09ZNLjs6fSe2alaH6CioRcEszPNNciDi32z6BbmZgXr8ED7
         Z1w8Kz9oc46pA==
From:   =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com
Cc:     conor@kernel.org, conor.dooley@microchip.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
Date:   Tue, 13 Jun 2023 15:00:37 +0200
Message-ID: <87mt13ldoq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Conor Dooley <conor.dooley@microchip.com> writes:

> Palmer suggested at some point, not sure if it was in one of the
> weekly linux-riscv syncs, or a conversation at FOSDEM, that we
> should document the role of the automation running on our patchwork
> instance plays in patch acceptance.
>
> Add a short note to the patch-acceptance document to that end.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I was also not sure if this was the correct doc for this, or whether a
> process/maintainer-riscv.rst file was better suited. There's clearly no
> rush on this though so =C2=AF\_(=E3=83=84)_/=C2=AF

I'm fine with this file. Thanks for adding it!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
