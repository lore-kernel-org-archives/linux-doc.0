Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F46C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 23 Feb 2022 07:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbiBWHMB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:12:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbiBWHMA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 02:12:00 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6E0DFD
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 23:11:30 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id gl14-20020a17090b120e00b001bc2182c3d5so2938031pjb.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 23:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajou.ac.kr; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eO4P8gNctIGm1EeUOiCxmIMQcDwPflV40V22xmuGQ1Y=;
        b=bBctnH/MZFlR4I0JUfB6Gqn3rQP8GWwrFKhCihvfRsVSV26vqP50YSur5zSj4Afa1U
         G7RTlvytoyBoMpOXekUbGCyvVn2KJJ3h20lzQr7OvBCrQH3VTscSKnOSuI+qyocYqyb+
         BTTKn+JeimFJLev56fTuW5vM+66C4No9wMjCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eO4P8gNctIGm1EeUOiCxmIMQcDwPflV40V22xmuGQ1Y=;
        b=309nB1SISfrQN+I3NnlRX3jqUxvcH0I13snHMJ3XphO/NDarZU6D0OZIR3PABioK5N
         bRAU29lT7CSwUkdJimMz2X2xG+1xFbooY5OCifJU4L95MwP7Qs7j5uoLhDGebr8M3dxK
         gY5LTZG2BbuVIMY6/v7r6KOfyII7N0MGQyKWwnz1Ovwc/6+/aMFtDBwAeSKx1dlsDmlv
         WGsBgOdZdnPiEgo8dfiP2FQB/Ci1VksYuF1AL9Hf4Z8ts9G1dx21SSWdia2XrOQK7bK7
         zmC8iF5TNa9p0FNa4mWARESw4iJ4cIec/y1UqMFR+hKMRy3H/AhomT/I/JJVXcvk8v0C
         w9Vw==
X-Gm-Message-State: AOAM532/PLMy/nWy54A+bhT3CqLDClf54Yzbkcjo6RdJwpFWOHNxcjTL
        RZ8CxVEQSuI6gS+/Z0RX4MhQRQ==
X-Google-Smtp-Source: ABdhPJxxlJCmHoQ7UMp15+G8GXj41mXtG9w/xA5wheg6qRT0hvnTW3/qEjdvFqQjmDjErIbqyz/BHQ==
X-Received: by 2002:a17:90a:664b:b0:1bc:72df:54e4 with SMTP id f11-20020a17090a664b00b001bc72df54e4mr6776354pjm.10.1645600289667;
        Tue, 22 Feb 2022 23:11:29 -0800 (PST)
Received: from swarm08 ([210.107.197.32])
        by smtp.gmail.com with ESMTPSA id k16sm20903338pfu.149.2022.02.22.23.11.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 23:11:29 -0800 (PST)
Date:   Wed, 23 Feb 2022 16:11:23 +0900
From:   Jonghyeon Kim <tome01@ajou.ac.kr>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonghyeon Kim <tome01@ajou.ac.kr>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/3] mm/damon/core: Add damon_start_one()
Message-ID: <20220223071123.GB6270@swarm08>
References: <20220218102611.31895-3-tome01@ajou.ac.kr>
 <20220222095328.7962-1-sj@kernel.org>
 <20220223051113.GA3535@swarm08>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223051113.GA3535@swarm08>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 23, 2022 at 02:11:13PM +0900, Jonghyeon Kim wrote:
> On Tue, Feb 22, 2022 at 09:53:28AM +0000, SeongJae Park wrote:
> > Hello Jonghyeon,
> > 
> > On Fri, 18 Feb 2022 19:26:10 +0900 Jonghyeon Kim <tome01@ajou.ac.kr> wrote:
> > 
> > > damon_start() function is designed to start multiple damon monitoring
> > > contexts. But, sometimes we need to start monitoring one context.
> > > Although __damon_start() could be considered to start for one monitoring
> > > context, it seems reasonable to adopt a new function that does not need
> > > to handle 'damon_lock' from the caller.
> > > 
> > > Signed-off-by: Jonghyeon Kim <tome01@ajou.ac.kr>
> > > ---
> > >  include/linux/damon.h |  1 +
> > >  mm/damon/core.c       | 25 +++++++++++++++++++++++++
> > >  2 files changed, 26 insertions(+)
> > > 
> > > diff --git a/include/linux/damon.h b/include/linux/damon.h
> > > index c0adf1566603..069577477662 100644
> > > --- a/include/linux/damon.h
> > > +++ b/include/linux/damon.h
> > > @@ -511,6 +511,7 @@ int damon_register_ops(struct damon_operations *ops);
> > >  int damon_select_ops(struct damon_ctx *ctx, enum damon_ops_id id);
> > >  
> > >  int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
> > > +int damon_start_one(struct damon_ctx *ctx);
> > >  int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
> > >  
> > >  #endif	/* CONFIG_DAMON */
> > > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > > index 290c9c0535ee..e43f138a3489 100644
> > > --- a/mm/damon/core.c
> > > +++ b/mm/damon/core.c
> > > @@ -466,6 +466,31 @@ int damon_start(struct damon_ctx **ctxs, int nr_ctxs)
> > >  	return err;
> > >  }
> > >  
> > > +/**
> > > + * damon_start_one() - Starts the monitorings for one context.
> > > + * @ctx:	monitoring context
> > > + *
> > > + * This function starts one monitoring thread for only one monitoring context
> > > + * handling damon_lock.
> > > + *
> > > + * Return: 0 on success, negative error code otherwise.
> > > + */
> > > +int damon_start_one(struct damon_ctx *ctx)
> > > +{
> > > +	int err = 0;
> > > +
> > > +	mutex_lock(&damon_lock);
> > > +	err = __damon_start(ctx);
> > > +	if (err) {
> > > +		mutex_unlock(&damon_lock);
> > > +		return err;
> > > +	}
> > > +	nr_running_ctxs++;
> > > +	mutex_unlock(&damon_lock);
> > > +
> > > +	return err;
> > > +}
> > > +
> > 
> > IMHO, this looks like an unnecessary duplication of code.  Unless this is
> > needed for a real usecase, this change might unnecessarily make the code only a
> > little bit more complicated.  And to my understanding of the next patch, this
> > is not really needed for this patchset.  I will left comments on the patch.  If
> > I'm missing something, please clarify why this is really needed.
> > 
> > Furthermore, damon_start() starts a set of DAMON contexts in exclusive manner,
> > to ensure there will be no interference.  This patch breaks the assumption.
> > That is, contexts that started with damon_start() could be interfered by other
> > contexts that started with damon_start_one().  I have a plan to make
> > damon_start() also work for non-exclusive contexts group[1], though.
> > 
> > [1] https://lore.kernel.org/linux-mm/20220217161938.8874-3-sj@kernel.org/
> > 
> > 
> > Thanks,
> > SJ
> > 
> 
> I understand your opinion, and it makes sense. I will drop this patch in the
> next version.
> 
> 
> Thanks,
> Jonghyeon
