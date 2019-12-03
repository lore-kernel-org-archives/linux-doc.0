Return-Path: <SRS0=JqMg=ZZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28BEC43215
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 06:48:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A01A62073B
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 06:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OOLlVpJm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfLCGsm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Dec 2019 01:48:42 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42656 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfLCGsm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 01:48:42 -0500
Received: by mail-pl1-f193.google.com with SMTP id x13so1288645plr.9
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2019 22:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZrUEQpnhjssA5H4ckLx1/FL4yMnKDJVtL3vS1urgk3c=;
        b=OOLlVpJm+w4AJN2yx2hZrTcrZJ3k3sy8lSHYPpvN6XZ9ploTJEIEA7bBYCzbBRt7yG
         24G1DjY1sW2lu77gPUtsz6b0HFGxKaD2CDltSF7FiVg5kyy0WpmKqHSo2uS1s9Qa0ZRI
         6F+OaGm8aksg028LhkmscCBPzYA1s+22EsdOvkMPfszSgKbHt0vqHVyByeBT31r1L9eu
         6ESyJXHpUka2Uj7ErZ7hg0iKSOdeypmLfgKoQ5qMSCSX7+yiKAzJKerBv5kNPr/PYc42
         F+oP+an8sZM6y4mFx1/AKjeYQZ5kNyGFVTretLd/mhbZmPFF82g/Wmwt1fKOT6SONTVV
         kQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZrUEQpnhjssA5H4ckLx1/FL4yMnKDJVtL3vS1urgk3c=;
        b=e7OD0he4IeLOqSCKBfD4W3OEzBXMTWX23/IPBvBPNbzsHRlRgUSG0MBPFExPXsyoFa
         /3AVtbRptRwQfen5vKmLC6HxK8br3VYL9iSvynTy981SVSluLg0nqmn7zBB7kYis7uxt
         effnnehitpROt1DjnKUkR+MjR3Wy/j8eebWMpOrgybUgzVrKEF6zumcGMaycRbENTak/
         KugT/wG/TIBSO2njrqlEj2VLahea9d3pWDrCWm+/AzEyHkPds8NoXV7JHj2Rw+n9lNI5
         NnD26ETSi0PquD6IzWA+PdWSSHNhxWAenAZ0sCgP05/j9QS9+GOXcXSSCLK9Piekt5r5
         r+MQ==
X-Gm-Message-State: APjAAAWf9Ljl31RN6aHhhK38CTRCHdye542lmhiDX8NDLM4xmbFFJ47g
        Aw3O6kD5kSez0H4+MhGCT+fboYWLkme7wypYd8zWug==
X-Google-Smtp-Source: APXvYqxg5MdII+ViMW9PQ/XsBs5+SO2UZbHgYTN/T+GWkJaALLpc5gamk8VhBLGEjzYRqnWtES6UF8zeBKnnFHqZ+9E=
X-Received: by 2002:a17:902:9f98:: with SMTP id g24mr3467227plq.325.1575355720790;
 Mon, 02 Dec 2019 22:48:40 -0800 (PST)
MIME-Version: 1.0
References: <1575242724-4937-1-git-send-email-sj38.park@gmail.com> <1575242724-4937-6-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1575242724-4937-6-git-send-email-sj38.park@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 2 Dec 2019 22:48:29 -0800
Message-ID: <CAFd5g46TH31RkdFk5L4OFsuMmOA9SKJG_-g5bkehP1Z4uugrGQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] kunit: Place 'test.log' under the 'build_dir'
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 1, 2019 at 3:25 PM SeongJae Park <sj38.park@gmail.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> 'kunit' writes the 'test.log' under the kernel source directory even
> though a 'build_dir' option is given.  As users who use the option might
> expect the outputs to be placed under the specified directory, this
> commit modifies the logic to write the log file under the 'build_dir'.

Good idea!

>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
