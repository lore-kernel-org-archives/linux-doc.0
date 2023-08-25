Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEB3C3DA6F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 13:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbjHYNxU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 09:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245299AbjHYNw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 09:52:59 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E481BDB
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:52:57 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5733aa10291so625722eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1692971577; x=1693576377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hypiZrNUAlpFpds6qforN3FHopPaWtqa1VnQGLSWLoM=;
        b=jWibQtNGlxQKd+CM2JR3hPEcfbc3/Uqw5jr/+nsaSm2YidCYfOpwm9Crz/ZcG7hPKz
         KUXjCCzhK0OMBbeY7lX9SylSHgjOLagl6MBvGvTfAOVd7NzjUJux9n0Lg6nBCNTBCki6
         29gYWrDtMjinKBTJ3HEp4DWmQBJw+NkHbTY3pE4pAVkJIX9k5Zrh+KMSVq/55AXrYa+9
         qqivS4UJF/T/iTWxYzu0VxBb2pL3x7/JRTZhPObOjhXRHAgR/9Y8Roi+W3Ng3k+qD1Hf
         ylHggW5r7LgFe2OQGBMLsLSr71YhsKnzvhHVKmET7tJ0I2H8UBGiG8rr5WDidnMPSB71
         Ne2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692971577; x=1693576377;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hypiZrNUAlpFpds6qforN3FHopPaWtqa1VnQGLSWLoM=;
        b=gkyoSomyH7Y7Ki5D7C0TPLjRZm0sMK/HlPn1ULQgjT6Kuv/2TM66QzPXHjx5uum/b2
         At/hONm7B65PvYtU3hY+uAf8O9u7EYL73KrSDA00f/HrzSXWE/tZ0/UBwi7BZBodSseG
         puRXUzqjbFEl6XXU+I3D2/BEW289n4rnF9vLntD7sRnB8xOofbosHylbutpmMzegKweP
         ATvAuB/GfgsBA/whJ+sZx06yEe81KBTSBPl0SEOx4fk1S1YwYaPk3j3su6X6ogl5DXEj
         5f7qWUTCI52qSIaFVE9dvgf/xUVCP6CAlGNki/0RR0wL8eQRg++qiVDydq2kIwCwKbc4
         SWrA==
X-Gm-Message-State: AOJu0Yyw1lmaX7pePMlk7N0CWOcHJRmROfjz6/LyP2BE36mMIXdHvMqm
        X4Xnn1MNwlXkBpTScnBMe9uKJQ==
X-Google-Smtp-Source: AGHT+IE6kTpf/gf9HoBQB+U/Q6hDTLaZ1E8OoH4eSzztM0CCEntRDyeSI5r7KkHkcgGZBbnGkIfyLw==
X-Received: by 2002:a05:6871:206:b0:1be:dbd9:dd2b with SMTP id t6-20020a056871020600b001bedbd9dd2bmr3482658oad.54.1692971577180;
        Fri, 25 Aug 2023 06:52:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id e17-20020a62ee11000000b0068bdb0be6bdsm1574051pfi.191.2023.08.25.06.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:52:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qZXF9-0024Mu-3M;
        Fri, 25 Aug 2023 10:52:55 -0300
Date:   Fri, 25 Aug 2023 10:52:55 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marco Pagani <marpagan@redhat.com>
Cc:     Jerome Glisse <jglisse@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Penttila <mpenttil@redhat.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: remove references to hmm_mirror ops and clean
 typos
Message-ID: <ZOiyNxU1BGxMq8NF@ziepe.ca>
References: <20230825133546.249683-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230825133546.249683-1-marpagan@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 25, 2023 at 03:35:46PM +0200, Marco Pagani wrote:
> Clean typos and remove the reference to the sync_cpu_device_pagetables()
> callback since all hmm_mirror ops have been removed.
> 
> Fixes: a22dd506400d ("mm/hmm: remove hmm_mirror and related")
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> Reviewed-by: Mika Penttilä <mpenttil@redhat.com>
> ---
>  Documentation/mm/hmm.rst | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
