Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_SBL,
	URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 38A7B7DCEA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 28 Jun 2019 18:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfF1SsI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 28 Jun 2019 14:48:08 -0400
Received: from ms.lwn.net ([45.79.88.28]:35956 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726702AbfF1SsG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 Jun 2019 14:48:06 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A2AE75A0;
        Fri, 28 Jun 2019 18:48:05 +0000 (UTC)
Date:   Fri, 28 Jun 2019 12:48:04 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: format kernel-parameters -- as code
Message-ID: <20190628124804.5ce44f04@lwn.net>
In-Reply-To: <20190628203841.723ccd9c@heffalump.sk2.org>
References: <20190627135938.3722-1-steve@sk2.org>
        <20190628091021.457d0301@lwn.net>
        <20190628203841.723ccd9c@heffalump.sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 28 Jun 2019 20:38:41 +0200
Stephen Kitt <steve@sk2.org> wrote:

> Right, looking further shows a large number of places where -- is handled
> incorrectly. The following patch disables this “smart” handling wholesale;
> I’ll follow up (in the next few days) with patches to use real em- and
> en-dashes where appropriate.

Thanks for figuring that out, it seems like the right thing to do.

Let's not worry about "real" dashes for now.  Not everybody welcomes
non-ascii characters in the docs and, for dashes, it's something I deemed
not worth fighting about.

Thanks,

jon
