Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF2F57D082
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 14:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbeJGVti (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 17:49:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:34592 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726616AbeJGVti (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 7 Oct 2018 17:49:38 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7FC458AF;
        Sun,  7 Oct 2018 14:42:11 +0000 (UTC)
Date:   Sun, 7 Oct 2018 08:42:10 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Alessia Mantegazza <amantegazza@vaga.pv.it>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] doc:it_IT: add some process/* translations
Message-ID: <20181007084210.0cec373a@lwn.net>
In-Reply-To: <20181005185157.27819-1-federico.vaga@vaga.pv.it>
References: <20181005185157.27819-1-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  5 Oct 2018 20:51:57 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> This patch does not translate entirely the subfolder "process/"
> but only part of it (to begin with).
> 
> In order to avoid broken links, I included empty documents
> for those which are not yet translated.
> 
> In order to be able to refer to all documents in "process/",
> I added a sphinx label to those which had not one.
> 
> Translated documents:
> - howto
> - 1.Intro
> - clang-format
> - coding-style
> - kernel-driver-statement
> - magic-number
> - volatile-considered-harmful
> - development-process
> 
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> Signed-off-by: Alessia Mantegazza <amantegazza@vaga.pv.it>

Just FYI, I'll hold this until after the start of the merge window.

This is starting to be quite a bit of translated material!  Are you sure
you're up to maintaining it all as the documents evolve?

Thanks,

jon
