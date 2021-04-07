Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0107BC433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA71E61262
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 08:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbhDGIyv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhDGIxM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 04:53:12 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB862C061763;
        Wed,  7 Apr 2021 01:52:23 -0700 (PDT)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lU3v7-00010n-4W; Wed, 07 Apr 2021 10:52:17 +0200
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Harry Wei <harryxiyou@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, linux-kernel@vger.kernel.org
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <65d1983fb625b5dd38d05f5c75a592e61992a4e0.1617783062.git.mchehab+huawei@kernel.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 17/19] docs: replace transation references for
 reporting-bugs.rst
Message-ID: <1c37acb4-f927-e2f7-8c77-d4fc2644f1d8@leemhuis.info>
Date:   Wed, 7 Apr 2021 10:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <65d1983fb625b5dd38d05f5c75a592e61992a4e0.1617783062.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1617785547;a805462f;
X-HE-SMSGID: 1lU3v7-00010n-4W
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.04.21 10:20, Mauro Carvalho Chehab wrote:
> Changeset d2ce285378b0 ("docs: make reporting-issues.rst official and delete reporting-bugs.rst")
> dropped reporting-bugs.rst, in favor of reporting-issues.rst, but
> translations still need to be updated, in order to point to the
> new file.
> 
> Fixes: d2ce285378b0 ("docs: make reporting-issues.rst official and delete reporting-bugs.rst")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Well, yeah, might be the right thing to do. But FWIW: when I recently
submitted the change that became d2ce285378b0 I actually pointed out
that it breaks some of the translations. Back then I considered to do
what you did with this patch, but among others got a reply from Jonathan
who said "let the translators catch up on their own time". For details
see this thread:
https://lore.kernel.org/linux-doc/87h7krksvu.fsf@meer.lwn.net/

Ciao, Thorsten
