Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 743437D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 00:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfBGASH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Feb 2019 19:18:07 -0500
Received: from ms.lwn.net ([45.79.88.28]:35550 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfBGASG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Feb 2019 19:18:06 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 52BA49AE;
        Thu,  7 Feb 2019 00:18:06 +0000 (UTC)
Date:   Wed, 6 Feb 2019 17:18:05 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc:it_IT: add translations in process/
Message-ID: <20190206171805.52c73f6e@lwn.net>
In-Reply-To: <aa09cd3309bc9787b6ff3b1331508bb2@vaga.pv.it>
References: <20190119221341.3622-1-federico.vaga@vaga.pv.it>
        <20190120185617.44a7f275@lwn.net>
        <2146324.8BP4ZdZamE@pcbe13614>
        <aa09cd3309bc9787b6ff3b1331508bb2@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 06 Feb 2019 23:55:38 +0100
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> I am having a look at this document and I am wandering if this is an 
> useful
> document? Clearly I see value in the table with all requirements 
> summarised,
> but I do not see it for the rest of the document.
> 
> So, I propose to actually rename change.rst to requirements.rst and 
> remove
> everything but the requirements chapter and the links.

Removing obsolete information is fine with me.  I'd resist the temptation
to rename the file, though; people haven't forgiven us yet for the last
round of renaming, and this is a relatively well-known name.

Thanks,

jon
