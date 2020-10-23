Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0B2C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8132121527
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I+z3shC7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753655AbgJWRkZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 13:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753653AbgJWRkY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 13:40:24 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FA6C0613CE
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 10:40:24 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t4so1274698plq.13
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2020 10:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=99DVFI2Yq/R6a6ntok28QqPAZDkallXtdfQ5cTK1JxI=;
        b=I+z3shC76iB8Z8ke/TS1EVyKE8lmQEFQO1h4BbCSODPNuOrRG8hWWTFeLceK1KxiRr
         QE1Wk1EUtyDYRMbni55MoR1wXRzY9kOx5VYS7uJDQNyzxciAhDCkM9xRx+THnHNziua/
         17dTOVkdkeuVu1yj0YHbROYRd2TBWUIEOlh0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=99DVFI2Yq/R6a6ntok28QqPAZDkallXtdfQ5cTK1JxI=;
        b=sAKWi+zAcbYhdtue0ag9NhkOjx39GTdzAv9WWV5RbaN7bo1vXyf65BjNFhdh5j7uVQ
         fjm99uxhAdNV9SzLkPsNyR1ngbZbPDZrGQ5HRFoxOAXVY+8NRBYKMbBREiZkzucCiwGO
         /RqEQtOBE3Zbq+sRjkVLJx47O9aNHdRXcRTnUKdVSzR7vZJVFrV688IHMgkjZnm+PZKs
         aQQGYYvU0MfK3ssGeFYF5I57j26ge1MbIs6UtJNgmuw6XA7gU9zVjjz6BKDHCns4U5uB
         FQpVAQrCstNFZXWYXJuiVMiuEqGJCNQ80sMBanKSOqrvMM3FZyCSiVwuG3guaTzCH/I2
         2ojg==
X-Gm-Message-State: AOAM532jVwRDLhPGn+RBGM0TRSSI2X0H34UgGKAm5RXYRROfZE7m+MFr
        UCFBtQHJpqwFDxfHA34LrMOilw==
X-Google-Smtp-Source: ABdhPJwbgpR5Deyo7oPN3KlpdN7ivxAnUNFkd6aQUNjY1w+4J2kK+WD8RMq6M5ii++eBGMoY7xDnJw==
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id d10-20020a170902aa8ab02900d3c9dd77d1mr48509plr.0.1603474824401;
        Fri, 23 Oct 2020 10:40:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v6sm3278997pjh.10.2020.10.23.10.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 10:40:23 -0700 (PDT)
Date:   Fri, 23 Oct 2020 10:40:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 37/56] pstore/zone: fix a kernel-doc markup
Message-ID: <202010231040.0FD31DA7@keescook>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <576a3e3c27b84d0e36ced89840872ec3f251b2b2.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <576a3e3c27b84d0e36ced89840872ec3f251b2b2.1603469755.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 23, 2020 at 06:33:24PM +0200, Mauro Carvalho Chehab wrote:
> The documented struct is psz_head and not psz_buffer.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
