Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D80497E27B
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 12:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757287AbeEJMXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 08:23:45 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:36399 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757265AbeEJMXn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 08:23:43 -0400
Received: by mail-wm0-f46.google.com with SMTP id n10-v6so4049007wmc.1
        for <linux-doc@vger.kernel.org>; Thu, 10 May 2018 05:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BXfu7QcnPSs46qNv/W81zpn5NaSwmExDeUwL4oE/D4A=;
        b=KOc2u82J8sXFSauLFKqG7xQ5INvaj5YLQP5yWeJrFhtaaZLHn6dgplQ99IvQRzhpd+
         6Pgpo6rnxobWLyrm9O4ZUwL8aIzO+i2zrNj8uAmJCt8KeO3vex9/txw92R1BVOF5ShU9
         JKylopIZfhmL/0JEljiUrwz6ZXnP0+b93Q2HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BXfu7QcnPSs46qNv/W81zpn5NaSwmExDeUwL4oE/D4A=;
        b=Gj7gsFFPICwkvPVshDrxeEkt2QGWP2oVi1qq68we7J54VNgpFaiNY5ApdQ/boH7m0X
         ypGiAsZJmgJRodsuhZo25E7azCsv2Rh+sApBdQ5x6BgGvhn9SYb25qYNAw9LUeY6j3Oj
         IYjVCnXNepy1WsMU34mQ8oISWwEW5V5FxaeSCcDIolarmoZFji5MUogpvoCd4w3RgEs7
         h7FkjK5m+jMl90clGKvcakSLNkzOnj3At+6ykV14Yp32CxFjJVfVqLKjETBMFKm7w8Y4
         3agNc3a6r6GvOOBV3Scg6eY4ZFm+hScAtwKBEX845pQF5/rbWUKroOLpTbGumTr02ZwS
         OmtA==
X-Gm-Message-State: ALKqPwcVLuNgjtUDBS/MtoIeNRSz9rOFDBlYMMkJqAYYoslopNPTQxgn
        w+4UxJUylpsM4WfnorxYuLHwnQ==
X-Google-Smtp-Source: AB8JxZpt7McUxQKvXKsjOvyen4SQ5vtn2E6go/4Vw2ta6dzV72GGMrZBffLyPbtU8e2eJVioD7uNmA==
X-Received: by 2002:a1c:c702:: with SMTP id x2-v6mr1197978wmf.57.1525955022522;
        Thu, 10 May 2018 05:23:42 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id 76-v6sm32237272wmj.0.2018.05.10.05.23.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 05:23:41 -0700 (PDT)
Date:   Thu, 10 May 2018 14:23:35 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510122335.GA7704@andrea>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180509084120.GF12217@hirez.programming.kicks-ass.net>
 <20180509084518.247650e2@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180509084518.247650e2@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 08:45:18AM -0600, Jonathan Corbet wrote:
> On Wed, 9 May 2018 10:41:20 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > > This is easily done by using "::" instead of just ":".  
> > 
> > And I'll voice my objection once again. This makes a regular comment
> > worse. This rst stuff is utter shit for making normal text files less
> > readable in your favourite text editor.
> > 
> > If this gets merged, I'll simply remove that spurious ':' the next time
> > I'm near that comment.
> 
> Seriously, Peter?
> 
> It's a simple colon.  It goes along with the /** marker for kerneldoc
> comments and the @ markers found within them, both of which you seem to
> have found a way to live with.
> 
> The RST work was discussed for a year before we even started.  It has
> brought in the efforts of a large number of developers, all of whom see
> the value in actually caring about our documentation and making it
> accessible to a much larger group of readers.  And it has all happened
> while preserving the primacy of the plain-text documentation.
> 
> You're not the only consumer of the docs.  You may not appreciate the
> improvements that have come, but others certainly do.  I do hope that you
> can find it in youself to avoid vandalizing things for everybody else ...?

You wrote it:  the fact that some people (including its developers) see
a value in the RST work or the fact that such work made the kernel doc.
accessible to a larger group of readers are not in question here;  only
remember that other people (including some developers running into the
"disadventure" of opening an RST doc. from their preferred text editor
and being brought to conclude:  "WTH!  I need to open a web browser, I
guess...") _use_ such doc. and _do care_ about it, and that what might
be an improvement for some people might look as "vandalizing" to others.

We're talking about readability/accessibility here, but I think similar
considerations apply to other aspects of the doc. such as availability/
completeness (yes, I did hear developers arguing "I won't write such a
doc., because...") and consistency (w.r.t. the doc. itself and sources).

  Andrea


> 
> Thanks,
> 
> jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
