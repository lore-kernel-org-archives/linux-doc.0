Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C14C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 16:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C45561057
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 16:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240096AbhHaQmG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 12:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240087AbhHaQmG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 12:42:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FC2C061764
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 09:41:11 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id d5so6449413pjx.2
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ofROlvTu1E1hVbZ28WkGRDdjDewSdNfrPBGyLPdKxw=;
        b=eWcbSYm9Ou+SKpzFZH64hU1XB9AQL4hX8f/ozcFkxsFMVmKOVq6EYNCwo3pGkSFeau
         zJvkw5DumscbfX9AbV+Tk2Hvkczt6b+g0Q0SsXCmxg1bZYvJFvQFYEH6EdizEK4Qw6cH
         cWo/lMTvnKMK/wGicv28u4BiwaycKQ6qjFV7T8toBj/eN1VEqaU6kUlIM8rMuhXdmf19
         3ZV1t+2IsqixTsud2p62M9eHiMLU1FV0ozR12unNrQgfEBDItTm+/94DfSA16HElK31L
         hTmK37Llo0y0IpoUtZYk4a0MToXB2sjhRrX0PfcwDrIKCEvYis+/iwzsJH1doZgZU6Db
         1Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ofROlvTu1E1hVbZ28WkGRDdjDewSdNfrPBGyLPdKxw=;
        b=ge7VNiK4FvtjGYLM0hsi0BP2hkgQAM9WbcZMftMBa95qYIHmkhhhEDeATWCzzPUc6R
         kc/0dlxnmBcEMynVgRXkEUnOSlN1R2YYs010SYVAdJisNwqDSnlQsbaQpoN/LE3xPbHP
         ezAPQmI5fjypdKeu+MnHVgBKGKQHafxoSK9BSpBW32W5/eVu+E3xJLs6147WbJ8KQIEP
         6uv+jF3bsLwubga3T95X8tSjP9jQPj8ymx95UZr8Nkzyr9GnhRFR8j5RKh4obfC/Krvx
         8GAovij+KIIUSR8bhseIWojOBnCsDEbRI7llHk64Izb3ClqLW5K+RcSRJbp2X+BiB/Ck
         tU5w==
X-Gm-Message-State: AOAM531cRuiT+R6V+4i1ZzFcYltr7Pxw8kllbcu1RjfbvaJpYGJAJIYj
        cXkBDHT2zT+LJ54X+0NzMX82dJSn2ays4+NH0nEhDg==
X-Google-Smtp-Source: ABdhPJzUUsuFUyfYvCeCod2PWQHXawkudz0iKl+h2TTtZf4NEpXj88CuWJS1uiygyv78DjhoEMXXQ++n0FX+toPhwr4=
X-Received: by 2002:a17:902:a702:b029:12b:aa0f:d553 with SMTP id
 w2-20020a170902a702b029012baa0fd553mr5470508plq.3.1630428070408; Tue, 31 Aug
 2021 09:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210831151125.2401-1-roger@norberthealth.com> <3f26402b-00fd-1da3-0717-e2a6fc254060@infradead.org>
In-Reply-To: <3f26402b-00fd-1da3-0717-e2a6fc254060@infradead.org>
From:   Roger Knecht <roger@norberthealth.com>
Date:   Tue, 31 Aug 2021 18:40:59 +0200
Message-ID: <CAO_iFwoqbajgiKwQeNjTDWYPAjcnQWJFZM7EQLHadumtbJuBQQ@mail.gmail.com>
Subject: Re: [PATCH v4] Trivial comment fix for the CRC ITU-T polynom
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jiri Kosina <trivial@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Will do, thanks Randy!

Roger
