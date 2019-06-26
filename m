Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B2A37D8AB
	for <lwn-linux-doc@archive.lwn.net>; Wed, 26 Jun 2019 15:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfFZPUd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 26 Jun 2019 11:20:33 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34910 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFZPUd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jun 2019 11:20:33 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so2801704qto.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2019 08:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition:user-agent;
        bh=TMbonIAae3s2n3nbvmA2N1iuSovslInlJCc3ySLJcdo=;
        b=NXfWmMC6rA5iGjeJuckjoA8abC+i9iNmXvE4Esx0q0dp0XHSZ6ko6vtFnRjp82PV+L
         R2k65kPz6lxUsOY0EcyQI/QwK13IFv2g7OjBKD94myU5fVaR7UPNsnVrzKCEQDUKf2EJ
         GwWbZdOIwAUFSisLg/cXtELPycN3xxyKYGn0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=TMbonIAae3s2n3nbvmA2N1iuSovslInlJCc3ySLJcdo=;
        b=it7ZlYJDzZ76iUm8YZpINvlEm9DM2EuVXAU3fRDIUhKtDI8I1XWqSxEPdQCmw1OPxU
         zSZRzfG0syuTh/PrEVKDpcjQM8CxtbZY42aC8fWKNaWY0cV5gLO6NRymaLreEPm/VZNI
         seu21ljd6i3Y4+J0hqUg1Lpe5el34QpyuTv5MKBI1ub9LR3ahgR4zRwysneAYf7hgl62
         Mm2oc2aCBiapkptgXG9wfpXeAgzTmmfG/M2q+UGt4lfhUebfXAawdPyukc5ONPJswxNU
         FBRlTm8V0XyP38i3C0s5ZVROlSN/yM14h1MEVgB+zxUk6UMj+D39LotnwPhOJqB4GuSs
         SVog==
X-Gm-Message-State: APjAAAXjk26uC8eYlmQoiYjyYcJxddBxmyqqbdVYQwi9OeSbDf9jogms
        5lqAsIAM6Y2QlQKFYqDE8XJwQ2PT5x0=
X-Google-Smtp-Source: APXvYqzN9fn+CGt2RcRwUMWT6FUJnwizwfbnFPULKH1rwbhzVgQn1QkNw58beMnIWFoIRjMsBUuf6g==
X-Received: by 2002:ac8:2aaa:: with SMTP id b39mr4375873qta.24.1561562431523;
        Wed, 26 Jun 2019 08:20:31 -0700 (PDT)
Received: from chatter.i7.local (192-0-228-88.cpe.teksavvy.com. [192.0.228.88])
        by smtp.gmail.com with ESMTPSA id 6sm8626387qkk.69.2019.06.26.08.20.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 08:20:30 -0700 (PDT)
Date:   Wed, 26 Jun 2019 11:20:29 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net
Subject: [PATCH] Documentation: PGP: update for newer HW devices
Message-ID: <20190626152029.GA27451@chatter.i7.local>
Mail-Followup-To: linux-doc@vger.kernel.org, corbet@lwn.net
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-Patchwork-Bot: notify
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Newer devices like Yubikey 5 and Nitrokey Pro 2 have added support for
NISTP's implementation of ECC cryptography, so update the guide
accordingly and add a note on when to use nistp256 and when to use
ed25519 for generating S keys.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 .../process/maintainer-pgp-guide.rst          | 31 ++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index 4bab7464ff8c..17db11b7ed48 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -238,7 +238,10 @@ your new subkey::
     work.
 
     If for some reason you prefer to stay with RSA subkeys, just replace
-    "ed25519" with "rsa2048" in the above command.
+    "ed25519" with "rsa2048" in the above command. Additionally, if you
+    plan to use a hardware device that does not support ED25519 ECC
+    keys, like Nitrokey Pro or a Yubikey, then you should use
+    "nistp256" instead or "ed25519."
 
 
 Back up your master key for disaster recovery
@@ -432,23 +435,23 @@ Available smartcard devices
 
 Unless all your laptops and workstations have smartcard readers, the
 easiest is to get a specialized USB device that implements smartcard
-functionality.  There are several options available:
+functionality. There are several options available:
 
 - `Nitrokey Start`_: Open hardware and Free Software, based on FSI
-  Japan's `Gnuk`_. Offers support for ECC keys, but fewest security
-  features (such as resistance to tampering or some side-channel
-  attacks).
-- `Nitrokey Pro`_: Similar to the Nitrokey Start, but more
-  tamper-resistant and offers more security features, but no ECC
-  support.
-- `Yubikey 4`_: proprietary hardware and software, but cheaper than
+  Japan's `Gnuk`_. One of the few available commercial devices that
+  support ED25519 ECC keys, but offer fewest security features (such as
+  resistance to tampering or some side-channel attacks).
+- `Nitrokey Pro 2`_: Similar to the Nitrokey Start, but more
+  tamper-resistant and offers more security features. Pro 2 supports ECC
+  cryptography (NISTP).
+- `Yubikey 5`_: proprietary hardware and software, but cheaper than
   Nitrokey Pro and comes available in the USB-C form that is more useful
   with newer laptops. Offers additional security features such as FIDO
-  U2F, but no ECC.
+  U2F, among others, and now finally supports ECC keys (NISTP).
 
 `LWN has a good review`_ of some of the above models, as well as several
-others. If you want to use ECC keys, your best bet among commercially
-available devices is the Nitrokey Start.
+others. Your choice will depend on cost, shipping availability in your
+geographical region, and open/proprietary hardware considerations.
 
 .. note::
 
@@ -457,8 +460,8 @@ available devices is the Nitrokey Start.
     Foundation.
 
 .. _`Nitrokey Start`: https://shop.nitrokey.com/shop/product/nitrokey-start-6
-.. _`Nitrokey Pro`: https://shop.nitrokey.com/shop/product/nitrokey-pro-3
-.. _`Yubikey 4`: https://www.yubico.com/product/yubikey-4-series/
+.. _`Nitrokey Pro 2`: https://shop.nitrokey.com/shop/product/nitrokey-pro-2-3
+.. _`Yubikey 5`: https://www.yubico.com/products/yubikey-5-overview/
 .. _Gnuk: http://www.fsij.org/doc-gnuk/
 .. _`LWN has a good review`: https://lwn.net/Articles/736231/
 .. _`qualify for a free Nitrokey Start`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
-- 
2.21.0

