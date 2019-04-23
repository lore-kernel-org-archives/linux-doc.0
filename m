Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BAA567D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 21:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfDWVSA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 17:18:00 -0400
Received: from casper.infradead.org ([85.118.1.10]:39474 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfDWVR7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 17:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=T365wM+ApFniAEvB/kS7+BPv3Xz4P9xukBDPnNOUtnE=; b=bSapy78htwDmK7t0oq5X0GtaYK
        kX70ytKnAE5IBJPkUlOr1xhA7M3Ykm5uO/C7cGsOlpC5BKO+exrdnzNMWF8WpMYH4XmEWzF9Hdixy
        3NJ6KGUiuvCcXET/CdlrprXtBVTxVhvkUIPob+fDeaExeiELxzzo9qGPGFB+/oud8gjYWCOK1ciKR
        tBh4Nzgr6jOfIRy+A6ssFHpI2D2dKziDQ8tkvBL9wOo70jNzqCnwG6+m2yZycB5YMhfYwovKWOywU
        BjUF0qYxIRwjR1GaPHJivmo75oKPTLCoUcI5qmeOK/z1d/dDEZqBWwtOgYsrmQhK05mGukidTO5GO
        0qYjx9Uw==;
Received: from 177.17.136.231.dynamic.adsl.gvt.net.br ([177.17.136.231] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hJ2nb-00047N-1a; Tue, 23 Apr 2019 21:17:55 +0000
Date:   Tue, 23 Apr 2019 18:17:48 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Bjorn Helgaas <bhelgaas@google.com>, rjw@rjwysocki.net,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        x86@kernel.org, fenghua.yu@intel.com,
        linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 15/63] Documentation: ACPI: move
 dsd/data-node-references.txt to firmware-guide/acpi and convert to reST
Message-ID: <20190423181748.24f8aed2@coco.lan>
In-Reply-To: <20190423162932.21428-16-changbin.du@gmail.com>
References: <20190423162932.21428-1-changbin.du@gmail.com>
        <20190423162932.21428-16-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 24 Apr 2019 00:28:44 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  .../acpi/dsd/data-node-references.rst}        | 28 +++++++++++--------
>  Documentation/firmware-guide/acpi/index.rst   |  1 +
>  2 files changed, 17 insertions(+), 12 deletions(-)
>  rename Documentation/{acpi/dsd/data-node-references.txt => firmware-guide/acpi/dsd/data-node-references.rst} (79%)
> 
> diff --git a/Documentation/acpi/dsd/data-node-references.txt b/Documentation/firmware-guide/acpi/dsd/data-node-references.rst
> similarity index 79%
> rename from Documentation/acpi/dsd/data-node-references.txt
> rename to Documentation/firmware-guide/acpi/dsd/data-node-references.rst
> index c3871565c8cf..79c5368eaecf 100644
> --- a/Documentation/acpi/dsd/data-node-references.txt
> +++ b/Documentation/firmware-guide/acpi/dsd/data-node-references.rst
> @@ -1,9 +1,12 @@
> -Copyright (C) 2018 Intel Corporation
> -Author: Sakari Ailus <sakari.ailus@linux.intel.com>
> -
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
>  
> +===================================
>  Referencing hierarchical data nodes
> ------------------------------------
> +===================================
> +
> +:Copyright: |copy| 2018 Intel Corporation
> +:Author: Sakari Ailus <sakari.ailus@linux.intel.com>
>  
>  ACPI in general allows referring to device objects in the tree only.
>  Hierarchical data extension nodes may not be referred to directly, hence this
> @@ -28,13 +31,14 @@ extension key.
>  
>  
>  Example
> --------
> +=======
>  
> -	In the ASL snippet below, the "reference" _DSD property [2] contains a
> -	device object reference to DEV0 and under that device object, a
> -	hierarchical data extension key "node@1" referring to the NOD1 object
> -	and lastly, a hierarchical data extension key "anothernode" referring to
> -	the ANOD object which is also the final target node of the reference.
> +In the ASL snippet below, the "reference" _DSD property [2] contains a
> +device object reference to DEV0 and under that device object, a
> +hierarchical data extension key "node@1" referring to the NOD1 object
> +and lastly, a hierarchical data extension key "anothernode" referring to
> +the ANOD object which is also the final target node of the reference.
> +::
>  
>  	Device (DEV0)
>  	{
> @@ -75,10 +79,10 @@ Example
>  	    })
>  	}
>  
> -Please also see a graph example in graph.txt .
> +Please also see a graph example in :doc:`graph`.
>  
>  References
> -----------
> +==========
>  
>  [1] Hierarchical Data Extension UUID For _DSD.
>      <URL:http://www.uefi.org/sites/default/files/resources/_DSD-hierarchical-data-extension-UUID-v1.1.pdf>,

Hmm... on the previous patch, you replaced <URL:some_url> by some_url,
with makes sense. Please do the same here and on other patches on
this series with a similar way to describe URLs.

> diff --git a/Documentation/firmware-guide/acpi/index.rst b/Documentation/firmware-guide/acpi/index.rst
> index f81cfbcb6878..6d4e0df4f063 100644
> --- a/Documentation/firmware-guide/acpi/index.rst
> +++ b/Documentation/firmware-guide/acpi/index.rst
> @@ -9,6 +9,7 @@ ACPI Support
>  
>     namespace
>     dsd/graph
> +   dsd/data-node-references
>     enumeration
>     osi
>     method-customizing



Thanks,
Mauro
