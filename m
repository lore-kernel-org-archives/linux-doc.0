Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EC8C32793
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 18:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjARS0B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjARS0A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 13:26:00 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155E654217;
        Wed, 18 Jan 2023 10:26:00 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so3270581pjg.4;
        Wed, 18 Jan 2023 10:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfdBFnYu5sNZX5xFe5dSgbNFlKRXmyEjirqJcinL8sM=;
        b=KLz8M1LacL19djpn1QnVHpwDLfqm5ZPqvEkxH+PEoCS88M/dddzhvXp+B5xsuS3dRq
         Dozgqm8vdidtYNCMjy93Bjj+GA64O/FZh7XHnfyW/F+71TYelRGQNaVj6/VQ79r9XpnJ
         9eEchAroDQfDazRdPqrrfUVkePd61pk4FxXxPt6FudJnG1gYkllewxhez8Q/xr5dniZH
         03DD12mqiseHav5y7aI9Nr3lPsL82m26Rfura9SbI4eEtY0NrmPkKwZKUXEuVz/sIPMZ
         x2Hil+L2EjPt1eOgaqUes2EAHjEXktuePQ0epQsYCuhplCJy+mM+v/GG9oVvQQh4Fqcc
         nGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfdBFnYu5sNZX5xFe5dSgbNFlKRXmyEjirqJcinL8sM=;
        b=dWmssoRoB0zOk9bK7QzC9+wnWeMHu1qSz+wUu6OElLMWeFIyy7pXnJEsW8BC4UmgzG
         vaZteQ4KMoOXy4R9rXven61hteWQSnzY3GE/u01myJRPHiAsIRcBoHZvm2tMMOGt7UkT
         zkzJbfkeYkOT7hiBoS9GD8loULLUK6EzEZPdYzHxjP5g/kUn8CSJBvJ0d0b8mXYswwxq
         BsaWCjvCKWl6qAHAj9s6JmwALTkGoisrtHLAwp34su1DndISfA1DhEJ4ng2ug0R15KsM
         Tx2HhIms58p0oDrBJz5wknyNA4woZZ8x+EdGU3g3PLa6b/Qp4423FtK/sdJcMJ+uNmq2
         bI3A==
X-Gm-Message-State: AFqh2kpeh05l8tMGKfNX1HOjodt7Vd82gwHLGVJ2m7tFkRI17jZiDLpr
        h1oZR7R81wxMrPVkBHBlJFbDn/CbX98=
X-Google-Smtp-Source: AMrXdXuddP+QLqbpiJjVVoBjiKzMya8ya11h0O34Qm4U4bXH8ycZ+67WnlQwbpCawBq+FhbU3MQ+bw==
X-Received: by 2002:a17:90a:430f:b0:229:46f0:6f71 with SMTP id q15-20020a17090a430f00b0022946f06f71mr7957578pjg.45.1674066359379;
        Wed, 18 Jan 2023 10:25:59 -0800 (PST)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090a640400b0022910fa4d1csm1626154pjj.46.2023.01.18.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:25:59 -0800 (PST)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Wed, 18 Jan 2023 08:25:57 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Sandeep Dhavale <dhavale@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
Message-ID: <Y8g5tR8tup8LHbb7@slm.duckdns.org>
References: <20230113210703.62107-1-nhuck@google.com>
 <Y8HI+42TxxlJxT6D@slm.duckdns.org>
 <CAJkfWY7vmvrU8sW3OWpSa9zygY=6e8BTTkktPe-VScdOcLL-sw@mail.gmail.com>
 <Y8gxu7l8BUWewuMg@slm.duckdns.org>
 <CAB=BE-Q9jtJnqPwGzSTQ6-soZ9STvqAebeONy=Eyo08H+eg-rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB=BE-Q9jtJnqPwGzSTQ6-soZ9STvqAebeONy=Eyo08H+eg-rQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 10:22:32AM -0800, Sandeep Dhavale wrote:
> If with the kernel config option, every WQ_HIGHPRI is elevated to
> sched_fifo_low, wouldn't that be kind of defeating the purpose? Having
> another class for even more urgent work is better in my opinion.

I mean, everybody thinks their work items are the most important. Even with
explicit FIFO, you're still gonna have similar problems as people crowd that
flag. If this is a concern, please benchmark with realistic scenarios and
consider other options (e.g. maybe that problematic workqueue doesn't need
to be HIGHPRI or should be split somehow). Right now, I don't think there
are enough justifications for adding another level.

Thanks.

-- 
tejun
