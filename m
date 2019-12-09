Return-Path: <SRS0=5fBo=Z7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E5BC43603
	for <linux-doc@archiver.kernel.org>; Mon,  9 Dec 2019 08:07:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CD1F206D3
	for <linux-doc@archiver.kernel.org>; Mon,  9 Dec 2019 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575878844;
	bh=iNDOb4Re7g8QNZnW+Ee4jzXblK1lQxZhPsrzG5/0+E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IMsfpd+F7aFxtUV4QJjH2sYJ6zdsAMqQ0pBXz3vqi/kLAocENFtwGmc/mRJsypgUc
	 q6KpoNejPM7cNYfRDUbMU+L4XsrlWWGXbYQjBUFEb+swuZJ/5eUXSQ7NcmDz6Btbyr
	 dmal+W21WV3P/yMWGoZ2QRQrSfox6mnSy7xXnCnE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfLIIHX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Dec 2019 03:07:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:52284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbfLIIHX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Dec 2019 03:07:23 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66968205ED;
        Mon,  9 Dec 2019 08:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575878842;
        bh=iNDOb4Re7g8QNZnW+Ee4jzXblK1lQxZhPsrzG5/0+E8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dRxoUPBLSnC3b48X07lOqpj9MWs+Ke3MfJ5t/pH6WpzOLueii0oj3Zlfmjq0oN65a
         QAZQUNfZzHX0x1H8LwK0HPtCgXMQYZyUg/MMxawtuwoOIQoq4pC5zi6sepiCBytlGJ
         py1Z1pWKKrabca62ZXLLrAguec0alFNVLujfHv8w=
Date:   Mon, 9 Dec 2019 09:07:20 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     shubhrajyoti.datta@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, arnd@arndb.de, michal.simek@xilinx.com,
        robh+dt@kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: misc: Add dt bindings for traffic
 generator
Message-ID: <20191209080720.GB706232@kroah.com>
References: <8b3a446fc60cdd7d085203ce00c3f6bfba642437.1575871828.git.shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b3a446fc60cdd7d085203ce00c3f6bfba642437.1575871828.git.shubhrajyoti.datta@xilinx.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 09, 2019 at 11:41:26AM +0530, shubhrajyoti.datta@gmail.com wrote:
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> 
> Add dt bindings for xilinx traffic generator IP.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../bindings/misc/xlnx,axi-traffic-gen.txt         | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-traffic-gen.txt

What changed in v2?  Always put that below the --- line so we know what
happened.

thanks,

greg k-h
