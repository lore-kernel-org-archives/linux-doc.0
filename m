Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA35DC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 07:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1F8E613CD
	for <linux-doc@archiver.kernel.org>; Wed, 29 Sep 2021 07:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244490AbhI2HFd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Sep 2021 03:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244488AbhI2HFd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 29 Sep 2021 03:05:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE4386138E;
        Wed, 29 Sep 2021 07:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632899032;
        bh=GcoU2MZqcGbGfGu7dqp3ky0uo+isKPbsBl/bQHfwjkA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LNYuFHabhSmp8WoFeFG/LNoV9ixHrrJN+WcMeeFnkuAMAKPpSgiaqs28Ie4ObbkqR
         v79QTMO+IUwjr7Myg8tyVkc760HeuJ0qmskht5wWiLv7bTfAPZbGaTce9QEHhjS9t5
         8qGObuF6tyv4Rkc0dHyPR8+ZCfdAi7rjyTgJnj6c=
Date:   Wed, 29 Sep 2021 09:03:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bean Huo <beanhuo@micron.com>, Can Guo <cang@codeaurora.org>,
        Daejun Park <daejun7.park@samsung.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 16/17] ABI: sysfs-driver-ufs: Add another What for
 platform drivers
Message-ID: <YVQP1btICr0TJusK@kroah.com>
References: <cover.1632750608.git.mchehab+huawei@kernel.org>
 <bc61469964bbcabe38d12aa88f2734d38a8741e5.1632750608.git.mchehab+huawei@kernel.org>
 <DM6PR04MB6575E3C9D13E8B41627240FDFCA99@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR04MB6575E3C9D13E8B41627240FDFCA99@DM6PR04MB6575.namprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 29, 2021 at 06:32:40AM +0000, Avri Altman wrote:
> > The current what expressions:
> >         What:          /sys/bus/platform/drivers/ufshcd/*/...
> > 
> > Doesn't actually match what (some?) platform drivers actually
> > export. For instance, drivers/scsi/ufs/ufs-hisi.c actually
> > creates the sysfs struct for ufshcd inside this directory:
> > 
> >         /sys/devices/platform/soc/ff3c0000.ufs
> > 
> > Which has those aliases:
> > 
> >         /sys/devices/virtual/devlink/platform:fff35000.crg_ctrl--
> > platform:ff3c0000.ufs/consumer/
> >         /sys/bus/platform/drivers/ufshcd-hisi/ff3c0000.ufs/
> >         /sys/bus/platform/devices/soc/ff3c0000.ufs/
> >         /sys/bus/platform/devices/ff3c0000.ufs/
> > 
> > So, add another What: for such files that will match the
> > device ufs entries, e. g.:
> > 
> >         What:          /sys/bus/platform/devices/*.ufs/
> On some platforms the suffix is .ufshc
> So Maybe use:
> /sys/bus/platform/devices/*.ufs*/

That's confusing.  How about describing why "ufshc" is used in another
entry?  You all must have picked the new name for some reason to
differentiate, right?

thanks,

greg k-h
