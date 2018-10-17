Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E8357D082
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Oct 2018 23:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbeJRHnl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Oct 2018 03:43:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39209 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbeJRHnl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Oct 2018 03:43:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id c25-v6so13950981pfe.6
        for <linux-doc@vger.kernel.org>; Wed, 17 Oct 2018 16:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NeBusob0P0hREnODFcEm5DgzPAfAIIHp6IjRZdnNmsI=;
        b=VkG4F5TXQZzh/c/Ayy0glPosEPpzzRps0QXXaFiw0qWJjtBd/1jBmLrrZww63tqIjm
         Y3sXanmoMsnlJac0qHf7GGMEIgNYJlcfl2X0mX14LfLmZPc7JduQ/FjRQoUX6TjaXY5R
         W6L9vHScC8ys8hwjlwBAGNVqJmsDLL1YJRVZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NeBusob0P0hREnODFcEm5DgzPAfAIIHp6IjRZdnNmsI=;
        b=D0/keN6mY9aHvtyIVgFXHl1GqKwVxa9TfdBQ6LbHK1rbPilGmb3oTJ66MKrIPFzHf6
         4NifByWt+9/mLyDKkGcFbmotu9HEeU48x0cETc5sZrS0KTt00dZfW9iPsdZpcT7HK53i
         fuJ0ywQWMOeUABFKnnFbsYZ+CYHmxnaOqONvU5ixq9BJSxYh6bzCdvyyU+y0LTAiiW41
         apfk6/NIi+qB5EhBbN+SaIMhpUr4o8Mw5pC2k4Iz/x+YhSmv+LVL0MkjFijunOctUP3E
         CREiwGfOeqL+3/L3jCGgPApKkR2SCwEIxkhijLfGoVqEwj3XNGDvNw2Fypo9hyOyPG2T
         6pIg==
X-Gm-Message-State: ABuFfogi92D+tacA08CDnl3yjm9yP9Cxjra67C4raOrxMZ0q5qU+vwEh
        b9qjL3XDeMbMbrnauJD08qtefg==
X-Google-Smtp-Source: ACcGV63DPuWZZm4kEHjlHm2eArg1drWxt6TuThSuC942JzBlHNdUO7hvZ7Re3yxZ27Abt28sc2SflA==
X-Received: by 2002:a63:5509:: with SMTP id j9-v6mr25852577pgb.208.1539819934531;
        Wed, 17 Oct 2018 16:45:34 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id o12-v6sm20478467pgv.7.2018.10.17.16.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Oct 2018 16:45:33 -0700 (PDT)
Date:   Wed, 17 Oct 2018 16:45:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] docs: Introduce deprecated APIs list
Message-ID: <20181017234532.GA26162@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As discussed in the "API replacement/deprecation" thread[1], this makes
an effort to document what things shouldn't get (re)added to the kernel,
by introducing Documentation/process/deprecated.rst.

[1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2018-September/005282.html

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: drop overflow.h hack, try to clarify open-coded math description
---
 Documentation/driver-api/basics.rst  |   3 +
 Documentation/process/deprecated.rst | 119 +++++++++++++++++++++++++++
 Documentation/process/index.rst      |   1 +
 3 files changed, 123 insertions(+)
 create mode 100644 Documentation/process/deprecated.rst

diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 826e85d50a16..e970fadf4d1a 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -121,6 +121,9 @@ Kernel utility functions
 .. kernel-doc:: kernel/rcu/update.c
    :export:
 
+.. kernel-doc:: include/linux/overflow.h
+   :internal:
+
 Device Resource Management
 --------------------------
 
diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
new file mode 100644
index 000000000000..0ef5a63c06ba
--- /dev/null
+++ b/Documentation/process/deprecated.rst
@@ -0,0 +1,119 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================================================
+Deprecated Interfaces, Language Features, Attributes, and Conventions
+=====================================================================
+
+In a perfect world, it would be possible to convert all instances of
+some deprecated API into the new API and entirely remove the old API in
+a single development cycle. However, due to the size of the kernel, the
+maintainership hierarchy, and timing, it's not always feasible to do these
+kinds of conversions at once. This means that new instances may sneak into
+the kernel while old ones are being removed, only making the amount of
+work to remove the API grow. In order to educate developers about what
+has been deprecated and why, this list has been created as a place to
+point when uses of deprecated things are proposed for inclusion in the
+kernel.
+
+__deprecated
+------------
+While this attribute does visually mark an interface as deprecated,
+it `does not produce warnings during builds any more
+<https://git.kernel.org/linus/771c035372a036f83353eef46dbb829780330234>`_
+because one of the standing goals of the kernel is to build without
+warnings and no one was actually doing anything to remove these deprecated
+interfaces. While using `__deprecated` is nice to note an old API in
+a header file, it isn't the full solution. Such interfaces must either
+be fully removed from the kernel, or added to this file to discourage
+others from using them in the future.
+
+open-coded arithmetic in allocator arguments
+--------------------------------------------
+Dynamic size calculations (especially multiplication) should not be
+performed in memory allocator (or similar) function arguments due to the
+risk of them overflowing. This could lead to values wrapping around and a
+smaller allocation being made than the caller was expecting. Using those
+allocations could lead to linear overflows of heap memory and other
+misbehaviors. (One exception to this is literal values where the compiler
+can warn if they might overflow. Though using literals for arguments as
+suggested below is also harmless.)
+
+For example, do not use ``count * size`` as an argument, as in::
+
+	foo = kmalloc(count * size, GFP_KERNEL);
+
+Instead, the 2-factor form of the allocator should be used::
+
+	foo = kmalloc_array(count, size, GFP_KERNEL);
+
+If no 2-factor form is available, the saturate-on-overflow helpers should
+be used::
+
+	bar = vmalloc(array_size(count, size));
+
+Another common case to avoid is calculating the size of a structure with
+a trailing array of others structures, as in::
+
+	header = kzalloc(sizeof(*header) + count * sizeof(*header->item),
+			 GFP_KERNEL);
+
+Instead, use the helper::
+
+	header = kzalloc(struct_size(header, item, count), GFP_KERNEL);
+
+See :c:func:`array_size`, :c:func:`array3_size`, and :c:func:`struct_size`,
+for more details as well as the related :c:func:`check_add_overflow` and
+:c:func:`check_mul_overflow` family of functions.
+
+simple_strtol(), simple_strtoll(), simple_strtoul(), simple_strtoull()
+----------------------------------------------------------------------
+The :c:func:`simple_strtol`, :c:func:`simple_strtoll`,
+:c:func:`simple_strtoul`, and :c:func:`simple_strtoull` functions
+explicitly ignore overflows, which may lead to unexpected results
+in callers. The respective :c:func:`kstrtol`, :c:func:`kstrtoll`,
+:c:func:`kstrtoul`, and :c:func:`kstrtoull` functions tend to be the
+correct replacements, though note that those require the string to be
+NUL or newline terminated.
+
+strcpy()
+--------
+:c:func:`strcpy` performs no bounds checking on the destination
+buffer. This could result in linear overflows beyond the
+end of the buffer, leading to all kinds of misbehaviors. While
+`CONFIG_FORTIFY_SOURCE=y` and various compiler flags help reduce the
+risk of using this function, there is no good reason to add new uses of
+this function. The safe replacement is :c:func:`strscpy`.
+
+strncpy() on NUL-terminated strings
+-----------------------------------
+Use of :c:func:`strncpy` does not guarantee that the destination buffer
+will be NUL terminated. This can lead to various linear read overflows
+and other misbehavior due to the missing termination. It also NUL-pads the
+destination buffer if the source contents are shorter than the destination
+buffer size, which may be a needless performance penalty for callers using
+only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
+(Users of :c:func:`strscpy` still needing NUL-padding will need an
+explicit :c:func:`memset` added.)
+
+If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
+still be used, but destinations should be marked with the `__nonstring
+<https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>`_
+attribute to avoid future compiler warnings.
+
+strlcpy()
+---------
+:c:func:`strlcpy` reads the entire source buffer first, possibly exceeding
+the given limit of bytes to copy. This is inefficient and can lead to
+linear read overflows if a source string is not NUL-terminated. The
+safe replacement is :c:func:`strscpy`.
+
+Variable Length Arrays (VLAs)
+-----------------------------
+Using stack VLAs produces much worse machine code than statically
+sized stack arrays. While these non-trivial `performance issues
+<https://git.kernel.org/linus/02361bc77888>`_ are reason enough to
+eliminate VLAs, they are also a security risk. Dynamic growth of a stack
+array may exceed the remaining memory in the stack segment. This could
+lead to a crash, possible overwriting sensitive contents at the end of the
+stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
+memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index 9ae3e317bddf..b4de2c682255 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -41,6 +41,7 @@ Other guides to the community that are of interest to most developers are:
    stable-kernel-rules
    submit-checklist
    kernel-docs
+   deprecated
 
 These are some overall technical guides that have been put here for now for
 lack of a better place.
-- 
2.17.1


-- 
Kees Cook
Pixel Security
