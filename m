Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 59BEF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Sep 2019 12:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbfIEM5E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Sep 2019 08:57:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:56832 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731008AbfIEM5D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Sep 2019 08:57:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EB1176EC;
        Thu,  5 Sep 2019 12:57:02 +0000 (UTC)
Date:   Thu, 5 Sep 2019 06:57:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
Message-ID: <20190905065701.4744e66a@lwn.net>
In-Reply-To: <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
References: <20190905055614.7958918b@coco.lan>
        <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  5 Sep 2019 06:23:13 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Python's PEP-263 [1] dictates that an script that needs to default to
> UTF-8 encoding has to follow this rule:
> 
> 	'Python will default to ASCII as standard encoding if no other
> 	 encoding hints are given.
> 
> 	 To define a source code encoding, a magic comment must be placed
> 	 into the source files either as first or second line in the file'

So this is only Python 2, right?  Python 3 is UTF8 by default.  Given that
Python 2 is EOL in January, is this something we should be concerned
about?  Or should we instead be making sure that all the Python we have
in-tree works properly with Python 3 and be done with it?

Thanks,

jon
