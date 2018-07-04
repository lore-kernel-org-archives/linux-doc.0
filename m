Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 665397DF93
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Jul 2018 11:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934556AbeGDLcS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Jul 2018 07:32:18 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:59994 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934537AbeGDLcR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Jul 2018 07:32:17 -0400
Received: from localhost (li1825-44.members.linode.com [172.104.248.44])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id AD0CFA80;
        Wed,  4 Jul 2018 11:32:13 +0000 (UTC)
Date:   Wed, 4 Jul 2018 13:32:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 2/2] device core: Add flag to autoremove device link on
 supplier unbind
Message-ID: <20180704113214.GB30967@kroah.com>
References: <20180627125056.12851-1-vivek.gautam@codeaurora.org>
 <20180627125056.12851-2-vivek.gautam@codeaurora.org>
 <5b2d17e8-2224-512c-e01c-212828ecf74b@codeaurora.org>
 <2991909.NMIP74eIIJ@aspire.rjw.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2991909.NMIP74eIIJ@aspire.rjw.lan>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 04, 2018 at 12:44:20PM +0200, Rafael J. Wysocki wrote:
> On Wednesday, July 4, 2018 9:16:20 AM CEST Vivek Gautam wrote:
> > Adding Ulf and Marek.
> > 
> > On 6/27/2018 6:20 PM, Vivek Gautam wrote:
> > > Add a flag to autoremove the device links on supplier driver
> > > unbind. This obviates the need to explicitly delete the link
> > > in the remove path.
> > > We remove these links only when the supplier's link to its
> > > consumers has gone to DL_STATE_SUPPLIER_UNBIND state.
> > >
> > > Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> > > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > > Cc: Jonathan Corbet <corbet@lwn.net>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: linux-doc@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-pm@vger.kernel.org
> > > Cc: linux-arm-msm@vger.kernel.org
> > > ---
> > 
> > Hi Rafael, et al.
> > 
> > Gentle ping.
> > Do you have comments on this series. I would really like to conclude these
> > device link additions sooner, and get things moving on the long awaited
> > arm-smmu clock/runtime support series.
> > 
> > Thanks again for reviewing these patches.
> 
> They are fine by me.
> 
> I can queue them up for 4.19 if no one has objections (Greg in
> particular).

No objection from me!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
