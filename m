Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B04C7E676
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 14:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933762AbeCHOls (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 09:41:48 -0500
Received: from verein.lst.de ([213.95.11.211]:35622 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933736AbeCHOlp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Mar 2018 09:41:45 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id C1EB69F161; Thu,  8 Mar 2018 15:41:43 +0100 (CET)
Date:   Thu, 8 Mar 2018 15:41:43 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Karthik Ramasubramanian <kramasub@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org,
        corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de,
        hch@lst.de, m.szyprowski@samsung.com, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
Message-ID: <20180308144143.GB23266@lst.de>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org> <1519781889-16117-3-git-send-email-kramasub@codeaurora.org> <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com> <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org> <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com> <945b6c00-dde6-6ec7-4577-4cc0d034796b@codeaurora.org> <8567be1b-1431-4f1d-cb41-6a7eaa434438@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8567be1b-1431-4f1d-cb41-6a7eaa434438@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 08, 2018 at 01:24:45PM +0000, Robin Murphy wrote:
> Implementing dma_map_ops inside a driver for real hardware is almost always 
> the wrong thing to do.

Agreed.  dma_map_ops should be a platform decision based on the bus.

Even our dma_virt_ops basically just works around bad driver layering.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
