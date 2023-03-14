Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC8AC05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 18:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjCNSXr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjCNSXo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 14:23:44 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14808132D8
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 11:23:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 929587F9;
        Tue, 14 Mar 2023 18:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 929587F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678818223; bh=TGIn+WWJvwo7kXmKWBDh2WDwXy0GHSRGNTNkrbEkqiA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lz1tY041QyUeH5eSWcIqewEuFLzsc8yidE5aclstJ39Kye1/EKUvkLZa1SU5GDWYG
         d0KEts0LgWnovMGlxlpyuyuI6wLT8W2zGX+3t1Px7cppOEnsBJFq1BdiZSUSSZX9Sz
         AoYyN3b7frWOA/Cm3/Fwx8qrR0JxSIJMXp/VefPsWNknltBStcsZIcqHpRA/ksPgdf
         a/OzF31PQpQ6qGFIGJZaj7uWkiynMcPn26uW9r/LP6AKwpDm0YMiI44h2W6xGgGdax
         NyPHCXzJ5LojZxW9nKKpgm/EkNDWlfBiJifn8kMjOz+r+aPpFdIqSCS65wkhKdqoTn
         IaqNr6x4WRfgQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org
Cc:     Theodore Ts'o <tytso@mit.edu>, Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH -v3] Documentation/process: Add Linux Kernel
 Contribution Maturity Model
In-Reply-To: <20230308190403.2157046-1-tytso@mit.edu>
References: <20230308190403.2157046-1-tytso@mit.edu>
Date:   Tue, 14 Mar 2023 12:23:42 -0600
Message-ID: <87ilf3ry35.fsf@meer.lwn.net>
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
>
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  .../process/contribution-maturity-model.rst   | 109 ++++++++++++++++++
>  Documentation/process/index.rst               |   1 +
>  MAINTAINERS                                   |   8 ++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/process/contribution-maturity-model.rst

I've gone head and applied this.

Thanks,

jon
