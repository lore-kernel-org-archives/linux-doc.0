Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 792DB7D581
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 20:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbeIUCU3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 22:20:29 -0400
Received: from ms.lwn.net ([45.79.88.28]:47920 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387845AbeIUCU3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Sep 2018 22:20:29 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E544866;
        Thu, 20 Sep 2018 20:35:13 +0000 (UTC)
Date:   Thu, 20 Sep 2018 14:35:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: Re: [PATCH] doc:it_IT: add some process/* translations
Message-ID: <20180920143511.26136ddd@lwn.net>
In-Reply-To: <20180920142957.09000163@lwn.net>
References: <20180909161641.3792-1-federico.vaga@vaga.pv.it>
        <20180920142957.09000163@lwn.net>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 20 Sep 2018 14:29:57 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Sun,  9 Sep 2018 18:16:41 +0200
> Federico Vaga <federico.vaga@vaga.pv.it> wrote:
> 
> > This patch does not translate entirely the subfolder "process/"
> > but only part of it (to begin with).
> > 
> > In order to avoid broken links, I included empty documents
> > for those which are not yet translated.
> > 
> > In order to be able to refer to all documents in "process/",
> > I added a sphinx label to those which had not one.
> > 
> > Translated documents:
> > - howto
> > - 1.Intro
> > - clang-format
> > - coding-style
> > - kernel-driver-statement
> > - magic-number
> > - volatile-considered-harmful
> > - development-process
> > 
> > Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> > Signed-off-by: Alessia Mantegazza <amantegazza@vaga.pv.it>  
> 
> Applied, thanks.

Actually, I just backed that out, sorry.  There's an immediate conflict
with -next over code-of-conflict.rst that is best avoided, and there is
no point in adding a translation of the old code. If you can respin the
patch set without that change, I'll apply it.

Thanks,

jon
