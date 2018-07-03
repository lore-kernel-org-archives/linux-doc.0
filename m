Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3CBE97DF93
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 19:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752775AbeGCTrs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 15:47:48 -0400
Received: from mail-yw0-f195.google.com ([209.85.161.195]:33042 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbeGCTrp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 15:47:45 -0400
Received: by mail-yw0-f195.google.com with SMTP id c135-v6so1129976ywa.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Jul 2018 12:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=KD+HOwwNalxBCmzQCfW128ExrNZBpJ3xfT+/mpHfl6k=;
        b=voXQjSqXK9rRqxY5QDljiYx6KSM4+Z1jJEWWHbaFy7KpGpTnPKxxmFR1ulCjgXt3WN
         ybep39sBZq6tuGVZTwsfCBkwEK3pNl9f9r/4/pDZKrRRRSkc+iP9Gq/dnCWBZZI9ovu4
         cLoxycM3Vf5HQpDaEuVOzBmEhhrAPX1HOu0JQKXOxJ8bOOC9LQiH2y+xpNRWuwmmzhjw
         k4w9wNL3gxri/kdigtIu9w7jT03Fxm90XEMqzDgqWFjKncxiFV9egx/qGsYts3hJ530N
         pfltw+SdNzGgDg0N5CTRRhJkgLY2VoOcPzSdjRc68dYDGZ29SvS+WudpAWcuZgFFvUeD
         K36w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=KD+HOwwNalxBCmzQCfW128ExrNZBpJ3xfT+/mpHfl6k=;
        b=Fgw9s55fIg9E1E78jWIsMWYkHAh65n1K0Zhx82o1O3MKSyCVXES2Izm4/y2QgZDn9n
         j6b+YmPTopgbH2dfXHqKqRZXfN5ASfb53fks+3BFac8DeKx5wj9SxG5W7FmBhaLYKtgi
         BLq/F/oIPYNbPtY5kG1nnSl3JQbuRFTDCzJZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=KD+HOwwNalxBCmzQCfW128ExrNZBpJ3xfT+/mpHfl6k=;
        b=nJTXX8VNSGqyp3Zeqfq4ai+fB1Qhj8hWuqTDjElG5QJlImwkw+B9KI4GOVCAyFHXM6
         4fNEThFdGrFFFZ1EVT1Ty1SwrJe8J22Jt2WQRw1qd/HWlZwJonnDmnD6oq93ovginheW
         p+C+W09BCKT5VaQaTI95s9ymsaoy99396lQtXwq0ajBnKPTK2xIsS5QP+AYjaTIz7n3N
         LuUO9TywpKVwudlBfvpWt6IdOq9m3t4QQFLFONo1rmNA/crO2ru1T9Az44kycsa1Kb+X
         JpNFomUQ93ALtfqoso5pzaDB82WAPWtZZrSLTnPcvLtE/3RdT2HPcHzImZcWSvPC8B4Z
         gpxA==
X-Gm-Message-State: APt69E10BrOEZ7vmRcd1p+v6BfFaDtQhrzEEutpdRpFRPcsrbcxsVjre
        ALW/DMz2QvVEQKs8SdHAxgF51R4IeipE+N33CZmxNwFs
X-Google-Smtp-Source: AAOMgpf4lXDwlLKY/66mqaY6XCkETlQ4eFKJCg7DmHnJVpMPrVBA+j/T48Ww72aGEgertMBKwPQJUVPioTcYo+sfKIY=
X-Received: by 2002:a81:39d7:: with SMTP id g206-v6mr8836541ywa.416.1530647265006;
 Tue, 03 Jul 2018 12:47:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:5f51:0:0:0:0:0 with HTTP; Tue, 3 Jul 2018 12:47:44 -0700 (PDT)
In-Reply-To: <20180703194354.21614-1-willy@infradead.org>
References: <20180703194354.21614-1-willy@infradead.org>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 3 Jul 2018 12:47:44 -0700
X-Google-Sender-Auth: Ghn_9WD_45oOKAM9O06_vNeAUAc
Message-ID: <CAGXu5jKN2HTno=1MfAug+pn0yf82tV-YAWURpx6v_xk7spc4mA@mail.gmail.com>
Subject: Re: [PATCH] reed_solomon: Fix kernel-doc
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 3, 2018 at 12:43 PM, Matthew Wilcox <willy@infradead.org> wrote:
> The current doc build warns:
> ./lib/reed_solomon/reed_solomon.c:287: WARNING: Unknown target name: "gfp".
>
> This is because it misinterprets the "GFP_" that is part of the
> description.  Change the description to avoid the problem.
>
> Signed-off-by: Matthew Wilcox <willy@infradead.org>

Acked-by: Kees Cook <keescook@chromium.org>

Jon can you take this?

-Kees

> ---
>  lib/reed_solomon/reed_solomon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/reed_solomon/reed_solomon.c b/lib/reed_solomon/reed_solomon.c
> index d8bb1a1eba72..e5fdc8b9e856 100644
> --- a/lib/reed_solomon/reed_solomon.c
> +++ b/lib/reed_solomon/reed_solomon.c
> @@ -283,7 +283,7 @@ static struct rs_control *init_rs_internal(int symsize, int gfpoly,
>   *             in index form
>   *  @prim:     primitive element to generate polynomial roots
>   *  @nroots:   RS code generator polynomial degree (number of roots)
> - *  @gfp:      GFP_ flags for allocations
> + *  @gfp:      Memory allocation flags.
>   */
>  struct rs_control *init_rs_gfp(int symsize, int gfpoly, int fcr, int prim,
>                                int nroots, gfp_t gfp)
> --
> 2.18.0
>



-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
