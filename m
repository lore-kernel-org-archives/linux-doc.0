Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDDDC636CC
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 10:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbjBOKXs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 05:23:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbjBOKXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 05:23:46 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBF237B63
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 02:23:44 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id e17so10930329plg.12
        for <linux-doc@vger.kernel.org>; Wed, 15 Feb 2023 02:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQoLCMRrgpMqdQtXehI+d4Noij4Rs7C70l/9+OAHSdg=;
        b=L0STun1EpiPEHohQsL325JE5xmQSY2wGtHffC6myoN37DOHB5Rp4nwcG0u3C3kJ9wl
         4FHbb0Nx0PI9Ix3YNmOXFb4yZrtuzldsxn90dkTOBeBS0V7UdgKBCzm8nzUYeQcNcTXn
         b/hZT2KrjKy11O7qIiViGvc3oEWihedL6uITJCu+vtfW3SQki5GjJL2l7NjLz4klCI4u
         C2GPUKB5SisIb6t0p/uURomthD0vK4a1lWfWA5Z7VvLoHy/++ey+coEDYVmM6ZP/3rY/
         /ENaRRW9f1nLm4xFKkQpsdwuXCGcOxRvohjmdYlM/Mo96M5zfrt4w5xfIO33xXZ4DfeX
         juVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQoLCMRrgpMqdQtXehI+d4Noij4Rs7C70l/9+OAHSdg=;
        b=iMExotMuq8KEdzd0hA/2Hv5aJ1iEHKZrn76lofrc2ScCwwKG1tgrE55eEMZJzME1cP
         FWPxRTUfAQds2MAH1vl630zTz4VtueJwzYCWKvhuCz1QUe5aqPKvdT0vkhGJIpP5AsA1
         jkM68dxL0ItjefY/jUx4r1HkK1bc0lyF9rqPzlZ8Tq2zDEJem4lwlE1ClYdLWm4kjRV/
         ECAFzQ4uU6z/T+xiKDNpa7ujfJWCi5G093T8pBT54xM0BRYAulGSbm6C2fTluluShwp5
         cc0UPySg6d/OBrVq6puxx01WFjyPuykAz6k2Uy6G8nIU5k934C1gyIrQMm5lwVe0BKiv
         QuEw==
X-Gm-Message-State: AO0yUKUtVrp8BktF63C3M1IANNp8yJQ2RBwjhu/Qo8iF6HlJwOYEukWd
        1heQwImt9bIlCDLCAlVTeM8=
X-Google-Smtp-Source: AK7set9VDNezm/062jp7ZhIwXFdCMv8+cYIwVI2waOCm287WKUCwTkj/8sV8nfAzdYQ5HHODEtqOsw==
X-Received: by 2002:a17:90b:1a92:b0:234:248c:9830 with SMTP id ng18-20020a17090b1a9200b00234248c9830mr2343816pjb.12.1676456623735;
        Wed, 15 Feb 2023 02:23:43 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id o20-20020a17090ac09400b00233bab35b57sm1126941pjs.29.2023.02.15.02.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 02:23:43 -0800 (PST)
Message-ID: <f242e068-2126-c67e-c894-7a1727b1d2b7@gmail.com>
Date:   Wed, 15 Feb 2023 19:23:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To:     corbet@lwn.net, rdunlap@infradead.org
Cc:     akiyks@gmail.com, davidgow@google.com, linux-doc@vger.kernel.org,
        sadiyakazi@google.com
References: <874jroksgq.fsf@meer.lwn.net>
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <874jroksgq.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Tue, 14 Feb 2023 11:33:09 -0700, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
>=20
>> Is there a reason that the main index's "sections" (single underline)
>> don't show up in the sidebar index?  Is that on purpose?
>> Or just a relic of them being "sections"?
>=20
> That's just how the sidebar gets generated.  I would much rather see th=
e
> sections there...but if we want that, I think we'll have to implement i=
t
> ourselves.

I'd say that the reason why you don't see sections of the main index in
the sidebar is because the main index.rst *isn't* listed in any of
"toctree" directives.

So, if you want those "sections" in the sidebar, you need to create
a .rst file and list it in a toctree of main index.

The RTD theme has exactly the same behavior ever since commit
0c7b4366f1ab ("docs: Rewrite the front page").
Furthermore, as there are quite a few pages which belong to multiple
toctrees, sidebar sometimes behaves weirdly.

For example, see the sidebar at:

   https://www.kernel.org/doc/html/next/process/submitting-patches.html
                                         (built on current linux-next)

You will see that the "Submitting patches ..." title is expanded
twice in the sidebar.

Don't you think this looks weird? ;-)

I think the patch appended below (on top of current docs-next)
would have been a better approach, where each .rst file is listed
only once in the whole toctree. The refurbished part of main index
is moved to index-frequent.rst and toctrees are replaced with
lists of :doc: references.

Per-directory indexes are listed in the main index's toctree
below the index-frequent.

I'm not saying this is "the" right approach.
There can be many ways to accomplish the same result, I suppose.

I'll submit this change as a proper patch if I can get positive
feedback.

Hope this helps.

        Thanks, Akira

------------------
diff --git a/Documentation/index-frequent.rst b/Documentation/index-frequ=
ent.rst
new file mode 100644
index 000000000000..5d412be69196
--- /dev/null
+++ b/Documentation/index-frequent.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+Frequently Referenced Documents
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+This is a list of links to kernel documents which would help
+(prospective) kernel developers most.
+
+Working with the development community
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The essential guides for interacting with the kernel's development
+community and getting your work upstream.
+
+ * process/development-process.rst
+ * process/submitting-patches.rst
+ * :doc:`Code of condust <process/code-of-conduct>`
+ * maintainer/index.rst
+ * :doc:`All development-process docs <process/index>`
+
+
+Internal API manuals
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Manuals for use by developers working to interface with the rest of the
+kernel.
+
+ * core-api/index.rst
+ * driver-api/index.rst
+ * subsystems-apis/index.rst
+ * :doc:`Locking in the kernel <locking/index>`
+
+
+Development tools and processes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+Various other manuals with useful information for all kernel developers.=

+
+ * process/license-rules.rst
+ * doc-guide/index.rst
+ * dev-tools/index.rst
+ * dev-tools/testing-overview.rst
+ * kernel-hacking/index.rst
+ * trace/index.rst
+ * fault-injection/index.rst
+ * livepatch/index.rst
+ * rust/index.rst
+
+
+User-oriented documentation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The following manuals are written for *users* of the kernel =E2=80=94 th=
ose who are
+trying to get it to work optimally on a given system and application
+developers seeking information on the kernel's user-space APIs.
+
+ * admin-guide/index.rst
+ * :doc:`The kernel build system <kbuild/index>`
+ * admin-guide/reporting-issues.rst
+ * :doc:`User-space tools <tools/index>`
+ *  userspace-api/index.rst
+
+See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_=
,
+which are kept separately from the kernel's own documentation.
+
+
+Firmware-related documentation
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+The following holds information on the kernel's expectations regarding t=
he
+platform firmwares.
+
+ * firmware-guide/index.rst
+ * devicetree/index.rst
diff --git a/Documentation/index.rst b/Documentation/index.rst
index bf6aa681c960..a50681452fab 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -12,86 +12,41 @@ documents into a coherent whole.  Please note that im=
provements to the
 documentation are welcome; join the linux-doc list at vger.kernel.org if=

 you want to help out.
=20
-Working with the development community
---------------------------------------
-
-The essential guides for interacting with the kernel's development
-community and getting your work upstream.
-
 .. toctree::
-   :maxdepth: 1
-
-   process/development-process
-   process/submitting-patches
-   Code of conduct <process/code-of-conduct>
-   maintainer/index
-   All development-process docs <process/index>
+   :maxdepth: 2
=20
+   index-frequent
=20
-Internal API manuals
---------------------
=20
-Manuals for use by developers working to interface with the rest of the
-kernel.
+Per-subdirectory documents (referenced from above)
+--------------------------------------------------
=20
 .. toctree::
    :maxdepth: 1
=20
+   process/index
+   maintainer/index
    core-api/index
    driver-api/index
    subsystem-apis
-   Locking in the kernel <locking/index>
-
-Development tools and processes
--------------------------------
-
-Various other manuals with useful information for all kernel developers.=

-
-.. toctree::
-   :maxdepth: 1
+   locking/index
=20
-   process/license-rules
    doc-guide/index
    dev-tools/index
-   dev-tools/testing-overview
    kernel-hacking/index
    trace/index
    fault-injection/index
    livepatch/index
    rust/index
=20
-
-User-oriented documentation
----------------------------
-
-The following manuals are written for *users* of the kernel =E2=80=94 th=
ose who are
-trying to get it to work optimally on a given system and application
-developers seeking information on the kernel's user-space APIs.
-
-.. toctree::
-   :maxdepth: 1
-
    admin-guide/index
-   The kernel build system <kbuild/index>
-   admin-guide/reporting-issues.rst
-   User-space tools <tools/index>
+   kbuild/index
+   tools/index
    userspace-api/index
=20
-See also: the `Linux man pages <https://www.kernel.org/doc/man-pages/>`_=
,
-which are kept separately from the kernel's own documentation.
-
-Firmware-related documentation
-------------------------------
-The following holds information on the kernel's expectations regarding t=
he
-platform firmwares.
-
-.. toctree::
-   :maxdepth: 1
-
    firmware-guide/index
    devicetree/index
=20
-
 Architecture-specific documentation
 -----------------------------------
=20
@@ -123,6 +78,6 @@ Translations
    translations/index
=20
 Indices and tables
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+------------------
=20
 * :ref:`genindex`
--=20
