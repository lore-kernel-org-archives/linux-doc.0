Return-Path: <SRS0=JqMg=ZZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0382C43141
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 07:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77EF32080A
	for <linux-doc@archiver.kernel.org>; Tue,  3 Dec 2019 07:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItVhJQ5/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbfLCHAc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Dec 2019 02:00:32 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45147 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfLCHAc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 02:00:32 -0500
Received: by mail-pg1-f194.google.com with SMTP id k1so1217158pgg.12
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2019 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=INGajexy9It7CoUDmxX+ri4F9omlcw2mriGYC3fDDCI=;
        b=ItVhJQ5/E4Tjc6i/wsv9yGPBfHXXxKaCb4L7T+pTJEe+oB0q0MqPtcQNj3lmHkV3Cq
         dL5jxRC7w7herfMWSMCI/44CqKzzZkp7WGxLGvDWnxcp/9sFCv8pbSrB8lrzp0f6VIXG
         iv/iwztoNmBPqTpJKzBmnlDuF2XL7T8onNihgot0eJ96ZkmO8ZkQPcnVIx4wuR9eGRph
         BLJRIkR8vsfuBBnpdbIMYCCVOMjKpwCHS5EEmn/+f+yIPheJlNPkdmuHSAEf1mOVzy8s
         RMDPF4OYG+Yqw3SiBsNvCTMTNigzyeIwjps7jU9/izIs0clDzCqzHaNBOYM4KS+UIpcA
         EZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=INGajexy9It7CoUDmxX+ri4F9omlcw2mriGYC3fDDCI=;
        b=CVPDE4f3jGoDZ56NT58AZngV0LgMmZ3/A39ZhKdlvJmwjnavI/TX2WvizaOF6oJCXD
         AL2ZcOZtmk0NEvHp8QHiK1DajMcSz7BHTyyyueKv3ETXsJnMp/U2MK/SHBW5+tck7Uj2
         fa0D0XNUFNN4dLSS7//KPzUK5X9bUYZjh3aYdTu8I0jqn4AGgjYyDt46jREmdWgaTVbT
         IRm2bq/x1Wdy2SSm0JNAdJ7k9Ghja3KnGoszz1d0Oxbihis1x2zghcXTI2cok6ed9YLD
         muV/SRbgU74MTZuyWccceH5CRkxBxjkNlCjXpDYfyxv8S6/Fz/YdNIAD7afNtMiPhcVA
         jhCA==
X-Gm-Message-State: APjAAAV9feL9nxHgGZzfMsgLo7RN9fxT7ct/Hfq00ttx+YkQZEfk1KnE
        EFdLaz3UsWBJxqLjnLy1zQlJKQ==
X-Google-Smtp-Source: APXvYqy1Nw4ygDEMu+qXudGEcJNNMk2ym1VAsn4ckHP/DMNzJc0rIrbvfRLWNHSofdREJyMrAL6Big==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr3764856pgm.69.1575356430815;
        Mon, 02 Dec 2019 23:00:30 -0800 (PST)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
        by smtp.gmail.com with ESMTPSA id k4sm1887484pfa.25.2019.12.02.23.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 23:00:30 -0800 (PST)
Date:   Mon, 2 Dec 2019 23:00:25 -0800
From:   Brendan Higgins <brendanhiggins@google.com>
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah@kernel.org, corbet@lwn.net, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sjpark@amazon.de>
Subject: Re: [PATCH 0/6] Fix nits in the kunit
Message-ID: <20191203070025.GA4206@google.com>
References: <1575242724-4937-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575242724-4937-1-git-send-email-sj38.park@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 02, 2019 at 08:25:18AM +0900, SeongJae Park wrote:
> From: SeongJae Park <sjpark@amazon.de>
> 
> This patchset contains trivial fixes for the kunit documentations and the
> wrapper python scripts.
> 
> SeongJae Park (6):
>   docs/kunit/start: Use in-tree 'kunit_defconfig'
>   docs/kunit/start: Skip wrapper run command
>   kunit: Remove duplicated defconfig creation
>   kunit: Create default config in 'build_dir'
>   kunit: Place 'test.log' under the 'build_dir'
>   kunit: Rename 'kunitconfig' to '.kunitconfig'
> 
>  Documentation/dev-tools/kunit/start.rst | 19 +++++--------------
>  tools/testing/kunit/kunit.py            | 10 ++++++----
>  tools/testing/kunit/kunit_kernel.py     |  6 +++---
>  3 files changed, 14 insertions(+), 21 deletions(-)

I applied your patchset to torvalds/master, ran the command:

tools/testing/kunit/kunit.py run --timeout=60 --jobs=8 --defconfig --build_dir=.kunit

and got the error:

Traceback (most recent call last):
  File "tools/testing/kunit/kunit.py", line 140, in <module>
    main(sys.argv[1:])
  File "tools/testing/kunit/kunit.py", line 123, in main
    create_default_kunitconfig()
  File "tools/testing/kunit/kunit.py", line 36, in create_default_kunitconfig
    kunit_kernel.KUNITCONFIG_PATH)
  File "/usr/lib/python3.7/shutil.py", line 121, in copyfile
    with open(dst, 'wb') as fdst:
FileNotFoundError: [Errno 2] No such file or directory: '.kunit/.kunitconfig'

It seems that it expects the build_dir to already exist; however, I
don't think this is clear from the error message. Would you mind
addressing that here?

Cheers!
