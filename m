Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBBAC433E0
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 12:05:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B22764F5D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Feb 2021 12:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhBBMFI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Feb 2021 07:05:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:42706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhBBMFH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Feb 2021 07:05:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12CDA64F53;
        Tue,  2 Feb 2021 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612267466;
        bh=vpa76DJVw3u2hImBgcGY2RefNVrkqI+c8q81hUCChG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IgUfc5NoKYN48z3xn3H9Z2AYFDRkw6a/uH5nFMZS5cIBCXMCVRf6GQGuNGkyMaH4G
         Fcfl8CYT2GXLLKm/8Tgov0ejWOyQPSvbiZq2uL6aaBcU1Eh2lOQOPnow+TsTFU4tuA
         tDZoAwHYvXTfc2sFlK2NPw4+AgpSPcWPEQtblr24=
Date:   Tue, 2 Feb 2021 13:04:22 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Adrian Catangiu <acatan@amazon.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org, graf@amazon.com, rdunlap@infradead.org,
        arnd@arndb.de, ebiederm@xmission.com, rppt@kernel.org,
        0x7f454c46@gmail.com, borntraeger@de.ibm.com, Jason@zx2c4.com,
        jannh@google.com, w@1wt.eu, colmmacc@amazon.com, luto@kernel.org,
        tytso@mit.edu, ebiggers@kernel.org, dwmw@amazon.co.uk,
        bonzini@gnu.org, sblbir@amazon.com, raduweis@amazon.com,
        corbet@lwn.net, mst@redhat.com, mhocko@kernel.org,
        rafael@kernel.org, pavel@ucw.cz, mpe@ellerman.id.au,
        areber@redhat.com, ovzxemul@gmail.com, avagin@gmail.com,
        ptikhomirov@virtuozzo.com, gil@azul.com, asmehra@redhat.com,
        dgunigun@redhat.com, vijaysun@ca.ibm.com, oridgar@gmail.com,
        ghammer@redhat.com
Subject: Re: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <YBk/xskdrwqTOyM9@kroah.com>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612200294-17561-2-git-send-email-acatan@amazon.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 01, 2021 at 07:24:53PM +0200, Adrian Catangiu wrote:
> +config SYSGENID
> +	tristate "System Generation ID driver"
> +	default N

"N" is always the default, no need to list it again :(

