Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D92CB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 18:51:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935523AbeEISvH convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 14:51:07 -0400
Received: from smtp1-3.goneo.de ([85.220.129.32]:33663 "EHLO smtp1-3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935528AbeEISvG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 14:51:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id 60553240CC0;
        Wed,  9 May 2018 20:51:04 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id j_JjU_uvnrfv; Wed,  9 May 2018 20:50:57 +0200 (CEST)
Received: from [192.168.1.112] (dyndsl-091-248-137-164.ewe-ip-backbone.de [91.248.137.164])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 1542D23F0AB;
        Wed,  9 May 2018 20:50:56 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <20180509123540.083b61d2@lwn.net>
Date:   Wed, 9 May 2018 20:50:56 +0200
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Transfer-Encoding: 8BIT
Message-Id: <B01BA9C9-2EB8-4B02-A78A-21CACC78143B@darmarit.de>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180509084120.GF12217@hirez.programming.kicks-ass.net>
 <20180509084518.247650e2@lwn.net>
 <20180509152026.GA12198@hirez.programming.kicks-ass.net>
 <20180509123540.083b61d2@lwn.net>
To:     Peter Zijlstra <peterz@infradead.org>
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 09.05.2018 um 20:35 schrieb Jonathan Corbet <corbet@lwn.net>:
> 
>> Why should I care for people not using text editors to write code?

Eh? .. why must readers write code?

We have rules how to write kernel-doc markup since the beginning of the century.
If you do not want to contribute kernel-doc markups, then just leave it, change
your comment start-tag to

 /*

and feel free to type what ever you want. Sorry, but this discussion is superfluous.

-- Markus -




--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
