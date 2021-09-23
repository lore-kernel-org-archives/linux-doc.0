Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB2AC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1CC610C9
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 15:00:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241867AbhIWPBx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 11:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28355 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241752AbhIWPBx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 11:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632409221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KAWkRRiP+ToKhHsVmpncsGA+uG5zL1/UXnCV1dJpPg0=;
        b=dIgqxDPn6IDFCzO1SuK7v/H2txrHfwzXSjGY+tISbn3xhUqStyO3Mk4C44jvpssjH2pn+j
        h23zcOWchwtDLZnNeo/xay2e63LqHDMmiObzLkWA+fRFayVr4H49a+aaK1STdAuyzoNuVK
        Y0kE/hLaC5iJsdHgTWiyWExiXVlq1zE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-1D582T7SMSme1PTynz52Fw-1; Thu, 23 Sep 2021 11:00:20 -0400
X-MC-Unique: 1D582T7SMSme1PTynz52Fw-1
Received: by mail-qt1-f200.google.com with SMTP id 90-20020aed3163000000b002a6bd958077so6682555qtg.6
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 08:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KAWkRRiP+ToKhHsVmpncsGA+uG5zL1/UXnCV1dJpPg0=;
        b=WA9phwaS10n1Dfde45hWgrXTD6WTSkG7cIFmAx/c5vKv2D6QaOL8KbiU5yVvLUDQQ4
         x8bYvU359BwW669ALEV6FCQj4fpRSMuEpoBCudHQ317cw/9t7r3ApqUl8zm6nvQedJsY
         mzdffZLDc+UxzyCSGl4lF0qgOf80W3p5xo8l/bHJA0TgQnNTFd4dvSQ/hCnj9i/SJiVI
         7lvTToYgPdjXvkUv/Orra3vcAaVltB/glEXM6p6dmEQw1TIXJhX/Aih2t0lFYmZEvjtF
         tUOTfVNnV7/MA7cLhoJwQowsa1Bmsjj5CXC2DNN8EXn4BftEHIHVqYJUPNy0xK5ZKWmu
         RdWg==
X-Gm-Message-State: AOAM531tMbrS5k4CLxU76GQMdPWPM4FpyvUAXuCDbkae1sXY4ufzd6Mu
        COCRhajpkN+R0dunU6i2NsRvvclyh/S6ofIP4EtUnGWcf/9p/UE3VyCpl5QmwdM9z0nff3tW258
        4R6DHAPwXYJn4F1UByEk4
X-Received: by 2002:a05:620a:9c9:: with SMTP id y9mr5187040qky.207.1632409219588;
        Thu, 23 Sep 2021 08:00:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvF3oUBDTyvXXjo1UJaYDIMU/wevu6DSYRKaGO/Oh7HtqhBOY7spzcnGEiBKrNIRshX75npw==
X-Received: by 2002:a05:620a:9c9:: with SMTP id y9mr5187008qky.207.1632409219296;
        Thu, 23 Sep 2021 08:00:19 -0700 (PDT)
Received: from t490s ([2607:fea8:56a2:9100::d3ec])
        by smtp.gmail.com with ESMTPSA id u4sm3574935qtq.31.2021.09.23.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 08:00:18 -0700 (PDT)
Date:   Thu, 23 Sep 2021 11:00:17 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, ivan.teterevkov@nutanix.com,
        florian.schmidt@nutanix.com, carl.waldspurger@nutanix.com,
        jonathan.davies@nutanix.com, chris.riches@nutanix.com
Subject: Re: [PATCH v3 1/1] Documentation: update pagemap with shmem
 exceptions
Message-ID: <YUyWganKYoWOF1ns@t490s>
References: <20210923064618.157046-1-tiberiu.georgescu@nutanix.com>
 <20210923064618.157046-2-tiberiu.georgescu@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210923064618.157046-2-tiberiu.georgescu@nutanix.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 23, 2021 at 06:46:18AM +0000, Tiberiu A Georgescu wrote:
> Mentioning the current missing information in the pagemap and alternatives
> on how to retrieve it, in case someone stumbles upon unexpected behaviour.
> 
> Signed-off-by: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
> Reviewed-by: Ivan Teterevkov <ivan.teterevkov@nutanix.com>
> Reviewed-by: Florian Schmidt <florian.schmidt@nutanix.com>
> Reviewed-by: Carl Waldspurger <carl.waldspurger@nutanix.com>
> Reviewed-by: Jonathan Davies <jonathan.davies@nutanix.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

