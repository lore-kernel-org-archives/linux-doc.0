Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AD5B7DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 16:52:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966486AbeEJQw2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 12:52:28 -0400
Received: from mail-wm0-f41.google.com ([74.125.82.41]:40627 "EHLO
        mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965017AbeEJQw2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 12:52:28 -0400
Received: by mail-wm0-f41.google.com with SMTP id j5-v6so5538296wme.5
        for <linux-doc@vger.kernel.org>; Thu, 10 May 2018 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ss2kORxtzfhA2xYRAoFSTLjwC+HQA9jy+T3jVS0FSHU=;
        b=bj854xgH4SAS8rHpgnUinGrJOD70czvKNlV4AJhQexdNztoS/9QhLsFEEyTw8D+w3f
         b5bFS4zAOkkllQ39lRuO/+iUhrO5eDziEk4LgjBGBGndhHmR9SaVVGh+uBx9k6fuXWU0
         S+Fu0Hc1DPwufjAVOo3iA42EIfvyfigVl9P7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ss2kORxtzfhA2xYRAoFSTLjwC+HQA9jy+T3jVS0FSHU=;
        b=I5hw6+Nq1xRmPwc0WnWFtKorq4DvtqrhHdu+LZ+2EuadX/1norofRAdVcEHxkfC3XF
         DpLe1RyNqklK4NWrAeHID0dTxrZcAz0j6D+6zSFSa7J5PWaS228ZshuCJMWJkODSlobl
         uPXZzsor/LdvU93JgrtwAh+SILK8W/7M7XjOx7tDhv5Mj4dkyDKbZyq+kPTZx2tRaXM4
         F/Aw8tUWZiOjiFz/gEyuGdz24oQSZMh2SlBGpRnKmg3Tf3AuH1Awj3o5Vpi6V6+jkozT
         y5iOrcyMCFDv0T2mrNxK41qv1PYNGp6E1r9Z72Orj8ExbY8iIvuqKZroWuYCutGYwwHe
         xXnQ==
X-Gm-Message-State: ALKqPwflBiJenLLsfsE8LkSYeQNy6epiPVPQmDHlaLUdILdeXQHAt995
        d1F83LTpafRW5ZYbYM5GZ2TiGg==
X-Google-Smtp-Source: AB8JxZojRdGUeO/Rxybkdpc5evo7EdljrpaJP3yJfcgeQ+29HlwNs0YnUz+O1ixbmLB3i+CTdim3ZQ==
X-Received: by 2002:a1c:d6c9:: with SMTP id n192-v6mr1866795wmg.125.1525971146829;
        Thu, 10 May 2018 09:52:26 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k3-v6sm1711567wri.28.2018.05.10.09.52.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 May 2018 09:52:26 -0700 (PDT)
Date:   Thu, 10 May 2018 18:52:20 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510165220.GA9757@andrea>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180509084120.GF12217@hirez.programming.kicks-ass.net>
 <20180509084518.247650e2@lwn.net>
 <20180510122335.GA7704@andrea>
 <20180510071559.59dcc8cc@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180510071559.59dcc8cc@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 10, 2018 at 07:15:59AM -0600, Jonathan Corbet wrote:
> On Thu, 10 May 2018 14:23:35 +0200
> Andrea Parri <andrea.parri@amarulasolutions.com> wrote:
> 
> > only
> > remember that other people (including some developers running into the
> > "disadventure" of opening an RST doc. from their preferred text editor
> > and being brought to conclude:  "WTH!  I need to open a web browser, I
> > guess...") _use_ such doc. and _do care_ about it, and that what might
> > be an improvement for some people might look as "vandalizing" to others.
> 
> If you have an example of a place where use of a web browser has been
> made mandatory, please point it out.  Avoiding that was at the top of the
> list of explicit requirements.

That's all I need.


>Surely an extra colon is not going to
> force you to run screaming to the protective embrace of Firefox...?

Let me put it in these terms: I believe that that extra colon (or the
"diagram" keywork) is not going to improve/help my use of the doc. ;D

  Andrea


> 
> Thanks,
> 
> jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
