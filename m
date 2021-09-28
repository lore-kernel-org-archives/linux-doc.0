Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B470C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 13:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E21E460FF2
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 13:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240632AbhI1Nph (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Sep 2021 09:45:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233878AbhI1Nph (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Sep 2021 09:45:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E50B60FE8;
        Tue, 28 Sep 2021 13:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632836637;
        bh=cs5n98qHfQZYLy19Er8FYJReHQtg5Zp1lA6UsfoorMQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=S20gXJdb+xfcew7LZYB2dAiUCXsLj60iH9XYu6a6GOb/kezOEd/+/VuQAn9zl6p6F
         U5V7pX62IKg5uG+jCb1IfZhA3qo7BGnCVBJyanEjd4BSA6dueCjtSvfyzf6ink4Vtd
         R+kblBnMJE/rf1W19/FnLbq4afzgfgdoph0bdsgHbALMiG6HHQtXal8s8NQnYn1Wfu
         Wzop9l2ub9Db92hUTSR8FqnRphl6uqNY/tdIBilJzatJkxkFj2JFQeT7+m7ixdhn/2
         AmRbvjA/Ss0xOxogeyPYSsRAnWQnB2AvszpUESuw+bjMW06cUQefULWU2LVqIicEzM
         oICAm0DV0uKCQ==
Date:   Tue, 28 Sep 2021 15:43:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/3] get_abi: improve message output and fix a
 regression
Message-ID: <20210928154353.2e6656bb@coco.lan>
In-Reply-To: <20210928142739.2ffe380b@coco.lan>
References: <cover.1632823172.git.mchehab+huawei@kernel.org>
        <YVL2trHQzxG59nXf@kroah.com>
        <20210928142739.2ffe380b@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 28 Sep 2021 14:27:39 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 28 Sep 2021 13:04:22 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > On Tue, Sep 28, 2021 at 12:14:01PM +0200, Mauro Carvalho Chehab wrote:  
> > > Hi Greg,
> > > 
> > > As promised on
> > > 
> > > 	https://lore.kernel.org/lkml/20210928120304.62319fba@coco.lan/T/#u
> > > 
> > > I'm adding progress info when  get_abi.pl is checking for undefined ABI symbols
> > > on patches 1 and 2.
> > > 
> > > That will help not only to identify what is causing delays on the script, but also
> > > to notify the user that processing it could take some time on some systems.
> > > 
> > > If you run it on your big server with:
> > > 
> > >   scripts/get_abi.pl undefined 2>logs
> > > 
> > > The "logs" file will contain timestamps relative to the time the script started to
> > > do the regex matches for sysfs files. It should be printing one line every
> > > time the progress completes 1% or one second after the last progress output.    
> > 
> > Adding more debugging and tweaking the script a bit to show the file it
> > is about to check, not the one it finished checking,  
> 
> Feel free to modify the script and add such debug/tweaks if you find
> it useful. 
> 
> > I got the following
> > debug output that seems to pinpoint the problem file.
> > 
> > The sysfs file that is causing problems is:
> > 	/sys/devices/pci0000:40/0000:40:00.2/iommu/ivhd1/amd-iommu/cap
> > 
> 
> Btw, I just got an arm64 server with 128 CPUs for testing. I'm trying
> to allocate also a big x86 server here, but I'm not sure if it is AMD or
> Intel.

Some tests on a Gigabyte R182-Z91-00 server, equipped with AMD EPYC 7352 
24-Core Processors (total 96 threads):

	$ find /sys |wc -l
	233981

	$ time ./scripts/get_abi.pl undefined >undefined 2>logs

	real	0m38.917s
	user	0m34.554s
	sys	0m4.292s

PS.: this machine doesn't have anything at /sys/class/iommu.

On a Huawei TaiShan 200 (Model 2280) with 128 ARM cores:

	$ find /sys |wc -l
	99362
	$ time ./scripts/get_abi.pl undefined >undefined 2>logs

	real	0m29.311s
	user	0m26.173s
	sys	0m3.061s

Both machines are using Perl 5.26.

Thanks,
Mauro
