Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D113C636CD
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 13:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjBJNzK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Feb 2023 08:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjBJNzJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 08:55:09 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B661560D4F
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 05:55:07 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id g18so5721170qtb.6
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 05:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XIPHxCMD5tFxCkQNamP1KwgZXhCO9JHa2zZcUYu+zE=;
        b=VNcwhXzklTCDhx2S86opLFevpUQrSXsNC7sI++lkeosdSuacvHF4EvNMIPrUVcmLE1
         ypJKr8JzEzAy57MLSz/EZH7+C7uCM+nJmskifqnbM7DCEmskPOnabBlRxkK5gtPJ0OQt
         BEOuhg04dExP0J0eYFixdeZx4sQjcYYvx6Dd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XIPHxCMD5tFxCkQNamP1KwgZXhCO9JHa2zZcUYu+zE=;
        b=PtIic/1g2KLJdrS5VgKCJ4at8OQLrmztadRGNZuZqb8xMtKSbR2VY4dovP30IX/fG7
         yTWUkb0FfT6EpJKLx1ubHmtPArUstymuiOP69D+/za6QPxW5vtvZdCFFsKw+DsOqK/SU
         BBRQfNIvoL8zzMo192dSzvueJzku+QTlhGaevhuMIKb6T5fXLAEDhsiCPZ59KJO9UT/1
         w7Cli8kvyjiftqOCqURaq70RCORnLlizu8P1Chnj3nJMrmvQ4lGsYoQwLLe6l25qseN8
         1oXgKMVsbewyZv2u8xcR5McHVUYMrZK88U8Z4+LpcvH2Il8jZVhPMLGKBPU7F9BaSIlP
         wG3w==
X-Gm-Message-State: AO0yUKXuSjWt+pAx/XXc5cPZJVp/D7azLzWZLjHIdjxidjJx48WYWAwR
        rZejzpOVZSmkeJdr8YAzKPX/AA==
X-Google-Smtp-Source: AK7set+iuUVYVYSZfmqGNHWnygiBBmIGdActv8aFlM3YnnhwYp9+961GSvD8pgsm7nxBy5K7wkLKkw==
X-Received: by 2002:a05:622a:5cb:b0:3b8:6814:ea20 with SMTP id d11-20020a05622a05cb00b003b86814ea20mr26686495qtb.67.1676037306852;
        Fri, 10 Feb 2023 05:55:06 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id c26-20020ac84e1a000000b003a5c6ad428asm3281450qtw.92.2023.02.10.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 05:55:06 -0800 (PST)
Date:   Fri, 10 Feb 2023 08:55:04 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
Message-ID: <20230210135504.jg7tmqhdmhfwdz5t@nitro.local>
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <1f217c94-b90f-359a-2142-0d3ae5d84fc6@leemhuis.info>
 <66fc12cd-65b6-0831-89a8-57636453883b@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66fc12cd-65b6-0831-89a8-57636453883b@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 10, 2023 at 12:38:07PM +0100, Thorsten Leemhuis wrote:
> Downloading the sources using a full git clone
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> If downloading and storing a lot of data (~4,4 Gigabyte as of early
> 2023) is nothing that bothers you, instead of a shallow clone perform a
> full git clone instead.

As a minor segue, we know we can dramatically reduce the size of the stable
repo (and the stable clone.bundle) if we drop all branches and tags for old
EOL releases and move them to a separate repo (e.g. stable-eol.git).

I have suggested this in the past, but it's not a trivial change:

- it requires a fair amount of git work
- it may disrupt some of the build infra around the world still building EOL
  kernels (for whatever reason)

In my preliminary tests, we easily dropped the size from 4GB to under 3GB.

-K
