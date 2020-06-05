Return-Path: <SRS0=GB1l=7S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MALFORMED_FREEMAIL,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E779C433E1
	for <linux-doc@archiver.kernel.org>; Fri,  5 Jun 2020 10:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEBEB207D0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Jun 2020 10:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZZglLMr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgFEKlK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Jun 2020 06:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgFEKlK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Jun 2020 06:41:10 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43BBC08C5C2
        for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2020 03:41:09 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gl26so9537185ejb.11
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2020 03:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=hZYvHGig+cUC51Qrj+rSQIMWD3WeReXV7PdJTrlMp/c=;
        b=IZZglLMrjoSaV3Dh/2WHJT24LsI/+X4gCQx1keBWYC53TRRhVW+RKl3UmWQZ2Yrb4Z
         lXIoj9tL1ww/hL0ZmMnxymncNjDIgiIWzcUIP9RxrWhOAEyX6kZZwY/UV1U0tn5nSYQ0
         RNwKB8IMSKtJNJmVGMUhrgs1lTndWLw1DmoAsKke91WPWnV8KwBJ68euw6AWUfjjEXRJ
         K2PtT5Hr5/JOIIgx+I/1exdhqbiU69+zpUVn0f6dXsRb1F6LO62DiWbpNrdvnGAZvS6u
         4NdGDavWq1dVp62VBuZqYu+5OBEA76oV2Pb+Iy3rMBV/D0TV5EremVfUDJnIcHI1RXp0
         jv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=hZYvHGig+cUC51Qrj+rSQIMWD3WeReXV7PdJTrlMp/c=;
        b=t3s17Z26pg99iT2oG1vLtemWorQJxrga4ac5haq94zKpbETKDx8blU8KosNmrhKz8y
         USQpGyvhfDfvcpzrCJRgHN21VmbvVwCt4pXth4djgWV5RdEUaPKE2RV/sX473vs0fTiQ
         shawApezQACOJJ5aBhew2ttyBaIYDnv31kcprFomJ+UESBKYrdrjpfj0w2n/GEjWz52K
         NH6aC66yvAHRiGYUTTMQ6AVTKIEAPkxAN+H9HFvQGqY8iSEMNWOThmosLxwSFbZPSBlF
         DKDNokGaAwOuELV2tOhaspwT9r3yVxdMMvPuu656jL2tUfaToW0oZ80sywu4iX22QHJJ
         +ctA==
X-Gm-Message-State: AOAM533/7/K/sBzVwlTbp/uguoGgUMcvTFTfNvhSr9ZScVjIZKygUV3i
        FCXJvbiUe6Xbqrd0K3gLsC+qSyTgcvk=
X-Google-Smtp-Source: ABdhPJz5LHFKrEKci1kBpiv2PnVaREYl6988ieQKuJ0ung4pgDzUVlaX3yNiJpYklw0aZHHk2JBuYw==
X-Received: by 2002:a17:906:b845:: with SMTP id ga5mr8047967ejb.300.1591353668388;
        Fri, 05 Jun 2020 03:41:08 -0700 (PDT)
Received: from felia ([2001:16b8:2d93:f800:e1f0:eb01:927d:6b8a])
        by smtp.gmail.com with ESMTPSA id b24sm4505411edw.70.2020.06.05.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 03:41:07 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Fri, 5 Jun 2020 12:40:59 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Jonathan Corbet <corbet@lwn.net>
cc:     linux-doc@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] docs: Update the location of the LF NDA program
In-Reply-To: <20200603161407.0ec41084@lwn.net>
Message-ID: <alpine.DEB.2.21.2006051238540.11918@felia>
References: <20200603161407.0ec41084@lwn.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Wed, 3 Jun 2020, Jonathan Corbet wrote:

> The link to the Linux Foundation NDA program got broken in one of their
> web-site thrashups; now that the information is back online, point to its
> current location.  This should last until the next thrashup...
> 
> Cc: stable@vger.kernel.org
> Reported-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

For what it is worth on a one-line change,

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I checked that the new URL now resolves to the document on the NDA 
program.

Lukas

> ---
>  Documentation/process/3.Early-stage.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/process/3.Early-stage.rst b/Documentation/process/3.Early-stage.rst
> index be00716071d4..7067abbd75bc 100644
> --- a/Documentation/process/3.Early-stage.rst
> +++ b/Documentation/process/3.Early-stage.rst
> @@ -216,7 +216,7 @@ a non-disclosure agreement.  The Linux Foundation operates an NDA program
>  designed to help with this sort of situation; more information can be found
>  at:
>  
> -    http://www.linuxfoundation.org/en/NDA_program
> +    https://www.linuxfoundation.org/nda/
>  
>  This kind of review is often enough to avoid serious problems later on
>  without requiring public disclosure of the project.
> -- 
> 2.26.2
> 
> 
