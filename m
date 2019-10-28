Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4FDB37D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 14:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfJ1Oaq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 10:30:46 -0400
Received: from ms.lwn.net ([45.79.88.28]:38410 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727148AbfJ1Oap (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 28 Oct 2019 10:30:45 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E73A1739;
        Mon, 28 Oct 2019 14:30:43 +0000 (UTC)
Date:   Mon, 28 Oct 2019 08:30:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     madhuparnabhowmik04@gmail.com
Cc:     mchehab+samsung@kernel.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Documentation: driver-api: index: Removed non-existing
 document driver-api/sgi-ioc4 from the toctree.
Message-ID: <20191028083039.1151a646@lwn.net>
In-Reply-To: <20191028060710.15154-1-madhuparnabhowmik04@gmail.com>
References: <20191028060710.15154-1-madhuparnabhowmik04@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 28 Oct 2019 11:37:10 +0530
madhuparnabhowmik04@gmail.com wrote:

> From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> 
> This patches fixes the WARNING: toctree contains reference
> to nonexisting document u'driver-api/sgi-ioc4'by removing
> it from the toctree in the index.rst file.
> 
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
> ---

Thanks, but this was fixed in docs-next last week.

jon
