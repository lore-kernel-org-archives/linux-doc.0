Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F0217D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 18:11:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfDVSLB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 14:11:01 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42378 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbfDVSLB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 14:11:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id w23so9614738lfc.9
        for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2019 11:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXcU2rwgvZNUrY/itsQwdIy2L1lPb6tI46vmzKGhR7A=;
        b=tj7tFwRHkoz7pjmoWjo3SMm0XDlteq238wWuL6ybJvcZrsL2JxJx2ZgWmSLn87CZaz
         3H9UMN9Vl+EtCEoBnHNDHmKqQu/kM+RDgBqSjUVbPiz3cRoziivzTkzgQ4yI7VxlAdEG
         z+hlqrR4xJpGsf8cLtXEHPnnOmIESFfziCIA53F9ODKsp8nKGME4m7xGR0xtaqIz5fVa
         N1r8IKclGB9PtRt2chuWfiVxo3GoN7jdHO2AXTCaAGfFL2VT6NU9NdnPVATly+Ai5x0p
         hYa0uvK6LBrsARi+w9cDmpI7t9dulKi/5unVNe4MBSDajRLPAPEKbimUzln15UcWTYGK
         GBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXcU2rwgvZNUrY/itsQwdIy2L1lPb6tI46vmzKGhR7A=;
        b=Y7rXUxOlzZ4mZ3uVwIRwBtSFEuLpIsp6nhJOUqmMS5T5BQp75YvczAlpyCoBp48iog
         XFnh5qTXVuuL9Q2KN1cl0UqD3u8Dg+cLNokh1NWiN8Vz98TpCkeTR/XAGmR/mOoPU1Pv
         ZcJEz3mA/YkMM58/VvrrAiZeYsJ6xoiv2j1sNUWfUAAND4AgqyaWwRuLGI03kgK12M/n
         0tR4FpNkgDAIUu/r8R+c/09uTSBoVv3gnT5Qw3dle8YkuXv0Ntg/cc5Z/v8VD9zK027F
         mHewBPopCuwH3pUwr7OvRaxzz6d3Gc1kIquTuUCSrW3CMZnu2CkpkqpJVadWJDhfv9or
         zEUA==
X-Gm-Message-State: APjAAAUZLvN4Axc8PRuI3CbAvGZt889LRn+pofkZT00kBJulr/r3oSoe
        fecFpkFg2vwvTEk8uStg1hxkxc6q+zKkQrRIXcyu
X-Google-Smtp-Source: APXvYqyFxh/7LRh2OUs07TaeIwkLdmUFOzPywD7hyxv8By/XR7oy9MGpTc3jNJvUlnYKg+aAZN4R8oJKU3Cyeok7DUc=
X-Received: by 2002:ac2:4119:: with SMTP id b25mr11052807lfi.72.1555956658518;
 Mon, 22 Apr 2019 11:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1555938375.git.mchehab+samsung@kernel.org> <72133d276dd8cde2d1ee8528b4e87ab2a614cbd0.1555938376.git.mchehab+samsung@kernel.org>
In-Reply-To: <72133d276dd8cde2d1ee8528b4e87ab2a614cbd0.1555938376.git.mchehab+samsung@kernel.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 22 Apr 2019 14:10:47 -0400
Message-ID: <CAHC9VhT7_vu1TeSWSFAJprf2iCgyHRYLpfpBvR48Yc40XefUcw@mail.gmail.com>
Subject: Re: [PATCH v2 23/79] docs: netlabel: convert docs to ReST and rename
 to *.rst
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        netdev@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 22, 2019 at 9:28 AM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Convert netlabel documentation to ReST.
>
> This was trivial: just add proper title markups.
>
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  .../{cipso_ipv4.txt => cipso_ipv4.rst}        | 19 +++++++++++------
>  Documentation/netlabel/draft_ietf.rst         |  5 +++++
>  Documentation/netlabel/index.rst              | 21 +++++++++++++++++++
>  .../{introduction.txt => introduction.rst}    | 16 +++++++++-----
>  .../{lsm_interface.txt => lsm_interface.rst}  | 16 +++++++++-----
>  5 files changed, 61 insertions(+), 16 deletions(-)
>  rename Documentation/netlabel/{cipso_ipv4.txt => cipso_ipv4.rst} (87%)
>  create mode 100644 Documentation/netlabel/draft_ietf.rst
>  create mode 100644 Documentation/netlabel/index.rst
>  rename Documentation/netlabel/{introduction.txt => introduction.rst} (91%)
>  rename Documentation/netlabel/{lsm_interface.txt => lsm_interface.rst} (88%)

Still looks fine to me.  I should go through these docs again to make
sure they are current (the old email address definitely is a bad
sign).

Acked-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com
