Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED296C77B7C
	for <linux-doc@archiver.kernel.org>; Wed, 31 May 2023 07:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbjEaHtD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 May 2023 03:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbjEaHs4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 May 2023 03:48:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E829E10F;
        Wed, 31 May 2023 00:48:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D4AE61AE0;
        Wed, 31 May 2023 07:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D1BC433EF;
        Wed, 31 May 2023 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685519334;
        bh=hg/WI8CvXV4doEuR9qu+txCievRWqTzbWCDzZKazZ50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SmqHxsBk8OxycLUnlt8M/bCYlrRJGMGoWRgIvE+E+BImmyJV4u0lMF7+Rxza3zb9t
         5avtUr1UEoOlxLw7pefuYpSJ2WhWYOtBRA74/0K/zvL1GBfywUMWPuHEOuse7A0zar
         bEumL2v6nBbjv1gX+dKG73l3vh2XS2i78AQKw6+d6sHYoSDOm+uKtYjpyfmH+Y67/Z
         LgVFT1uMGc7O1LM729XpRwP6FSFJHMJ8k9atZ3J/IDCOQ/F2XqT6Iac1I5Ck5KD+4A
         0ZnOaCwSNnFaTv9dtqWLMgckC+NM7dsC15FuplhpT9nSsk7cwmFQyR2Ltu2M3SA9Wb
         MxKtYJOQ405FA==
Date:   Wed, 31 May 2023 09:48:49 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, corbet@lwn.net,
        viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] init: Add support for rootwait timeout parameter
Message-ID: <20230531-podest-montag-cc8c944b722d@brauner>
References: <20230526130716.2932507-1-loic.poulain@linaro.org>
 <ZHYOucvIYTBwnzOb@infradead.org>
 <20230530-angepackt-zahnpasta-3e24954150fc@brauner>
 <ZHbhEMxW2XjvAAju@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZHbhEMxW2XjvAAju@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 30, 2023 at 10:54:24PM -0700, Christoph Hellwig wrote:
> On Tue, May 30, 2023 at 05:43:53PM +0200, Christian Brauner wrote:
> > On Tue, May 30, 2023 at 07:56:57AM -0700, Christoph Hellwig wrote:
> > > This clashes a bit with my big rework in this area in the
> > > "fix the name_to_dev_t mess" series. I need to resend that series
> > > anyway, should I just include a rebased version of this patch?
> > 
> > Sure, if this makes things easier for you then definitely.
> 
> I have missed you had more comments that need a respin.  So maybe
> Loic can just do the rebase and send it out with a note for the
> baseline?  I plan to resend my series later today.

Sure, that works too!
