Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85F6FA3740
	for <linux-doc@archiver.kernel.org>; Mon, 31 Oct 2022 12:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiJaM2O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Oct 2022 08:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiJaM2A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Oct 2022 08:28:00 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ED8EF
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 05:27:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso15736440pjg.5
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 05:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5aXwSjLVB2lVJiyIGvKbD3EIKpSTJ9/2mXSvnVYFqI=;
        b=orEn95hxMQ5CFzqtEp4xNsAz9V3THww5fnsaNwYjvUQiaVag2xer40Nmq9MZbBoAXI
         OHmFYIGv8PAPX/DpigbTV3Owa3kD4YZ2wGs1m7hcsqqAcTE8bAY/QPwMJjvQC2xjLMDR
         hlZru2sLqPqeDFUOgkIs+lOGR6mNi5lSOv7XdS5doRj4QxzgjnD2k0xtvmJUUDqQedB6
         5eyzZQnr/bJfz5/6a2SjOzjYPPRnM9aascSpFCaQgVWT+n0AIh5H4quzhmctjrlpM02l
         Zaq3XEqh/OSN29UHbNBc90YH8wzKpnkwLojQAArpVvDzqgycKFhg8ooweRkyXWh+iBuG
         kMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5aXwSjLVB2lVJiyIGvKbD3EIKpSTJ9/2mXSvnVYFqI=;
        b=XC2sDyFB96H1GMvg59Cg3a1/nMGH8Nq6Fz2w1ykfRyyRm71nZeH5yPzscLInB8o7yC
         cnzfGW+e+wOKkP3c5zSDugSBhWMu5s9vLXrX62ESVQgBeHS9Ahmb3zE5mBVcLsGjzcdK
         iJRB145RurB9o9iKmMVTKPWN2zbqgob+qv8zfg73XN3v6seZZbzhYRq7RFeaCdHpeorn
         nD/RfCRA+70GR6Hc5RiIytDrgYy+S48zac+edBHb/B1R+I/YkaX/dnKES7DAfHNKEv3A
         c6N/qa9bMPIXyIi0SaML7nzfyoLaSTKZTLJIKD2+HtTWpyPeEDx44Q2tWcFIQQvsuuHX
         DfOg==
X-Gm-Message-State: ACrzQf0SfsTva6v4gzt9iuDqM3i+nNhJb7J0V1cJCUUvflTATao2bdPm
        TlosNTV/qbRqAdlwfKcvOnMn1p09e7T+mQ==
X-Google-Smtp-Source: AMsMyM7pOEGuBiow670j08M5sb0LccdgbNr3O5FYRkp+minkzMIepmrhizR7XvrPpb2xiD2Ab8ppGg==
X-Received: by 2002:a17:90a:8c8e:b0:202:883b:2644 with SMTP id b14-20020a17090a8c8e00b00202883b2644mr31716218pjo.89.1667219277405;
        Mon, 31 Oct 2022 05:27:57 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-92.three.co.id. [180.214.232.92])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902714200b0017a0f40fa19sm4309835plm.191.2022.10.31.05.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:27:57 -0700 (PDT)
Message-ID: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
Date:   Mon, 31 Oct 2022 19:27:51 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From:   Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Font size for actual content in Alabaster too small?
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I have done make htmldocs on linux-next (which includes switching doc theme
to Alabaster) and see the results.

Honestly, the font size for actual content (body) is only 10pt, which makes
reading the docs a bit harder. I think that 12pt should be more readable
instead.

---- >8 ----
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 9b36f7abd24f3f..7894901ca92e4e 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -10,6 +10,10 @@ div.body h3 { font-size: 130%; }
 
 /* Tighten up the layout slightly */
 div.body { padding: 0 15px 0 10px; }
+
+/* Largen body font size for readability */
+div.body { font-size: 12pt; }
+
 div.sphinxsidebarwrapper { padding: 1em 0.4em; }
 /* Tweak document margins and don't force width */
 div.document {

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
