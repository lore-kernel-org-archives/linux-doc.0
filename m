Return-Path: <SRS0=zh9o=6G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD7C5518C
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 10:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76EE52087E
	for <linux-doc@archiver.kernel.org>; Wed, 22 Apr 2020 10:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730697AbgDVK0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:26:15 -0400
Received: from smtp1-2.goneo.de ([85.220.129.31]:54699 "EHLO smtp1-2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730686AbgDVK0O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Apr 2020 06:26:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 9ED7923F014;
        Wed, 22 Apr 2020 12:26:11 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rNSSx5_nzDPe; Wed, 22 Apr 2020 12:26:10 +0200 (CEST)
Received: from [192.168.1.127] (dyndsl-085-016-042-144.ewe-ip-backbone.de [85.16.42.144])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 9317F23F0E4;
        Wed, 22 Apr 2020 12:26:10 +0200 (CEST)
Subject: Re: Path troubles when using SPHINXDIRS option
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <20200421103814.4e0fa4c3@coco.lan>
 <dbc22720-79fe-e7a8-b88c-46108ba5ccf9@darmarit.de>
 <20200422105750.4fed3717@coco.lan>
 <428db3a0-4762-5ff4-1d31-2d64d81e2f65@darmarit.de>
 <20200422120520.70054224@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <7afd7ef6-8763-23eb-34d6-00b8a699bdda@darmarit.de>
Date:   Wed, 22 Apr 2020 12:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422120520.70054224@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 22.04.20 um 12:05 schrieb Mauro Carvalho Chehab:
[...]
>> The opposite of pointing to a file is, that we can only point the
>> file not a content in the file and we lost the flexibility of
>> dynamical referencing by target's name: If the target is moved,
>> the refs has to be changed also.
> 
> True, but we have a script that tracks those problems and even
> auto-correct most of such broken references.

[...]

> An extension like Documentation/sphinx/automarkup.py could
> easily replace them by :doc:`Documentation/foo`, creating
> links on all those places at no cost.

[...]

> Adding explicit :ref: would require manual work, and I bet some
> maintainers will reject adding extra markups on some files.

[...]

> In any case, maybe one day intersphinx will have support for :doc:
> types added there as well.
> 
> Without looking into the dirty details, it doesn't sound too hard to add
> support for it: intersphinx could simply create a :ref: type of reference
> for all files (like, __doc_driver_api__media__drivers__tuners). Then,
> any place with a :doc:`/driver-api/media/drivers/tuner` would be
> dynamically replaced by a :ref:`__doc_driver_api__media__drivers__tuners`
> at runtime.

Yes, hack over hack .. sometimes I feel back in the "DocBook century".

We now have a very confusing build process and I have to admit that
I am also to blame.

I also believe that everyone has good reasons.  For one solution or
for the other solution.  _Hack_ or _standard_, it is always a compromise
that the Kernel community has to find. 

  I cannot rate that.

-- Markus --


