Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 27E3E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 18:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfBGSDV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 13:03:21 -0500
Received: from smtp2-4.goneo.de ([85.220.129.36]:57931 "EHLO smtp2-4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfBGSDV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Feb 2019 13:03:21 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 6F48823F4C2;
        Thu,  7 Feb 2019 19:03:19 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LsDd7IH-3Icj; Thu,  7 Feb 2019 19:03:18 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-178-142-135-081.ewe-ip-backbone.de [178.142.135.81])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 82B5E23F02C;
        Thu,  7 Feb 2019 19:03:18 +0100 (CET)
Subject: Re: Return: vs Returns:
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
 <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
 <20190207161852.GC8040@rapoport-lnx>
 <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
 <20190207173448.GZ21860@bombadil.infradead.org>
 <77f029f635867f45e8c0192fc4db5928a00076ef.camel@perches.com>
 <5ab01a70-edbc-71b4-8c38-8eee0859889d@darmarit.de>
Message-ID: <dd7b41bc-ceca-93fb-873d-0bb1a8b3ba1a@darmarit.de>
Date:   Thu, 7 Feb 2019 19:03:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5ab01a70-edbc-71b4-8c38-8eee0859889d@darmarit.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Am 07.02.19 um 18:58 schrieb Markus Heiser:

> 
> BTW: kernel-doc parser accept 'return' and 'returns':
> 
>      } elsif ($newsection =~ m/^return?$/i) {
>          $newsection = $section_return;

Sorry wrong C&P, here is the one from the source:

	} elsif ($newsection =~ m/^returns?$/i) {
	    $newsection = $section_return;
	} elsif ($newsection =~ m/^\@return$/) {

-- Markus --

> 
> Is there really a need to be standardize this? From the list above I think
> there are only a few where it fails.
> 
> -- Markus --
