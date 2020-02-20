Return-Path: <SRS0=o7tk=4I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D832C11D04
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 09:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4399824672
	for <linux-doc@archiver.kernel.org>; Thu, 20 Feb 2020 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582190848;
	bh=XgKAWIq9e6qAgZoVDhw9r2LNsJdmFShHckDTrw/YwQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pN9FOXU425HbzzfVaDEvPruGoKNd5ju39X8KVJBRQd3++AczuAF7J6ao3YHEicfHD
	 qiIwGjwe0F7T1t9DycEyHvagkAnkl2KgWKnk57Lxem/iRbPni6z7X7MYHXfXBpxgDP
	 jNYkvFs7ebAy7NitzQQnXqHXUEK4YWKkjnIwgDl0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgBTJ12 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Feb 2020 04:27:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:54678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbgBTJ11 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Feb 2020 04:27:27 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9EB820801;
        Thu, 20 Feb 2020 09:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582190847;
        bh=XgKAWIq9e6qAgZoVDhw9r2LNsJdmFShHckDTrw/YwQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a0hINo/Z0z0lHhBBiiUKy1fk51vRDZ8cxOvOQ0UFCdwyy5Hd9E/z9sUBe2gYguR0s
         eZMkfFLEY84H4JrrB24U/XbanQSWUBvjHnLYKv4zxSawW+Zthkn4+fOANXlAYOv3XF
         LicQQ/pCuojfq6hcKl7i/bxGdFc90S6Ppl5jJDlk=
Date:   Thu, 20 Feb 2020 09:27:22 +0000
From:   Will Deacon <will@kernel.org>
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: arm64: fix trivial spelling enought to enough in
 memory.rst
Message-ID: <20200220092721.GA12780@willie-the-truck>
References: <20200219221403.16740-1-scott.branden@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219221403.16740-1-scott.branden@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 19, 2020 at 02:14:03PM -0800, Scott Branden wrote:
> Fix trivial spelling error enought to enough in memory.rst.
> 
> Cc: trivial@kernel.org
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  Documentation/arm64/memory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can take this along with the other arm64 fixes I have pending.

Will
