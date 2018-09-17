Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D1627D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Sep 2018 16:13:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbeIQVlW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Sep 2018 17:41:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbeIQVlW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 Sep 2018 17:41:22 -0400
Received: from localhost (unknown [209.121.128.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2800E214C5;
        Mon, 17 Sep 2018 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1537200800;
        bh=SPeGaiDcWl/sjOuncuBnnae+wYoui2ky5pw5kanr4IY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F73qjYUr1usD3M71iUb1JQiBQEvWFM7pUEtCuPtVnZR+xS2NiAQgbC+UKaztgCm3Q
         NhlWR1A4vV7w5lL3EAiyAchJUO0lfnCHnOb6znVQgl79C7C92QDRPT3oZbg3PUNgfu
         mbhYuYKu8b4pvQ61YY64QqstebtpJ10hYlJse3BM=
Date:   Mon, 17 Sep 2018 09:13:19 -0700
From:   Vinod <vkoul@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     moderated for non-subscribers <alsa-devel@alsa-project.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Shreyas NC <shreyas.nc@intel.com>
Subject: Re: [PATCH] Documentation: soundwire: fix stream.rst markup warnings
Message-ID: <20180917161319.GB2613@vkoul-mobl>
References: <8e1ec734-06b8-ba8a-fdca-3221ac134ea0@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1ec734-06b8-ba8a-fdca-3221ac134ea0@infradead.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 16-09-18, 17:34, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix kernel-doc markup warnings in soundwire/stream.rst:
> 
> rc4/Documentation/driver-api/soundwire/stream.rst:177: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:203: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:248: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:277: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:304: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:328: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:352: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> rc4/Documentation/driver-api/soundwire/stream.rst:364: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Applied, thanks

-- 
~Vinod
