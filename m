Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C627C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 18:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 531346115C
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 18:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhINS7D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 14:59:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:34536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229728AbhINS7C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 14:59:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F9A36113B;
        Tue, 14 Sep 2021 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631645864;
        bh=cdaxNlp5g19t8g5+gH1wGD200woFox+xWxEOE9iQDlQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=MFXzeexz2XnC2XTNXHIQGukLkOcecXxNbmujjk14NJJssbTSge46A774+sinUEI9c
         pe6CQS9lNFv0kVDWJ/YRkXC/mpeosx/SNrOBJ/hVpzck+9AmY4CecsOdF6Fml6dPF+
         CDaDZoC04v0nybcLMtSjQu7kalphS/QqMJSlZX2ASX80KZQOkab+zPkdGskZ3lJb83
         ByUwf2TiuSsYMwfAr5lTVZ+HtXAJKJjCOIeFxLTAMyGQnWM4QrYspUSY0B9EsoBgT1
         hcUCeI+M6FtSZ9FOxgFnaim1x9X0PPcTDu2RaVd4ogCWJ9mFVi2n7OcpHD2aqFrBY/
         oOed37T1SOyNw==
Date:   Tue, 14 Sep 2021 13:57:43 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Amey Narkhede <ameynarkhede03@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Carlos Bilbao <bilbao@vt.edu>,
        Leon Romanovsky <leon@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/29] ABI: sysfs-bus-pci: use wildcards on What
 definitions
Message-ID: <20210914185743.GA1444675@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86b40be1fde43adf059797e112b8aafd70e554b9.1631629496.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 14, 2021 at 04:32:29PM +0200, Mauro Carvalho Chehab wrote:
> An "N" upper letter is not a wildcard, nor can easily be identified
> by script, specially since the USB sysfs define things like.
> bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
> to convert it into a Regex.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  Documentation/ABI/testing/sysfs-bus-pci | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
> index d4ae03296861..191cbe9ae5ed 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci
> +++ b/Documentation/ABI/testing/sysfs-bus-pci
> @@ -160,7 +160,7 @@ Description:
>  		If the underlying VPD has a writable section then the
>  		corresponding section of this file will be writable.
>  
> -What:		/sys/bus/pci/devices/.../virtfnN
> +What:		/sys/bus/pci/devices/.../virtfn<N>
>  Date:		March 2009
>  Contact:	Yu Zhao <yu.zhao@intel.com>
>  Description:
> -- 
> 2.31.1
> 
