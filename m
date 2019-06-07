Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AAF207D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 17:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729655AbfFGReP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 13:34:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:57840 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728998AbfFGReP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 13:34:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 827F57DA;
        Fri,  7 Jun 2019 17:34:14 +0000 (UTC)
Date:   Fri, 7 Jun 2019 11:34:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: Kbuild/Makefile: allow check for missing docs at
 build time
Message-ID: <20190607113413.5d9a3755@lwn.net>
In-Reply-To: <8ac254a7cf0569f1eeced9c9263cd7b0bfe4ed78.1559651025.git.mchehab+samsung@kernel.org>
References: <8ac254a7cf0569f1eeced9c9263cd7b0bfe4ed78.1559651025.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  4 Jun 2019 09:26:27 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> While this doesn't make sense for production Kernels, in order to
> avoid regressions when documents are touched, let's add a
> check target at the make file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Applied, thanks.

jon
