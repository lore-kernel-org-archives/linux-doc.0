Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214F5CD6114
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 17:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377071AbjJIRyH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 13:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376891AbjJIRyG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 13:54:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3003ECA;
        Mon,  9 Oct 2023 10:54:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DDCC433C8;
        Mon,  9 Oct 2023 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696874044;
        bh=PPCdcumr+UA++nlG83Y+uutcu7c6YH7gfSHrX1LBEaw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fugsy4PGaY/O6EQUhUPCPNBxTT5ZhVVpD2V6xnTzGWIrQ4iQEpPAyKJppVYRXdHws
         U/czILVQj+Dx99beegFEjvy2b0+qwK5knakS65UN89uuxQEPSwMggMffgFOGJTMqa0
         ueQeCCWdqneoBuN2yVeBduVMDdez00ovxrVGlJ4k=
Date:   Mon, 9 Oct 2023 19:54:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
        onathan Corbet <corbet@lwn.net>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
Message-ID: <2023100910-used-unruly-f750@gregkh>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com>
 <2023100931-reward-justice-ed1c@gregkh>
 <a9efdc23-0417-48dc-aa17-ef7b1459b85a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9efdc23-0417-48dc-aa17-ef7b1459b85a@quicinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 09, 2023 at 09:02:32PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/9/2023 8:38 PM, Greg Kroah-Hartman wrote:
> > On Mon, Oct 09, 2023 at 07:50:05PM +0530, Krishna Kurapati wrote:
> > > Currently the NCM driver restricts wMaxSegmentSize that indicates
> > > the datagram size coming from network layer to 1514.
> > 
> > I don't see that restriction in the existing driver, where does that
> > happen?
> 
> Hi Greg,
> 
>  In the ecm_desc, the following line restricts the value:
> 
> .wMaxSegmentSize =      cpu_to_le16(ETH_FRAME_LEN),

Ok, so is that 1514?  I don't know as I don't know what ETH_FRAM_LEN is.

So how about saying something to the affect of "the max segment size is
currently limited to the ethernet frame length of the kernel which
happens to be 1514 at this point in time."

thanks,

greg k-h
