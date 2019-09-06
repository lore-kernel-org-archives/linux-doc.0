Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D22C87D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Sep 2019 14:52:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394645AbfIFOwO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Sep 2019 10:52:14 -0400
Received: from ms.lwn.net ([45.79.88.28]:36658 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394644AbfIFOwO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Sep 2019 10:52:14 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AB9EE97D;
        Fri,  6 Sep 2019 14:52:13 +0000 (UTC)
Date:   Fri, 6 Sep 2019 08:52:12 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     John Garry <john.garry@huawei.com>
Cc:     <mchehab+samsung@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
Message-ID: <20190906085212.79ec917c@lwn.net>
In-Reply-To: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 7 Aug 2019 00:06:23 +0800
John Garry <john.garry@huawei.com> wrote:

> The reference driver no longer exists since commit 50f1242c6742 ("mtd:
> fsl-quadspi: Remove the driver as it was replaced by spi-fsl-qspi.c").
> 
> Update reference to spi-fsl-qspi.c driver.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>

So this appears to have languished for a month...applied now, sorry for
the delay.

Thanks,

jon
