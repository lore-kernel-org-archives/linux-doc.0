Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0BC17D912
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 13:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbfJGNZk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 09:25:40 -0400
Received: from ms.lwn.net ([45.79.88.28]:57398 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727324AbfJGNZk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Oct 2019 09:25:40 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7B48E2C1;
        Mon,  7 Oct 2019 13:25:39 +0000 (UTC)
Date:   Mon, 7 Oct 2019 07:25:38 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     <yamada.masahiro@socionext.com>
Cc:     <adam.zerella@gmail.com>, <michal.lkml@markovi.net>,
        <linux-doc@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH] Documentation: kbuild: Add document about namespaces
Message-ID: <20191007072538.4585be2c@lwn.net>
In-Reply-To: <a5dfd064b9c14065a5be171cb68876c7@SOC-EX01V.e01.socionext.com>
References: <20191007030319.GA32575@gmail.com>
        <a5dfd064b9c14065a5be171cb68876c7@SOC-EX01V.e01.socionext.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 7 Oct 2019 04:26:24 +0000
<yamada.masahiro@socionext.com> wrote:

> > Sphinx outputs the following build warning:
> > 
> > Documentation/kbuild/namespaces.rst:
> > WARNING: document isn't included in any toctree  
> 
> 
> Oh, I did not notice this file was added to the kbuild directory.
> 
> I do not understand why it is related to the build system.
> So, I'd rather have this file somewhere else.

Yeah, probably it makes sense to move it into the core-api manual.
Matthias (added to CC) do you disagree?  If not, maybe Adam you could redo
the patch with the move as well?

Thanks,

jon
