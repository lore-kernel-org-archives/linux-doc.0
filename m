Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A10C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 12 Oct 2022 12:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiJLMiy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Oct 2022 08:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiJLMix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 08:38:53 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3FF0C697F;
        Wed, 12 Oct 2022 05:38:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 462352DC;
        Wed, 12 Oct 2022 12:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 462352DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665578332; bh=s8PqmBWF3mBVRrjgZVnrBttlirERX9+rbJQjRKhxk7I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oYcK1iX92ua1zn5YXiQ1m0+B/TFTNcCXCX+jMxKzTCxRUkr7mnSN6NTIJmHdgqHMY
         VGky22OdA1kI3juA3Qq1bOPrNUKPu1NoqUB2OugU4jiguQvbZpAXCesxMWAm5LQil0
         hZqvU7CAnYVWL7c6XbuF01xAgPq9xso4epjrXalKWpCScv6a49qJMWXQkdbFNUMk+O
         f8dC8shOQWfHupmnSuJrNOi3l8AkrprEmSS1dE600w7bRCgBMemS6OUrEdqcEnIvGJ
         wajG8sYeGjnAv3o8s9pAwHVldSu9OG2y5n/+9swUPuKN83Ij3t2rKnwvzjLPJhXwBj
         NSE0I+1iJUYTw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 0/6] docs: Improvements to our HTML output
In-Reply-To: <3c65451e-c9bf-55ea-02af-f375346c955a@gmail.com>
References: <20221011190047.749145-1-corbet@lwn.net>
 <3c65451e-c9bf-55ea-02af-f375346c955a@gmail.com>
Date:   Wed, 12 Oct 2022 06:38:51 -0600
Message-ID: <87h709md2c.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hmm, I can't cleanly apply this patch series on top of either Linus's tree
> or linux-next due to conflicts on [1/6]. On what commit this series is based
> on?

docs-next, which is still running off the pre-6.0 base until after the
merge window closes.

If I need to post another round before merging I'll drag everything
forward to a more current base.

Thanks,

jon
