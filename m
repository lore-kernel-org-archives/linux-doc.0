Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43512C47247
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F2D82166E
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 21:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="DrKIrrdW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgD3VWN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 17:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726338AbgD3VWN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 17:22:13 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C40C035494
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 14:22:11 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id v26so6415743qto.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 14:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mv1U7YozJfnchal4lfvuT60duHRfjYBO+uZmYOeQypI=;
        b=DrKIrrdWt/QtIh54BbVwtdHACJ3lbs49nTlxebUUCaoR+47bYBQ/s4uvEGAbiFkB6F
         HmBMPXuWqqmCaHaEmtaRIxDRWhX0BWsQmUHAheQJfy/SeKcRSWvjuo6yRfkpwDUeZC6I
         Yh7rMhslY9sgpTbAPiOvZwi+w1gfYzvSMUay3JD/oFNp9QM2PMzRKAsc5/E1UivG/8KK
         74HbMo5ZgYHw3sN3kdxKHXJ3Xx/bh98ylG3my/XBpO6msDvM0vNYN3yeQfQiGw/obTYH
         9cKsSuw+10PZADEHyF2QMdAoaH9DNcM2/MSInKc+JIxZUz29BbUwT4Lp2sQ1hVRY/9Rv
         fBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mv1U7YozJfnchal4lfvuT60duHRfjYBO+uZmYOeQypI=;
        b=gUOv9mKoQo3fFY/L/d5e8y0pNLEp4Mz1bpQFZYajuMjxXCzzr20yKyD6g9bVzeSODa
         2Vvkw4SMOWnu2vaa25xwodfiZv1QfXnh7LpgL/HexzXdBK/gr9pPXO6uPZpTH0i0Fa7J
         iMBYOfJkqWBZVmlxadxhhtWFpAWVVXBRJ4K07l3F4j2xva0WrJ0ssZunPVJoE2N+TGXj
         SAKs4wrh96UNRKl7LuHhbJEmC6n/VxZ6Wyd/cIbWAS4ufw0a+crlBCUxS3kCD29ccNZr
         qCOUrYhR1GPasgP45f2Eq+sLhPhW5fVmd4V8J/VewWeyrSg6Tii7cWOcstV3GvkwC0AT
         fr4A==
X-Gm-Message-State: AGi0PubNj3rxhUbUrjYLkEosBXEFYSuoLK4xNpCIooBFwE4oBAzcsZuh
        iOiWLuOLjmB8FJrmeuHBKlfyJg==
X-Google-Smtp-Source: APiQypIQSsVNMioIQvXaPh5z2c/PTy/NnMZw0fklX9quel/4zViXOJ0hWUDelyHRVpwkeeL3yeIAJA==
X-Received: by 2002:ac8:7552:: with SMTP id b18mr532486qtr.312.1588281730917;
        Thu, 30 Apr 2020 14:22:10 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id m12sm829008qtu.42.2020.04.30.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 14:22:10 -0700 (PDT)
Message-ID: <e8a65498cfad063b011c342ae2a6b81bfd470e93.camel@massaru.org>
Subject: Re: [PATCH] Documentation: fix `make htmldocs ` warning
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, pbonzini@redhat.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Thu, 30 Apr 2020 18:22:07 -0300
In-Reply-To: <20200430150501.033bfa20@lwn.net>
References: <20200430205447.93458-1-vitor@massaru.org>
         <20200430150501.033bfa20@lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2020-04-30 at 15:05 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 17:54:47 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Fix 'make htmldocs' warning:
> > Documentation/virt/kvm/amd-memory-encryption.rst:76: WARNING:
> > Inline literal start-string without end-string.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/virt/kvm/amd-memory-encryption.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/virt/kvm/amd-memory-encryption.rst
> > b/Documentation/virt/kvm/amd-memory-encryption.rst
> > index c3129b9ba5cb..57c01f531e61 100644
> > --- a/Documentation/virt/kvm/amd-memory-encryption.rst
> > +++ b/Documentation/virt/kvm/amd-memory-encryption.rst
> > @@ -74,7 +74,7 @@ should point to a file descriptor that is opened
> > on the ``/dev/sev``
> >  device, if needed (see individual commands).
> >  
> >  On output, ``error`` is zero on success, or an error code.  Error
> > codes
> > -are defined in ``<linux/psp-dev.h>`.
> > +are defined in ``<linux/psp-dev.h>``.
> 
> This one, too, is already fixed in docs-next.  If you're doing
> documentation work, please work against that tree.
> 
> Also, "fix a warning" is almost never an appropriate subject line for
> any
> kernel patch.  You're not fixing a warning, you're fixing some broken
> RST
> in the file.  The subject line on the patch I merged fixing this
> problem
> reads:
> 
> 	docs: virt/kvm: close inline string literal
> 
> ...which describes what is really going on.

Sorry. Thanks by the review.

> 
> Thanks,
> 
> jon

