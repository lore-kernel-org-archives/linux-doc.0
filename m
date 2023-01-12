Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ABFC54EBE
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 19:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240081AbjALTpm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbjALTox (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 14:44:53 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CF1EE
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 11:38:27 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y1so21258558plb.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 11:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRyhT8+281FkbtvlzWcd8x6Mt5Qf+uTY04klZrSDBgA=;
        b=VgKSHn+89hEPMavJwYES359VnVFzbolKedyoSBQJzw+A0qwTjNIaPF5+UEMzQzWZir
         jCZqnHqIk81byMCdBALS8X/9xmdi/R2Amsw2bRMytV29XYgyHhI3sK4By7Tnci6q2/fW
         tC3XgXVAN+kaHdJL1mLDbP/si0CPos72fWWTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRyhT8+281FkbtvlzWcd8x6Mt5Qf+uTY04klZrSDBgA=;
        b=KOBs0yZdPdqghFCinfHF3EVdW9HHGYNcFt4FSTfrldVo7VvuFjSv5Kddtn7CkQ2kiw
         6dZaTreEBVye0NeE2y2hkDAf0IbDKClrUYr2AOWCMPfPpKtVJJ7UfezItMsiQrp3DGcF
         vrrz1bbn8PF9Rlxd5cEV/dxCkKcT+YVyVj3VNq21ndYxCotJu1OFfgNBQkCNJGxavtWg
         trQwnIDu2V1oYdcI5a42tY0xvgX3PlfSP9GB0vYKtLGgIakRTAg6ASUMfAAYnF+RdmQI
         QxooYmA6JZvnFpeKqkAOvRaiv34qwqpn7n7XNBjudU/XwJ9Jg8QQ42r5zsMIDy5Iswey
         6l3w==
X-Gm-Message-State: AFqh2kqh9PvSy2eJqQzXF7fWDGjkfXzDLXiBycyDkzfwyQwZOLAWfBsD
        Hp7XBJE1BuahwWu+oI0oYdjoMg==
X-Google-Smtp-Source: AMrXdXs4z1HduTAnC+3Vr6wZn3Ynas8Lg0tNaMNRSSML8W4X/xmDWe9qEYPR4PBpbZcYfmkcK2lC0Q==
X-Received: by 2002:a05:6a20:1455:b0:af:e13e:cd67 with SMTP id a21-20020a056a20145500b000afe13ecd67mr116274174pzi.6.1673552307354;
        Thu, 12 Jan 2023 11:38:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p3-20020a63c143000000b004a03cdc82bbsm10422383pgi.55.2023.01.12.11.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 11:38:26 -0800 (PST)
Date:   Thu, 12 Jan 2023 11:38:25 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] docs: deprecated.rst: Add note about
 DECLARE_FLEX_ARRAY() usage
Message-ID: <202301121138.0A591928@keescook>
References: <20230106200600.never.735-kees@kernel.org>
 <87r0w0vf82.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0w0vf82.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 04:11:41PM -0700, Jonathan Corbet wrote:
> Kees Cook <keescook@chromium.org> writes:
> 
> > There wasn't any mention of when/where DECLARE_FLEX_ARRAY() should be
> > used, so add the rationale and an example to the deprecation docs.
> >
> > Suggested-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: linux-doc@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Documentation/process/deprecated.rst | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> 
> I've applied this, but couldn't resist making one tweak...
> 
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > index c8fd53a11a20..fcac0a929efa 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -346,3 +346,29 @@ struct_size() and flex_array_size() helpers::
> >          instance->count = count;
> >  
> >          memcpy(instance->items, source, flex_array_size(instance, items, instance->count));
> > +
> > +There are two special cases of replacement where the DECLARE_FLEX_ARRAY()
> > +helper needs to be used. (Note that it is named __DECLARE_FLEX_ARRAY() for
> > +use in UAPI headers.) When the flexible array is either alone in a struct,
> > +or is part of a union. 
> 
> The pedant in me couldn't stand leaving that sentence fragment, so I
> made a complete sentence out of it.

Thank you; I appreciate the help! :)

-- 
Kees Cook
