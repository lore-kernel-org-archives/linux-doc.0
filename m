Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7B72E7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753525AbeEHDHa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753510AbeEHDHa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 23:07:30 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C45B921741;
        Tue,  8 May 2018 03:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525748849;
        bh=/RvQs14LiYW+wqNMCgCKfAIhGhH0DY+YGtqJpEytnNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hEyYzqhSgT/kibZJGSg8nsa8tBa0Qu3dugGyeoylS7hdbrFS+lV0FZXiGL1sdjU5R
         r4YJnkL0iiabybHvYzO5vQoJD1WpXiBu0IZfyvijxYVDyRz7sddxe0kojmQxUJImLE
         22cotS0V2wNpGKiK2y1QtE25y5vVmT+Chi9oehV8=
Date:   Tue, 8 May 2018 05:07:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 08/18] docs: driver-api: add clk documentation
Message-ID: <20180508030716.GA1882@kroah.com>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <f3398bca6fba979bd55b8a053b6b46fe35bf9891.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3398bca6fba979bd55b8a053b6b46fe35bf9891.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:44AM -0300, Mauro Carvalho Chehab wrote:
> The clk.rst is already in ReST format. So, move it to the
> driver-api guide, where it belongs.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
