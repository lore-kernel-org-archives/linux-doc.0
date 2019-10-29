Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9797A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 11:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731607AbfJ2LB3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 07:01:29 -0400
Received: from ms.lwn.net ([45.79.88.28]:44352 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726091AbfJ2LB3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 07:01:29 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F09302B4;
        Tue, 29 Oct 2019 11:01:27 +0000 (UTC)
Date:   Tue, 29 Oct 2019 05:01:23 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix warnings for unused files in toctree
Message-ID: <20191029050123.54a474e6@lwn.net>
In-Reply-To: <CAODfWeF_xAhQJvRSBiDBQco8OG0kaH69eD=VbxBjB2fnPAXWnA@mail.gmail.com>
References: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
        <CAODfWeH67_ZfO7yrrQ+EcFgXd8stA23y6hUtimhzEbXvWmjhbw@mail.gmail.com>
        <20191029032130.444c6fce@lwn.net>
        <CAODfWeF_xAhQJvRSBiDBQco8OG0kaH69eD=VbxBjB2fnPAXWnA@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Oct 2019 11:58:21 +0100
Héctor Orón Martínez <hector.oron@gmail.com> wrote:

> >  - Please work against docs-next and look at the history of what you are
> >    working on. For example:  
> 
> Where do I find the docs-next tree?

It's in the MAINTAINERS file:

T:	git git://git.lwn.net/linux.git docs-next

Thanks,

jon
