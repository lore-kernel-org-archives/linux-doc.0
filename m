Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B87A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 09:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfCGJ6N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 04:58:13 -0500
Received: from smtp2-4.goneo.de ([85.220.129.36]:56232 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfCGJ6M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Mar 2019 04:58:12 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 7F80524055A;
        Thu,  7 Mar 2019 10:58:09 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xkPxj5zYLTRh; Thu,  7 Mar 2019 10:58:08 +0100 (CET)
Received: from [192.168.1.127] (host-091-097-250-091.ewe-ip-backbone.de [91.97.250.91])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 0C97223F56F;
        Thu,  7 Mar 2019 10:58:08 +0100 (CET)
Subject: Re: undefined label
To:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
References: <20190307091734.GB9152@eros.localdomain>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <c24a75bf-5bd5-aca8-7764-e05a03495e01@darmarit.de>
Date:   Thu, 7 Mar 2019 10:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190307091734.GB9152@eros.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 07.03.19 um 10:17 schrieb Tobin C. Harding:
> Hi Jon,
> 
> I hit that undefined label warning again today.  Then just now I was
> sitting enjoying a quite scotch and the reason came to me.  It is caused
> by building part of the docs instead of the whole tree i.e. using
> 
> 	make SPHINXDIRS=admin-guide htmldocs
> 
> Gives the warning
> 
> 	WARNING: undefined label: numa (if the link has no caption the label must precede a section header)

The label 'numa' is not a part of the admin-guide (book), it is set in
the vm (book): Documentation/vm/numa.rst:1

If compiling only a book like admin-guide, those links are broken.  Its not only
'numa' which is broken and its not only the admin-guide which has cross-books
links in.

To close such cross-books links we can use intersphinx [1] and map to e.g.

   intersphinx_mapping = {
       'kernel': ('https://www.kernel.org/doc/html/latest/', None)}

If there is any interest in, I can implement a RFC for this.

-- Markus --

[1] https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html

> 
> This is a hell of a gotcha, I wasted a bunch of cycles baffled as to why
> that label was not defined today :(  Super excited that I worked out why
> while day dreaming though.
> 
> Last time I sent in the 'fix' I must built with SPHINXDIRS, patched then
> built without SPHINXDIRS and thought the patch fixed it.
> 
> Anyways, hope you get a chuckle out of this.
> 
> All the best,
> Tobin.
> 
