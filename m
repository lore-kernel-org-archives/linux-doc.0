Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E82EC4363D
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 23:23:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62ABE2076B
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 23:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WEHLJvOR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731255AbgI3XX7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 19:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgI3XX5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 19:23:57 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07E1C061755
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 16:23:57 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k13so2552352pfg.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 16:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kREN/bOevCqCefEiqcu5963AVtvCoPNDNjWTDSgQ4bk=;
        b=WEHLJvORopfW9SqVzjuIBplovl593zKzDltPW/iKhjkazT8C9tkdavbcR6JpyM1PkY
         uyLweiQZF3Vc/EeISGMjIdoz2rHu7kBTj0eX2kBjstC+iuwEwBg+doSVlBTw+nkCqnaE
         YAOl/QveetXkwgDn12/InOw/fdsLMGwWt1otE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kREN/bOevCqCefEiqcu5963AVtvCoPNDNjWTDSgQ4bk=;
        b=I9fF9wlHLA0Mt/3IqhcUPGrGOvS4JPbFE+elpK/99s7PdpgxKXkQadtiRyOryUMpQE
         4Z+ghJqnNNydUcz1cmI8sJl5Kx7ujygJAR6p2W20hjt9nl2b5UBGGdni3nUsJ6Leninv
         sYst2h33c7ag5ySkxwsC6lwFML/Uf8cRYE2fT5eDJbnoqYiKfq8VuCbVWAQEolaKdUXA
         a1KvoPT+WiJhe0yMIkPoUqE+JFYcA297PwpiAgI0kbCDrOTAAeZFENq5qvSsVCrAAZo1
         02ct/tDADPDtCguqqSHlCu/0LP5MQN/RIA3sKMcV7Nkv/rXAHa/Y/N8cOplJR5cDA4CX
         aIxg==
X-Gm-Message-State: AOAM531Y1iQeOn7KVa/UjMBmD5+2yA6VidIg2lFBdtyUzfJ2sj2bJN9s
        VaozyKGJwl+24kaYc/tYKltSJA==
X-Google-Smtp-Source: ABdhPJwNUmbl/VUroCr+GBxQXdRFOKbvYJq+bsGNQATMyYAT4Z3stJW+wxY/tA4Qll2558gPZN7CBg==
X-Received: by 2002:a63:591e:: with SMTP id n30mr3969654pgb.340.1601508237388;
        Wed, 30 Sep 2020 16:23:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id fz22sm3260765pjb.46.2020.09.30.16.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 16:23:56 -0700 (PDT)
Date:   Wed, 30 Sep 2020 16:23:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 34/52] docs: pstore-blk.rst: fix kernel-doc tags
Message-ID: <202009301623.496E3F85@keescook>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <cecf37b806ceb3bd53e642fc5437111e29e1c1f3.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecf37b806ceb3bd53e642fc5437111e29e1c1f3.1601467849.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 03:24:57PM +0200, Mauro Carvalho Chehab wrote:
> There is currently a problem with kernel-doc tags from blk.c:
> 
> 	.../Documentation/admin-guide/pstore-blk:239: ./fs/pstore/blk.c:175: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
> 	Declaration is 'register_pstore_device'.
> 	.../Documentation/admin-guide/pstore-blk:239: ./fs/pstore/blk.c:432: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
> 	Declaration is 'register_pstore_blk'.
> 	.../Documentation/admin-guide/pstore-blk:242: ./include/linux/pstore_blk.h:43: WARNING: Duplicate C declaration, also defined in 'admin-guide/pstore-blk'.
> 	Declaration is 'pstore_device_info'.
> 
> Basically, the internal parts is shown with :export:, instead
> of :internal:. Yet, there are some other exported docs that
> aren't at the document, because they lack :identifiers:.
> 
> So, instead, let's just use :export: at the kAPI part of
> the documentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

That should work; thanks!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
