Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 002D77D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 30 Jun 2018 11:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755038AbeF3LWD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 30 Jun 2018 07:22:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50662 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754852AbeF3LWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jun 2018 07:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iu4VYaFLzn5qg4OmKjyOucIZnumfbp5gnrMfoa3lJ+w=; b=Lnz2bz+r/KlOpHXYfyk83ctXX
        Z7/6wfQry0EZstABvEgx9R3cx7IKVf7MecVFuzWzllEsc9uTCIdwlfY7bAmu91aCvIdsAcXZXOLEp
        /wiGcFtZpHWVR2k8MRAiPqI5RQl5+dOMoEdrf5dqIoxHPrkrHLLSePIjDezTx/4FJ3hc7/wEi9L2G
        DtOWIcRsEgv1yIN5+CsizPCA/XFuU5NTF4ZdRxb6N1wZO73hEY6oilT1SFvw1WoE19cDRAUneIh2k
        ApH1fAXObdc12QnAcU9rqSthiGhsYlR2C5mpLN9aK7LDaLlyazvn5F0YthzQZ71SAqNCP0P0LlCuC
        lIQ474N+g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fZDwy-00078T-VN; Sat, 30 Jun 2018 11:21:56 +0000
Date:   Sat, 30 Jun 2018 04:21:56 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] Documentation/sphinx: allow "functions" with no
 parameters
Message-ID: <20180630112156.GK7646@bombadil.infradead.org>
References: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1530306311-10510-2-git-send-email-rppt@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530306311-10510-2-git-send-email-rppt@linux.vnet.ibm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 30, 2018 at 12:05:10AM +0300, Mike Rapoport wrote:
> @@ -488,14 +488,19 @@ doc: *title*
>      .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
>         :doc: High Definition Audio over HDMI and Display Port
>  
> -functions: *function* *[...]*
> +functions: *[ function ...]*
>    Include documentation for each *function* in *source*.
> +  If no *function* if specified, the documentaion for all functions

"is specified".  "documentation".

> -  Example::
> +  Examples::
>  
>      .. kernel-doc:: lib/bitmap.c
>         :functions: bitmap_parselist bitmap_parselist_user
>  
> +    .. kernel-doc:: lib/idr.c
> +       :functions:

Is this the right syntax?  Should we rather have:

    .. kernel-doc:: lib/idr.c
       :functions: *

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
