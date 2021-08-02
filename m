Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B71C4338F
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 09:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AA4360F58
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 09:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhHBJv6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Aug 2021 05:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhHBJv6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Aug 2021 05:51:58 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F52DC0613D5;
        Mon,  2 Aug 2021 02:51:49 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e5so19031060pld.6;
        Mon, 02 Aug 2021 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rSvZVCk/b4lxtMrQbI5kKo6ZH+53Muvk1QfohkjMfWQ=;
        b=o6LQCpplPt+icWPEHbKaQRMkxOAejINbTeRiO/3YRlw+GDij/NuKgi0Vk73BjoslDV
         8cygSgqRS/9zcQyJR+1glwYl+Oedc+7o6Ujh/wsRJ2ZRTAO5KiL/nMe6wu5jGdcMVwQn
         uIrjSh2yOWRQ+MF+bbyNns5eJvlDNL7Tp86d6vdLN3zj22UpfaZ4aKo2U0zbHud7EiCu
         zGh3C3YzpJU2TLds4/yA0Sxm9hDsrG+2Aw64vRJyjjRgXHldtH5YkihrLvkx4o/MQr8i
         bgYbkYCWkzes5gmR76SZRVlUP689YrCH1LUZ5G3J+o56uGu0fFVomAIT8g9G4SjzH4aF
         De2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rSvZVCk/b4lxtMrQbI5kKo6ZH+53Muvk1QfohkjMfWQ=;
        b=siHXSIwsmAiRqUsMeijUnTdMZ0pZx3TzITpY2Nv37aqZl0Vv7EgnHhrWR9DrzyrBpQ
         zZJDYIDAKDBCcsInbFZp8chq6eAgRwstpo+5mH0IO+uIWN/FzkGynYu/Gr7h31zNOyLk
         aVnTRhoaI/i5n/KTZsK+Ztgav5guxqCYDR33Pwe2aS5YC37ez91i5cpisTiJIDNJnJ8D
         snaIW5cRHPx1cXZlKo4A5M0lQZapStaZlw3VpZBuDzR5KDGGXvJ35go664IUUynGI1Yz
         iJQrJxZ5s5OEkv/8/kiWpBSLEOczqkGGpUOslYEGzDlyg00l6R/cXbPoE47gUJUZUXZE
         vy6w==
X-Gm-Message-State: AOAM533o+T+S8lqd/diVlII5RmjSfJu89clK1Jkf0FtuaxnMelPCY4ap
        1CE1R4iRCiLyQX23c0SQpv8=
X-Google-Smtp-Source: ABdhPJw2LOje+GZYbQog/yQS/5WnF59msN+/7Mp4i9o299dg7UF20relEobhVXBtiKDULMzGNhi7og==
X-Received: by 2002:a17:90a:a78d:: with SMTP id f13mr16098143pjq.206.1627897908680;
        Mon, 02 Aug 2021 02:51:48 -0700 (PDT)
Received: from [192.168.11.2] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id t17sm10928794pfg.93.2021.08.02.02.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 02:51:48 -0700 (PDT)
Subject: [PATCH v3 4/9] docs: pdfdocs: Preserve inter-phrase space in Korean
 translations
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, SeongJae Park <sj38.park@gmail.com>,
        Hu Haowen <src.res@email.cn>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <eb8184ab-cfab-680b-f180-1157a7f709b3@gmail.com>
From:   Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9e0adaa3-2462-ab8b-3a72-8a0c93ff1cec@gmail.com>
Date:   Mon, 2 Aug 2021 18:51:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb8184ab-cfab-680b-f180-1157a7f709b3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In Korean typesetting, inter-phrase spaces in Hangul text have
a similar role as the inter-word spaces in Latin text.
They can be preserved by the \xeCJKsetup{CJKspace=true} option.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 980be06df723..2ccfe4442acc 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -426,6 +426,7 @@ latex_elements['preamble']  += '''
 	    \\renewcommand{\\CJKrmdefault}{KRserif}%
 	    \\renewcommand{\\CJKsfdefault}{KRsans}%
 	    \\renewcommand{\\CJKttdefault}{KRmono}%
+	    \\xeCJKsetup{CJKspace = true} % For inter-phrase space
 	}
 	\\newcommand{\\kerneldocEndKR}{\\endgroup}
 	\\newcommand{\\kerneldocBeginJP}{%
-- 
2.17.1


