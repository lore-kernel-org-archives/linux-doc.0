Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE68C05027
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 03:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbjBJDLk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Feb 2023 22:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjBJDLf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 22:11:35 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657616D8DE
        for <linux-doc@vger.kernel.org>; Thu,  9 Feb 2023 19:11:34 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id pj3so3972188pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Feb 2023 19:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FEPn77ESYIWVktoaQnjTNLNeGuggpLVq+3vwGPbB35I=;
        b=A9FhsYH5L9tlz7FGuENUr6v6DJ0Pdfx0p7iGzjX7R0Gna8ecK/roT9qmulSbi7gtAP
         NFz5I4oDjDOja9RTbcpD3MHImxBZEqfY+8Fz29y+qsrKB9Aig5hPcVIdUfVwXLrA3rGI
         qxva/GfbPyuJv9NGnQK/PjyV1Ff1bCo8hEwtlKPHrDeCw9QR4caJAiIhy75PdoqFIpQe
         +6QqRf3HSj2PriO5ZROjJxdlQA+0r7kBHwjdxTMai9rCBvUzyXntT/bOILRwdi7yKxme
         Jzn7BySHor7oQpPVdy4ldxsRITrjqwOl+rat9pbnxnS7aT7uL4arNvOuN0WFESEn/UpM
         57cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEPn77ESYIWVktoaQnjTNLNeGuggpLVq+3vwGPbB35I=;
        b=5iVR+Qe0Bs1YEB16iOIyM1svUKddN6/Dp96xWXY7MwfDfBC3U9PW1kXGYOZ56OonMh
         GnKBXaXOPhZSdjxU1fYz/lEA31usk8DapmspG1kn1f0+tvaDPdQYYjDgLIEmnZYyUeC/
         ZZd/Q0tte47AomKNl3ydj3iYsrCXeSlrm31Myo+y5EDlXg8UchoSP1WKoOIS83uBrGX5
         bpXdc4VHHptkwUXwBWYSzLuJ3abUADXft5A4r6YdxHw5KBNqGpq+Bp3yqYsuREQFBB4g
         XozurCj0WAqlLphxP1Zaofjixm9FqbWJvcPLPAE1BPCr0Pl2ngjkPX12fuKCFdz1QAeD
         OvXw==
X-Gm-Message-State: AO0yUKV1JuYp5pq2cjCHkCTl7PeukdESWpciroM/eh7isR1wn+oRIUkP
        Q3RRrwKmWA5gJxGDF4oyzlKd/5b1c7lpMxgts6QHJg==
X-Google-Smtp-Source: AK7set8yU/MGjwR5qOqf8Qi9y4vdL6GPFCeUOpzJJalKny4BBIVqfXxBCIAWk5G1Ff/1zqzNpZO5lS8b3LZGWqlStzI=
X-Received: by 2002:a17:90a:c70e:b0:230:aa66:1e7c with SMTP id
 o14-20020a17090ac70e00b00230aa661e7cmr2118157pjt.19.1675998693612; Thu, 09
 Feb 2023 19:11:33 -0800 (PST)
MIME-Version: 1.0
References: <87h6vyr3r9.fsf@meer.lwn.net>
In-Reply-To: <87h6vyr3r9.fsf@meer.lwn.net>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Fri, 10 Feb 2023 08:41:22 +0530
Message-ID: <CAO2JNKUD-X-=ye5e+EQ2aJ+vQU6iuMR4++cqXOgZYA5kbqWSag@mail.gmail.com>
Subject: Re: [PATCH v3] docs: improve the HTML sidebar/TOC
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 7, 2023 at 1:00 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Add a new sidebar template that creates a more RTD-like "fisheye" view of
> the current place in the document hierarchy.  It is far from ideal, but
> some readers may find it better for navigating through the documentation as
> a whole.
>
> Add some CSS trickery as well to make the table of contents less intrusive
> when viewing the pages on a small screen.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
> Changes this time are almost entirely in the small-screen view; I've
> added some CSS trickery to hide the TOC by default so it doesn't get
> between readers and what they actually want to see.  I'm sure it could
> be done more elegantly, but my fluency with CSS ... does not afford much
> elegance ...
>
> Once again, the results are at:
>
>   https://static.lwn.net/kerneldoc/
>
> This is as far as this work is likely to get before the merge window; in
> the absence of screams, I'll drop it into linux-next in the near future.

Thanks Jon! This looks fine to me. Although the font size in the nested
headings could be increased slightly. But for the time being, this is
sufficient.

Reviewed-by: Sadiya Kazi <sadiyakazi@google.com>

Regards,
Sadiya Kazi
>
>  Documentation/conf.py                         |  5 +-
>  Documentation/sphinx-static/custom.css        | 48 ++++++++++++++++++-
>  .../sphinx/templates/kernel-toc.html          | 15 ++++++
>  3 files changed, 65 insertions(+), 3 deletions(-)
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
> index 45a624fdcf2c..539577ac9baa 100644
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
> @@ -27,3 +29,47 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
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
> +div.kerneltoc li.current > a {font-weight: bold; }
> +div.kerneltoc li.toctree-l2,li.toctree-l3 { font-size: smaller;
> +               text-indent: -1em;
> +               margin-left: 2em;
> +               list-style-type: none;
> +             }
> +div.kerneltoc li.current ul { margin-left: 0; }
> +div.kerneltoc { background-color: #eeeeee; }
> +div.kerneltoc li.current ul { background-color: white; }
> +
> +/*
> + * The CSS magic to toggle the contents on small screens.
> + */
> +label.kernel-toc-title { display: none; }
> +label.kernel-toc-title:after {
> +    content: "[Hide]";
> +}
> +input[type=checkbox]:checked ~ label.kernel-toc-title:after {
> +    content: "[Show]";
> +}
> +/* Hide the toggle on large screens */
> +input.kernel-toc-toggle { display: none; }
> +
> +/*
> + * Show and implement the toggle on small screens.
> + * The 875px width seems to be wired into alabaster.
> + */
> +@media screen and (max-width: 875px) {
> +    label.kernel-toc-title { display: inline;
> +                            font-weight: bold;
> +                            font-size: larger; }
> +    input[type=checkbox]:checked ~ div.kerneltoc {
> +       display: none;
> +    }
> +    h3.kernel-toc-contents { display: inline; }
> +    div.kerneltoc a { color: black; }
> +}
> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
> new file mode 100644
> index 000000000000..b124f6cfa558
> --- /dev/null
> +++ b/Documentation/sphinx/templates/kernel-toc.html
> @@ -0,0 +1,15 @@
> +{# Create a local TOC the kernel way #}
> +<p>
> +<h3 class="kernel-toc-contents">Contents</h3>
> +<input type="checkbox" class="kernel-toc-toggle" id = "kernel-toc-toggle" checked>
> +<label class="kernel-toc-title" for="kernel-toc-toggle"></label>
> +
> +<div class="kerneltoc" id="kerneltoc">
> +{{ toctree(maxdepth=3) }}
> +</div>
> +{# hacky script to try to position the left column #}
> +<script type="text/javascript"> <!--
> +  var sbar = document.getElementsByClassName("sphinxsidebar")[0];
> +  let currents = document.getElementsByClassName("current")
> +  sbar.scrollTop = currents[currents.length - 1].offsetTop;
> +  --> </script>
> --
> 2.39.1
>
