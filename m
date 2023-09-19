Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC3CCD5BBD
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 13:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbjISNoP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 09:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbjISNny (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 09:43:54 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A665DE75
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 06:43:01 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-65627d499e1so25569256d6.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695130980; x=1695735780; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMlnkrwj3wlCF+Jb6rf6z2cdXhhcVQub12RMSixV2mg=;
        b=wLFeHrI3TrwRyQdBLhIa4RgSjhsyLGRIwMvA8m1mui16aOwfF0FBZFxkTsM2hvGm4z
         P5Z1cdzQ/oILQaf1J++YWr1HvGG05ehv8+lLOhtsd6ente2vsdAJPA2du3K+K+pyxkzl
         XA/hR+W2s2s2OAnh0VA2K2XEtl3HUih7eNa7zI9UQpe9X+DyMcX3v6id+BSDdu6W7T4V
         eQ//YI4mpR52FhF4u90Pj+qe+gde0aECCN68GPNSw8ls7Blas5RT6ZgmyaUFIZaaJzOD
         CqblEW5QGxvXuiMd+i83ucflKhXTW7G3zIXDWCI/miNqw/fBpsHPBF6VnyRgJzbXMs4r
         /sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695130980; x=1695735780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMlnkrwj3wlCF+Jb6rf6z2cdXhhcVQub12RMSixV2mg=;
        b=T0tm8XR+CoZW6tbexhvzGy5Fl33V1C+ZhPOZYRDgMMUbTyFjjNik38nYRgv+A7t3bf
         Pl7RESaM+egXMNI2O0a4Y5QdWw8FGv5ktDwK6rr/hAZ+OP00Y5cxjdHi+OxF1pSMwgAs
         EjuF06C4yD5/+p23k0JG8LFDKlMxK3RonbCuvxFMNj9vdSN6IdD2zccIZL25R/D0UgM4
         YSEK59u68krkrH4W0djPMEOdDidOLiHCNw1SoYF2XDPLe3MhiZ0jS0KD6B1sZnD2RgA7
         cFGRyewf3NazDWbnCAUcYUWrlJD43oweIuSa44va/Qx5WZyKbyYXyhb0TULo7yKN+MPx
         /+wQ==
X-Gm-Message-State: AOJu0YyqVRyYgBSS5SNpH6su0XKMQ2kPCMrBipyL6VyoMx0O7gcdpx1g
        o7gK9q8nQQXZ08qNeDbjgDhHi/51aNVDhj1RfUMbaw==
X-Google-Smtp-Source: AGHT+IEBV3N8+n/NZSfgTWS93NUWWOWhyAOuBw19vOjva0Icj9fEk+JQoETUIyeMKRf77QWVoAC03ml2/2E73G6yHRA=
X-Received: by 2002:a0c:b384:0:b0:64f:8d4c:1c0b with SMTP id
 t4-20020a0cb384000000b0064f8d4c1c0bmr11206027qve.43.1695130980241; Tue, 19
 Sep 2023 06:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230915105933.495735-1-matteorizzo@google.com>
 <7a4f5128-28fd-3c5f-34c2-1c34f4448174@intel.com> <1d7573c0-ebbc-6ed2-f152-1045eb0542f9@os.amperecomputing.com>
 <CAHKB1w+rVyww0UrHhzeGfPA7FM482Z-7ApzXvekVqLHvTDAV3Q@mail.gmail.com> <ZQiLX0W2Tcr+wdJT@gmail.com>
In-Reply-To: <ZQiLX0W2Tcr+wdJT@gmail.com>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Tue, 19 Sep 2023 15:42:47 +0200
Message-ID: <CAHKB1wKneke-dyvMY0JtW-xwW8m=GaUdafoAqdCE0B9csY7_bw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/14] Prevent cross-cache attacks in the SLUB allocator
To:     Ingo Molnar <mingo@kernel.org>
Cc:     "Lameter, Christopher" <cl@os.amperecomputing.com>,
        Dave Hansen <dave.hansen@intel.com>, penberg@kernel.org,
        rientjes@google.com, iamjoonsoo.kim@lge.com,
        akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-hardening@vger.kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, corbet@lwn.net, luto@kernel.org,
        peterz@infradead.org, jannh@google.com, evn@google.com,
        poprdi@google.com, jordyzomer@google.com,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Sept 2023 at 19:39, Ingo Molnar <mingo@kernel.org> wrote:
>
> What's the split of the increase in overhead due to SLAB_VIRTUAL=y, between
> user-space execution and kernel-space execution?
>

Same benchmark as before (compiling a kernel on a system running the patched
kernel):

Intel Skylake:

      LABEL    | COUNT |   MIN    |   MAX    |   MEAN   |  MEDIAN  | STDDEV
---------------+-------+----------+----------+----------+----------+--------
wall clock     |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 49.700   | 51.320   | 50.449   | 50.430   | 0.29959
SLAB_VIRTUAL=y | 150   | 50.020   | 51.660   | 50.880   | 50.880   | 0.30495
               |       | +0.64%   | +0.66%   | +0.85%   | +0.89%   | +1.79%
system time    |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 358.560  | 362.900  | 360.922  | 360.985  | 0.91761
SLAB_VIRTUAL=y | 150   | 362.970  | 367.970  | 366.062  | 366.115  | 1.015
               |       | +1.23%   | +1.40%   | +1.42%   | +1.42%   | +10.60%
user time      |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 3110.000 | 3124.520 | 3118.143 | 3118.120 | 2.466
SLAB_VIRTUAL=y | 150   | 3115.070 | 3127.070 | 3120.762 | 3120.925 | 2.654
               |       | +0.16%   | +0.08%   | +0.08%   | +0.09%   | +7.63%

AMD Milan:

      LABEL    | COUNT |   MIN    |   MAX    |   MEAN   |  MEDIAN  | STDDEV
---------------+-------+----------+----------+----------+----------+--------
wall clock     |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 25.480   | 26.550   | 26.065   | 26.055   | 0.23495
SLAB_VIRTUAL=y | 150   | 25.820   | 27.080   | 26.531   | 26.540   | 0.25974
               |       | +1.33%   | +2.00%   | +1.79%   | +1.86%   | +10.55%
system time    |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 478.530  | 540.420  | 520.803  | 521.485  | 9.166
SLAB_VIRTUAL=y | 150   | 530.520  | 572.460  | 552.825  | 552.985  | 7.161
               |       | +10.86%  | +5.93%   | +6.15%   | +6.04%   | -21.88%
user time      |       |          |          |          |          |
SLAB_VIRTUAL=n | 150   | 2373.540 | 2403.800 | 2386.343 | 2385.840 | 5.325
SLAB_VIRTUAL=y | 150   | 2388.690 | 2426.290 | 2408.325 | 2408.895 | 6.667
               |       | +0.64%   | +0.94%   | +0.92%   | +0.97%   | +25.20%


I'm not exactly sure why user time increases by almost 1% on Milan, it could be
TLB contention.

--
Matteo
