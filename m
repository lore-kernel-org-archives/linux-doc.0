Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CAD997DBD4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Oct 2019 02:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfJJCbA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 22:31:00 -0400
Received: from mail-pg1-f179.google.com ([209.85.215.179]:43350 "EHLO
        mail-pg1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfJJCbA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 22:31:00 -0400
Received: by mail-pg1-f179.google.com with SMTP id i32so2644420pgl.10
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kiyNt/xJekPXIhuKZIFZr04kR6MVjud5JHLuZXfE0rU=;
        b=SyVZTij3mTFyijG0kOCQZ/JAoLMYFf/FIetijY0B5VW0lJQ/DHR94Ub5HPjlfQhhHv
         L3/pvSQD+xYjcIn+zm1Gexvsl9wvABvUIBXbptWDOan8WsitaKTH8jse1aRn/ySTsJnY
         WcVUdNI1ieqd61+yq2zng50F7DoYpiA7WllpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kiyNt/xJekPXIhuKZIFZr04kR6MVjud5JHLuZXfE0rU=;
        b=DIt/I+tneXJ2mFJ86bI1NXNnBEnCZy3UztLA3tJXNiEWGcmdXTXOjZWvg3NIdm1Mld
         p0YWM5lZ0sz/nuVGjNy2ql6r49AvAU15/y55/ErX6wAt+4qoHc1Xm4KkJKNDz4X0ZcCQ
         ozPD2Z3jjCmgNC2Bu24Mtw31W6rRXb1TwzpBBdk8safCMSnIYpYbdYvjgll1fF0my9yq
         KFgZM94yLlmbEZxMKgbjNwL4LkOOYy6zXHl03I9Te3kbzfZcxeDkJ+/ZQcr31+/cC4SW
         4wNs4XMRMe5H/GW9+BfGvtFYlviFGHsP+fu1v+q9lrdzrYEa1Hx8I0sofhkfPfhRe1H4
         qwVw==
X-Gm-Message-State: APjAAAXqRDTXo/yy8vsLM8V7SJUoZugt5GaDewjo41uoT2JEsU5pAhGZ
        NVj1sQQbNqhF8DEehTlwRlm5ETcvmX4=
X-Google-Smtp-Source: APXvYqzkyNkjCbpSYjxsbJqIVNy6cqc1WfFs7eRW1h8aguBHOfA6HIVMOoBXtc8Oq2HnFzFsP+wAMA==
X-Received: by 2002:a65:4907:: with SMTP id p7mr8010561pgs.429.1570674658240;
        Wed, 09 Oct 2019 19:30:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i8sm4240086pgl.18.2019.10.09.19.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 19:30:57 -0700 (PDT)
Date:   Wed, 9 Oct 2019 19:30:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Sphinx parallel build errors
Message-ID: <201910091929.0C058BB@keescook>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 09, 2019 at 02:37:51PM -0700, Randy Dunlap wrote:
> 
> Sphinx parallel build error:
> OSError: [Errno 12] Cannot allocate memory
> 
> I have had this error 4 times in the last 3 days.
> 
> The first time it oom-killed Thunderbird.  No big deal.
> The second time it oom-killed gimp, which had 24 photos open.
> Still no big deal.  Just a nuisance.

Eek, sorry! OOM-killer once again chooses ... not the culprit. ;)

> My little laptop has only 8 GB of RAM.
> 
> Is there a way that I can limit the amount of parallelism?

As mentioned, "make -jN htmldocs" should be respected now (before it was
as many CPUs as it had). I'm wondering if it's actually the addition of
the MAINTAINERS file parsing -- that's a really big parse and maybe that
pushed things over the edge?

-- 
Kees Cook
