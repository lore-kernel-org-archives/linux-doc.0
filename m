Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E679BC54EBC
	for <linux-doc@archiver.kernel.org>; Tue, 10 Jan 2023 15:27:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbjAJP1x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Jan 2023 10:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238525AbjAJP1d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jan 2023 10:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665D48CBFE
        for <linux-doc@vger.kernel.org>; Tue, 10 Jan 2023 07:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673364368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i6XtrwS2g47AdWhbEHN9QxRlwgfhH48+9cdffawOCUI=;
        b=fNnsR/6QFGt9nYTw4u9JZrUfNP4Reys7oBbiO2nCFlK67N8BaTiL7ybm422LgmQ7JhPMWd
        V71oeZAzDkClIaNUZYUB98kFcVz9x/ne99dPK8YtEAk2V+r5orOBM+rRh2Omy7WMqGPZhg
        P9Rdokvdw6x20jBHwa6lV2pEUbwWHC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-UzlE0oBPO_GxGR-NOcFOBQ-1; Tue, 10 Jan 2023 10:26:02 -0500
X-MC-Unique: UzlE0oBPO_GxGR-NOcFOBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDF7811E6E;
        Tue, 10 Jan 2023 15:26:02 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.198])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C8BCC53AA;
        Tue, 10 Jan 2023 15:26:00 +0000 (UTC)
Date:   Tue, 10 Jan 2023 16:25:57 +0100
From:   Kashyap Chamarthy <kchamart@redhat.com>
To:     Wang Yong <yongw.kernel@gmail.com>
Cc:     corbet@lwn.net, pbonzini@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH] Documentation: KVM: fix typos in
 running-nested-guests.rst
Message-ID: <Y72DhSk7GkUPfqch@pinwheel>
References: <20230110150046.549755-1-yongw.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110150046.549755-1-yongw.kernel@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 10, 2023 at 03:00:46PM +0000, Wang Yong wrote:
> change "gues" to "guest" and remove redundant ")".
> 
> Signed-off-by: Wang Yong <yongw.kernel@gmail.com>
> ---
>  Documentation/virt/kvm/x86/running-nested-guests.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/x86/running-nested-guests.rst b/Documentation/virt/kvm/x86/running-nested-guests.rst
> index a27e6768d900..71136fe1723b 100644
> --- a/Documentation/virt/kvm/x86/running-nested-guests.rst
> +++ b/Documentation/virt/kvm/x86/running-nested-guests.rst
> @@ -150,7 +150,7 @@ able to start an L1 guest with::
>      $ qemu-kvm -cpu host [...]
>  
>  The above will pass through the host CPU's capabilities as-is to the
> -gues); or for better live migration compatibility, use a named CPU
> +guest, or for better live migration compatibility, use a named CPU

Nice catch.  Thanks!

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com> 

[...]

-- 
/kashyap

