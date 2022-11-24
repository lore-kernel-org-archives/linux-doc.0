Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8EAC352A1
	for <linux-doc@archiver.kernel.org>; Thu, 24 Nov 2022 10:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiKXKCs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Nov 2022 05:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiKXKCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Nov 2022 05:02:44 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACB61DA63
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 02:02:41 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt23so3012251ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 24 Nov 2022 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=6eIMyEhsOzzAGNHE3cNtx6ptsH6jAPHZtkqtEKGyaLk=;
        b=mtzCPunrgB/P4FGyrvH+DJw4yWdymYTEbEp8pjtcBr7oqMYTrx/CHjO4ukHDj9ufdZ
         qVpa1iTuQhTCnV+Sz2cwNnF8Haw6yST+J4kfhkXn2ShIB1GIJclhxjHFgnPLDdTLAWoX
         ruLygMOr4hmDnnAIbvz0DrJWebV57wXeuvHb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eIMyEhsOzzAGNHE3cNtx6ptsH6jAPHZtkqtEKGyaLk=;
        b=jz7df+VBynor6FpH69xnX2tFT7zv4Hh06nt092TrnVKM2YxY5yDgHldH1UN7ZgeJL0
         MteMIRSIrTNQKzjJ7t5E7xCBDZ0WhaVWuXmS1EkSu5yKJjzhbn5OxrnYutRu2M2Eic/Q
         umO9gwOSCEPtuVperGNV9WcMZVNfzpbptUE+u8jdaPBD/H3fpM+YSZ8vN1ILuj2qvy54
         bWTE0QPdxEIElspjlFaZqw39lw5WUrYPODVOHXAj10Y10gyrlu2H74lX/GnOiWL2XNj6
         HQRqyrp244+iZVddomdQGMnvgPnBh2Ec2xwcV4T1PzkWUg6vYUjLdlaUlPp8+Si+Ly+z
         2isA==
X-Gm-Message-State: ANoB5pkNIfr5XGFQCXFwdwhXK9Vt5B5e9XGonf6euPe2GX/5Jqk566BZ
        LkvBEvk0meY4Slzlj+AbLqXUcwSurxCEoA==
X-Google-Smtp-Source: AA0mqf4fzyoLoop57uBwx2ohDUKrbEGT8U9T7pnnGxroWHWnIImy1NhlAdD7dqX1iyJIJXrn0vjEUg==
X-Received: by 2002:a17:906:2e83:b0:78d:b3f0:b5c0 with SMTP id o3-20020a1709062e8300b0078db3f0b5c0mr27904342eji.141.1669284160088;
        Thu, 24 Nov 2022 02:02:40 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:2a85:84f4:13a1:b293])
        by smtp.gmail.com with ESMTPSA id i29-20020a50d75d000000b0046a44b2b5e6sm335548edj.32.2022.11.24.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 02:02:39 -0800 (PST)
Subject: [PATCH v2 0/2] earlycon: Let users set the clock frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAClBf2MC/22NTQ7CIBCFr9LM2jEMFmtc9R7GxRSwECkkYJuYhruLrl29fC/vZ4dis7cFrt0O2W
 6++BQbyEMH2nGcLXrTGKSQkkie8JvngDo88aLMNAhiw2qAVpi4WJwyR+1aJa4hNNP58kr5/TvYqMnt
 79ZGKJAeQqme+zMbGrXLafHrckx5hnut9QPaKpgyrAAAAA==
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 24 Nov 2022 11:02:17 +0100
Message-Id: <20221123-serial-clk-v2-0-9c03ce8940d8@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Ricardo Ribalda <ribalda@chromium.org>, linux-doc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=ipQ2kNvTA4ADg+/HdXcEtkOOhqoFcmX4YejwFb+YLHY=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjf0Eu/uudDGFjuS9xXphy6PjsIC4Mgo34NdDc+Jw0
 Fz4exfKJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY39BLgAKCRDRN9E+zzrEiD2ED/
 9Iml3PgJm8eNS34z07D3DLehC6bG0ENU2k6WqsGGq6Zs1d3g1jdZ8OZ0MAIxUc+ppnnALv8VuZEMlD
 EgZOkjNXmPlz69oYUZ1LFUeh2wHzZLCckkaW79f5Z/bivxGRy3TvP0d3Cj49RQqO2qwJ2zQvZPO8Pm
 HbRBDmjwWCmD++Zg6g226sipjBNSWs7Ktsxykmzk8QSFYBnU93F2UwBVeJIzFViybo+4RBzfdJN0mQ
 fTyg/gtPG0kLvLZzf12i+AVKPlZ+WaNMeSlYNhMl6sCgF6z3+T+kb1ld4ZYR8XVPD/tk5y2pTp+6Dz
 e2XvOAHrpja1BBr0kddUDass+E2sySjOa30IgTmWXTME9SJDIG5iLN5JXjMb7ZQ4AWEZPf+fb+9ORI
 HLAkkFQwEFNVQaJP3S/K4SZRmYYSe4yvE8WHbPkbrBEyO8OlGQh0FDnStahNlPishusmlaYB58vfVh
 7Nd8VCC+uuwlAH5S0ySjnMgK+vyqiKWkfEwhn2ChACnKfaFBwpLaIauJ7tMmnSCwetNjNJ6k1Fw3ZR
 Q7jl6KHgnJxUImigv+2ttFewBJ4TaI6+c9Abs0lAQFLxO9RC20tep9jSVnTZOSn4V/UJh531ivkS+X
 mkmKYESu3r2pO2mdz6MXMcii+LRYGUHrhWJX4yytFBtXuqmOt5HacL054Y6A==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some platforms, namely AMD Picasso, use non standard uart clocks (48M),
witch makes it impossible to use with earlycon.
    
Let the user select its own frequency.

To: Jonathan Corbet <corbet@lwn.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Changes in v2:
- Add a patch to fix handling of baudrate
- Use kstrtouint instead of simple_strtoul
- Link to v1: https://lore.kernel.org/r/20221123-serial-clk-v1-0-1f0554a46ad1@chromium.org

---
Ricardo Ribalda (2):
      earlycon: Replace simple_strtoul with kstrtouint
      earlycon: Let users set the clock frequency

 Documentation/admin-guide/kernel-parameters.txt | 12 +++++++-----
 drivers/tty/serial/earlycon.c                   | 17 ++++++++++++++---
 2 files changed, 21 insertions(+), 8 deletions(-)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221123-serial-clk-85db701ada57

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
