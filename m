Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0B25A7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 16:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbeKUCqG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 21:46:06 -0500
Received: from ms.lwn.net ([45.79.88.28]:55652 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728271AbeKUCqG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 21:46:06 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DF4892E4;
        Tue, 20 Nov 2018 16:16:11 +0000 (UTC)
Date:   Tue, 20 Nov 2018 09:16:10 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Alessia Mantegazza <amantegazza@vaga.pv.it>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] doc:it_IT: update italian documentation
Message-ID: <20181120091610.35ebffee@lwn.net>
In-Reply-To: <20181108232417.14982-1-federico.vaga@vaga.pv.it>
References: <20181108232417.14982-1-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  9 Nov 2018 00:24:14 +0100
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> In this small patch set there is the V3 of
> "doc:it_IT: add some process/* translations" in which I fixed
> the recent conflicts in docs-next.
> I took the occasion to add other two simple patches that fix:
> - a missing translation in locking.rst
> - apply a patch from the official documentation to the italian one

OK, I have applied the set, apologies for taking so long.

I do have one request: there are an awful lot of entries that simply say
"ancora da tradurre" in here; those are not going to bring much joy to
your readers.  Can I ask that you try to reduce those in number, either by
doing the work or concluding that it won't happen and just removing them?
No timelines or anything - I'd just be happy to see the work go in that
direction.

Thanks,

jon
