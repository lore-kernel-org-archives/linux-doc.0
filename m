Return-Path: <SRS0=tsXf=5J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A5FC43331
	for <linux-doc@archiver.kernel.org>; Tue, 24 Mar 2020 16:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AE722076F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Mar 2020 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585069155;
	bh=wv7V6OA+vnQKUw2Y4zY+fl+UxUMw0in7d1nJHJs3HkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=L3i/738HbatCHCLTQrrHmj/fvUP2m13rwj5phzrzYg18qRfJFV1X60lNHEA6vkPC2
	 CPcriY39m+1wPB96HcOG+RuWNWAhwr5xFEnJdmKGeAWBXREZqAuudrz2WF9UmLwO9G
	 PKYTxaAue+I9jzefQoWYuxztE133JakyeO7GAj3I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgCXQ7O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Mar 2020 12:59:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46054 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCXQ7O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 12:59:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id u59so21489521edc.12
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WsR634IM9mmhNsoHiRslx4q1ur3OKG9sqLOfW3mTlvE=;
        b=Z4pJJsNRptNjfG3P3MoBuNrYlnzenPIYlkT2d80DcIZW7UeaJ7NzLHI1ja4yIjcDoc
         /iKfJJvm1iYP31UYLTqjCrBqL5Uar8necO8dCIgcOuI51Nj7AidT3P8YaYaCV6jUFzMJ
         fsKqZJnyfGhT7+0lEb4rByJaviH4S/tML+mT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WsR634IM9mmhNsoHiRslx4q1ur3OKG9sqLOfW3mTlvE=;
        b=K7zt+P8W2o4q3UP2qPL3fQtNFv/pFeWfrhMjwUhNIEbktc2uSH07stJZXXW6uUVIJx
         w/mqhsoqCRPM1HArBruaYSedtjU+RpRxFHp+ngNiRUHkTd6HY174a87v8URMjSadUjTV
         fZf9VnmwFXdu1qRdmKjZfPzedVjLs7WhpJtb9AdZRXrxYEXrXecNVtfzFLL0ZlLARB8n
         teHmRpZL3rrIOFdUXSkTNcClQC/1VI6Aq2h6iuIBt8DFLP31CU07FTwmpbpg+2sCBEdu
         SC61TTbhGpCmJRwW7kiB+J9GX+URZDmYouM359wH2QQZc0c1Pi1LLC1kYqv0BAZHR8TV
         XCag==
X-Gm-Message-State: ANhLgQ1LDJ2unbQMOL7cJFD1TbfQGJJAnhBD4+64zYdjw/ePXHNCMWcr
        eqg8blvTlTCLCZilp/L52EAPm6Mbnvw=
X-Google-Smtp-Source: ADFU+vuzxJtoajZ4ipx7eHcS4uQfHVM1EgUXQ0zle8CU1psZP9wY8XE8WMjv24Ze6BWMvueirWuygw==
X-Received: by 2002:a17:906:751:: with SMTP id z17mr7027730ejb.11.1585069152238;
        Tue, 24 Mar 2020 09:59:12 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id j10sm229681ejv.13.2020.03.24.09.59.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 09:59:12 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id e5so11558942edq.5
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 09:59:11 -0700 (PDT)
X-Received: by 2002:a05:6512:10cf:: with SMTP id k15mr17550349lfg.142.1585068727556;
 Tue, 24 Mar 2020 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Mar 2020 09:51:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjEi4VoT8qkBhrBtdZ27shyrPwo0ETpuOdxk5anHtQqhQ@mail.gmail.com>
Message-ID: <CAHk-=wjEi4VoT8qkBhrBtdZ27shyrPwo0ETpuOdxk5anHtQqhQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If it is OK to queue this up to Kbuild tree,
> I will send a pull request to Linus.

Looks fine to me, assuming we didn't now get some confusion due to
duplicate patches (I think Jason got his tree added to -next already).

And yeah, that end result looks much better.

             Linus
