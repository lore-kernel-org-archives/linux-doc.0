Return-Path: <SRS0=kV/L=65=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5092BC433DF
	for <linux-doc@archiver.kernel.org>; Fri, 15 May 2020 19:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2821520709
	for <linux-doc@archiver.kernel.org>; Fri, 15 May 2020 19:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EQXfVFJ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgEOTkw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 May 2020 15:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726607AbgEOTkw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 15:40:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD658C05BD0A
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:40:51 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g9so3152690edw.10
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HHca1qoV7do/YHj6VhiHa0wv0gL1FKGrqV5m6xaYOco=;
        b=EQXfVFJ4yz515JshhnvlO7USDVNFwG69NR5tuhWjf7zaSGV2LSZOG/FpNAtUosLSnU
         9ts0wbGytpuSheRP3ZoyHaJVy+JsQ1Z1Cvaptopb1n0wqaABjBwhlg6Tv1gRZWEWU5N7
         Xf1NHtzI2/d6wc9/JoXFFotJC6AdETHGlu7ZPHF46mQb5LSagZDXg01u6m6RSJHqGCsX
         G8zguFhZtGVf+wbDNstxQsF4RSs6m0HY3WenqGd6CGw5+MyM67ss838sKv8JWxkfdLV5
         BSMpNrRreffqc91pQEzZgU61/CDkmb2Sw9K1pJvrh01opTu3O/0yWLHR5K/QMsJImlTO
         jHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HHca1qoV7do/YHj6VhiHa0wv0gL1FKGrqV5m6xaYOco=;
        b=rJ7HCZpaPTV49wvyXUQ3+YAyyLS4UIm/GYM07Xe8bTJqgO3KoGVSu7UEF6H49x3ezG
         oachE8ZUC+hbNx3Dk+EnmqbH1NnQBDD5L9B6qwoiySUyjUSikIxHYIMYel7/55mEYvy8
         N9Vat8noD5wRVl9PGYky5ikgNLiXDIfqKMqGlFXJ3c1qtuBDusdDDgIce/2yeY+FtEB7
         9Uiggjn7O0V+v5O85FiaeKQpqHfU4vCVX6kCgLunaujZTF489hmMMdrFXFO7Afa9ccK/
         FTxMTEnCiqQIjK5kIVwovCyO6T8g84CtAM/RM7qfmwSLWiikpErkpRXN1vFSlYwvDP4o
         17iQ==
X-Gm-Message-State: AOAM531uLZLUBaXMqpE3b/ExqPPwh33NA0toe92jZExLhxQbX6GeCg2q
        YFjqTOuDFb4kPqar3wC4ogGxUcsL2OLP0psnLiqUvA==
X-Google-Smtp-Source: ABdhPJy3hW9KN8C+0k3e1QtNg/q5jcxANsOo4JOf1UIs/QMiOLnU+PzMoJv7/O4icSIDCXxitbkF0rZPLnkBSitoNmc=
X-Received: by 2002:a05:6402:31b1:: with SMTP id dj17mr4543330edb.142.1589571650510;
 Fri, 15 May 2020 12:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org> <20200515184434.8470-6-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-6-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 15 May 2020 15:40:14 -0400
Message-ID: <CA+CK2bCbAb1EN6xa9a-DRfan6Cv3YgZgPJ1buwUaej7jBRv=Kg@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert dump_oops
To:     Kees Cook <keescook@chromium.org>
Cc:     Petr Mladek <pmladek@suse.com>, Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Benson Leung <bleung@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 pdata.dump_oops = dump_oops;
> +       /* If "max_reason" is set, its value has priority over "dump_oops". */
> +       if (ramoops_max_reason != -1)
> +               pdata.max_reason = ramoops_max_reason;

 (ramoops_max_reason >= 0) might make more sense here, we do not want
negative max_reason even if it was provided by the user.

Otherwise the series looks good.

Thank you,
Pasha
