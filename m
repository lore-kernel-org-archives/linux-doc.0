Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301ADC4363D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 12:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 039A9206B2
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 12:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387738AbgJBMHi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 08:07:38 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:40108 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725964AbgJBMHi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Oct 2020 08:07:38 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kOJqS-00HD8r-7k; Fri, 02 Oct 2020 14:07:28 +0200
Date:   Fri, 2 Oct 2020 14:07:28 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] scripts: kernel-doc: add support for typedef enum
Message-ID: <20201002120728.GH4067422@lunn.ch>
References: <cover.1601616399.git.mchehab+huawei@kernel.org>
 <f381c13667d8794a941457f5ef771fe34788e831.1601616399.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f381c13667d8794a941457f5ef771fe34788e831.1601616399.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 02, 2020 at 07:49:49AM +0200, Mauro Carvalho Chehab wrote:
> The PHY kernel-doc markup has gained support for documenting
> a typedef enum.
> 
> However, right now the parser was not prepared for it.

Hi Mauro

Thanks for this. I'm using Sphinx 3.2.1, since that is what my Debian
box has. So it can be hard to see the new warnings amongst the old.

Will this patch get merged via Jonathan Corbet's tree?

Thanks
	Andrew
