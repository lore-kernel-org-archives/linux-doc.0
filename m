Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A242DC05027
	for <linux-doc@archiver.kernel.org>; Mon,  6 Feb 2023 11:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjBFLWc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Feb 2023 06:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjBFLWb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Feb 2023 06:22:31 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2D99ECB
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 03:22:30 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id g13so6957008ple.10
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 03:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TxhmEL2QKzuA2KnvKWZKNha852YtFmdnaDf+I/zJ96Y=;
        b=SS+vVwCoRiy0t41HnEbXrVayX3JOebYGLH6NycOBhTZQuqyZMvUHMvLGIRXNv6SZHt
         sE12LX9h0HOSPlcUpEHdG5PnpsWsZi3UEdodNvpVgFsLkrZG53o8Nd3aogv9zzi30QaG
         cmEBOD1FIw6Gx7D5ZYiVrPfwG+thPSy5NvQo5dfI+s395xCUUAD+pewsCQ64IePhh0A3
         VKMJrWlZNqGAjXkIfDkxoykfSMKiHdyHPECNL8zczHieOAlVAbowKBGp9HBYZp1YBKmr
         iCSB6+IB1iN/etVYHgTWs7j0zhP0gtM7EOTWuAJZaJXouE7sUT3zS5u5Es1qOTr0Tm6S
         mqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxhmEL2QKzuA2KnvKWZKNha852YtFmdnaDf+I/zJ96Y=;
        b=2V8p3Er6IzpZJ9nFfR61wrA4/aUS6yXfG0YbexhsMWXdG0VHeEYV1b57D12hIByGF2
         I2QSjUY0DT1fB0hjrnTmIbYk/pYr8lOrn7+lhaP1IraE5c0yCqTMRNQNmuIPRhwzQUhl
         tKPqz2As2cRBF52FfIZYd1t5hKwtWIjNAOKznW1odvA3mNh1o0wKoPRb0+41z92/ikVc
         fQK0DlKerXxCMnp9SQfP8GWmqBYNseRRjPMDohaxp/9LoRKnI7P7pMemAwQQFbI7O1Rq
         uc/z3MYLwloJv2pEQAiVYn6uX+P6DeUXSJeSWje/bBIBLE4kq4+7P5ChhWyl0/edbx3A
         CwKg==
X-Gm-Message-State: AO0yUKW1GcKaZxQGzPRzP0v52HqDu6eiNG/QkAHvy7n5oSNtF9CPuCTQ
        2qBlUfB9ydWm2oXtYlSd1IoP54obQO/kLJczdKxxSA==
X-Google-Smtp-Source: AK7set+/stD4n2SGB11esf3lDtXhChZtJl1NjgqiFWXur6tuX8MQg1Pj989cU0ecIXNUb/0RPh9o3Wb+lLNPVCquCEY=
X-Received: by 2002:a17:903:186:b0:199:985:a594 with SMTP id
 z6-20020a170903018600b001990985a594mr972000plg.6.1675682549425; Mon, 06 Feb
 2023 03:22:29 -0800 (PST)
MIME-Version: 1.0
References: <87bkmas5vc.fsf@meer.lwn.net>
In-Reply-To: <87bkmas5vc.fsf@meer.lwn.net>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Mon, 6 Feb 2023 16:52:18 +0530
Message-ID: <CAO2JNKUVHivGN558S17K-iKOEVjqQQ__6Yo=tOhuakuFHQKDcw@mail.gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 4, 2023 at 4:40 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Add a new sidebar template that creates a more RTD-like "fisheye" view of
> the current place in the document hierarchy.  It is far from ideal, but
> some readers may find it better for navigating through the documentation as
> a whole.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Sorry it took so long to get back to this...$EXCUSES plus trying to get
> ready for the merge window.
>
> This version includes the suggestions Akira sent around a couple of
> weeks ago.  I've also the sidebar TOC go one level deeper when
> appropriate.
>
> There's a bit of JavaScript that attempts to scroll the sidebar
> appropriately.  It's far from perfect but, hopefully an improvement.  It
> could be made better, but I've managed to remain blissfully ignorant of
> JavaScript over the years, so it's slow going.  It would sure be nice if
> somebody who is better at that stuff could jump in.
>
> I think the contents of the sidebar could be improved too, but that's
> probably a bigger job.
>
> As before, the results can be seen at:
>
>   https://static.lwn.net/kerneldoc/
>
> This probably isn't going to get a lot further before the merge window.
> So I ask: is this sufficiently better that it should go into 6.3?

Thank you very much, Jon. This version looks better than the previous one
and resolves the "Where am I?" problem. As David suggested, the font size
for the third-level nested heading in the sidebar should be increased;
otherwise, it
is good to go for 6.3.

Regards,
Sadiya



>
>  Documentation/conf.py                         |  5 +++--
>  Documentation/sphinx-static/custom.css        | 20 ++++++++++++++++++-
>  .../sphinx/templates/kernel-toc.html          | 11 ++++++++++
>  3 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/sphinx/templates/kernel-toc.html
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index d927737e3c10..6c8ccf3095ac 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -153,7 +153,7 @@ else:
>      math_renderer = 'mathjax'
>
>  # Add any paths that contain templates here, relative to this directory.
> -templates_path = ['_templates']
> +templates_path = ['sphinx/templates']
>
>  # The suffix(es) of source filenames.
>  # You can specify multiple suffix as a list of string:
> @@ -328,6 +328,7 @@ if  html_theme == 'alabaster':
>          'description': get_cline_version(),
>          'page_width': '65em',
>          'sidebar_width': '15em',
> +        'fixed_sidebar': 'true',
>          'font_size': 'inherit',
>          'font_family': 'serif',
>      }
> @@ -345,7 +346,7 @@ html_use_smartypants = False
>
>  # Custom sidebar templates, maps document names to template names.
>  # Note that the RTD theme ignores this
> -html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
> +html_sidebars = { '**': ['searchbox.html', 'kernel-toc.html', 'sourcelink.html']}
>
>  # about.html is available for alabaster theme. Add it at the front.
>  if html_theme == 'alabaster':
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 45a624fdcf2c..17cc0abeb0a7 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -11,7 +11,9 @@ div.body h3 { font-size: 130%; }
>  /* Tighten up the layout slightly */
>  div.body { padding: 0 15px 0 10px; }
>  div.sphinxsidebarwrapper { padding: 1em 0.4em; }
> -div.sphinxsidebar { font-size: inherit; }
> +div.sphinxsidebar { font-size: inherit;
> +                   max-height: 100%;
> +                   overflow-y: auto; }
>  /* Tweak document margins and don't force width */
>  div.document {
>      margin: 20px 10px 0 10px;
> @@ -27,3 +29,19 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
>  dl.function dt { margin-left: 10em; text-indent: -10em; }
>  dt.sig-object { font-size: larger; }
>  div.kernelindent { margin-left: 2em; margin-right: 4em; }
> +
> +/*
> + * Tweaks for our local TOC
> + */
> +div.kerneltoc li.toctree-l1 { font-size: smaller;
> +               text-indent: -1em;
> +               margin-left: 1em; }
> +div.kerneltoc li.current {font-weight: bold; }
> +div.kerneltoc li.toctree-l2,li.toctree-l3 { font-size: smaller;
> +               text-indent: -1em;
> +               margin-left: 2em;
> +               list-style-type: none;
> +             }
> +div.kerneltoc li.current ul { margin-left: 0; }
> +div.kerneltoc { background-color: #eeeeee; }
> +div.kerneltoc li.current ul { background-color: white; }
> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
> new file mode 100644
> index 000000000000..020a174a8139
> --- /dev/null
> +++ b/Documentation/sphinx/templates/kernel-toc.html
> @@ -0,0 +1,11 @@
> +{# Create a local TOC the kernel way #}
> +<p>
> +<h3>Contents</h3>
> +<div class="kerneltoc" id="kerneltoc">
> +{{ toctree(maxdepth=3) }}
> +</div>
> +{# hacky script to try to position the left column #}
> +<script type="text/javascript"> <!--
> +  var sbar = document.getElementsByClassName("sphinxsidebar")[0];
> +  sbar.scrollTop = document.getElementsByClassName("current")[0].offsetTop;
> +  --> </script>
> --
> 2.39.1
>
