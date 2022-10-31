Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AA3FA3741
	for <linux-doc@archiver.kernel.org>; Mon, 31 Oct 2022 16:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiJaQxE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Oct 2022 12:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbiJaQw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Oct 2022 12:52:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1867712AD9
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 09:52:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8F0306E1;
        Mon, 31 Oct 2022 16:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8F0306E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1667235178; bh=euB1egviVbr/guU0oVwzBhk6xjoAJdCfNDVLCfrNfM8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=i71rhmdNdY1igxHzzpWKtkh4AGdhs9ypgjitq2ih/eYcZ7OYHiXMmd1/MWBv0nIW7
         yCEaWXtQJ41Ezvg+BIHTF5nZqqfri2Ci8mtikry2HxDC87AV2/W5zeiYj+UkovxQNv
         g6SchZbV59jcwNr2e4yMLFeiu21LRl9oNcMnW/Q/eSI8vVD4bF9DNphXGjOx81F9vx
         OP3VukJXm3DcWPjCghIR0PcRki98vpFFnDROButdyfr9AN1XPQaUDtboD+GJEaCHGu
         KIURd4++6c9i1Dns0NfgYJUm4xnzhZerfTy7DuYWK1J0u0fjZo7GnbJZamA+bUHP80
         OS7qb4x5P2JFw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Font size for actual content in Alabaster too small?
In-Reply-To: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
References: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
Date:   Mon, 31 Oct 2022 10:52:57 -0600
Message-ID: <87mt9c2avq.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> I have done make htmldocs on linux-next (which includes switching doc theme
> to Alabaster) and see the results.
>
> Honestly, the font size for actual content (body) is only 10pt, which makes
> reading the docs a bit harder. I think that 12pt should be more readable
> instead.
>
> ---- >8 ----
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 9b36f7abd24f3f..7894901ca92e4e 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -10,6 +10,10 @@ div.body h3 { font-size: 130%; }
>  
>  /* Tighten up the layout slightly */
>  div.body { padding: 0 15px 0 10px; }
> +
> +/* Largen body font size for readability */
> +div.body { font-size: 12pt; }
> +

You didn't notice that I'd already set the font size (seemingly too
small) in conf.py.  The real fix, anyway, is to stop trying to wire font
sizes and let the user's browser settings take control.  So I'm
pondering something like the following...

jon

--------8<--------------


From 236978c7bd9433aea45d5314f31c079e0ef031bb Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 31 Oct 2022 10:48:19 -0600
Subject: [PATCH] docs: Don't wire font sizes for HTML output

The alabaster theme likes to provide explicit sizes for fonts, which
overrides the users's own browser settings and is guaranteed to displease
folks.  Set the font size to "inherit" so that the users browser settings
control the font size they get.  We can use the font_size configuration
option for the main body font (changing the size I'd already put there),
but the sidebar size can only be set via custom CSS.

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py                  | 3 ++-
 Documentation/sphinx-static/custom.css | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 6ab47833ab6c..c715610d6297 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -316,9 +316,10 @@ if major <= 1 and minor < 8:
 if  html_theme == 'alabaster':
     html_theme_options = {
         'description': get_cline_version(),
-        'font_size': '10pt',
         'page_width': '65em',
         'sidebar_width': '15em',
+        'font_size': 'inherit',
+        'font_family': 'serif',
     }
 
 sys.stderr.write("Using %s theme\n" % html_theme)
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 9b36f7abd24f..45a624fdcf2c 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -11,6 +11,7 @@ div.body h3 { font-size: 130%; }
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
 div.sphinxsidebarwrapper { padding: 1em 0.4em; }
+div.sphinxsidebar { font-size: inherit; }
 /* Tweak document margins and don't force width */
 div.document {
     margin: 20px 10px 0 10px; 
-- 
2.38.1

