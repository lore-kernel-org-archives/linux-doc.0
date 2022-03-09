Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F5EC433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 01:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiCIBFU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiCIBFE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:05:04 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D4EAC929
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 16:42:50 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id s25so929638lji.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=T9Y8CKYiSW3hGc9HM0/MT5sFo5blD99UIhMWcRbFD5kggM3DUwxybXuISqMFUGIjrg
         mWQ74CDHtfn9kXLqt5VqIvjs1zPAj3pO65tEdbgr+OX1FrAEaiMiYghKLtQSRfh7w9WS
         TgKR2SZWDkmK6Hkv45V1e1kyBDZQ0M8AOrIp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYmupwL1NthFsF42+Fr0z4aIrhKGW9iSWfQCfyDDaEk=;
        b=uBB9ORTq6DPqqzQtSJIWz+yKi3I6xlWS4p8sH0fWNMb8Gxytsb9jNzvMKN6GnTILtu
         zIaXZVNn9zN32SqJTlfn5xAuwyP0AKU6SNcXMkcgpBX1/Sbg50wa7Oe+3cnPoJE9dUV+
         Vs7yeY86X1fDhH2Tk7946PHM7lYxXM+6NQWUFCNpD+BueF1lTWrbLnxWA2booVUKTAp7
         EG/KRiQgoqSJjBhMqm5s1QKs+7BDEV4MDO+IzfLC5z6LbtPryDpbOZcObsvOGYPe/wgD
         oU7qo2xro2rGIbyKKezzfgH3JZ3tIL1sh2A7/U14DPT8fmI1wqQsmKek3igk1Ou8e3XY
         bxrQ==
X-Gm-Message-State: AOAM530qQUrRdNTep8o3H4CQHoP6BT+zQjNv5eJoQRyopiLcyLeaGpQq
        2PYzsURy/F5NJJLeB+2P30s6X3T31ZUHuvaCm+4=
X-Google-Smtp-Source: ABdhPJz2XEykMLhmMUN6ozxvg3m1XH0XhomPSONGadtsygBNntZHZexqNmE49Iz8/Ejop+v5Z6SVjw==
X-Received: by 2002:a2e:864b:0:b0:248:321:f13a with SMTP id i11-20020a2e864b000000b002480321f13amr39933ljj.210.1646784570057;
        Tue, 08 Mar 2022 16:09:30 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id f4-20020a056512092400b004485164791csm43467lft.119.2022.03.08.16.09.27
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 16:09:28 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id u7so809597ljk.13
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:09:27 -0800 (PST)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr3400178lji.152.1646784567653; Tue, 08
 Mar 2022 16:09:27 -0800 (PST)
MIME-Version: 1.0
References: <20220308215615.14183-1-arnd@kernel.org>
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 16:09:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Message-ID: <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] [v4] Kbuild: std=gnu11 changes
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Alex Shi <alexs@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        David Sterba <dsterba@suse.com>,
        Marco Elver <elver@google.com>,
        Jani Nikula <jani.nikula@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 8, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I've incorporated the feedback from Masahiro Yamada in this
> version, splitting out one more patch, rebasing on top of
> the kbuild tree, and changing the order of the patches.
>
> Please apply to the kbuild tree.

I'd actually like to see this as a separate branch, so that I can
merge it early - or other peoples git branches end up depending on it.

Yeah, it shouldn't change anything on its own, but since it allows for
new syntax, we might have other things depending on it (I'm obviously
thinking of the list_for_each_entry() series that keeps getting
posted).

                      Linus
