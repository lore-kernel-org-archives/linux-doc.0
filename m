Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B1D97D043
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Jun 2018 16:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932330AbeFFQbM convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Jun 2018 12:31:12 -0400
Received: from smtp1-3.goneo.de ([85.220.129.32]:56826 "EHLO smtp1-3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932152AbeFFQbM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Jun 2018 12:31:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 72EE623F6D8;
        Wed,  6 Jun 2018 18:31:09 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EIv-5ulzjF3y; Wed,  6 Jun 2018 18:31:08 +0200 (CEST)
Received: from [192.168.1.112] (host-091-097-255-197.ewe-ip-backbone.de [91.97.255.197])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 0BBF723F77D;
        Wed,  6 Jun 2018 18:31:06 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH v2 53/53] kernel-doc: describe the ``literal`` syntax
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <5d47c31b59f6c2c7ddce0fcb1be0f85ad39a56fe.1494935649.git.mchehab@s-opensource.com>
Date:   Wed, 6 Jun 2018 18:31:05 +0200
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Cyrille Pitchen <cyrille.pitchen@atmel.com>,
        linux-mtd@lists.infradead.org, Jani Nikula <jani.nikula@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Transfer-Encoding: 8BIT
Message-Id: <EF34D78D-738B-47F4-B188-9777440B7E70@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <cover.1494935649.git.mchehab@s-opensource.com>
 <5d47c31b59f6c2c7ddce0fcb1be0f85ad39a56fe.1494935649.git.mchehab@s-opensource.com>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

> Am 16.05.2017 um 14:16 schrieb Mauro Carvalho Chehab <mchehab@s-opensource.com>:
> 
> changeset b97f193abf83 ("scripts/kernel-doc: fix parser
> for apostrophes") added support for ``literal`` inside
> kernel-doc, in order to allow using the "%" symbol inside
> a literal block, as this is used at printk() description.
> 
> Document it.
> 
> Fixes: b97f193abf83 ("scripts/kernel-doc: fix parser for apostrophes")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
> Documentation/doc-guide/kernel-doc.rst | 10 ++++++++++
> 1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> index b32e4813ff6f..b24854b5d6be 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -149,6 +149,16 @@ Domain`_ references.
> ``%CONST``
>   Name of a constant. (No cross-referencing, just formatting.)
> 
> +````literal````
> +  A literal block that should be handled as-is. The output will use a
> +  ``monospaced font``.

just nitpicking; this is not literal block, this is called an inline literal [1]

To be complete: "blocks" are allways indented.

[1] http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html#inline-literals

--- Markus --

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
