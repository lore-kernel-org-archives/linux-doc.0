Return-Path: <SRS0=iu5e=BI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB8DC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 17:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F08AA207F5
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jul 2020 17:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eByDfxve"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgG2RdQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Jul 2020 13:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgG2RdQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jul 2020 13:33:16 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BF9C061794
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2020 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=EHFOPfesjGxscZfs70crUk5/FQqBqlH1MNHu6mjS6S0=; b=eByDfxve0neV1p/KdG5GNp0j1u
        M95ecuMpFkyOztnVEX+as3vlv+VHjJWm6hMJHYYfDdayo9bYVry92ttT+9lzjmMt+PQq+fkWKpKLz
        7/OtlNi1ROdUEjmiLRD7AMTZY6dDGFvGIlsT80UpHIdA4xaTban44RWHgv0zOrLzERz/tIQbnGnoM
        RAX/FTka1s1Lcw7WcEMGnSg6nLvxfr8z2EKCDjPQj5xk0rGtg+RVsaSoaNirtjS2wZPXG+TIhjh83
        bfeyvivucw+lTJcbtD6YP9M9ytwfHmyfx1CofjqoVP4XY32YozekUVNTe9luI7YbeM632l2SwVPow
        InI3TL1g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0px4-0003bB-5A; Wed, 29 Jul 2020 17:33:14 +0000
Subject: Re: Documentation/scsi/aha152x.rst
To:     Julia Lawall <julia.lawall@inria.fr>, mchehab+huawei@kernel.org,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <alpine.DEB.2.22.394.2007291908280.2459@hadrien>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <da610848-322c-3bcf-e351-bead548d8961@infradead.org>
Date:   Wed, 29 Jul 2020 10:33:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2007291908280.2459@hadrien>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/29/20 10:16 AM, Julia Lawall wrote:
> Hello,
> 
> The ada152 documentation mentions some compilation flags.  This was
> converted to ReST as eg:
> 
> +- DAUTOCONF
> +    use configuration the controller reports (AHA-152x only)
> 
> --DAUTOCONF
> - use configuration the controller reports (AHA-152x only)
> 
> This is clearly not correct.  The - should be attached to the D, and not
> be converted to a bullet.  I tried replacing:
> 
> - DAUTOCONF
> 
> by
> 
> - -DAUTOCONF
> 
> but the result with rst2html was not very satisfactory.  The DAUTOCONF
> seems to be slightly raised with respect to the rest of the text.  And a
> subsequent case:
> 
> - DSETUP0="{ IOPORT, IRQ, SCSI_ID, RECONNECT, PARITY, SYNCHRONOUS, DELAY, EXT_TRANS }"
> 
> comes out different from the ones that have no associated list of possible
> values (larger letters, different font).
> 
> What should be done instead?
> 
> Also, does the kernel include some scripts for testing the documentation?
> make Documentation/scsi/aha152x.html doesn't seem to work.

I would do this:

$ make SPHINXDIRS="scsi" htmldocs

to limit the htmldocs build to Documentation/scsi/.
I don't know of a way to build only one output file.


-- 
~Randy

