Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC825C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 06:47:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF364613B6
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 06:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhEKGsW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 02:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhEKGsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 02:48:22 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587ECC061574
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 23:47:16 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id i13so15482681pfu.2
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RKqT/nwQ71pQaiS5URJvwL3GDyJXDoQWd8//qAZw3IU=;
        b=O1FlW1b3CgJHHbcyfgpMurik8kqLcahiM0Y8CsscnVKCV9IG5eKw4owrQwl4Il3XcM
         jRYTeukqfpHgaFjTVlZJct2PT/ZEpovEK+v6XnNzpYeY2m49x6JC11l2ZuAvB5DA1lEH
         nLI2oVaS3WBok/nI9u8vqsUtFp3ZPPu1DiXpr4cP3+dSPx1++FKuE6Oy3iRM0qPs2SC9
         L8JiN7qkW48CDXeYQqgMjMlfQDplSfYLyBAP2dwf7SDxooHXXfsAA3MkIVN00FI46Kmn
         baWq9bZdMbHTAOBmmDsJqqQVJsYWFzoOEyQvZ8m6S8D8Ex/qd8J6oMV8Su84Giy7uvwV
         I9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RKqT/nwQ71pQaiS5URJvwL3GDyJXDoQWd8//qAZw3IU=;
        b=c9wKmlosuqPggaRLiYNnKD1cNJHzZhTg9ul0+Uag1yAk6afxCBobTJaj1kM9CrpXIm
         /BZHpLSC6u7LTAk6ug33uStOwOtqQQ7u3DWK21NTrbwLPpvCxBW5k+7htHO1d+F6Pnpb
         vZ8nAtpbcI9uVN8bCHtGqpeowHSH44nja2QdvZWLM+1XhfAfpaJeiSt4VLmbgVtaYJpO
         jmWtks6oq9atM75jkbfx105n1oMu4owlKv3LrXEeSdxsArWFR3v4kQ9KMDiSQt50MQU4
         leNwGOE6mgvdOeLV0E14R+6pb2Pfj548mVLV5gySUqcZjf7T22fT5Qie2swDJCGYGmuy
         svfQ==
X-Gm-Message-State: AOAM533c6UzM7TZjGsjeU+q8VtYSBVNgC45Es6bFmuN3X3vcIlU18gF4
        d77B+PyJVD7mawhdrjJ31Wd9N7zo8RpkU2I/JsA=
X-Google-Smtp-Source: ABdhPJwbb9WVAOYFu12viEeJ0jwvl9PLs88NDZUZTlwVJ17pwrpEkpRyjRRtLVG6UrqAD1OY18DmkpJOQWGpcF1rxMM=
X-Received: by 2002:a63:eb47:: with SMTP id b7mr2522771pgk.227.1620715635961;
 Mon, 10 May 2021 23:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210509150735.GA30084@bobwxc.top> <CAMU9jJpLiReRqkQFnQiNfciO_zdBSrVnFRbZiHd8PzQ+Wt9rNQ@mail.gmail.com>
 <20210511052244.GA317@bobwxc.top>
In-Reply-To: <20210511052244.GA317@bobwxc.top>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Tue, 11 May 2021 14:47:05 +0800
Message-ID: <CAMU9jJp0Z2XaG3rVGPXmJRuR2nk-1_MDvFh-fgBKddCRXEuvwg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: sync reporting-issues.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

PiDpnIDopoHlsIbpl67popjmupDlpLTnmoTooaXkuIHnmoTkvZzogIUNCj4g6ZyA6KaB5bCG5a+8
6Ie06Zeu6aKY55qE6KGl5LiB55qE5L2c6ICFDQo+IOmcgOimgeWwhuKAnOe9qumtgeeluOmmluKA
neeahOS9nOiAhQ0KPg0KPiBXaGljaCBpcyBiZXN0IGluIHRoZSB0aHJlZT8gOykNCkkgdGhpbmsg
IumcgOimgeWwhuKAnOe9qumtgeeluOmmluKAneeahOS9nOiAhSIgaXMgYmV0dGVyLiA+XzwNCg0K
VGhhbmtzLA0KWWFudGVuZw0K
