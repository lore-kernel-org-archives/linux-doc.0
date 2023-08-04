Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E6CC001DE
	for <linux-doc@archiver.kernel.org>; Fri,  4 Aug 2023 08:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234030AbjHDIXo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Aug 2023 04:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234198AbjHDIXl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Aug 2023 04:23:41 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A592646A8
        for <linux-doc@vger.kernel.org>; Fri,  4 Aug 2023 01:23:37 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bc1c1c68e2so12799005ad.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Aug 2023 01:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691137417; x=1691742217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqdXFomMcxJTHaDqy7dbmnB+epG491/CtwlKPqeBXDk=;
        b=OWLgSbAlpdbLlX97XZIdjRI8lxtlydrt+JjLXEl569rs+xBK8lrjUXKTKwBwtTCUs/
         qzMDhsatNvTHT9zrNH9C2aTQyVT1wjpajEpxe31Kr0rJ0EzNQbiSeohiFgXEWsbJth4M
         aphehO58kWydtezPbXacheEC/y3n/aaryw5II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691137417; x=1691742217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqdXFomMcxJTHaDqy7dbmnB+epG491/CtwlKPqeBXDk=;
        b=K7Q4IIR7B0i8+c3yD4C7ODsB55mO5T5omAOAEEE66ILTL4GByYaV8Jo7bUtPgqVqA5
         ehP23BnCdGwdgN7yhmfKHOphl6PmD5lG3ZNTGC644akqhuS4w5PqfRz1fZW1BQ26VfCm
         bKiONALd88T52TkypAimswAqXeSgpNT78DbwWy7VlEJcPPhY2548wcVmGEFD7uopu2m1
         mDSRtK78Vx9UjHVkv91XEFGDYtWKK+ojCZdE80uPmnbSjAe9hf5Zwe7eIhNrwd4saxdc
         u2xHJ1DEqckO5xg2adeVgHkiW2yeFRQkpF2Y6Cm5/nnMHWyGC8z/3ZtTaXFNLHE46Lqo
         mlhQ==
X-Gm-Message-State: AOJu0Yx8K3fPEFVbPpknO8lkOBGegY+qtTeCqeLK33DWdG1p8IREnDgx
        0uDpFnLr+KvZQ0F21MX9D1fOkA==
X-Google-Smtp-Source: AGHT+IFsafD90E5qJcldKYIP+UlnOQXPznSagsYMzXhCxyqNbhsvX6sR7P4YJOGbyW60Y51msSweXA==
X-Received: by 2002:a17:903:32d0:b0:1bb:14e7:4fd0 with SMTP id i16-20020a17090332d000b001bb14e74fd0mr1023520plr.7.1691137417129;
        Fri, 04 Aug 2023 01:23:37 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jw24-20020a170903279800b001bbb25dd3a7sm1151837plb.187.2023.08.04.01.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 01:23:36 -0700 (PDT)
Date:   Fri, 4 Aug 2023 01:23:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, tech-board@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
Subject: Re: [Tech-board] [PATCH] docs: Add a section on surveys to the
 researcher guidelines
Message-ID: <202308040123.927319F@keescook>
References: <87il9v7u55.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87il9v7u55.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 03, 2023 at 02:23:02PM -0600, Jonathan Corbet wrote:
> It is common for university researchers to want to poll the community with
> online surveys, but that approach distracts developers while yielding
> little in the way of useful data.  Encourage alternatives instead.
> 
> Co-developed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

Yeah, I like it. Moar conference presentations! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
