Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CD4C433FE
	for <linux-doc@archiver.kernel.org>; Sun, 22 May 2022 05:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236202AbiEVFHT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 May 2022 01:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235384AbiEVFHQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 May 2022 01:07:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CFF3669D
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 22:07:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8032CB80781
        for <linux-doc@vger.kernel.org>; Sun, 22 May 2022 05:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117A1C34116;
        Sun, 22 May 2022 05:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653196032;
        bh=6KI8YVGpvNIkGau6XXH0JbIGZow0jVuIaDZM39JqnUM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oQa1zuxcLfvghhK+jJRZCrfghT9Z95tpQQe8E4ZWPzpKBvOxmWLdyrlAnu50POPv8
         ZUtYH/QecAUaYqNGiUjIyCqjBErpZnrFhQAonotv54+LECD4qn3tUI6ymQNNiQlUhe
         70SOMTaDVy7lMhPBEGavk1tlNkREuePfXzjF1B3nn4HR7Qd9uqxPMslICqrtiS/uuS
         A6bIWO3rX3c7HySC7f7LBXSYaKbN+dKM6bexvcCYuBdtfmqn3cjyVVmvO9Ky1W27lK
         V9BpdJaTRUdgctZUiztlDnyjFcNrsYz1vsNWAA1mm64LmRHZZyIgjVw4xjTSL9ED4x
         tMBtI8SjNebMA==
Date:   Sun, 22 May 2022 07:07:07 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: "WARNING: Duplicate C declaration" from recent Sphinx (was Re:
 [PATCH] docs: sphinx/requirements: Limit jinja2<3.1)
Message-ID: <20220522070707.313e6558@coco.lan>
In-Reply-To: <6476f6e7-0fc9-a55a-cafc-7b2fc31f6d51@gmail.com>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
        <871qyk7p28.fsf@meer.lwn.net>
        <20220330022534.10ac0a50@coco.lan>
        <ed2690db-84ae-5c85-f65d-e08021f5f562@gmail.com>
        <20220330190724.1596e01a@coco.lan>
        <edf80179-4776-773d-0c4a-e75a1824bfba@gmail.com>
        <564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com>
        <20220521114629.6ee9fc06@coco.lan>
        <6476f6e7-0fc9-a55a-cafc-7b2fc31f6d51@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sun, 22 May 2022 09:57:45 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Sat, 21 May 2022 11:46:29 +0200,
> Mauro Carvalho Chehab wrote:
> [...]
> > 
> > Sphinx 4.0 and above: it is now possible to add a namespace. This allows
> > fixing things like read() system calls that have different meanings on
> > different subsystems.
> > 
> > On other words, only with Sphinx 4.0 and above, the cross-references
> > for C domain symbols should all be OK.  
> 
> So, I noticed there is a PR at https://github.com/sphinx-doc/sphinx/pull/8313
> which is still open.

Are you sure? I always believed that this (or a variant of it) got 
merged on 4.0.

> 
> This PR is supposed to resolve "WARNING: Duplicate C declaration"
> due to struct and function with the same name, isn't it?
> 
> Are you sure the issue is resolved in Sphinx 4.0 and later?

You need to ping Sphinx C domain maintainer to be sure. This was
the author of the PR by the time I looked into it, but I'm not
tracking Sphinx development, so things might have changed.

Thanks,
Mauro
