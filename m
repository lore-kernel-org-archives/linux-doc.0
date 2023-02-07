Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59659C636CC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Feb 2023 06:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjBGGVM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBGGVL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Feb 2023 01:21:11 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6A12E81D
        for <linux-doc@vger.kernel.org>; Mon,  6 Feb 2023 22:21:10 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id x4so17286151ybp.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Feb 2023 22:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jBRcYOmPVXIZphDlrTy7686ifm0WjZiHxpn6QTu0ETQ=;
        b=hKTbl+dK7TXl9G/SPf13eahgvCrTVhXuwJ7AKHbic6RR5u2P11oMCT8AnZAWu9WhkE
         A6caRae1IUlueTzZvE0rRdL7jnTGzVYRm8+9gxN/pLJNZxxzA5TvH9OCtv3J3tv1vcWw
         aoPwQPdbPjBij3n+SLoRyPvq1LhqlKuJYOZ/PYiM5iqDWQDidx9p+4xpcIUQocd2qc7x
         OXyHN8VkuvHmXhOgPJYkW0uAt/JDmN7aX0XBWuYz9/jc0+4rcbOXWo+d7/4sCMFfnqbx
         8yeccFOb6gaq8kVh1CwUjkDYfhM7WxuT6agbjsB2cDuzl7OqCC/+UZK4nKa5c78bJnfj
         IYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBRcYOmPVXIZphDlrTy7686ifm0WjZiHxpn6QTu0ETQ=;
        b=C/ofCWcVvgbwws3Hc7KSbz7sDvzaccfFOLD5bOFgSwZDFgf7UUE1nBTsiBvKPwWY2g
         eCloz/pVAdOD5CXrrcsluYk+6qKUY940GWKWxm+9lDlFjQqaoIYpjsjaxPv7XCtLmJ2J
         df/hW8VyF36CzlJAqx067medF++LcVnz9tkSb8OxR14glnyIIv9oaWPGpZF0UsPPHxxN
         bsbOYv+me3T5K+xQXCRQyEUepeU0QKRsNccq91m2lvJk/Y/m0ahVsj+TUWjXZKAfCQ+s
         nmR/Hauo5UyAZsbFNzInB9rcNklV6up9dsk8qhxMU9tHxPHVoM76/6dtXEUfUHL49S5R
         oG+w==
X-Gm-Message-State: AO0yUKXQp1Rs+stMofibs6XaDeFAFaVQ+6WwaS8MMP2q39vn79LnV2vN
        YJimKLlKGqPjtS12fL73XeMNSFo6cq5dMgbjWkLyDQ==
X-Google-Smtp-Source: AK7set8AJdV+6AhWzheccaZnMt+jooczIfsCYRO5xGf0XMR05gI3lpyV33Yw3mY0LWFaquDs+K+ZnivQweUaOJMA8pY=
X-Received: by 2002:a05:6902:4ed:b0:8b0:3d8b:486a with SMTP id
 w13-20020a05690204ed00b008b03d8b486amr89474ybs.327.1675750869137; Mon, 06 Feb
 2023 22:21:09 -0800 (PST)
MIME-Version: 1.0
References: <87h6vyr3r9.fsf@meer.lwn.net>
In-Reply-To: <87h6vyr3r9.fsf@meer.lwn.net>
From:   David Gow <davidgow@google.com>
Date:   Tue, 7 Feb 2023 14:20:55 +0800
Message-ID: <CABVgOSk27H9zrFrY0qOa=4a=3m-ddJkrcs+mJMwF_5TPgthoZw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: improve the HTML sidebar/TOC
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
        boundary="0000000000004f179905f4162750"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--0000000000004f179905f4162750
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Feb 2023 at 03:30, Jonathan Corbet <corbet@lwn.net> wrote:
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
>

Thanks for these fixes!

This now looks good to me, modulo the font size being too small for
nested toc entries.

I'm sure there are lots of other improvements that can be made, but
this isn't causing me any issues, so (with the font size fixed) this
is
Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

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

Can we remove the font-size: smaller here (and _maybe_ above for toctree-l1)?

toctree-l3 ends up at ~9.259pt grey-on-white font here, which is
basically an unreadable grey blur.

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

--0000000000004f179905f4162750
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
MDIwAhABxy1wm0tAmHKHFkLS9RWPMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCJ
dUpE6LlojfRIwS/uG8TWBDJ9yuGKkcZZWRizle0SlzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzAyMDcwNjIxMDlaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAHdkt8U3aMyT2aj7UsMIt
ZKgI8PmTKVCtweELcbY+6bM2Wvb9hpvg5+dKlnUk07nRI8A6LiU8icLA6i8YcydiqnnQYYds0sNo
3MUshEAbAohDr5l0xcsGlf+WE5jWBNqnUcTSxSdgNAYBByGD7q0c4zT0Bj1LNF4rD37JKqG+HomW
H0FqZ1mUOICges+ZcxliFERRoUP/3pxSnAyBjAumtOH5UV5ANmmJUwwPVkAL2WCgB5P9FvF1VXYy
ca3QVKNuSoDSdQrMB4QT/KqEJMHANVr77iyS0h0IYlwZ2bgsfvNk5PTkogL/FtaT8ZLAzdbPf+V5
EV0HhEfmkice8ofTUw==
--0000000000004f179905f4162750--
