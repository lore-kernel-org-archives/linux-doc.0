Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265C4C88CB2
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 18:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbjFLSVT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 14:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbjFLSVS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 14:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A64E64
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686594022;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DweJJLld2HQbZcM4M29lIrPOPHeHIdRll60sBYlCG68=;
        b=RMmGa3V9xNhWF+I8DrbRl+BrGJWIyabuysgKaWt1cOCe2fbEBjmtw25RVzRet4XDXdvVJ1
        RyiWxbVr84v+Cm0392SXkX7vgQ6Q2gHQwuDigt0ZiV870Q9zFSn5q8Pq5ecoZdcC+gT24z
        go/o2wkjpSXTwNLvZF1rVm0rTqhqGjw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-MT2yHL5fPISWGWg2lrhwgw-1; Mon, 12 Jun 2023 14:20:20 -0400
X-MC-Unique: MT2yHL5fPISWGWg2lrhwgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 968DE38117F7;
        Mon, 12 Jun 2023 18:20:19 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E1440D1B61;
        Mon, 12 Jun 2023 18:20:19 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
        id 526D3400F7B72; Mon, 12 Jun 2023 11:24:17 -0300 (-03)
Date:   Mon, 12 Jun 2023 11:24:17 -0300
From:   Marcelo Tosatti <mtosatti@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: virt: correct location of haltpoll module
 params
Message-ID: <ZIcqkSzHGTZB6spQ@tpad>
References: <20230610054302.6223-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610054302.6223-1-rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 09, 2023 at 10:43:02PM -0700, Randy Dunlap wrote:
> Module parameters are located in sysfs, not debugfs, so correct the
> statement.
> 
> Fixes: 2cffe9f6b96f ("cpuidle: add haltpoll governor")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/virt/guest-halt-polling.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff -- a/Documentation/virt/guest-halt-polling.rst b/Documentation/virt/guest-halt-polling.rst
> --- a/Documentation/virt/guest-halt-polling.rst
> +++ b/Documentation/virt/guest-halt-polling.rst
> @@ -72,7 +72,7 @@ high once achieves global guest_halt_pol
>  
>  Default: Y
>  
> -The module parameters can be set from the debugfs files in::
> +The module parameters can be set from the sysfs files in::
>  
>  	/sys/module/haltpoll/parameters/
>  
> 
> 

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

