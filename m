Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 55F4A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 20:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfDWUvk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 16:51:40 -0400
Received: from casper.infradead.org ([85.118.1.10]:36528 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfDWUvk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 16:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=botNWw+S6WKNaF5EjthcNKSjg632PnN3Uy2HYxc3wPA=; b=CTck0YaL1r+YPoCW5SnYRwPRZE
        EdhdJ4h/X6url55E0KWe1cVQLTAu3hjJymDbKezivT1iJx1mi2krfCklOaECgEJs9IzXktpo8Ppqv
        U5/EZsfQqI0bYvLjJEsG0tppCM+HDeCRtB2514IRwFYM5UYOZgpR9lsMUakxETPGK0VMfUyVBnEqC
        9zzY1NG73hRfHVIJLvudBqPj65PI+dAtaxo3ZWcKU1Nmmzrh9XCMA0Kg2V0rPbNGJlR59GliXkzby
        MGjeNyj9V0iujQJ2x1/2oCaKXFicCvf2zgWjk+wp4Ck5QbPwEVCnQyCPW/SexpZYIhX5UrEPczC1t
        gZet/2oQ==;
Received: from 177.17.136.231.dynamic.adsl.gvt.net.br ([177.17.136.231] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hJ2O8-0002uX-2K; Tue, 23 Apr 2019 20:51:36 +0000
Date:   Tue, 23 Apr 2019 17:51:29 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>, rjw@rjwysocki.net,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        x86@kernel.org, fenghua.yu@intel.com,
        linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 06/63] Documentation: ACPI: move scan_handlers.txt to
 driver-api/acpi and convert to reST
Message-ID: <20190423175129.03f74a4b@coco.lan>
In-Reply-To: <20190423162932.21428-7-changbin.du@gmail.com>
References: <20190423162932.21428-1-changbin.du@gmail.com>
        <20190423162932.21428-7-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 24 Apr 2019 00:28:35 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

For the conversion itself:

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
>  Documentation/driver-api/acpi/index.rst       |  1 +
>  .../acpi/scan_handlers.rst}                   | 24 ++++++++++++-------
>  2 files changed, 16 insertions(+), 9 deletions(-)
>  rename Documentation/{acpi/scan_handlers.txt => driver-api/acpi/scan_handlers.rst} (90%)
> 
> diff --git a/Documentation/driver-api/acpi/index.rst b/Documentation/driver-api/acpi/index.rst
> index 12649947b19b..ace0008e54c2 100644
> --- a/Documentation/driver-api/acpi/index.rst
> +++ b/Documentation/driver-api/acpi/index.rst
> @@ -6,3 +6,4 @@ ACPI Support
>     :maxdepth: 2
>  
>     linuxized-acpica
> +   scan_handlers
> diff --git a/Documentation/acpi/scan_handlers.txt b/Documentation/driver-api/acpi/scan_handlers.rst
> similarity index 90%
> rename from Documentation/acpi/scan_handlers.txt
> rename to Documentation/driver-api/acpi/scan_handlers.rst
> index 3246ccf15992..7a197b3a33fc 100644
> --- a/Documentation/acpi/scan_handlers.txt
> +++ b/Documentation/driver-api/acpi/scan_handlers.rst
> @@ -1,7 +1,13 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +==================
>  ACPI Scan Handlers
> +==================
> +
> +:Copyright: |copy| 2012, Intel Corporation
>  
> -Copyright (C) 2012, Intel Corporation
> -Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> +:Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>  
>  During system initialization and ACPI-based device hot-add, the ACPI namespace
>  is scanned in search of device objects that generally represent various pieces
> @@ -30,14 +36,14 @@ to configure that link so that the kernel can use it.
>  Those additional configuration tasks usually depend on the type of the hardware
>  component represented by the given device node which can be determined on the
>  basis of the device node's hardware ID (HID).  They are performed by objects
> -called ACPI scan handlers represented by the following structure:
> +called ACPI scan handlers represented by the following structure::
>  
> -struct acpi_scan_handler {
> -	const struct acpi_device_id *ids;
> -	struct list_head list_node;
> -	int (*attach)(struct acpi_device *dev, const struct acpi_device_id *id);
> -	void (*detach)(struct acpi_device *dev);
> -};
> +	struct acpi_scan_handler {
> +		const struct acpi_device_id *ids;
> +		struct list_head list_node;
> +		int (*attach)(struct acpi_device *dev, const struct acpi_device_id *id);
> +		void (*detach)(struct acpi_device *dev);
> +	};
>  
>  where ids is the list of IDs of device nodes the given handler is supposed to
>  take care of, list_node is the hook to the global list of ACPI scan handlers



Thanks,
Mauro
