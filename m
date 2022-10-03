Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EAFC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 16:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJCQYS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiJCQYR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 12:24:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953DB22BD0
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 09:24:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id k3-20020a05600c1c8300b003b4fa1a85f8so6130695wms.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=A6/qIIrW+T9mW+rRkiz0qKXueDJX3nuL345XEE8/LoI=;
        b=G1lhdJPcRq0TuLHXS6nyN0GnH95ZRsX22yWgbbkgZdJxXF4xqp4koN2MfyJqzTQxk6
         vJlHG1GMsqxSJVlK+JGF3W0QEKmUEsNOh1eUhAyfXevZst9kS2DFdSh7R7MxzJRZiFS6
         iHc0z7VHarRib71bijl4csvcWhEhu2RgGQU7nBEEhSWqDSE9Jd1PkOCsXfAe1p0GUPaG
         tzySXMa01ybBBTfgIt4y6U7RyuS5oQmdvk7dtDpU8ZetqPinqVSYcomaZRXHF8jcPZEG
         Gx4pvnlcxGjMn0T8rzCNOsurA2V9frc9S5EuoL4FwRzhbdTPJ+/34EcEmAPTHeUmMDen
         tAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=A6/qIIrW+T9mW+rRkiz0qKXueDJX3nuL345XEE8/LoI=;
        b=33uvHVP6oKAEB1Hity7U93xXHJVQG5y/edwACH1lhwKpbgYyf/p0zYy0nfxXO1EP3u
         UM2lIqVmYuENHJEIFDJYLAiYkNvRgjc3864POO2LKosldlPoQqgcpadNckUEg6fIJNZ9
         C3Bc9IAhXGOVivw3a49+i2sI4a4kfWcvTu1KLLDN/iOWWyyXXfSSoO1cY4VsqE8chfQ4
         jdTpsmH0mO9dVpaYXrcLQCeCRJoHtYVIkiPXWWunQgAfzGJtwFeQZQHjtT5Np0aWDRfC
         xXHcBv6OAOE1dWB3a9qj6zGXe+jkpeUuM2byND85qNxrh63WbmOAUP5M5onE+1UkjmFp
         YZMw==
X-Gm-Message-State: ACrzQf0nS6hzNmYpwvTxilGyOY1VrIk6diNYpacwotIc2E/3TW39gNqB
        1cpIA4mVbAIgTDSTUzFMdnUzHtyPJ6mJCg==
X-Google-Smtp-Source: AMsMyM5skvwDSTRntguijGWT+ldbLZ1YTj3D/2HV8R/W16rN/Mgw9GyYNckn7eSVf4KsLaCg5BXESw==
X-Received: by 2002:a05:600c:1ca8:b0:3b4:a5d1:2033 with SMTP id k40-20020a05600c1ca800b003b4a5d12033mr7269288wms.23.1664814254075;
        Mon, 03 Oct 2022 09:24:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b003b95ed78275sm4989013wms.20.2022.10.03.09.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:24:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com, akiyks@gmail.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH RESEND v4 0/2] Fixup instructions around mailing recipients
Date:   Mon,  3 Oct 2022 17:24:09 +0100
Message-Id: <20221003162411.431774-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

RESEND
+ Akira

V4:
- Change the subject line of the series
  Previous: Expand get_maintainer to be explicit about supporters
  https://lore.kernel.org/all/20220930064629.329514-1-bryan.odonoghue@linaro.org/t/

- Update get_maintainer.pl to return "maintainer" for both "S: Supported"
  and "S: Maintained" - Theodore Tso
  For the purposes of sending a patch whether or not the maintainer is
  listed as volunteer or paid is not really useful information.
  Listing both as "maintainer" is clearer the end user.

- Incorporate Krzysztof's list of recipients into
  Documentation/process/submitting-patches.rst.

- I didn't include the get_mainainter.pl example.
  Comments from both Akira and Joe suggest to me the example is not that
  useful.

- get_maintainer will no longer produce "supporter" so one could argue that
  the documentation shouldn't refer to supporters however not all of the
  potential output strings are documented and I've opted not to document
  "chief penguin" either.

  I'd like to focus on the particular case of supporters with some
  reasonable knock-on documentation tweaks for the obvious gaps we've
  identified in our discussion because "supporter" really means
  "maintainer" and you absolutely have to mail that person to get your
  patch into the right inbox.

V3:

- Drops change to get_maintainer.pl - Theodore
- Rewords around `get_maintainer --nogit-fallback` and gives an example

I think the document text now is clearer and should be more helpful to
others in getting their minimum submission list right every time.

V2:

https://lore.kernel.org/lkml/20220928003006.230103-1-bryan.odonoghue@linaro.org/T/#u

- Documentation/process
  Added in text to also make clear subsystem mailing list should be
  included - Krzysztof

- Changed get_maintainer.pl to print maintainer[supporter] or
  maintainer[volunteer] depending on MAINTAINERS file. - Thorsten/Bryan

- Choose supporter and volunteer instead of supported and volunteer
  Supporter and volunteer describe the role of the person whereas supported
  and volunteer would describe an activity and a role which isn't
  consistent. - Thorsten/Bryan

- I didn't change Documentation/process/5.Posting.rst
  This file doesn't mention get_maintainer.pl and I was mostly aiming to
  fixup the process around get_maintainer.pl. - Thorsten

- Myself and Thorsten discussed changing get_maintainer.pl, how it seems
  like a desirable thing to do but also that "it might break scripts for
  people" and it might.

  I don't know if get_maintainer.pl is or should be considered to be a
  stable interface and an explicit software contract but, making it clear a
  supporter is also a maintainer seems like the right thing to do from a
  transmission of information perspective.

  There is still the option of just updating Documentation/process in
  isolation.

V1:
- Sent a standalone change to Documentation/process stating
  get_maintainer.pl email addresses marked "supporter" should be included
  in a patch run.

Bryan O'Donoghue (2):
  get_maintainer: Print maintainer for S: Supported
  Documentation/process: Be more explicit about who to mail on patch
    submission

 Documentation/process/submitting-patches.rst | 4 +++-
 scripts/get_maintainer.pl                    | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.37.3

