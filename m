Return-Path: <SRS0=p0eP=3M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9901C32771
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 00:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CF9221835
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jan 2020 00:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgAWAX5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 19:23:57 -0500
Received: from ms.lwn.net ([45.79.88.28]:53606 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgAWAX5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Jan 2020 19:23:57 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 948CE378;
        Thu, 23 Jan 2020 00:23:56 +0000 (UTC)
Date:   Wed, 22 Jan 2020 17:23:55 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Add a maintainer entry profile for Documentation/
Message-ID: <20200122172355.07aefd82@lwn.net>
In-Reply-To: <64abdebb-6055-7b9c-9376-607ff75c0b01@infradead.org>
References: <20200122162140.6a13e6a9@lwn.net>
        <64abdebb-6055-7b9c-9376-607ff75c0b01@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 22 Jan 2020 15:50:32 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> > +When making documentation changes, you should actually build the
> > +documentation and ensure that no new errors have been introduced.  
> 
> I would prefer "that no new errors or warnings" ...

Easily added, thanks.

jon
