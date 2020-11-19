Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A116C56201
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 17:37:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 004692225E
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 17:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KqRYM6qv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgKSRhL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 12:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgKSRhK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 12:37:10 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AF3C0613D4
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 09:37:08 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id f11so9467483lfs.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 09:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWEVN098FpZJFcAmKY11I26ZadR0uReqN/JRZh6yv1g=;
        b=KqRYM6qvFzlj4whHg0wPUzefb/Tt/+dAVF70kktIo+tJZZh5X1F/kXlctUDU74ROhm
         ydrBhKXfT+AawsD7xzm48LfuqXJ0cGbrdZu7ibL6Rh/C60eTsOVtdcLOGlTSlgNECPSW
         DbXXj1j+AT2dxH3MRfRYkWW13fPRd1hqoxEsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWEVN098FpZJFcAmKY11I26ZadR0uReqN/JRZh6yv1g=;
        b=JrV3WvX1ZAPd61pAwBfuaAVUBBD13OULT6n6e8o1XAQnnqHOPkTiBOdJuSjGKU5Jz4
         zvrz0QETvGtcGHeRohIASB4BqFxCDFnmGZyDxrpiAbMRVWUwcZLWWgmHOmlSfBwx5DZk
         BEXeKeL4MVEzfBasEdS9YK2gliVYOiqKINKeu0sTs0PX2Lu44qH4TiX6wViIDT6yM4Es
         xImgE28Omq0K5geEH0f1tSPkMdyMYIHcZ1efFkZW3NrlxvEPV8ihueCTWa+EdM9Pmcxo
         ixK+NMs6geENrZW3lXwZGWI8HMs10OBRlAVocmVplZyH++bSGMSoSd/Eg7XizvYHhlWb
         eRog==
X-Gm-Message-State: AOAM532/M/V2SR3rZ0DAZR86oLMJUBfCJbY1rnjk9yt7dhmmSj9xSI+P
        wSgXQpAUThrUCy/aPuAUQ6dU+6FGf06oCw==
X-Google-Smtp-Source: ABdhPJxgU4i6tgL2FNeGiHiF7QCE6MZ6MlGwyHJcOh7bv3+kaIy1jCNXCrdVdcPcPqOWpcYxOcL+6g==
X-Received: by 2002:a19:bce:: with SMTP id 197mr7126238lfl.468.1605807426418;
        Thu, 19 Nov 2020 09:37:06 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id t6sm31199lfe.81.2020.11.19.09.37.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 09:37:03 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id z21so9401383lfe.12
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 09:37:03 -0800 (PST)
X-Received: by 2002:a19:7f55:: with SMTP id a82mr7079601lfd.603.1605807422828;
 Thu, 19 Nov 2020 09:37:02 -0800 (PST)
MIME-Version: 1.0
References: <160579629161.503380.9118263439060046721.stgit@devnote2>
In-Reply-To: <160579629161.503380.9118263439060046721.stgit@devnote2>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 19 Nov 2020 09:36:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi9RedSQoGF06dVs2mp7tBp4QoiW8+XZzNcDFJr3Zo5gg@mail.gmail.com>
Message-ID: <CAHk-=wi9RedSQoGF06dVs2mp7tBp4QoiW8+XZzNcDFJr3Zo5gg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] bootconfig: Use hexadecimal ASCII string for size
 and checksum
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Chen Yu <yu.c.chen@intel.com>,
        Chen Yu <yu.chen.surf@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 6:31 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Here is a seires of patches to change the bootconfig footer format
> to use 8-bytes hexadecimal ASCII string for size and checksum instead
> of u32.

Ugh.,

Just make it little-endian only.

The _worst_ thing to do is to make it some kind of "native-endian",
because then you have to deal with cross building issues etc.

But using a __le32 type and just doing "le32_to_cpu()" is trivial and
optimal - not just because everybody relevant is LE anyway, but simply
because even if you _aren't_ LE, an unconditional byte swap is better
than a conditional native access.

           Linus
