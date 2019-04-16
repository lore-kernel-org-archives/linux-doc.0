Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9910F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 11:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729131AbfDPLnh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 07:43:37 -0400
Received: from casper.infradead.org ([85.118.1.10]:58130 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728706AbfDPLnh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Apr 2019 07:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pwSiZYvIqAnueGaDNcL1fXNSQ+1wKaAhSA0jh0cQoN8=; b=B5m/0kf20v9afSgg/Mw50xX6cA
        DBKW6+r9nqzeoNLM4VcN6NM7+FvgNAqMUJga8h2OM1O+f1XwtA0tNd2WeDRwDMGJIQh6nL13QCoyC
        w1/und9MnSspC/R+QrNtlH22Zqq1ANMX05mUx9NGct/+M/B73554xVND0+5OBo9pWoW3SF4a++QBG
        cYJvdNEZi7h6PF7DB/U0QQvSAsfv2OboOQZYsgQBLzwXpk3Y3hoJySA24tdrm1W8z+MRmMISGinEK
        cUaiNe+up+6+6oGl/r4oCHnQw9yiVqaU8Sp3at0Y3igD/SXHPFtjdN0bKPRqgv2X66IoRGdJK0HmS
        xBmJZSjw==;
Received: from 177.205.118.176.dynamic.adsl.gvt.net.br ([177.205.118.176] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hGMUv-00082H-2W; Tue, 16 Apr 2019 11:43:33 +0000
Date:   Tue, 16 Apr 2019 08:43:28 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 36/57] docs: usb: convert documents to ReST
Message-ID: <20190416084328.380de91e@coco.lan>
In-Reply-To: <874l6ya373.fsf@linux.intel.com>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
        <eaafc5741ccfe3b96ab2a9ef799c537c49ab20e5.1555382110.git.mchehab+samsung@kernel.org>
        <874l6ya373.fsf@linux.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 16 Apr 2019 09:12:32 +0300
Felipe Balbi <felipe.balbi@linux.intel.com> escreveu:

> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> writes:
> 
> > Convert USB documents to ReST, in order to prepare for adding it
> > to the kernel API book, as most of the stuff there are driver or
> > subsystem-related.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  Documentation/usb/WUSB-Design-overview.txt |  56 +-
> >  Documentation/usb/acm.txt                  | 156 +++---
> >  Documentation/usb/authorization.txt        |  75 +--
> >  Documentation/usb/chipidea.txt             | 101 ++--
> >  Documentation/usb/dwc3.txt                 |  12 +-
> >  Documentation/usb/ehci.txt                 |  42 +-
> >  Documentation/usb/functionfs.txt           |  17 +-
> >  Documentation/usb/gadget-testing.txt       | 609 ++++++++++++---------
> >  Documentation/usb/gadget_configfs.txt      | 302 +++++-----
> >  Documentation/usb/gadget_hid.txt           | 175 +++---
> >  Documentation/usb/gadget_multi.txt         |  43 +-
> >  Documentation/usb/gadget_printer.txt       | 155 +++---
> >  Documentation/usb/gadget_serial.txt        |  73 +--
> >  Documentation/usb/iuu_phoenix.txt          |  34 +-
> >  Documentation/usb/mass-storage.txt         |  19 +-
> >  Documentation/usb/misc_usbsevseg.txt       |   9 +-
> >  Documentation/usb/mtouchusb.txt            |  42 +-
> >  Documentation/usb/ohci.txt                 |   5 +-
> >  Documentation/usb/rio.txt                  |  83 +--
> >  Documentation/usb/usb-help.txt             |  21 +-
> >  Documentation/usb/usb-serial.txt           | 203 ++++---
> >  Documentation/usb/usbip_protocol.txt       | 552 ++++++++++---------
> >  Documentation/usb/usbmon.txt               | 100 ++--  
> 
> should you change extension to .rst while at that?

I did that on a first version (not submitted):

	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=all_with_indexes&id=d7eec4678dbfeb1a40c58bca7a157c8a4c39fa04

but I opted do the postpone the rename to a new series yet to be
sent.

The problem is that renaming it will make Sphinx to try to build them,
causing lots of warnings because they won't be inside an index file.
Adding index would touch Documentation/index (or Documentation/drivers-api),
with would cause merge conflicts.

Once this patch gets merged upstream, a renaming patch can happen
anytime. It probably makes sense to do all renames at once, late
at a merge window.


Thanks,
Mauro
