Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C795C05027
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 00:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjBJAEy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 19:04:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBJAEy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 19:04:54 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FAE30B3F
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 16:04:53 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E8B114B0;
        Fri, 10 Feb 2023 00:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8B114B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675987492; bh=CVt33zUSL0kzC67DPduT4Ok164aT/C4bWLAC5LwoeBE=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=Ey6Po9dGv3LhpMSCClXbY5NW1iZ78BMwdKUODWj17GUufVTHGlsKojOklNAnbQkZs
         /FxrIdsbdWbCiA+fevgnKMbz3FoZ9Coc0vXyAhLrQVYciKmsLdt9IarZSOg2I7As3w
         Yh21+GBGtlGLJLve0ea9m3Nl5CjaFetaRdHGGPCEMpdvnZVtGRQe7xemP+CWiUnIhl
         wRh33XsfQxmKDer2pTfWOfksm4fJkBouYgnwZOudY22ObydrpIEldfJ768sPO8BbHB
         1bqEvfdYgW8gfy+JHql1FLIft9A42ozMQrhQ6YZPCmN9g7fHxPPCANk5h+kR4k5PHO
         lIRT/BqS3wU6g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sreevani Sreejith <ssreevani@meta.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Kernel Documentation Backlog
In-Reply-To: <758FF6F9-460B-4323-9C1F-80901255B9F0@fb.com>
References: <758FF6F9-460B-4323-9C1F-80901255B9F0@fb.com>
Date:   Thu, 09 Feb 2023 17:04:51 -0700
Message-ID: <874jruqtb0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sreevani Sreejith <ssreevani@meta.com> writes:

> I am a tech writer interested in improving kernel documentation. Where
> do I find kernel-related documentation to-do list/bugs listed?

I have a general list of useful tasks in
Documentation/doc-guide/contributing.rst, also visible at
https://www.kernel.org/doc/html/latest/doc-guide/contributing.html.

Beyond that, it's a matter of what kinds of work you're looking to do.
Feel free to ask if you have any questions, and I'm looking forward to
your patches.

Thanks,

jon
