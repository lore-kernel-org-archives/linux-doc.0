Return-Path: <SRS0=IxZW=2H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB912C43603
	for <linux-doc@archiver.kernel.org>; Tue, 17 Dec 2019 20:39:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 708402053B
	for <linux-doc@archiver.kernel.org>; Tue, 17 Dec 2019 20:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNKEyWiC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727704AbfLQUjS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Dec 2019 15:39:18 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:39255 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfLQUjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Dec 2019 15:39:18 -0500
Received: by mail-lj1-f182.google.com with SMTP id e10so12453677ljj.6
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2019 12:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=BHwZ/riOuonsu0Tz1pvKYtaZ+WuTlxD8js4hvNkYlE0=;
        b=ZNKEyWiCQ0WWPI8ioUHFRF808sXcsUvSCEhVVrE7gyIhC0eAphxhomh7iMSUcmcRqL
         1GoVDeMtOyAWcR/YrEcDCHmP3b8uJUd53SiXxlHWw5a5IDE5pBg+acJ3/yiHz4pcB9+y
         8xu+TqVoAmL3o0M4PUQuKY1OwoAQ+0x7W8PUSVuB8WRV3UqDpngfWKBEAAtgWBFyj4FZ
         wa8rOmUBekXF7JErOTL4h5MyOlopcnRc0kbXO/onvVzvVGuUxEYeHhmgtsTnU/Bv8bVc
         tVXphIvgPQiCam/1eO0Yj7IV2tdTIQgxznYpP9GW6EoONW88JZvUyW/3g9I1xveHIyry
         SGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BHwZ/riOuonsu0Tz1pvKYtaZ+WuTlxD8js4hvNkYlE0=;
        b=VYHOJBHA1Y0sAXMHnzHMIS/wbmykWI6d0qam8D7Bw3Uw/nHFaGLzLkc/E66epicN2j
         omUxF6eQXIgzaH7uvNR8kSMSqV3Tgz513lDtqded15hGpjuEDJP28Ots58ih6SlK3Qe2
         p/ZH6ZgcunTO8gWnbG6/gVYah+e0vw+ALvF3cipMZVi7SNqqJUo1a9lS66IpPgIXRPDd
         FiGgUUhqE36bf38SFJM0Nk0A6nU6PfRDjKtszIhTC4/+MwGxs29Z7Q787gc3dVMUy4ra
         KGoSTa9JyP+IJX/H/C0pfDKvdyASgJf4ZuxVNdKkOmGvfwJOscg2XTSoWvhMxjqGNCP0
         9qlg==
X-Gm-Message-State: APjAAAUGXnOvmlPOGdxSfSsCtiBUXGfdq5+QDsJDaXxLZTt2PE0tWWeI
        fJ/dDfUAZMpmdQAakibdhxWJFZo/xzTTLsa4XNMWl4cc
X-Google-Smtp-Source: APXvYqygmhRBYq1H0lwwvVaQw9MDToZsmajnb3Z3oU/Yr0zHVTAVnUpIy8ZHXM9lwLXPTLAcD22x+vCyMrQ6RpfV9NI=
X-Received: by 2002:a2e:9886:: with SMTP id b6mr4688660ljj.47.1576615155599;
 Tue, 17 Dec 2019 12:39:15 -0800 (PST)
MIME-Version: 1.0
From:   jim.cromie@gmail.com
Date:   Tue, 17 Dec 2019 13:38:49 -0700
Message-ID: <CAJfuBxxJptTBpEY-HYmVCy325=UZTm4BLrO0kJ2B27eKy+dx-A@mail.gmail.com>
Subject: is there a preferred form of root-prompt example ?
To:     Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

so Im looking at Documentation/admin-guide/dynamic-debug-howto.rst

its a typical root-shell command environment.

there are a lot of different example prompts scattered about,
which is objectively inconvenient for copy-pasting.

I briefly played with aliasing away the prompts, and it seems like it
might work,
but it seems way too magical to put into examples just to make the
various example prompts play nice with copy-paste.

At minimum, it seems good to reduce this to one or few variations,
dir-agnostic preferred, and ideally evaluates to nil (without an ugly
alias), leaving 1st token as the command itself.

Also '//' is not a legit comment char in root-shell-environ, # is better.
I have this and several other doc patches, this is the right place to
send them ?

comments ?
