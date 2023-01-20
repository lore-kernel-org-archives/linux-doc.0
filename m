Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1A0C05027
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 13:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjATNih (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjATNig (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 08:38:36 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529657DFBD
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 05:38:27 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so2093263pji.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7lZ52clzIBB19JtGzUd8hBIwpssmbB8jTWw9i1AWF4=;
        b=AeHhsVEPKyMF4ljmoYrz5v+EDIF7LJk+rYn0ZqzOc+G0QuT7GErK3l/d3db0UKnZCc
         uaMxeVCYAg+SO8Ysa+qmz5uKcOOXUuW2QJUm1zi+E+q4qYXk13WXvPmMTQjWwvhIpmjJ
         FkSxdVqdeA/Pf5d/wFKxRaBVepiMlHMiBkxMK00ZNUdVgCxxv5L5+ooTMsGVIsssjRWP
         RUThyFM/kW2GdemDG28FQR9gWE2eSG1309OCKhIcUrQUAU+cZ8v7xeBA1q8SabyIrhkK
         FRmZ5qufwLym4+fx+MxQdzOdM2ytPyI0TPUx0xyetqg6WIf/oiyPtxlPKlTphW6FA04V
         tcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7lZ52clzIBB19JtGzUd8hBIwpssmbB8jTWw9i1AWF4=;
        b=spi1Lb7Cvs7i+VHQXZ9oxtJwgvi6m7gXggMm5MIHVZ4Ow1qOlxKUgGM9iANXfy/mzE
         f9/6hfNn8rXeDtzJry9t3bvNreOZ7tMR6gKlOGBvJEhdYZ9PoZ8iceKS12hkxn+JfwMy
         Xi21Ym6wnZgImhpg5whcedokBYETFlUnVw3tRYGYcH8yWq9jp2B3SFxtUJ3wk5R/MxKd
         Lyi1jStGnqeA8IuNYgZgA74EbwGU57fdZrjQh4IAFOSwNU0IlCmQ22GEV843d1sjL8yC
         OpWlyOudkd/wNBjwqwpY6hoxpYJTMhmvi2zVz+G+9IyIwp+9JIUZXP+1+RJOvhC2/9/s
         SQlA==
X-Gm-Message-State: AFqh2krokxSb6wUKxnXU5w6fb8IoQRL1SIA2WWtx1KEtDIPGxToDxrDF
        Eb9bM0NwVtEkgZRsap7EpvT9Ch/rNKhSsEcQinrhYg==
X-Google-Smtp-Source: AMrXdXulYrdXeKlLIFXQ1MT95gMlSy54LY7dtlLThrIS/YW+C3taq3mJU6mF22miyTdiBBe9A/8ezDA2oLkHyFkOopQ=
X-Received: by 2002:a17:90a:1088:b0:229:df9f:9455 with SMTP id
 c8-20020a17090a108800b00229df9f9455mr835800pja.45.1674221906407; Fri, 20 Jan
 2023 05:38:26 -0800 (PST)
MIME-Version: 1.0
References: <87o7qu5al3.fsf@meer.lwn.net>
In-Reply-To: <87o7qu5al3.fsf@meer.lwn.net>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Fri, 20 Jan 2023 19:08:14 +0530
Message-ID: <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 20, 2023 at 5:41 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Add a new sidebar template that creates a more RTD-like "fisheye" view of
> the current place in the document hierarchy.  It is far from ideal, but
> some readers may find it better for navigating through the documentation as
> a whole.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
Thank you, Jon.

This is definitely an improvement as we are able to see the second
level headings in the
sidebar of the main page. But I would still prefer the "RTD" theme
kind of sidebar due to the
following reasons:
- This sidebar toc list is not bulleted and the same chapter name runs
into multiple lines making
   it trickier for the reader to click the exact chapter they are interested in.
   Perhaps this can be handled by increasing the width of the sidebar.
This will avoid the
   chapter headings to go to the next line.
- Comprehending "where am I" is difficult. When I use the table of
contents to navigate
  to any chapter, such as https://static.lwn.net/kerneldoc/dev-
tools/kunit/architecture.html,
  I'm unsure of where to go from here because it's difficult to find
this chapter's exact location
  in the table of contents. Is there a way to get the nested headings
in the sidebar until
  depth 3 and make it collapsible?

Regards,
Sadiya





> So this is just a first attempt to create a more crowded sidebar; the
> result is somewhat like what RTD does; I'm not hugely happy with it, but
> it's a start.
>
> I've put a copy of the rendered docs at:
>
>   https://static.lwn.net/kerneldoc/
>
> Thoughts?  Is this headed in the right direction?  This view of the TOC
> is readily available from Sphinx; if we want something else it's going
> to be rather more work.
>
>  Documentation/conf.py                          |  4 ++--
>  Documentation/sphinx-static/custom.css         | 16 ++++++++++++++++
>  Documentation/sphinx/templates/kernel-toc.html |  6 ++++++
>  3 files changed, 24 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/sphinx/templates/kernel-toc.html
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index d927737e3c10..233f2f585143 100644
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
> @@ -345,7 +345,7 @@ html_use_smartypants = False
>
>  # Custom sidebar templates, maps document names to template names.
>  # Note that the RTD theme ignores this
> -html_sidebars = { '**': ['searchbox.html', 'localtoc.html', 'sourcelink.html']}
> +html_sidebars = { '**': ['searchbox.html', 'kernel-toc.html', 'sourcelink.html']}
>
>  # about.html is available for alabaster theme. Add it at the front.
>  if html_theme == 'alabaster':
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 45a624fdcf2c..1ad0899bc8f1 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -27,3 +27,19 @@ dl.function, dl.struct, dl.enum { margin-top: 2em; background-color: #ecf0f3; }
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
> +div.kerneltoc li.toctree-l2 { font-size: smaller;
> +               text-indent: -1em;
> +               margin-left: 2em;
> +               list-style-type: none;
> +             }
> +div.kerneltoc li.current ul { margin-left: 0; }
> +div.kerneltoc { background-color: #eeeeee; }
> +div.kerneltoc li.current ul { background-color: white; }
> diff --git a/Documentation/sphinx/templates/kernel-toc.html b/Documentation/sphinx/templates/kernel-toc.html
> new file mode 100644
> index 000000000000..0d2fa3748437
> --- /dev/null
> +++ b/Documentation/sphinx/templates/kernel-toc.html
> @@ -0,0 +1,6 @@
> +{# Create a local TOC the kernel way #}
> +<p>
> +<h3>Contents</h3>
> +<div class="kerneltoc">
> +{{ toctree(maxdepth=2) }}
> +</div>
> --
> 2.39.0
>
