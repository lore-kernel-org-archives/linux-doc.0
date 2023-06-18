Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AE0EB64D8
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 16:10:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjFRQKG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Jun 2023 12:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjFRQKF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Jun 2023 12:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112901AB
        for <linux-doc@vger.kernel.org>; Sun, 18 Jun 2023 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687104558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w2INyO+y8xDXiMBhrjMvHN1J2A6ehB/rv2/0JiFPr5c=;
        b=Ks7B6qBNZmTwgxvXf5OKeymBY+uGt4YZJi0fStO7GYyytWJUcG9dFf0oef/Jy/LxULzyES
        RderjYsnfdBMxK1k4HlXKertoErEAtgJuoaygMOAmp5PwFTSoukEcx2QOlnndRnV0cVivT
        1+fSfP+azJIu+S7PGyBVw4seRg7Mn+c=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-P6Xx-VHFNjymKFId7rafyQ-1; Sun, 18 Jun 2023 12:09:16 -0400
X-MC-Unique: P6Xx-VHFNjymKFId7rafyQ-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-55e20391aadso1363102eaf.2
        for <linux-doc@vger.kernel.org>; Sun, 18 Jun 2023 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687104556; x=1689696556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2INyO+y8xDXiMBhrjMvHN1J2A6ehB/rv2/0JiFPr5c=;
        b=O5tEobuy+bnEtxJkqE1KbWSyn+yGkRXcDpqbCXtP012aIqoFB94c7NeYdbb7Vofif1
         TQDXob1Fd+RSLuN7ASSVjCSUB13SHIaFmyCrury7nD1XWKiR6cdhf95b6mUGetWM60FL
         5APjX/4G0QQ58y/8iwh10ENhyZIKygO6qvQJbv70OVFOUsSP+AK76kjxWk/HvSVhkhQX
         aXZ38vZ7xnWhKJDpa9bIbXzcT+DBowGBuX2Ny+qGCz80OYz1BEctVnNapjD2Yi11QWF6
         WaOkbrtOdLr8oe544RRIThSDn9NgyZPlPF/LZdSyAH3Ia6Lr1Y7C05aCxPR8lMjxZ3Aa
         Eypw==
X-Gm-Message-State: AC+VfDzWWuzsV3FljYup1Bhd5IN2gvjwPZz8HYzjACDEjoLU9MAnMxDh
        JcvWtOb6UMFhBZqJzOh0o14FuFMW7BYWTP4+eniR0U8s1B6TuKKRKdqUViQ6tPPPJWHdUmQt63L
        8xu4IV/GteC5biNEmEnTukIxJkjipXtcEonVATaZtF5Nf6bo=
X-Received: by 2002:a4a:a551:0:b0:558:b386:7a78 with SMTP id s17-20020a4aa551000000b00558b3867a78mr5064724oom.5.1687104556049;
        Sun, 18 Jun 2023 09:09:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qdlYRunIz+0lrWIGBkf2nmP2roOaQDa3a49rkAc6u+/xrdNaMJmxnVwol++Y4Uk/TyDPCixp2Z7ft29OIHFw=
X-Received: by 2002:a4a:a551:0:b0:558:b386:7a78 with SMTP id
 s17-20020a4aa551000000b00558b3867a78mr5064714oom.5.1687104555727; Sun, 18 Jun
 2023 09:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <87h6rhoyag.fsf@meer.lwn.net> <20230618062937.481280-1-costa.shul@redhat.com>
 <c0c44b35-b55d-6965-7103-76d9a9bf5c0d@infradead.org>
In-Reply-To: <c0c44b35-b55d-6965-7103-76d9a9bf5c0d@infradead.org>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Sun, 18 Jun 2023 19:09:04 +0300
Message-ID: <CADDUTFzBYtLbC5fGa7bA1LXXgNAEfHzueS9oO93r6WNtM2TYXw@mail.gmail.com>
Subject: Re: [PATCH v4] docs: consolidate storage interfaces
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 18 Jun 2023 at 18:20, Randy Dunlap <rdunlap@infradead.org> wrote:
> What does the TCM Virtual Device comment refer to?

TCM stands for Target Core Mod.
It is configured by CONFIG_TARGET_CORE.
The moved doc is https://docs.kernel.org/target/. Good example to not
name directories.
It says "TCM is another name for LIO, an in-kernel iSCSI target (server)."
LIO stands for Linux-IO: https://en.wikipedia.org/wiki/LIO_(SCSI_target)

Thank you.

