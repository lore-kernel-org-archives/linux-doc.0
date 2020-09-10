Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09729C433E2
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 23:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0CFA2073E
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 23:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gfDQq0ZQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgIJX6g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 19:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIJX6c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Sep 2020 19:58:32 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB99C061573
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 16:58:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s65so4190628pgb.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2020 16:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TiD2LqrFMgU68bxi0s2xnUciJbQ2K0M9nK4+d+t39K8=;
        b=gfDQq0ZQqLUJ2DXD4GeetN5kOqP51hwBhKIkS41DxfjESdBN19BG5x+kfviKP/yh9X
         NBzaEVawSvptQ7Q4030RuEKgEvrEhYDi7bTC89bB7xG03X9rvK14W6PkRUtnT9UOr0Zn
         w2FsE0kcZLviYstxkTuTgVRezP064DYBbisLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TiD2LqrFMgU68bxi0s2xnUciJbQ2K0M9nK4+d+t39K8=;
        b=WYjNsOWdK0Baq9Cj1q/nOvEpe36mbGGn0ISyFHdoZMMkayDa/e2H7GjVYDwzazabPK
         ZOeWXPqsjWk1WtiIaxuPUKiAUQHKMoncHDfzD7WuMlQ0TV7/y+X449l4MCa63aKR351U
         95oi0HLPzcDL5rwmGQI6H/1PndanE4Mw3VdSJSQvElbo+aYiHuq4Qq/wrV41gYASW2F2
         YRo2+g+rK6oROKO8mb6bWhMQgeU4HhuQbRRylZ+EQLdhLUtuc9GiOLi8U1IzehhtWoBq
         YgptKnjEP0UJlF+P3v0LnvGLQQIh7gnOEWz8khOWN9zEDKQal7U7g9IH7xhLhD9uQAcd
         ci2A==
X-Gm-Message-State: AOAM530rai1ieFZU8XXtbvWvrI7wiHu/9Fj6IWz71fGF5GgPxDPrBXqw
        WBxRDdaxoDa0jE7ATs3caofcvA==
X-Google-Smtp-Source: ABdhPJx7/8vv2eB24dRiaLxWkU+dxFBXMvFoW+hNl5OQ5bHZLnmTBQqdIzH3CPNupiTU/enKTlQaQg==
X-Received: by 2002:a17:902:b216:: with SMTP id t22mr8241168plr.35.1599782311659;
        Thu, 10 Sep 2020 16:58:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v91sm159824pjv.12.2020.09.10.16.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 16:58:30 -0700 (PDT)
Date:   Thu, 10 Sep 2020 16:58:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     kernel-hardening@lists.openwall.com
Cc:     John Wood <john.wood@gmx.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [RESEND][RFC PATCH 0/6] Fork brute force attack mitigation
 (fbfam)
Message-ID: <202009101656.FB68C6A@keescook>
References: <20200910202107.3799376-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910202107.3799376-1-keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 10, 2020 at 01:21:01PM -0700, Kees Cook wrote:
> From: John Wood <john.wood@gmx.com>
> 
> The goal of this patch serie is to detect and mitigate a fork brute force
> attack.

Thanks for this RFC! I'm excited to get this problem finally handled in
the kernel. Hopefully the feedback is useful. :)

-- 
Kees Cook
