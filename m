Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E04C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 12:01:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73D2764E60
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 12:01:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhBWMAh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 07:00:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:40378 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232845AbhBWL6Y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Feb 2021 06:58:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3E215AC1D;
        Tue, 23 Feb 2021 11:57:40 +0000 (UTC)
Subject: Re: [PATCH] docs: reporting-issues.rst: explain how to decode stack
 traces
To:     Thorsten Leemhuis <linux@leemhuis.info>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sasha Levin <sashal@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Damian Tometzki <linux@tometzki.de>
References: <20210215172857.382285-1-linux@leemhuis.info>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <aedcc7df-b30b-ebfe-9654-c2c572889d3f@suse.cz>
Date:   Tue, 23 Feb 2021 12:57:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215172857.382285-1-linux@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/15/21 6:28 PM, Thorsten Leemhuis wrote:
> Replace placeholder text about decoding stack traces with a section that
> properly describes what a typical user should do these days. To make
> it works for them, add a paragraph in an earlier section to ensure
> people build their kernels with everything that's needed to decode stack
> traces later.

Looks good!

> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> Reviewed-by: Qais Yousef <qais.yousef@arm.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!
