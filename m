Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93D2C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 12 Oct 2022 18:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiJLSsd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Oct 2022 14:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiJLSsb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 14:48:31 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67C1C5892
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 11:48:30 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id i25-20020a4a8d99000000b0047fa712fc6dso11557159ook.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ESROyxdmNaMCuLAvwDxLztz/p3doaWu/k516wwQHrw=;
        b=TxUslp/5MFOT246DWlq1s20VNKGGSSTTxByLdcsEMJmdAKLTiDSE0c2Hq5L+HVw4JY
         W5kDSqOsorAPAC0AWFewpZG+wc6mkemgAROu3M43P7g+Nr+xOV2FWfEaSoXlwIz/0n0U
         SxfcCTSnFEGvvBl9RwIWsBnbuy5EkfYyyf6ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ESROyxdmNaMCuLAvwDxLztz/p3doaWu/k516wwQHrw=;
        b=7p/XxAkJ1C5j7f5L6pgzws7TWMPIHdkAb7d3qIb2aJJj9Htj1CPk1DtavdsCo4BtnY
         pOnJB4TCYLPh6uoUJgJVf+hJJmGxH2cUeepDPfvBr85jXBNP8kueMJuGCa6PDH3uzPte
         I7mGnvi0x+NuCC0M2MdbmUlgG74pBVimgaA7TMFCUaEsVqCgMoTsP0RGIy8ASyC4RNsG
         U8N1nd04NZNJWDjB2D7z62w6iszVC8uodSXxEr2DZLY/SFyflZ1tGQisGa8uBqkougtG
         j+HmK7SPkhJUneZJahgNfzPgKZS0iRaaq70VlSaxpfgIpKMHCDOY4C9KY2kcCP5KPaFz
         sXDg==
X-Gm-Message-State: ACrzQf2VJj9g+5ltSTSH6zoH8uieiaZnxokfemFo0euJoMZ1W81eoOLW
        vhVgzkQhZ9R7axHR08ldAzYuWW6Jc1Xpgw==
X-Google-Smtp-Source: AMsMyM6kFqH+aNVeLz2Nhc4P+l/hUdEZ1VAIscyc1ybztH6QBsS0QVxAuu/zhTP22QAi0FE0HJMaKg==
X-Received: by 2002:a9d:74d0:0:b0:661:b9f7:3c53 with SMTP id a16-20020a9d74d0000000b00661b9f73c53mr1665201otl.295.1665600508926;
        Wed, 12 Oct 2022 11:48:28 -0700 (PDT)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id w22-20020a9d6756000000b00661a38ebbdasm3176003otm.59.2022.10.12.11.48.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 11:48:27 -0700 (PDT)
Received: by mail-oo1-f50.google.com with SMTP id s125-20020a4a5183000000b0047fbaf2fcbcso10605263ooa.11
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 11:48:27 -0700 (PDT)
X-Received: by 2002:a4a:4e41:0:b0:480:8a3c:a797 with SMTP id
 r62-20020a4a4e41000000b004808a3ca797mr2985303ooa.71.1665600507237; Wed, 12
 Oct 2022 11:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221012181841.333325-1-masahiroy@kernel.org>
In-Reply-To: <20221012181841.333325-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 12 Oct 2022 11:48:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTCVWhFz1MK22hq9WNEmhKy2kpNerA3fyyBYzP7z8XWg@mail.gmail.com>
Message-ID: <CAHk-=whTCVWhFz1MK22hq9WNEmhKy2kpNerA3fyyBYzP7z8XWg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: raise minimum supported version of
 binutils to 2.25
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 12, 2022 at 11:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Bump the binutils version to 2.25, which was released one year before
> GCC 5.1.

Ack, sounds sane.

               Linus
