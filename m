Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCCEB7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 16:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfADQlo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 11:41:44 -0500
Received: from ms.lwn.net ([45.79.88.28]:35522 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfADQlo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Jan 2019 11:41:44 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 83C702BB;
        Fri,  4 Jan 2019 16:41:43 +0000 (UTC)
Date:   Fri, 4 Jan 2019 09:41:42 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        linux-doc@vger.kernel.org, "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>, Zhang Le <r0bertz@gentoo.org>,
        Li Yang <leo@zh-kernel.org>
Subject: Re: [PATCH] Documentation/CodingStyle: Move emacs settings into
 .dir-locals.el
Message-ID: <20190104094142.3494d703@lwn.net>
In-Reply-To: <1546619558.163063.34.camel@acm.org>
References: <20190104003957.82220-1-bvanassche@acm.org>
        <4009470.9o5kGc7Prg@harkonnen>
        <1546619558.163063.34.camel@acm.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 04 Jan 2019 08:32:38 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> > Isn't it better if we collect such configuration files into a dedicated 
> > directory (where exactly?) instead of putting them in the top-level one? Then, 
> > the developer has to copy/link the configuration file into the top-level 
> > directory.  
> 
> I don't think so. The reason we have the checkpatch script and the
> coding-style.rst document in the kernel tree is to promote coding style
> uniformity. Placing the .dir-locals.el at the top level serves the same
> purpose. Additionally, if the .dir-locals.el file is not at the top level
> many kernel developers will overlook it.

I think we have to be careful about silently configuring other developers'
tools.  We put checkpatch.pl in the kernel tree, but we don't add a git
hook for everybody to run it.  I'm totally in favor of adding this .el
file to the documentation (or samples) directory and pointing users to it;
I'm less thrilled about putting in a dotfile where emacs will just pick it
up.

jon
