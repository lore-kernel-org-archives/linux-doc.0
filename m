Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF9C43334
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245640AbiFCPmn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245612AbiFCPme (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:42:34 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA116410
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:42:32 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id ew15so5885124qtb.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p7fBM9lxIGcA0pluvXJoxpV2uNoYJjyHDydh/vq7BTg=;
        b=cqiUZdSVPRe8uD+tiM58wDAFIU1QOm1cewSCGNr8Sqpk0T7O2Eh67CAbDeC685CADU
         s1T3PyNt1OHwG3EGUYCkUBJYO6qLCxqY3d0XQF+obR7cTC/DremNXApL0n0I/6SrWR4c
         e7ymYOZEYmuvJHBEcRp1QjkeoMIrpZLlpbf/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p7fBM9lxIGcA0pluvXJoxpV2uNoYJjyHDydh/vq7BTg=;
        b=hSmgq27KcrywNHHpbE+pq3C5JK/R/2N2uOyRgfXlqNQTPiLwVOE5Q+NP4VJnfZS8l4
         JhlJvoxKqtBSYezWbEhxZumY5+/dm3UhCc5vOIucT7C8XL0/i81fYDZgD5JA9UB08KLl
         +PWFjw1bDnntVl1nMl9l2/1ncE8InLbgyg7SqpcrDMFk2rKWIQjq9unEgndygf4CYbWa
         s2FVzH/gm3gTe5pTn+ZlIjbBfhuRRv2NB7qaj+og3lV+FBiCzJ33nhepnIKwqf4bI+Xn
         V1/zc3MdMWuVyi9UC12SyIOGHEChvPySXPhUAtFGLWSmgkpgBAIQN+m6PCd4dmSkInTZ
         OF2Q==
X-Gm-Message-State: AOAM531MFBxfIgIKCZC1mSCaJNGOGGEuY4aS0dVVL1tPmZb+DrQUrnd+
        nYAm5jIxBD3nMZzpaf6eAu3++nSy6Q5e7A==
X-Google-Smtp-Source: ABdhPJyc1u+TDFVV4I6/19bF7OYk6sHxqHcn/aNZxi/XijQW4rBl99M5CGLCLgaNXWIGbIDhO0zmzQ==
X-Received: by 2002:a05:622a:13:b0:301:6d0d:c731 with SMTP id x19-20020a05622a001300b003016d0dc731mr7981103qtw.43.1654270951836;
        Fri, 03 Jun 2022 08:42:31 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m13-20020a05622a054d00b003030d9f518dsm5011853qtx.60.2022.06.03.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:42:31 -0700 (PDT)
Date:   Fri, 3 Jun 2022 11:42:29 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YponOKPBgE8pgBYD@casper.infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 04:22:32PM +0100, Matthew Wilcox wrote:
> We'd need to coordinate with kernel.org's automated build of the
> documentation.  I believe Konstantin handles that.  With pip, I imagine
> he can install whatever version is needed.

Correct. We currently have:

    $ pip show Sphinx
    Name: Sphinx
    Version: 2.4.5

In the setup, I have it being installed as Sphinx~=2.0 with a comment:

    # Don't use Sphinx-3.x until upstream is happy using it 

I'm happy to upgrade that to a newer version if that condition no longer
applies.

-K
