Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C0487D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Jul 2019 06:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfGEGyF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Jul 2019 02:54:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbfGEGyE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 5 Jul 2019 02:54:04 -0400
Received: from localhost (unknown [122.167.76.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63C6521670;
        Fri,  5 Jul 2019 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562309644;
        bh=Fce+yFrH+ncRIcW3SbZSyfI2isJKSJpFCEfGw+fsAns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K8c+qYBNsFFPcz9REq2quIkmX3kPj6OHSH/jfCGKo9my8XPK8lBQ01xgTMQd3AuGj
         AE/O8iZ93XsE6fxBa8p5BK2vj2DXx/xA8XQmFZQglRIia2PbMutZMALSORBbeOUaxX
         EMd/D5f1LDhvLUTyNhip7Vqn/7dE193cazyhR260=
Date:   Fri, 5 Jul 2019 12:20:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     "Hook, Gary" <Gary.Hook@amd.com>
Cc:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: dmaengine: clean up description of
 dmatest usage
Message-ID: <20190705065047.GY2911@vkoul-mobl>
References: <156140130017.28986.2649022716558702933.stgit@taos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156140130017.28986.2649022716558702933.stgit@taos>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24-06-19, 18:35, Hook, Gary wrote:
> Fix the formatting of the multi-channel test usage example. Call out
> the note about parameter ordering and add detail on the settings of
> parameters for the new version of dmatest.

Applied, thanks

-- 
~Vinod
