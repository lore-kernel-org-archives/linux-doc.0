Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC6DC7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Aug 2019 15:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbfHSPqZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Aug 2019 11:46:25 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37527 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727970AbfHSPqZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Aug 2019 11:46:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id 129so1391138pfa.4
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2019 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yBo5l6Hb3i4HlgUMt0iRUlNpHTn17B/raGae53BLtlo=;
        b=g1nXlHoCW7Y2bR1cRffuS4BNOtNrOe4CRBULxbwa13Z2T1F/a5TXCs/ygYuh3oJpQ6
         iP9w/DB2iE5KseeaCoduO9chHspnlj7HeAyriaYqmf10ipcW7mCi/0Eo8NM8dvhRD/Hx
         Os8in9EMk2OfaRBYl2cEpm5IXC3V7vGcD33PouZWEjieE1Pj+je2Nn7CaFF5BZvonZEg
         u/VzJS+Hh/sdPpYsAqxeVCaiJsfiwPNG/PICBeFKxv0wfCAXdG6WShSIhktx1rp96BE0
         +xWyt40ufdMRvdwQUi3opN+XtIpHJ8cXudqQeN1u2+KGLLvmxDa1RGlF7itwhCQRAOWu
         FM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yBo5l6Hb3i4HlgUMt0iRUlNpHTn17B/raGae53BLtlo=;
        b=KdGljJaqKJcNBrrPUGlUK3QhqCMrpVpEuAf1hY6mWIfqov5nI1T30ozbK2ucS81xwO
         QWFIbgGlMdKhzIK/EYc2x1CSlcW9rkQ6hkSRKayqRiDiTTogVhV/ukJLJ3F63rrqZA5+
         CyVkk+DD38MXx9ECFS8Ew8gKoj5mdHZ+7M+X3jhZao6L54iE3DCCh4MY14lGmoJM/N+C
         9mgnEp08FXIlTZmD3tIzcI7KfaYHoSxZf4X3duwxnTSba63IcTW69+d0eoDJ+0Dv3VAg
         lgzGofGJG7bueHwahz3YsodZgY18OSYLrF0gnrfCEeSa/l/W7aO+3OyVjzX7ic2s+Y+N
         HwCA==
X-Gm-Message-State: APjAAAXPGPENZRSGf6su5vHAw108tfpDEGD4QqTdZNecQUwWM+xf7tCW
        rAVPC0BjBgwFQma3pToVf1qWNjoAvZ6u1uMkik97Zw==
X-Google-Smtp-Source: APXvYqwspcK95c1b7EzpNDYbzikjHPsqF9/mQX2RFrao6OHlpeBL0OGlH5Hg7JHZ2diW7v8MOGMj1LGIgGpYj/VFqkM=
X-Received: by 2002:a63:c442:: with SMTP id m2mr62735pgg.286.1566229583644;
 Mon, 19 Aug 2019 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190815154403.16473-1-catalin.marinas@arm.com> <20190815154403.16473-3-catalin.marinas@arm.com>
In-Reply-To: <20190815154403.16473-3-catalin.marinas@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 17:46:12 +0200
Message-ID: <CAAeHK+w7Y=UgwTyjyVt6bBSi=DZROkMaz1B6-0BefK3AjSPpYw@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] arm64: Tighten the PR_{SET,GET}_TAGGED_ADDR_CTRL
 prctl() unused arguments
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Szabolcs Nagy <szabolcs.nagy@arm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Dave P Martin <Dave.Martin@arm.com>,
        Dave Hansen <dave.hansen@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 15, 2019 at 5:44 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> Require that arg{3,4,5} of the PR_{SET,GET}_TAGGED_ADDR_CTRL prctl and
> arg2 of the PR_GET_TAGGED_ADDR_CTRL prctl() are zero rather than ignored
> for future extensions.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

Acked-by: Andrey Konovalov <andreyknvl@google.com>

> ---
>  kernel/sys.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index c6c4d5358bd3..ec48396b4943 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2499,9 +2499,13 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>                 error = PAC_RESET_KEYS(me, arg2);
>                 break;
>         case PR_SET_TAGGED_ADDR_CTRL:
> +               if (arg3 || arg4 || arg5)
> +                       return -EINVAL;
>                 error = SET_TAGGED_ADDR_CTRL(arg2);
>                 break;
>         case PR_GET_TAGGED_ADDR_CTRL:
> +               if (arg2 || arg3 || arg4 || arg5)
> +                       return -EINVAL;
>                 error = GET_TAGGED_ADDR_CTRL();
>                 break;
>         default:
