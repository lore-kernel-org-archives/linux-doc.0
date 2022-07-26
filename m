Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D941C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 07:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238183AbiGZHqp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 03:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238219AbiGZHqo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 03:46:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A0413E82
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 00:46:41 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id mf4so24712200ejc.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fe8FCWA8Wm+qfcWf/r36DmGWESGg9aUro2v60ffBvEw=;
        b=GUklJ/i54T4mu60z0nxww87BZMtd+OqqaYvw8WN8x7hVhl0fo+dY4lfDfvyepdp0RW
         XvHrBWy5JOY4W7LR/w6jzWEvopy1JUWPRCKBCXTqI5lUx/RhNZgW2IXfnOI06W3kNUij
         0hIXIV6SrNlIdT4O80FDGP/grKL6egfnglWraIFqq7DHY6/IHAS/TJjVLkK5AoyVBsSP
         3h8Ymz6H5vvEDz9Kxpn9R/Z9xDb3c9TuVDFj1Mio7884gHbvCCRRDGh90jodk4KlFXMx
         dninpEY7xoE6oahlH1lsKYTZV7as9eg1KjDyS49Xf8eS83gjVxttRRY5stHJLzBTPwft
         +A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fe8FCWA8Wm+qfcWf/r36DmGWESGg9aUro2v60ffBvEw=;
        b=CVgPXeXPjj6GzkAD/zidTaS1wvG/e9Cjfav8EdYPxEwLojalZe7mZy8gJ+JaGl0Nzv
         dSQsd7WPtAhcbY+WChMh1eQcACsK6/dg0/RIlaeF5jAvsLz/bQxxcbBiWetEEv2nUb2F
         0WewapoUa+kJwIO+GEZH1aBSmCpio5VT5KAN58MdrAYL+r5n45VmxP00ixvqfyv0Fzeg
         j69zqei8RR+UkTgZ/h5b+SLa6bh7LAWx4tROCnqYbYKih+gN0/w3PH8eV9A6K5Grg9V/
         tfD27CqPWTgmdqlCwyuYEaNG5BPcjzwjZ4LEbPmVraUWwTkHzb6dvdG2+KLzL402ZVxC
         U5WQ==
X-Gm-Message-State: AJIora9zf0ApK42ORC/m4cJp4it17/WMWO3bkMoa/4RymweC5bcM0Xo6
        ozWGrXwlHEeUEZ0ZWji/zcf5Ag==
X-Google-Smtp-Source: AGRyM1uFO/gjeVgZVMo2T6ekZxcZoMDquiuvwmOnarobeFUlsNL4N3QwgPCJGv8U8M2sp36My/1EKA==
X-Received: by 2002:a17:906:84e1:b0:72b:b109:7636 with SMTP id zp1-20020a17090684e100b0072bb1097636mr14028353ejb.10.1658821599484;
        Tue, 26 Jul 2022 00:46:39 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906319a00b00722f069fd40sm6075203ejy.159.2022.07.26.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 00:46:38 -0700 (PDT)
Date:   Tue, 26 Jul 2022 09:46:37 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jacob Keller <jacob.e.keller@intel.com>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jiri Pirko <jiri@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        David Ahern <dsahern@kernel.org>,
        Stephen Hemminger <stephen@networkplumber.org>,
        linux-doc@vger.kernel.org
Subject: Re: [iproute2-next v3 2/3] mnlg: add function to get
 CTRL_ATTR_MAXATTR value
Message-ID: <Yt+b3XGbAixaf124@nanopsycho>
References: <20220725205650.4018731-1-jacob.e.keller@intel.com>
 <20220725205650.4018731-3-jacob.e.keller@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725205650.4018731-3-jacob.e.keller@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mon, Jul 25, 2022 at 10:56:49PM CEST, jacob.e.keller@intel.com wrote:
>Add a new function to extract the CTRL_ATTR_MAXATTR attribute of the
>CTRL_CMD_GETFAMILY request. This will be used to allow reading the
>maximum supported devlink attribute of the running kernel in an upcoming
>change.
>
>Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
