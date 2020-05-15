Return-Path: <SRS0=kV/L=65=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF471C433E2
	for <linux-doc@archiver.kernel.org>; Fri, 15 May 2020 19:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C301C2073E
	for <linux-doc@archiver.kernel.org>; Fri, 15 May 2020 19:18:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DYjN1UQ+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgEOTSD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 May 2020 15:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726223AbgEOTSB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 May 2020 15:18:01 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB67C05BD0A
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:17:59 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id r7so3098214edo.11
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2020 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zbFsGFMIlvy1kKOGqgavt+ubA29TnTVOTBRv6vIQjH0=;
        b=DYjN1UQ+2UifVP6w0ZHdAS+uaK/GP/9FOFhOPYeVr635TTaqdqu+hbJhqccicAI5lx
         Cbo4FdRrTW0jq/ekvklHVpsOkZBAOYDwp+KcZCiioXOsJ7nN1THWpRDJ8kkCV5qWtm0g
         AF/+1417vIKTX3DYRaoeOUt3wKN4+Ft836iqIjoOgl+X6UJGNj2GLPekJh8DuKYjf3UE
         AXjUmpSfyNeiq8S37ot0NrUeGh3+vXZJaYGwsPNrz9mVCSVhK6B96CRah6XKUOsEhypz
         ryKvBFjGDOrNVUKj4PYHDUpHNw82luHfzbGnyDdIGkha6PdBAja9wmcuYdT0B/+oY+TA
         MbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zbFsGFMIlvy1kKOGqgavt+ubA29TnTVOTBRv6vIQjH0=;
        b=ch87JDDD0phQnxorHqdnuREOqHX3GGCrQI2lRGa6v2geFPVVb76MKTvIlH6KSFcntK
         EREJbFXlrIr2woW8mxabQ3zhgBiu3hdSwJsHzv7FV+TRBJp3W7sJA+hlP8oPopxKj/ZU
         uWyeiKYZJEy0WG5JtMVVxaLVa/x0cmCmc4r0wEM8byxyQYWRGRYzWLh+fO1YvSMu/Ylu
         HvxkUhQLMS2tDNanqtdnLR5JiNq1URqu+f7El/0l7J7qeyq4qMSMj36nhSAa3ixAKJSR
         hkNmwbYb71Onl8FRXc0V8tzqswO1Hr/jtEkH/XzyEDw0j1HNKTHemqe/bHgXLLd1CZMQ
         eugA==
X-Gm-Message-State: AOAM531ncCaM+ibzlw3JmVHAHeK2bezIl62k7A+QwS74UIv7ZY5z34PU
        cZfjvJ+EH27grHX8Er28lAVrpOTygztP4gk63WPWsQ==
X-Google-Smtp-Source: ABdhPJz0Ek3DDmLsyu6vepzg7IcDPqIXlEvChPtaCxV8HF3LZLhlke8gwyZn2f1RjvDzPYken2umNdX2JOgQpllNx+E=
X-Received: by 2002:a50:ee04:: with SMTP id g4mr4273534eds.221.1589570278060;
 Fri, 15 May 2020 12:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org> <20200515184434.8470-2-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-2-keescook@chromium.org>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 15 May 2020 15:17:22 -0400
Message-ID: <CA+CK2bBV2vT-4NCsBnbuKM7YtDM=y9tV3mOcb+Mh+mW=YxF5Lg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] printk: Collapse shutdown types into a single dump reason
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

On Fri, May 15, 2020 at 2:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> To turn the KMSG_DUMP_* reasons into a more ordered list, collapse
> the redundant KMSG_DUMP_(RESTART|HALT|POWEROFF) reasons into
> KMSG_DUMP_SHUTDOWN. The current users already don't meaningfully
> distinguish between them, so there's no need to, as discussed here:
> https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Maybe it makes sense to mention in the commit log that for all three
merged cases there is a pr_emerg() message logged right before the
kmsg_dump(), thus the reason is distinguishable from the dmesg log
itself.

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
