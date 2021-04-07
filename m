Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2590C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86D446128D
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344706AbhDGOp3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:45:29 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44689 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244998AbhDGOp0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 10:45:26 -0400
Received: by mail-ot1-f42.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso18269100oti.11;
        Wed, 07 Apr 2021 07:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y7LejqSjmP72JykNbNh8s7/3JV7drAODmjJ4r8ppAGA=;
        b=dcfrVT7PsjcaTfAF+EvOWwt5jVOMmIf4ibPfWP3iONTXgmGLZ8fdtADYGGuqApX4s1
         yz0g3P92l10aeix0T8qHkhhlbDTnKTT6axpj1zLxY2BwvNNG/1vgc2TlX5rIbeQ6FUJo
         +6F2UtbB+WiBt1RHvQdv7a0I7pQdq/9KaE5t4g6/4OJoK3rty0ecp7dkZcI40mDXitus
         EXNK6U8teAlr+XM9TvtnoD+dA0Yr5HJ0N5QuMgYXLfnl3RFpLzuOQQgz8Q20ULIcEVdw
         klxvIo2f2ehN0wEaXr2YQMAQ1g4i8stnVFmbseyNMQCiB6eQfu8JjrvVbKweG7L/aMNo
         YeVQ==
X-Gm-Message-State: AOAM530Sm1wq+23CqRNNyUCF+NBe8bJy/+8EYYtCnelktWChm/7whbk1
        U0KoqN+GSd63l2QH3GNkqg==
X-Google-Smtp-Source: ABdhPJw5blCCz/SmqrvGWwD6HM+mFvtA4XUo4j5GQ0AEiXN+1TepkMRXXAVob8fvIbUbv7Tdp6I5YA==
X-Received: by 2002:a05:6830:15d2:: with SMTP id j18mr3327684otr.75.1617806716946;
        Wed, 07 Apr 2021 07:45:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c2sm5317311otf.66.2021.04.07.07.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 07:45:16 -0700 (PDT)
Received: (nullmailer pid 3719382 invoked by uid 1000);
        Wed, 07 Apr 2021 14:45:15 -0000
Date:   Wed, 7 Apr 2021 09:45:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andy Whitcroft <apw@canonical.com>, devicetree@vger.kernel.org,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH 29/32] docs: dt: update writing-schema.rst references
Message-ID: <20210407144515.GA3719288@robh.at.kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <7cfddf303f1508d26f90d87546d3812faebfc5ba.1617279356.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cfddf303f1508d26f90d87546d3812faebfc5ba.1617279356.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 01 Apr 2021 14:17:49 +0200, Mauro Carvalho Chehab wrote:
> Changeset b83db5b84900 ("docs: dt: Group DT docs into relevant sub-sections")
> renamed: Documentation/devicetree/writing-schema.rst
> to: Documentation/devicetree/bindings/writing-schema.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: b83db5b84900 ("docs: dt: Group DT docs into relevant sub-sections")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/submitting-patches.rst | 2 +-
>  scripts/checkpatch.pl                                    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!
