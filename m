Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63C7C27C76
	for <linux-doc@archiver.kernel.org>; Mon, 23 Jan 2023 00:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjAWAFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Jan 2023 19:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjAWAFL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Jan 2023 19:05:11 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B956F166F9
        for <linux-doc@vger.kernel.org>; Sun, 22 Jan 2023 16:05:09 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id 5so4588355plo.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Jan 2023 16:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2xejZRuLs+ZU0c0v7N7NIEdAZdeKl5ODz7hV6KgzoA=;
        b=opQ6nf3m7gU2WmlvEM/RkgYQi1AsyQ5hAOzW/oyI4HXTCgnTRC3rGCNUtUQZ7/qdPD
         dRGX94hTwI1+8yxBxFlI/q9stk1Ijv9P9hnImDgta05wjMrpv5PT9htPpv/SalmUggGj
         bGa2fU0GDZsrqAnDNzesmXM4BEmEEaCyr1vc71+DrBRKkHKoUe5zl2Wq9Sb/DhS7PmZK
         8MoaT09RR6QNPSfcxcvU676ZlJBVXMTG05ShdoUE2ptWtQt83ZAh31QzPSwsjFdAvM5P
         Z27gBv/7k6RuGi1CKHM2FQMhUVEvZR0vba6CuynBTBpyXk6DKnZ9o//kRdaVZu/6RYar
         onTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2xejZRuLs+ZU0c0v7N7NIEdAZdeKl5ODz7hV6KgzoA=;
        b=8Lsi8MX+IilNC+q9R6m3jmc3RdqtbtspjAZCuOOPVekcIX6y+4V8p51HMRs6pkcVgb
         vhiBE4ZIYUnc7l1B8qjOOktzvIXxr03miujbNqzJ6CYEptCf49qWfxamy/OpsHJfmLI8
         Pst8WaV+wjGCevP/CylNf/iY4zNVebXWM6VfZ2atvC3eMXKvk4pszqQSJZHHuWxVDblB
         L6yHYhWitTSxhmFSTgqheDmGF0WIbPFzBKrCS3ksTzoxcKkb++Zyi5iDvPLhteulubxc
         7qQbTVZkRVTlNOw1Ncodq7OCEhwGcYDTntZirDlR130bFD+8D2TNqwfmXw0NqCIBvD+A
         CrrQ==
X-Gm-Message-State: AFqh2kr+zlzFdmkgOQ29XtO91plBlFYnrZ3zMG/gvjieGHSWcanHXq9n
        7VidH0Utl8N8fLJt2MHEduw=
X-Google-Smtp-Source: AMrXdXt99ljFRmysBAxEqKL5yE/FDbkpGwrN996oqVPu0eGoZLJlCqaNGDDKxbFBSpb61GjaQR28+Q==
X-Received: by 2002:a17:902:8493:b0:194:3dce:deb5 with SMTP id c19-20020a170902849300b001943dcedeb5mr24467915plo.27.1674432308976;
        Sun, 22 Jan 2023 16:05:08 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id u20-20020a170902e21400b0019311ec72e8sm15157924plb.253.2023.01.22.16.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 16:05:08 -0800 (PST)
Message-ID: <6b2e496f-d7f6-abea-6bbd-4b12fea76a68@gmail.com>
Date:   Mon, 23 Jan 2023 09:05:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
From:   Akira Yokosawa <akiyks@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Akira Yokosawa <akiyks@gmail.com>
References: <87o7qu5al3.fsf@meer.lwn.net>
 <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
 <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
Content-Language: en-US
In-Reply-To: <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Fri, 20 Jan 2023 23:09:34 +0900, Akira Yokosawa wrote:
...
> 
> I have mostly the same list of possible improvements.
> 
> As for the "where am I?" syndrome, it would be helpful if the sidebar
> could be scrolled independently.
> 
> I'd really like to suggest some code changes, but unable to do so.

There is a related question at stackoverflow [1].
The CSS tweak mentioned in its answer works like a charm.

Can you try the changes below on top of this RFC patch?

[1]: https://stackoverflow.com/questions/57031848/sphinx-alabaster-theme-scroll-inside-of-fixed-sidebar

        Thanks, Akira

-------------------------------
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 233f2f585143..6c8ccf3095ac 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -328,6 +328,7 @@ if  html_theme == 'alabaster':
         'description': get_cline_version(),
         'page_width': '65em',
         'sidebar_width': '15em',
+        'fixed_sidebar': 'true',
         'font_size': 'inherit',
         'font_family': 'serif',
     }
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 1ad0899bc8f1..3ec27edeb394 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -11,7 +11,7 @@ div.body h3 { font-size: 130%; }
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
 div.sphinxsidebarwrapper { padding: 1em 0.4em; }
-div.sphinxsidebar { font-size: inherit; }
+div.sphinxsidebar { font-size: inherit; max-height: 100%; overflow-y: auto; }
 /* Tweak document margins and don't force width */
 div.document {
     margin: 20px 10px 0 10px; 

