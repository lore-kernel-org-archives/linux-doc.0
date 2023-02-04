Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5B0C636CD
	for <linux-doc@archiver.kernel.org>; Sat,  4 Feb 2023 04:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjBDEgs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Feb 2023 23:36:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBDEgr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Feb 2023 23:36:47 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C7B4ED1E
        for <linux-doc@vger.kernel.org>; Fri,  3 Feb 2023 20:36:45 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o18so6258764wrj.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Feb 2023 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6e1hBq0umfhQ+gZFNCvX3JbBjuw9mBFfAUfbkKtEYsc=;
        b=H9pItRNoi9M57ZXMG1yP52w+feP7EwHhzJDtkdg1VTCG0scJJPZQCHBZRWvcBdL6P5
         7TPfSz8mppQyJYt+p6HLBh6uiuY1ZRn0yNIcg0UQIxRAUJO7auyt+x7OhkGhnFXmEVHv
         fm+xfl7FXB+9eavjpRs+RiUR9rHV3ICTYggJmUr9E+pE6aouxdXMxDQFRAARqiF65ze8
         krMckYwDSbYGJFbCq8P3FMJCYk0Io2rkfVzuSuIa0C6FGzKfGKCordQe4Gj+PTtrlvva
         2B0c8msVkqPcnNysNoO1W5iiRrnH9zITgVJlVdmkPhVCF+BDh6SONHYqA0LnXqJFE5eQ
         45JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6e1hBq0umfhQ+gZFNCvX3JbBjuw9mBFfAUfbkKtEYsc=;
        b=u1uC5iSXWoCVx2dDbxz97Y8YrtoUJ7eMTIllM3l+IQdBnsuSr2vkKOuDq2iO+xJ6u2
         oZwjuk2ICApxwR6j6ffL9shocVWQQ0x2pWSvT80xhST+LbwlnVkajaqDfUiQGKptHbGd
         NGmS1pmTecSufMwflz5SG41ampJnBC7RPBb7CjgkgFnBouJfWK6h0/W5DBlPaPXN94gv
         cqVrCtOfjgUZSMRUVEUEI1tsjKk13rdfEVgxd2ZeW6TgR4accAdGKvOvJ8I0xTVOrjrJ
         KENQznAQLKYIWSzO75SwCVzgYCqNt6vtxaMnPOtNc9idSoWb9hNN3uAoDYJbY2iKq1qQ
         xLqg==
X-Gm-Message-State: AO0yUKWEXExcFtEuVCxclXzSFMNL+Sk58FrzY5ioXNW8bMSHIvoa30D1
        zx8qrYRwWPt4EhUw9GQddlU6lw8ZAhgl2MDaqcmI1g==
X-Google-Smtp-Source: AK7set9GlqJrJlR3yMUv0aWhMFozpYOoXSrk+rZoCMxuAWVp8GucAI28eMqlLHOpH2G5BsNHT99JGeAenCG7N4GsOV4=
X-Received: by 2002:a05:6000:1b08:b0:2c3:cdcd:f0b6 with SMTP id
 f8-20020a0560001b0800b002c3cdcdf0b6mr156702wrz.471.1675485403736; Fri, 03 Feb
 2023 20:36:43 -0800 (PST)
MIME-Version: 1.0
References: <87bkmas5vc.fsf@meer.lwn.net>
In-Reply-To: <87bkmas5vc.fsf@meer.lwn.net>
From:   David Gow <davidgow@google.com>
Date:   Sat, 4 Feb 2023 12:36:31 +0800
Message-ID: <CABVgOSkbiUzTjmPdOJBT7kWfuwZPuqDtCiTEHgyf5sYDWByhBA@mail.gmail.com>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="000000000000572df605f3d858bd"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--000000000000572df605f3d858bd
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Feb 2023 at 07:10, Jonathan Corbet <corbet@lwn.net> wrote:
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
>

This is much better, thanks!

Personally, I think this fixes the problems I had with the earlier
alabaster versions. It's still not quite perfect, but it's usable to
me in a way the original versions weren't.

There are definitely a few pages which are nested even deeper than
maxdepth=3, which become more difficult to navigate, but they seem
rare enough that it might make more sense to just restructure those
bits of the docs to remove some levels of nesting.

Otherwise, mostly small css issues (the main one being the font size
for the 3rd level nested elements being way too small to comfortably
read). Getting rid of the font-size: smaller bit works for me. In fact
(at least for my normal usage pattern), the more deeply nested
something is, the more useful it's likely to be: navigating to child
and/or sibling pages (or back to the immediate parent page) is most
common, as those pages are most related. So having the font size
increase with "font-size: larger" actually works pretty well, even if
it really gives a weirdly-bulging "fisheye" view to everything.

I still think RTD is a bit more usable at the moment, if only because
of the higher contrast and the breadcrumbs at the top of each page.
But this is good enough that I can get everywhere I need to go without
constantly needing to use the browser back button. So I'd much rather
this in 6.3 than the stock alabaster version, even if it could still
use some tweaks.

Cheers,
-- David

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

--000000000000572df605f3d858bd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
64VRg2IjDI2fJVE9RD6aMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQA2lZLYRLu7foeR
cHo1VeNA974FZBiCm08Kd44/aCMEzdTJvxAE9xbUJf7hS1i6eW49qxuSp3/YLn6U7uatwAcmZcwp
Zma19ftf3LH+9Hvffk+X8fbPKe6uHkJhR2LktrhRzF159jj67NvXyGQv8J4n7UNeEVP0d5ByvRwv
tF2bJwlOwRGLoxasKSyDHIyUpwTfWYPq7XvjoGqQ/tDS7Khcc5WncJl0/ZEj7EKjtoGbsDbLdXEF
m/6vdcYKJzF9ghHewtV3YIU4RE3pEM4aCWWRtJwbExzeue6fI7RqURbNCAyQuSpWv0YQvzsX3ZX3
c1otrs50n1N0Sf8/rfJxq7sWMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCBf
CsjMbszLzd74+XRvO8Epio182+tH4IrXgfr8b67x6jAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAyMDQwNDM2NDRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAnZFS5u/u6BnVG67rIEUj
7dK9u+NwyUDQFwjrxgcJdTXzffOwWfoFxl3w+YeIUFVC6C0azKl1mZY/p+EN0KEUchrtOfM2MbdQ
FJMXOVdJaWXa3EtI27bFUoPUC305kiaKT4Aw08tSXsfwy+JmGKuC3s22jlI+8L07Rb6np3ZXZrOk
zPx6YEDq2Kj5ZlORC/ibDLmeMLa/Yvcxo7GQYn/VgI4/i76+Pxh0nS+7iZaCruaRMWXORh1TowmR
1GkV2EEGILFHybuy8uhdiOoxPq84ZL6g+qV04DDPA72Ln9yz/ylObQYCdB5j3D8k3uUda90Sae1w
dZKsyqmprqzJZDHdqQ==
--000000000000572df605f3d858bd--
