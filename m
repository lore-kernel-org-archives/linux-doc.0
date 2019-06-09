Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F08D57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun,  9 Jun 2019 09:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfFIJ1k (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 9 Jun 2019 05:27:40 -0400
Received: from smtpcmd0756.aruba.it ([62.149.156.56]:45829 "EHLO
        smtpcmd0756.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbfFIJ1k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jun 2019 05:27:40 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Sun, 09 Jun 2019 05:27:39 EDT
Received: from [192.168.1.40] ([93.146.66.165])
        by smtpcmd07.ad.aruba.it with bizsmtp
        id NZLW2000a3Zw7e501ZLWhl; Sun, 09 Jun 2019 11:20:31 +0200
Subject: Re: [PATCH v3 22/33] docs: pps.txt: convert to ReST and rename to
 pps.rst
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <cb9274c1d5e94a74c5922c04d99b90554f2d804b.1560045490.git.mchehab+samsung@kernel.org>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <8079a463-1d39-e5c5-1c51-51bf37269f61@enneenne.com>
Date:   Sun, 9 Jun 2019 11:20:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cb9274c1d5e94a74c5922c04d99b90554f2d804b.1560045490.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1560072031; bh=paXthY9PTzj607n6DkR2m8vML/ZyJnsHXYh6cM4sxeo=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=HzDjhuQmewrFZf4LRDYi96rkWLpznV0QNZKYFvC94rGXNOQ1tydAjkFvPswZmUpR6
         JaSr26DgHWY2iKVGGeLYNwHyeVeklEge15AqUX+4RpAaTEFM2FlJKOS3k/2Q9awu9/
         Cl7gTEf4rArzG59UuzVSjE0kX1YEBC47TupUJFj82TK4b9FwPYFpsuxunZslK9kPCs
         0ISjyHQ2L+CP4OhhQ7X3YtGwg+RtezWDCrrh8Vy3H6hdNiRNpopWDyr0IMIWMbaNaX
         mWkso3QwjmEP7pYhaFMydAGWhQbUjuCnXJZ3g8m4qaA3BX28VIIIgEDkGUJtD+wOLy
         WaPeAVxrYSZAQ==
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/06/2019 04:27, Mauro Carvalho Chehab wrote:
> This file is already in a good shape: just its title and
> adding some literal block markups is needed for it to be
> part of the document.
> 
> While it has a small chapter with sysfs stuff, most of
> the document is focused on driver development.
> 
> As it describes a kernel API, move it to the driver-api
> directory.
> 
> In order to avoid conflicts, let's add an :orphan: tag
> to it, to be removed when added to the driver-api book.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
