Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 513427D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 20:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfDAUnS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 16:43:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:40556 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfDAUnR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Apr 2019 16:43:17 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D1AB27DE;
        Mon,  1 Apr 2019 20:43:16 +0000 (UTC)
Date:   Mon, 1 Apr 2019 14:43:15 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: Makefile: use latexmk if available
Message-ID: <20190401144315.117f9c75@lwn.net>
In-Reply-To: <bfcc25db0c687797697d4ad71703ff8449072fad.1553953553.git.mchehab+samsung@kernel.org>
References: <bfcc25db0c687797697d4ad71703ff8449072fad.1553953553.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 30 Mar 2019 10:45:58 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> In the past, Sphinx was generating a LaTex Makefile that would
> run xelatex 3 times. Running it multiple times is needed in order
> to make the indexes right.
> 
> However, newer versions of it runs it just once, as it expects
> the machine to use the "latexmk" build, with automatically
> detects the need for rebuilds.
> 
> So, add a logic at the Makefile in order to detect if latexmk
> is installed. If so, it will call it.
> 
> As an additional bonus, the output of latexmk is a little bit
> better, making easier to identify build problems.

Seems to work.  I've applied both, thanks.

jon
