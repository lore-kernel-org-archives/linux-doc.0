Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D41FC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 23:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0681764DE2
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 23:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhA1Xkc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jan 2021 18:40:32 -0500
Received: from ms.lwn.net ([45.79.88.28]:51252 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231481AbhA1Xkb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 28 Jan 2021 18:40:31 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0FE8A617B;
        Thu, 28 Jan 2021 23:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0FE8A617B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611877191; bh=8uyQNTB/nB2LTiZ3Hy2ppDXqH+dcyz2L66J4VE+opFo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TiQnY7YMWtLSfAJIfV8/aknVW3wDfaCFEEeRfwyQNbD6SpNxHSRNZc16R3x/Nai+x
         1lWXU8daKcFmBlNwpLg51OF9NSEd1vFRZRMbS4EtC+Mz+1dSrsnzYc5Ea+diAoi+IF
         HqW3EjzZRlIZOfZciUNxVCppZTskKSmE5PHwwtTYy9IQ94Z98SySyLSh7qQRZgty8a
         2vJ/Vde5TElMb+N64SS96xqUw9SqZ970HfImB9tLi5U7RdNyPxmIdjQS/ReXAy/GeY
         cfXfx8klEPztYjQ3z8w76lUA62/xWdr4SQetId//OUqrlLoZjCff1sMINHUQ0wrYEN
         r2oROkP7GMvpg==
Date:   Thu, 28 Jan 2021 16:39:49 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc:     linux-doc@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] scripts/kernel-doc: add internal hyperlink to DOC:
 sections
Message-ID: <20210128163949.1f07186b@lwn.net>
In-Reply-To: <20210118110813.1490-1-michal.wajdeczko@intel.com>
References: <20210118110813.1490-1-michal.wajdeczko@intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Jan 2021 12:08:13 +0100
Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:

> While DOC: section titles are not converted into RST headings
> sections and are only decorated with strong emphasis markup,
> nothing stops us from generating internal hyperlinks for them,
> to mimic implicit hyperlinks to RST headings.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

So I've applied this, but ...

>  scripts/kernel-doc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 6325bec3f66f..272f70c9fb13 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -833,6 +833,7 @@ sub output_blockhead_rst(%) {
>  	next if (defined($nosymbol_table{$section}));
>  
>  	if ($output_selection != OUTPUT_INCLUDE) {
> +	    print ".. _$section:\n\n";
>  	    print "**$section**\n\n";
>  	}

...the placement within this if means that the section marker doesn't
appear whenever a doc block is explicitly included with the :doc: modifier
- which I think is much of the time.  I *think* the marker should be
output unconditionally.

Jani, you appear to be the culprit behind that particular "if", which
seems a little questionable to me in general at the moment, but you must
have had a good reason.  Do you see any reason why a section marker should
be suppressed in the same way?

Thanks,

jon
