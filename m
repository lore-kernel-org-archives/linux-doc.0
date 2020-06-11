Return-Path: <SRS0=MEEV=7Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F847C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 23:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1E1120842
	for <linux-doc@archiver.kernel.org>; Thu, 11 Jun 2020 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591916955;
	bh=TOEnQBlvzDnn9jgmBu8COBmdJKW0e69SPmRBJIm2/Qc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=CJSZDAFnnZbgwfjtmyVh/TWdeVwwBqNpyO+OSNN50HS/AFa+KEi6lxnVW+Hw+KDS9
	 c8sRn0PyDvC3DHMfV/kz3QKnwhTIzV6/93NaDRbuN7va4IrXeUvERjLtNXFT+DnEtp
	 uCxW81RRlV1gUEy6CTrFtVzHRtC+t3rdmGB7afmA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgFKXJP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Jun 2020 19:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:45456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgFKXJP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 11 Jun 2020 19:09:15 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8CDE20720;
        Thu, 11 Jun 2020 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591916954;
        bh=TOEnQBlvzDnn9jgmBu8COBmdJKW0e69SPmRBJIm2/Qc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=l2OaAu5TrLljQ8amapJ8rXfcVq9Rg7CQ8z2dftDZsbtWE7WhH9woJlw1M0r3AvQSM
         92ceDH5mEvT4dDj9tN1aHyD8CLt5Yf88p7J7hpSzO9l1lCm6cCBkykoS+nSj9FxGjs
         eyqkKesb8OVBtOt0FQg2KEm/dMJnaE5M3reWb/2c=
Date:   Thu, 11 Jun 2020 16:09:12 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "klassert@kernel.org" <klassert@kernel.org>,
        "akiyano@amazon.com" <akiyano@amazon.com>,
        "irusskikh@marvell.com" <irusskikh@marvell.com>,
        "ioana.ciornei@nxp.com" <ioana.ciornei@nxp.com>,
        "kys@microsoft.com" <kys@microsoft.com>,
        "saeedm@mellanox.com" <saeedm@mellanox.com>,
        "jdmason@kudzu.us" <jdmason@kudzu.us>,
        "snelson@pensando.io" <snelson@pensando.io>,
        "GR-Linux-NIC-Dev@marvell.com" <GR-Linux-NIC-Dev@marvell.com>,
        "stuyoder@gmail.com" <stuyoder@gmail.com>,
        "sgoutham@marvell.com" <sgoutham@marvell.com>,
        "luobin9@huawei.com" <luobin9@huawei.com>,
        "csully@google.com" <csully@google.com>,
        "kou.ishizaki@toshiba.co.jp" <kou.ishizaki@toshiba.co.jp>,
        "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
        "chessman@tux.org" <chessman@tux.org>
Subject: Re: [RFC 1/8] docs: networking: reorganize driver documentation
 again
Message-ID: <20200611160912.7c2b3478@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200611151842.392642c5@hermes.lan>
References: <20200611173010.474475-1-kuba@kernel.org>
        <20200611173010.474475-2-kuba@kernel.org>
        <61CC2BC414934749BD9F5BF3D5D94044986F4FAE@ORSMSX112.amr.corp.intel.com>
        <20200611151842.392642c5@hermes.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 11 Jun 2020 15:18:42 -0700 Stephen Hemminger wrote:
> > > Organize driver documentation by device type. Most documents
> > > have fairly verbose yet uninformative names, so let users
> > > first select a well defined device type, and then search for
> > > a particular driver.
> > > 
> > > While at it rename the section from Vendor drivers to
> > > Hardware drivers. This seems more accurate, besides people
> > > sometimes refer to out-of-tree drivers as vendor drivers.
> > > 
> > > Signed-off-by: Jakub Kicinski <kuba@kernel.org>  
> 
> How much of it is still relevant and useful?
> 
> The last time I checked, lots of this had bad advice about settings.
> And there was lots of drivers documenting what was generic Linux
> functionality
> 
> And still there were references to old commands like ifconfig or ifenslave.

For general documentation I hope now that it's slightly de-cluttered
it's more likely folks (including myself, time allowing) will be more
inclined to clean up / contribute. I haven't looked in detail, yet.

As for the vendor docs - I guess that the obsolescence of the docs/
instructions goes hand in hand with obsolescence of the HW itself.
