Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF1DC0015E
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jul 2023 05:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjGQFNc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jul 2023 01:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjGQFNa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 01:13:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C21AE6A
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689570762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XpPl7D+YyowuSTqvPnZdoj0YXyM0k/RzKfcV3mHh1uY=;
        b=Wmrn3HLJbC794iKAMYXG1277wJyUCtLyelgT1tZIzjcczL3lMv8gvurrNA1iIScpmcQDbj
        FiKPWN2NIOhWTzt/+52pqh9K7ndoEWIWkmSaXaVX+DbxmWXw+YzC2R1fU+cjDjSXog8RTa
        Gsfm8cxMcliMO31c0FhfHh1nGBGiVKI=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-vRqqIB4wPBa-asGkpC47Jw-1; Mon, 17 Jul 2023 01:12:39 -0400
X-MC-Unique: vRqqIB4wPBa-asGkpC47Jw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-187959a901eso6660960fac.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 22:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689570758; x=1692162758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpPl7D+YyowuSTqvPnZdoj0YXyM0k/RzKfcV3mHh1uY=;
        b=W87OBOStis8NUV3X7H+bHefOe429n78pWf+P6QB+mdg4upxrPYnWQZW/XpCI68UyxD
         RW3twkzfhDuNtmca8C4CGRIsZADZvItVF8nk/9daCAFKCrTAQnu0MA1Yt5N3wAhBeNd5
         8+Gb5rKFaV+fr15M2nZ8mU5cQZwGGJ7J6hUzvapuiBZnV7qkU5Fyr+IPSPtvb1RXd/aC
         uwEbHH4JsurvXPOU3biMxKgSnBJfdtZSk/+DOV3iGaz/1at87wx5E+HaVmdSLT6qWEWb
         3o95VEY5pecOG4vYLbe6bE/7t3WHe8e/ZmTR03GQoNQQochEheWo7BZ9p7doPTgK9iZd
         xO0Q==
X-Gm-Message-State: ABy/qLYDPq9hxRtcCyHwVxlSln/7Xt5hD7W4traOUoUSWszH9UywD12n
        XGJVww8inHo7awf//ajfeNv9B3/iHT8cPF8pDJZz9bXT9KQYg33ja0+VffH21drni4K1tZIEfmU
        3YAsQ7Q/0Deqhob/jCHh7B5zi0jVxWAu+F4jBANW9zTVbCAs=
X-Received: by 2002:a05:6870:2d4:b0:1b3:ec6b:b264 with SMTP id r20-20020a05687002d400b001b3ec6bb264mr12384794oaf.5.1689570758677;
        Sun, 16 Jul 2023 22:12:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEhv8PmsM82bP4te8cHd92PfJoaIOIdUOnlQPVX0Ctase4wozNPYJ1aosaCxbjVD/0Z0bfNV4Aof5r+kG80NEQ=
X-Received: by 2002:a05:6870:2d4:b0:1b3:ec6b:b264 with SMTP id
 r20-20020a05687002d400b001b3ec6bb264mr12384786oaf.5.1689570758330; Sun, 16
 Jul 2023 22:12:38 -0700 (PDT)
MIME-Version: 1.0
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Mon, 17 Jul 2023 08:12:27 +0300
Message-ID: <CADDUTFyArtN--_27xLWpqnBM2e_udmL+E6Ka7KgimTUOguWthg@mail.gmail.com>
Subject: confusing changes in the documentation table of contents
To:     linux-doc@vger.kernel.org, kernelnewbies@kernelnewbies.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

In https://www.kernel.org/doc/html/v6.2/ Table of Contents consisted
of 10 items. It was compact, organized and observable:

The Linux Kernel documentation
- Working with the development community
- Internal API manuals
- Development tools and processes
- User-oriented documentation
- Firmware-related documentation
- Architecture-specific documentation
- Other documentation
- Translations
Indices and tables

Since  https://www.kernel.org/doc/html/v6.3/ it consists of 60+ items.
Now it is long, unorganized and unobservable:

A guide to the Kernel Development Process
Submitting patches: the essential guide to getting your code into the kerne=
l
Code of conduct
Kernel Maintainer Handbook
All development-process docs

Linux kernel licensing rules
HOWTO do Linux kernel development
Contributor Covenant Code of Conduct
Linux Kernel Contributor Covenant Code of Conduct Interpretation
A guide to the Kernel Development Process
Submitting patches: the essential guide to getting your code into the kerne=
l
Handling regressions
Programming Language
Linux kernel coding style
Subsystem and maintainer tree specific development process notes
Kernel Maintainer PGP guide
Email clients info for Linux
Linux Kernel Enforcement Statement
Kernel Driver Statement
Security bugs
Embargoed hardware issues
Minimal requirements to compile the Kernel
The Linux Kernel Driver Interface
Linux kernel management style
Everything you ever wanted to know about Linux -stable releases
Linux Kernel patch submission checklist
Index of Further Kernel Documentation
Deprecated Interfaces, Language Features, Attributes, and Conventions
List of maintainers and how to submit kernel changes
Researcher Guidelines
Applying Patches To The Linux Kernel
Adding a New System Call
Linux magic numbers
Why the =E2=80=9Cvolatile=E2=80=9D type class should not be used
(How to avoid) Botching up ioctls
clang-format
arch/riscv maintenance guidelines for developers
Unaligned Memory Accesses

Core API Documentation
Driver implementer=E2=80=99s API guide
Kernel subsystem documentation
Locking in the kernel

Linux kernel licensing rules
How to write kernel documentation
Development tools for the kernel
Kernel Testing Guide
Kernel Hacking Guides
Linux Tracing Technologies
fault-injection
Kernel Livepatching
Rust

The Linux kernel user=E2=80=99s and administrator=E2=80=99s guide
The kernel build system
Reporting issues
User-space tools
The Linux kernel user-space API guide

The Linux kernel firmware guide
Open Firmware and Devicetree

CPU Architectures

Unsorted Documentation

Questions:
- Why?
- What are further plans?
- What to do?

Thanks,
Costa

