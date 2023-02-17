Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCD9C636D6
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 17:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBQRKT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 12:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBQRKS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 12:10:18 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1B46ABFF
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 09:10:17 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id d4so557045ilm.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 09:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/Qv8u6Z2KXCcaJWZ8ZA1lMk2nbjKlk3sn8x9I4oZZw=;
        b=kPdZt0SA1LHrayAm4tv1zimTfk4DR7WJguEVMzR+evSCJnmAIXMS/bcW0IqKkOl8DW
         5C5MXHlTZDrVDv7OV54JGTbir+dpe6Ls6E6nd5RXsUeKyMuXFWnghEe58WFpgnrufmdU
         qwJVvJnbxv1bRih2uXj8EdJM23aSr4Vc/jPWavg5vgvVG8jDdT/HjpeYmlZTCTSHyZhF
         zPOMEyfA53jBNVA7Up0M5g7nOolpL1p7fxLH8cZyuquVjndDLNusXecKc3fFW7EiyJ1q
         T8A/kNl7De4i2n7UJ69itWeJP90pHMC5Ob3A1ONl7hHWL//scj7qinq1RI0XNP8zD6NK
         dC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/Qv8u6Z2KXCcaJWZ8ZA1lMk2nbjKlk3sn8x9I4oZZw=;
        b=VEAbXkOnVbc/qX3O3UPahjcicWy6g8Rj6wqlI76I4a8TxQfLKN92bYgeGHSutF+Gnf
         /dpO1Pok1WTxMXYaa0+YrdjE3cJsqnxNvqsAKaDkJtBD3wZixQ6+tSJ1WetRtGAca4C+
         PjD/v0Ac6t8zLnZg9L0TfsHFahbZPp0yU1FO8hNVlSXDr/kdROmDzK2upP7A7EA5zeGl
         /DwmXm6Xql/gbVbRJrNe8y+t/d6UP7LNHhRqRlBGB3M2KxUPXDnJaliSisOHUFDz2MjF
         cjpLPXzOn5hahXalciNZYkIvDuFv+312QnbM/8OXqgc8llUyfb6XV0nONbYlDPrcyP4x
         ME8A==
X-Gm-Message-State: AO0yUKXNt67yPwsPl/hwV+PXJZv7tj3dAGv1uWod+lvPTJs2zpUUx4/W
        AvgrVfblOL0KumKW6hXVgZsdJrD37EZgTCRjS28=
X-Google-Smtp-Source: AK7set87u6rDKzUgPwvUi1Gb4kZnuwzpMQcJMUlJKza42lDhRA2RtunaRJpyNDmOBFB4Cqr0SKBMfg==
X-Received: by 2002:a05:6e02:1a69:b0:315:d9ba:a392 with SMTP id w9-20020a056e021a6900b00315d9baa392mr2210842ilv.17.1676653816772;
        Fri, 17 Feb 2023 09:10:16 -0800 (PST)
Received: from google.com ([2620:15c:183:200:20d3:35a7:25e2:3102])
        by smtp.gmail.com with ESMTPSA id i3-20020a056e0212c300b00313fd932425sm1508659ilm.2.2023.02.17.09.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 09:10:16 -0800 (PST)
Date:   Fri, 17 Feb 2023 10:10:12 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: broken link in bpf/bpf_devel_QA
Message-ID: <Y++09LKx25dtR4Ow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I was checking out this page:

https://docs.kernel.org/bpf/bpf_devel_QA.html

and noticed that we have two links to .rst pages that are getting converted to
links in different ways.  This one:

  See the kernels selftest `Documentation/dev-tools/kselftest.rst`_
  document for further documentation.

is getting converted to a full external link:

  <p>See the kernels selftest <a class="reference external"
  href="https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html">Documentation/dev-tools/kselftest.rst</a>
  document for further documentation.</p>

While this one:

  Finally to ensure support for latest BPF Type Format features -
  discussed in `Documentation/bpf/btf.rst`_

Is left as a short local link to a nonexistent .rst page:

  <p>Finally to ensure support for latest BPF Type Format features - discussed
  in <a class="reference external"
  href="btf.rst">Documentation/bpf/btf.rst</a> 

I think this could point to either of these locations and be okay:

https://www.kernel.org/doc/html/latest/bpf/btf.html
https://docs.kernel.org/bpf/btf.html

but, as it is it's showing up as a broken link.

Given that the page source for these two links are basically the same:

 `Documentation/dev-tools/kselftest.rst`
 and
 `Documentation/bpf/btf.rst`

I'm guessing this is an issue with how Sphinx is generating the resulting
html, probably because it's trying to generate a more 'local' sort link for
the btf.rst page?

Thanks,
- Ross
