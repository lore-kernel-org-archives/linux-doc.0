Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA9FF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 19:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbfGaTJJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 15:09:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:55702 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726073AbfGaTJJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:09:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B15556D9;
        Wed, 31 Jul 2019 19:09:08 +0000 (UTC)
Date:   Wed, 31 Jul 2019 13:09:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Shobhit Kukreti <shobhitkukreti@gmail.com>
Cc:     skhan@linuxfoundation.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        willy@infradead.org
Subject: Re: [PATCH v3] Documentation: filesystems: Convert jfs.txt to
Message-ID: <20190731130907.5e0527e9@lwn.net>
In-Reply-To: <1562772541-32144-1-git-send-email-shobhitkukreti@gmail.com>
References: <20190710093323.7e5d6790@coco.lan>
        <1562772541-32144-1-git-send-email-shobhitkukreti@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Jul 2019 08:29:01 -0700
Shobhit Kukreti <shobhitkukreti@gmail.com> wrote:

> This converts the plain text documentation of jfs.txt to reStructuredText
> format. Added to documentation build process and verified with 
> make htmldocs
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti@gmail.com>

So this kind of fell through the cracks, sorry; I've applied it now.

Thanks,

jon
