Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBFEC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 05:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCDE220825
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 05:56:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hXDR6u4s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgFJF4z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 01:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgFJF4z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 01:56:55 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD94AC05BD1E
        for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2020 22:56:54 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e9so496365pgo.9
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2020 22:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z9SuisqRlcx6/lpUYEU6vFFpsqhLHwv5HofMXIqmkJY=;
        b=hXDR6u4syX57PlB+Oe6EzJDZXIop00EmmAfag/LriaGQuVmW3eARkJ4e9nJPE+dKJH
         bQNA31PjzGSg4+9R4bAM0kdYHL6IIg5SXQnW6JGMgpwgzPcTX4DISf1a3FH4bO5WibqW
         OrrlC5WC+7C7//JNgNogI34ptTpV/NivBXZKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z9SuisqRlcx6/lpUYEU6vFFpsqhLHwv5HofMXIqmkJY=;
        b=k9QTacG4PriWEOJA8VhWJ9D9WwaLaD5pe5W7EMzUl8lk53XfHlI6giOPDhZpheuG2r
         eTf+38I290aye1ZSQ6aB3sUMZK6TmN1zsTiOvWTsKEiiiMxKWj2z74scp3we+F+7w51k
         F+HlZb0+Y6ICP/8P8kiEkyTr+74qn+C4/1tAXFzcjYxumiJJSXtTTo8547yRP0k11RPe
         WrYpk5qLXUPlzrRVxa83u2i949AwsppodWxjcBZp9omKnf7YVswxzR2KdW4g2cmGvPL0
         JPOUQLv6qCosq9fUDTdPa/FrJPhDgTgHlmzSPeo5hS5zUKXMbKk/eRaYnXeUp7c//YKV
         hKnQ==
X-Gm-Message-State: AOAM532oZ/C9b2w4Ba1m7NwBj8waIO8IK6RPt9Fp6X9LUM5Xl4aWUzBV
        vAAlAmww0bUHJ8+gXaRkfVKymg==
X-Google-Smtp-Source: ABdhPJwVbW7S5e1JdomPfrD1ypYe0dIP8bmvkzwolVXO16IjuRDcq7ggf/PlaBmSHU3kHvUXp+enZw==
X-Received: by 2002:a63:6704:: with SMTP id b4mr1360430pgc.419.1591768614284;
        Tue, 09 Jun 2020 22:56:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mw5sm4464865pjb.27.2020.06.09.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 22:56:53 -0700 (PDT)
Date:   Tue, 9 Jun 2020 22:56:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v3] docs: deprecated.rst: Add zero-length and one-element
 arrays
Message-ID: <202006092255.B7897E7@keescook>
References: <20200608213711.GA22271@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608213711.GA22271@embeddedor>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 08, 2020 at 04:37:11PM -0500, Gustavo A. R. Silva wrote:
> Add zero-length and one-element arrays to the list.
> 
> While I continue replacing zero-length and one-element arrays with
> flexible-array members, I need a reference to point people to, so
> they don't introduce more instances of such arrays. And while here,
> add a note to the "open-coded arithmetic in allocator arguments"
> section, on the use of struct_size() and the arrays-to-deprecate
> mentioned here.
> 
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

We hammered this out offlist, hence my SoB, but just in case it's
useful:

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
