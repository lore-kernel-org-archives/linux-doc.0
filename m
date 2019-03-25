Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4BBFB7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Mar 2019 16:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbfCYQde (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Mar 2019 12:33:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:43178 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbfCYQde (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Mar 2019 12:33:34 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2D8619B1;
        Mon, 25 Mar 2019 16:33:34 +0000 (UTC)
Date:   Mon, 25 Mar 2019 10:33:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <tobin@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] docs: Fix various build warnings/errors
Message-ID: <20190325103333.700c2772@lwn.net>
In-Reply-To: <20190307211153.28400-1-tobin@kernel.org>
References: <20190307211153.28400-1-tobin@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  8 Mar 2019 08:11:44 +1100
"Tobin C. Harding" <tobin@kernel.org> wrote:

> I had a few hours to spare so I thought I'd clear some Sphinx build
> warnings/errors.

So there were comments on various parts of this series; were you planning
to respin it with those taken into account?  Certainly we're all in favor
of fewer warnings!

Thanks,

jon
