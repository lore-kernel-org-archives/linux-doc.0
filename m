Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B6CAA7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Nov 2019 18:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbfKMSMo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Nov 2019 13:12:44 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55821 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbfKMSMo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Nov 2019 13:12:44 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so3014148wmb.5
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2019 10:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ki25gnbpyN00Iv5cdTY8OhdgRYpiq6GuA0iUi2qS8JY=;
        b=Fs57GyBC4KqL9mwZ7pz4er+6yTwZnzeC3f6ecarogyGItcOt761IC74Ow/Fy4yemVK
         RUqp9/aQEupFLjbQgv1Is7jI9ME2ZM1Urs3WpBzkHiD8m8wVSpaj4qR2HT8NktQ9aIDh
         83PGyCiMELKFkPAAJ4oKSoHJYw+BxXeDVZHwA+/1F1FsDEdMj437l2T1zBZvMvvheHvL
         fdLJ8urtUQhsyRrrfXAVw/DhaY2VeUzbmsUBTotErPCNPW/7n17mK4ajJuqRCwV0CKYj
         W+Zp1BcViOgwN1fFLrhobVuOpXFZhmczbXyYlTzP7butXBzzN7km9hK2nXnGXCXaobqM
         5tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ki25gnbpyN00Iv5cdTY8OhdgRYpiq6GuA0iUi2qS8JY=;
        b=gJX0WeuiUpwJeNJ62ruQFrLFF9n0Quzk0S3/unhC3UyO9BBPzmElwTpjkTJg6nDDVA
         UpIDs8IfP1zYk5AYITGF5d6GuQcBNy/1BshIEp8C2mvPh/AH8azrgncGOjthrOdK4B6n
         Q2OFWdwC5tuddhpwozY5f4wEmJly29b9zhgTeERKX9W2ED27Fo1s4QSBd5l83qtu0xsw
         aYR0gLE5jr/GBRX0PcSdmiv3aiOfmnu6wpJihAdMwPH6oL+pz7fksG1en3araqjCf/M1
         7oA2VZQzn2b2cHpj4/f25QMPPfSq97Yuh/b6ZzXQaq+lerWWvPSI4O2TtfZ1dMXBQnys
         z4JQ==
X-Gm-Message-State: APjAAAUt6abWQKXEDtjA4Oizje5fiJWFj6LpRXq6WijPdSDFC52hM/7j
        Id76N1OO0Kj+t2JSrWHUNdgxvZsWYw5YRE6vPi0e0w==
X-Google-Smtp-Source: APXvYqyS2MWVz9Gjs48JrwIYbsO/Nl6/uoy1ID+PXy7Cl0PgKvCG4CClUBfmff8XpKrw/24ncJDArH9Sw7hQb50yikE=
X-Received: by 2002:a05:600c:295:: with SMTP id 21mr3864373wmk.43.1573668760287;
 Wed, 13 Nov 2019 10:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20191113012746.52804-1-brendanhiggins@google.com>
In-Reply-To: <20191113012746.52804-1-brendanhiggins@google.com>
From:   David Gow <davidgow@google.com>
Date:   Wed, 13 Nov 2019 10:12:28 -0800
Message-ID: <CABVgOS=3AXS1=rpGyNiNYu8hU+t=gQG9JongHXir=76ENnrnnA@mail.gmail.com>
Subject: Re: [PATCH linux-kselftest/test v1] Documentation: kunit: add
 documentation for kunit_tool
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <shuah@kernel.org>, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-doc@vger.kernel.org,
        corbet@lwn.net, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 12, 2019 at 5:28 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> Add documentation for the Python script used to build, run, and collect
> results from the kernel known as kunit_tool. kunit_tool
> (tools/testing/kunit/kunit.py) was already added in previous commits.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  Documentation/dev-tools/kunit/index.rst      |  1 +
>  Documentation/dev-tools/kunit/kunit-tool.rst | 57 ++++++++++++++++++++
>  Documentation/dev-tools/kunit/start.rst      |  3 ++
>  3 files changed, 61 insertions(+)
>  create mode 100644 Documentation/dev-tools/kunit/kunit-tool.rst
>
> diff --git a/Documentation/dev-tools/kunit/index.rst b/Documentation/dev-tools/kunit/index.rst
> index 26ffb46bdf99d..c60d760a0eed1 100644
> --- a/Documentation/dev-tools/kunit/index.rst
> +++ b/Documentation/dev-tools/kunit/index.rst
> @@ -9,6 +9,7 @@ KUnit - Unit Testing for the Linux Kernel
>
>         start
>         usage
> +       kunit-tool
>         api/index
>         faq
>
> diff --git a/Documentation/dev-tools/kunit/kunit-tool.rst b/Documentation/dev-tools/kunit/kunit-tool.rst
> new file mode 100644
> index 0000000000000..aa1a93649a45a
> --- /dev/null
> +++ b/Documentation/dev-tools/kunit/kunit-tool.rst
> @@ -0,0 +1,57 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================
> +kunit_tool How-To
> +=================
> +
> +What is kunit_tool?
> +===================
> +
> +kunit_tool is a set of scripts that aid in building the Linux kernel as UML
> +(`User Mode Linux <http://user-mode-linux.sourceforge.net/old/>`_), running
> +KUnit tests, parsing the test results and displaying them in a user friendly
> +manner.

Calling this a "set of scripts" is a bit confusing, as the only script
described is tools/testing/kunit/kunit.py, which isn't mentioned in
this section.

Also, it may be worth linking to the new version of the UML website
(even if the old one has more content).

> +
> +What is a kunitconfig?
> +======================
> +
> +It's just a defconfig that kunit_tool looks for in the base directory.
> +kunit_tool uses it to generate a .config as you might expect. In addition, it
> +verifies that the generated .config contains the CONFIG options in the
> +kunitconfig; the reason it does this is so that it is easy to be sure that a
> +CONFIG that enables a test actually ends up in the .config.
> +
> +How do I use kunit_tool?
> +=================================
> +
> +If a kunitconfig is present at the root directory, all you have to do is:
> +
> +.. code-block:: bash
> +
> +       ./tools/testing/kunit/kunit.py run
> +
> +However, you most likely want to use it with the following options:
> +
> +.. code-block:: bash
> +
> +       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=8
> +
> +- ``--timeout`` sets a maximum amount of time to allow tests to run.
> +- ``--jobs`` sets the number of threads to use to build the kernel.
> +

Not directly an issue with the documentation, but this does raise the
question of why we don't have better defaults. Alternatively, maybe
this doc could suggest --jobs=`nproc` or similar?

> +If you just want to use the defconfig that ships with the kernel, you can
> +append the ``--defconfig`` flag as well:
> +
> +.. code-block:: bash
> +
> +       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=8 --defconfig
> +
> +.. note::
> +       This command is particularly helpful for getting started because it
> +       just works. No kunitconfig needs to be present.
> +

Should we use this in the getting started section below, then?
Particularly since we're already going over kunitconfigs there
separately.

> +For a list of all the flags supported by kunit_tool, you can run:
> +
> +.. code-block:: bash
> +

Do you think it's worth documenting the remaining two (--build_dir and
--raw_output) here too?

> +       ./tools/testing/kunit/kunit.py run --help
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index aeeddfafeea20..1535c4394cfa2 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -21,6 +21,9 @@ The wrapper can be run with:
>
>     ./tools/testing/kunit/kunit.py run
>
> +For more information on this wrapper (also called kunit_tool) checkout the
> +:doc:`kunit-tool` page.
> +
>  Creating a kunitconfig
>  ======================
>  The Python script is a thin wrapper around Kbuild as such, it needs to be
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
