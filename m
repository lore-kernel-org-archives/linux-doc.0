Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B069EC47095
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD6B2078E
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 08:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgJEI4Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 04:56:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:44118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJEI4W (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 5 Oct 2020 04:56:22 -0400
Received: from gaia (unknown [95.149.105.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F17892064C;
        Mon,  5 Oct 2020 08:56:19 +0000 (UTC)
Date:   Mon, 5 Oct 2020 09:56:17 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Hui Su <sh_def@163.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org,
        mchehab+huawei@kernel.org, davem@davemloft.net, robh@kernel.org,
        yamada.masahiro@socionext.com, sam@ravnborg.org,
        jpoimboe@redhat.com, rostedt@goodmis.org,
        miguel.ojeda.sandonis@gmail.com, divya.indi@oracle.com,
        tomas.winkler@intel.com, dhowells@redhat.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] mm,kmemleak-test.c: move kmemleak-test.c to samples dir
Message-ID: <20201005085617.GA3774@gaia>
References: <20200925183729.GA172837@rlk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925183729.GA172837@rlk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 26, 2020 at 02:37:29AM +0800, Hui Su wrote:
> kmemleak-test.c is just a kmemleak test module, which
> also can not be used as a built-in kernel module.
> Thus, i think it may should not be in mm dir, and move
> the kmemleak-test.c to samples/kmemleak/kmemleak-test.c.
> Fix the spelling of built-in by the way.
> 
> Signed-off-by: Hui Su <sh_def@163.com>

Moving the test is fine by me.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
