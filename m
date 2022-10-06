Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD34C433FE
	for <linux-doc@archiver.kernel.org>; Thu,  6 Oct 2022 16:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiJFQYT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Oct 2022 12:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiJFQYS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Oct 2022 12:24:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B72CC1495
        for <linux-doc@vger.kernel.org>; Thu,  6 Oct 2022 09:24:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id h129-20020a1c2187000000b003c1e11f54d2so851690wmh.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Oct 2022 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gz2zH6sh025pIqlTZgZMoOhe3ZbD5/XGD/oE55GsOo4=;
        b=m35n7BqPwsKlEjazLbG/T3uIcwIq47NDFB/F8Vd1kol6Y/0jD+iDJjS73RwsP3WiQS
         1FIWgG8jScTZOSACMoQogM2TFcuExDX2N0REjilBxEGhHyOjWczfAGI9Ov9z4O/6BFLn
         9SI4CXu+5WJ2Mv430w16hOh3t+kzEipiIFrldyxN7bEdhxdC22NVnfLwfABJb6sfQfcf
         h2nwTQc3kLka1hTQ5E7rb7vOYDy1oaky5fBQPdm3BfhFEo4nxqL5xrbG7T4nNU3hm5WA
         4ltMYMcQQtwRLrVEGoDDlO1wmBLoiLRlf3JpvjDIdxLshrs8fI+D1ZyUtfeJnONZtXfA
         IxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gz2zH6sh025pIqlTZgZMoOhe3ZbD5/XGD/oE55GsOo4=;
        b=1uQbP/6BVUECPn4xqquXrhZUvmlc9ZzyxO9AZXfsVbpZKnP06cLx7y2xJ3uOHE2G2D
         I7e+s+R1mgcl95EFUqCMUu3drW8YysvrxL7SgODesFfFYj/WOQo2RuoYQHxKTEh+mlj0
         SdYQ9kDMEIk4Fzmb/C+cTuatpeTkBOzSFMY4oduKOt2EsavE7Gk/6Bw8TdFgE1kIn9yU
         UCBbyvVFLq1dYJ10AtWUNjA5qYkuRMlnEfOpEB9La5vdEh+ZIJJs1XzTwPAWgZbnvi8T
         rG4fZaiFq6Uv5pAE+Hri/OZU9sNKcdXUcabsy4L+hQiAZyb+TnGp+zKNRIqV/6pB9+rC
         0RsA==
X-Gm-Message-State: ACrzQf3i2ry+a74WwyHsDnbIFYlNY7bvZKBvc5j2dj/PoJ7FU7ibXN1L
        1okU9ul0T+5VoYb/WCxFKLDz1Q==
X-Google-Smtp-Source: AMsMyM5skw1JGH7+6bgcuKYSFzfHByP4+bqCs9NzMAUlLCsEfbv4o0liZAnEbqJbo13111iNMGUExQ==
X-Received: by 2002:a05:600c:12c6:b0:3bd:eeec:309 with SMTP id v6-20020a05600c12c600b003bdeeec0309mr7722582wmd.167.1665073455974;
        Thu, 06 Oct 2022 09:24:15 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k19-20020a05600c1c9300b003c1b492daa4sm3180145wms.36.2022.10.06.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 09:24:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/1] Fixup instructions around mailing recipients
Date:   Thu,  6 Oct 2022 17:24:12 +0100
Message-Id: <20221006162413.858527-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V6:
- Drops distinction between dedicated and non-dedicated mailing lists
- I appreciate Akria's concern on keeping the text concise but OTOH I think
  we should call out supporters and reviewers as well as the mailing
  list(s) produced by get_maintainer as mail addresses which ought to be
  mailed.

  A little bit of extra text should hopefully help others get the right
  list of recipients, with the least amount of additional text added as
  possible.

V5:
- Drops get_maintainer.pl removal of supporter - Joe Perches
- Back to one standalone Documentation change - Krzysztof's suggested list

RESEND:
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



Bryan O'Donoghue (1):
  Documentation/process: Be more explicit about who to mail on patch
    submission

 Documentation/process/submitting-patches.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.37.3

