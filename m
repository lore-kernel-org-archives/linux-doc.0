Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD33C636D3
	for <linux-doc@archiver.kernel.org>; Wed,  8 Feb 2023 20:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjBHUbm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Feb 2023 15:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbjBHUbl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 15:31:41 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8B438B54
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 12:31:39 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C586B4BF;
        Wed,  8 Feb 2023 20:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C586B4BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675888298; bh=Yl+DvmEvhch8X78FFNEUr6o2VaIF2aI6fArU+1jz0UU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fLGiRupUEGs4YOtXcc18Ekr9UUhNqgRn9dFFqyMq8lStVlr5mhcg3IV9XLiyaO3xr
         FPDn5qx1CNKWQ+aoCDakmdKs4ti/9ZUQmfrCp2gjGu3dr6YzOT/K0BH6RJFXxLTyNd
         9TVJ9rfIUJsxZ1kwjeK9oZ1NJpiYXhXUb0CNBO3MKhZ8bs8OsPRdNB+sGZN6BJHLki
         LVgNi7ZXyiAR+Z0bY1cGFzPepfzSa2GxPlsB30UnrKvib1GSg4VyX+oaFT6b9/DQMk
         d/LRFSmVJmF4in3XmIZdqVkbCpZF2G5lr1SjsbdgtdACOwDqv69/NWl+G/R3jPTIwB
         QtXgjc4Tq1+uQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org
Cc:     Theodore Ts'o <tytso@mit.edu>, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] Documentation/process: Add Linux Kernel Contribution
 Maturity Model
In-Reply-To: <20221214185714.868374-1-tytso@mit.edu>
References: <20221214185714.868374-1-tytso@mit.edu>
Date:   Wed, 08 Feb 2023 13:31:36 -0700
Message-ID: <87sfffucev.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Theodore Ts'o" <tytso@mit.edu> writes:

> As a follow-up to a discussion at the 2021 Maintainer's Summit on the
> topic of maintainer recruitment and retention, the TAB took on the
> task of creating a document which to help companies and other
> organizations to grow in their ability to engage with the Linux Kernel
> development community, using the Maturity Model[2] framework.
>
> The goal is to encourage, in a management-friendly way, companies to
> allow their engineers to contribute with the upstream Linux Kernel
> development community, so we can grow the "talent pipeline" for
> contributors to become respected leaders, and eventually kernel
> maintainers.
>
> [1] https://lwn.net/Articles/870581/
> [2] https://en.wikipedia.org/wiki/Maturity_model

So there were a few review comments on this document...  Ted, were you
planning a new revision or is it your feeling that it's ready to be
merged in this form?

Thanks,

jon
