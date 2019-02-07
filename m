Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CBC547D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 17:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfBGRex (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 12:34:53 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:39906 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfBGRex (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 12:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FZsgl4hnQWbo9l+b8WvgIjUxh/zlhT5dNbFTN9feJ2g=; b=at4WJe5FCotJQOgNgbyN9QsBc
        x1N+CKns7Eyev8KDVYpPh6QSyP4aU1SdMJhhjGDN+jR8vfcxP04n93FDia2Z6VrsR8WQh8+zvjB0D
        nP/JJo948LfATFTBi7Gf+FlPvBhBOrEyzDsHx7t9D3kHGTA0A2gsFlJ07QzJsMoMTJ/waq6Cf5qub
        p5ZaPSh5q2uViY7TmwPE13i3fm57X0FZDcE3jNGm3kYaiAIb8sG3B7Kv2qrh1lDzQ895gp9PwDmrV
        AHH77oy+VrrL9AxIsLE0m6nbk5ydjrbekXuAIOPoexKBPMvKyFIm+JK4rxE7xTrSbMM4GO6jYoJK9
        6eYa0Zqww==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1grnZY-0004dj-N6; Thu, 07 Feb 2019 17:34:48 +0000
Date:   Thu, 7 Feb 2019 09:34:48 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org
Subject: Re: Return: vs Returns:
Message-ID: <20190207173448.GZ21860@bombadil.infradead.org>
References: <20190207135924.GV21860@bombadil.infradead.org>
 <20190207153056.GB9120@rapoport-lnx>
 <8cacba6c-32c1-f60b-dfb0-0c74ef09d53c@darmarit.de>
 <20190207161852.GC8040@rapoport-lnx>
 <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <596652fd8f0a3637649167b47805f1c6ac848f25.camel@perches.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 07, 2019 at 09:31:20AM -0800, Joe Perches wrote:
> It's not clear to me what you are asking checkpatch to do here.
> 
> It may be reasonable for checkpatch to invoke kernel-doc on some
> portion of a patch, but I'm not sure how valuable it will be.

I was just hoping to match:

 * Returns:

Or to quote it properly for regexes ...

^ +\* *Returns:

(I think ...)

I can't see that matching C or assembler.
