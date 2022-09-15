Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7792BECAAA1
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 15:35:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIOPfA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Sep 2022 11:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiIOPeq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Sep 2022 11:34:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BA3120B6
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 08:34:43 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r186-20020a1c44c3000000b003b494ffc00bso6101wma.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Sep 2022 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9ziUlOSzja4on6ENSVsZ7KZ5gsg1rXUknDDdLHbcpi4=;
        b=RPcsG7QD7LY21zDMUQM2Yn204cjMEVNqRxte7SpqPWdiqnEvcWHSyQYOmVVHNJMEXh
         C+1JIRkZqosisnr204avTsAoMsQQ1o3OJ29406VzPu4AUim8Vhq9NfoIu7IrwAX9Zip3
         o1xLZo+mEUxBaGNm9j5zy5UNRj5+y0p5VQ6EDFFbud5BNwCFu7goLFZXu8FyN0FovrtI
         tRTjI8ysNLHZDHe7aNPcaUnD8OESx7xUARKQy7DLswYxXRhbLbWTsYtwO+OynsnukoCk
         lKYF7JkFGxTsvBwYDjylrIWnxdZ8TxG1T6egb84lhKXWRkjxeMW+9YrSYShK8ZYQvyFP
         9rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9ziUlOSzja4on6ENSVsZ7KZ5gsg1rXUknDDdLHbcpi4=;
        b=VG7P3ymBXH8jrK+EAij+Z6lrAW3YlPFcpP9zNzL5kgJImGbk8WhIIIKPr380fAhahR
         nv7xcIZ7UG1wK0aZIv61hZUVIkXOFymGpyas7Xw0dm5uaWRoXXGk81mHyyb0CYDDL48R
         plxCG+NJc1bXsJLBgmG9+vkqPPg41yM3xcjBsOmuEU+63vMvTUgH4/Xu0cqtNigJdmwU
         TJf2BmbSM10yXkh3CLQ8I5p0DSTEJu9WCKrFWvErtALPZjt/CnX09iWC75LgZef3O1NQ
         B76rLNScH5BHybBMLVnR5NG4bUuWXVkfRaPCnHNEYUrb4Oh2jwBt+8mvBFuu8kkkaQQx
         gKcw==
X-Gm-Message-State: ACgBeo2IYmXuax1V6DlpyaRhMznX2kC8yD3ioRxLejKUiZzza+DPfJ+H
        uBzcmiYlKct7NKv1cNRHAziZ5NKig5SIKA==
X-Google-Smtp-Source: AA6agR6bf9wqUAYeaGSP4+NNc/a1gtCt7Q9rFfPuFdTLr4JQUxbRCoQEY+XWWXR3du+UTfkZRdWgdw==
X-Received: by 2002:a1c:6a0b:0:b0:3b3:3ed4:9bef with SMTP id f11-20020a1c6a0b000000b003b33ed49befmr7516723wmc.84.1663256082159;
        Thu, 15 Sep 2022 08:34:42 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id p10-20020a1c544a000000b003a62052053csm4101096wmi.18.2022.09.15.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:34:40 -0700 (PDT)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Date:   Thu, 15 Sep 2022 17:33:58 +0200
Message-Id: <20220915153358.813993-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Improve readability of kprobetrace documentation by adding markup
(mainly code snippets), fixing some typos and splitting some paragraphs.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 Documentation/trace/kprobetrace.rst | 128 ++++++++++++++--------------
 1 file changed, 66 insertions(+), 62 deletions(-)

diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
index 4274cc6a2f94..d13bf15d6e00 100644
--- a/Documentation/trace/kprobetrace.rst
+++ b/Documentation/trace/kprobetrace.rst
@@ -6,22 +6,22 @@ Kprobe-based Event Tracing
 
 Overview
 --------
-These events are similar to tracepoint based events. Instead of Tracepoint,
+These events are similar to tracepoint-based events. Instead of tracepoints,
 this is based on kprobes (kprobe and kretprobe). So it can probe wherever
 kprobes can probe (this means, all functions except those with
-__kprobes/nokprobe_inline annotation and those marked NOKPROBE_SYMBOL).
-Unlike the Tracepoint based event, this can be added and removed
+``__kprobes``/``nokprobe_inline`` annotation and those marked ``NOKPROBE_SYMBOL``).
+Unlike the tracepoint-based event, this can be added and removed
 dynamically, on the fly.
 
-To enable this feature, build your kernel with CONFIG_KPROBE_EVENTS=y.
+To enable this feature, build your kernel with ``CONFIG_KPROBE_EVENTS=y``.
 
-Similar to the events tracer, this doesn't need to be activated via
-current_tracer. Instead of that, add probe points via
-/sys/kernel/debug/tracing/kprobe_events, and enable it via
-/sys/kernel/debug/tracing/events/kprobes/<EVENT>/enable.
+Similar to the event tracer, this doesn't need to be activated via
+``current_tracer``. Instead of that, add probe points via
+``/sys/kernel/debug/tracing/kprobe_events``, and enable it via
+``/sys/kernel/debug/tracing/events/kprobes/<EVENT>/enable``.
 
-You can also use /sys/kernel/debug/tracing/dynamic_events instead of
-kprobe_events. That interface will provide unified access to other
+You can also use ``/sys/kernel/debug/tracing/dynamic_events`` instead of
+``kprobe_events``. That interface will provide unified access to other
 dynamic events too.
 
 Synopsis of kprobe_events
@@ -68,85 +68,89 @@ Synopsis of kprobe_events
 
 Types
 -----
-Several types are supported for fetch-args. Kprobe tracer will access memory
-by given type. Prefix 's' and 'u' means those types are signed and unsigned
-respectively. 'x' prefix implies it is unsigned. Traced arguments are shown
-in decimal ('s' and 'u') or hexadecimal ('x'). Without type casting, 'x32'
-or 'x64' is used depends on the architecture (e.g. x86-32 uses x32, and
-x86-64 uses x64).
-These value types can be an array. To record array data, you can add '[N]'
+Several types are supported for ``fetchargs``. Kprobe tracer will access memory
+by given type. Prefix ``s`` and ``u`` means those types are signed and unsigned
+respectively. ``x`` prefix implies it is unsigned. Traced arguments are shown
+in decimal (``s`` and ``u``) or hexadecimal (``x``). Without type casting, ``x32``
+or ``x64`` is used depends on the architecture (e.g. x86-32 uses ``x32``, and
+x86-64 uses ``x64``).
+
+These value types can be an array. To record array data, you can add ``[N]``
 (where N is a fixed number, less than 64) to the base type.
-E.g. 'x16[4]' means an array of x16 (2bytes hex) with 4 elements.
-Note that the array can be applied to memory type fetchargs, you can not
-apply it to registers/stack-entries etc. (for example, '$stack1:x8[8]' is
-wrong, but '+8($stack):x8[8]' is OK.)
-String type is a special type, which fetches a "null-terminated" string from
+E.g. ``x16[4]`` means an array of ``x16`` (2-bytes hex) with 4 elements.
+Note that the array can be applied to memory type ``fetchargs``, you can not
+apply it to registers/stack-entries etc. (for example, ``$stack1:x8[8]`` is
+wrong, but ``+8($stack):x8[8]`` is OK.)
+
+``string`` type is a special type, which fetches a "null-terminated" string from
 kernel space. This means it will fail and store NULL if the string container
-has been paged out. "ustring" type is an alternative of string for user-space.
-See :ref:`user_mem_access` for more info..
+has been paged out. ``ustring`` type is an alternative of string for user-space.
+See :ref:`user_mem_access` for more info.
+
 The string array type is a bit different from other types. For other base
-types, <base-type>[1] is equal to <base-type> (e.g. +0(%di):x32[1] is same
-as +0(%di):x32.) But string[1] is not equal to string. The string type itself
+types, ``<base-type>[1]`` is equal to ``<base-type>`` (e.g. ``+0(%di):x32[1]`` is same
+as ``+0(%di):x32``.) But ``string[1]`` is not equal to ``string``. The ``string`` type itself
 represents "char array", but string array type represents "char * array".
-So, for example, +0(%di):string[1] is equal to +0(+0(%di)):string.
+So, for example, ``+0(%di):string[1]`` is equal to ``+0(+0(%di)):string``.
 Bitfield is another special type, which takes 3 parameters, bit-width, bit-
 offset, and container-size (usually 32). The syntax is::
 
  b<bit-width>@<bit-offset>/<container-size>
 
-Symbol type('symbol') is an alias of u32 or u64 type (depends on BITS_PER_LONG)
-which shows given pointer in "symbol+offset" style.
-For $comm, the default type is "string"; any other type is invalid.
+Symbol type('symbol') is an alias of ``u32`` or ``u64`` type (depends on ``BITS_PER_LONG``)
+which shows given pointer in ``symbol+offset`` style.
+
+For ``$comm``, the default type is ``string``; any other type is invalid.
 
 .. _user_mem_access:
 
 User Memory Access
 ------------------
 Kprobe events supports user-space memory access. For that purpose, you can use
-either user-space dereference syntax or 'ustring' type.
+either user-space dereference syntax or ``ustring`` type.
 
 The user-space dereference syntax allows you to access a field of a data
-structure in user-space. This is done by adding the "u" prefix to the
-dereference syntax. For example, +u4(%si) means it will read memory from the
-address in the register %si offset by 4, and the memory is expected to be in
-user-space. You can use this for strings too, e.g. +u0(%si):string will read
-a string from the address in the register %si that is expected to be in user-
-space. 'ustring' is a shortcut way of performing the same task. That is,
-+0(%si):ustring is equivalent to +u0(%si):string.
+structure in user-space. This is done by adding the ``u`` prefix to the
+dereference syntax. For example, ``+u4(%si)`` means it will read memory from the
+address in the register ``%si`` offset by 4, and the memory is expected to be in
+user-space. You can use this for strings too, e.g. ``+u0(%si):string`` will read
+a string from the address in the register ``%si`` that is expected to be in user-
+space. ``ustring`` is a shortcut way of performing the same task. That is,
+``+0(%si):ustring`` is equivalent to ``+u0(%si):string``.
 
 Note that kprobe-event provides the user-memory access syntax but it doesn't
 use it transparently. This means if you use normal dereference or string type
-for user memory, it might fail, and may always fail on some archs. The user
+for user memory, it might fail, and may always fail on some architectures. The user
 has to carefully check if the target data is in kernel or user space.
 
 Per-Probe Event Filtering
 -------------------------
 Per-probe event filtering feature allows you to set different filter on each
 probe and gives you what arguments will be shown in trace buffer. If an event
-name is specified right after 'p:' or 'r:' in kprobe_events, it adds an event
-under tracing/events/kprobes/<EVENT>, at the directory you can see 'id',
-'enable', 'format', 'filter' and 'trigger'.
+name is specified right after ``p:`` or ``r:`` in ``kprobe_events``, it adds an event
+under ``tracing/events/kprobes/<EVENT>``, at the directory you can see ``id``,
+``enable``, ``format``, ``filter`` and ``trigger``.
 
-enable:
+``enable``:
   You can enable/disable the probe by writing 1 or 0 on it.
 
-format:
+``format``:
   This shows the format of this probe event.
 
-filter:
+``filter``:
   You can write filtering rules of this event.
 
-id:
+``id``:
   This shows the id of this probe event.
 
-trigger:
+``trigger``:
   This allows to install trigger commands which are executed when the event is
-  hit (for details, see Documentation/trace/events.rst, section 6).
+  hit (for details, see ``Documentation/trace/events.rst``, section 6).
 
 Event Profiling
 ---------------
 You can check the total number of probe hits and probe miss-hits via
-/sys/kernel/debug/tracing/kprobe_profile.
+``/sys/kernel/debug/tracing/kprobe_profile``.
 The first column is event name, the second is the number of probe hits,
 the third is the number of probe miss-hits.
 
@@ -156,11 +160,11 @@ You can add and enable new kprobe events when booting up the kernel by
 "kprobe_event=" parameter. The parameter accepts a semicolon-delimited
 kprobe events, which format is similar to the kprobe_events.
 The difference is that the probe definition parameters are comma-delimited
-instead of space. For example, adding myprobe event on do_sys_open like below
+instead of space. For example, adding myprobe event on do_sys_open like below::
 
   p:myprobe do_sys_open dfd=%ax filename=%dx flags=%cx mode=+4($stack)
 
-should be below for kernel boot parameter (just replace spaces with comma)
+should be below for kernel boot parameter (just replace spaces with comma)::
 
   p:myprobe,do_sys_open,dfd=%ax,filename=%dx,flags=%cx,mode=+4($stack)
 
@@ -172,20 +176,20 @@ as below::
 
   echo 'p:myprobe do_sys_open dfd=%ax filename=%dx flags=%cx mode=+4($stack)' > /sys/kernel/debug/tracing/kprobe_events
 
-This sets a kprobe on the top of do_sys_open() function with recording
-1st to 4th arguments as "myprobe" event. Note, which register/stack entry is
+This sets a kprobe on the top of ``do_sys_open()`` function with recording
+1st to 4th arguments as ``myprobe`` event. Note, which register/stack entry is
 assigned to each function argument depends on arch-specific ABI. If you unsure
-the ABI, please try to use probe subcommand of perf-tools (you can find it
-under tools/perf/).
+the ABI, please try to use ``probe`` subcommand of ``perf-tools`` (you can find it
+under ``tools/perf/``).
 As this example shows, users can choose more familiar names for each arguments.
 ::
 
   echo 'r:myretprobe do_sys_open $retval' >> /sys/kernel/debug/tracing/kprobe_events
 
-This sets a kretprobe on the return point of do_sys_open() function with
-recording return value as "myretprobe" event.
+This sets a kretprobe on the return point of ``do_sys_open()`` function with
+recording return value as ``myretprobe`` event.
 You can see the format of these events via
-/sys/kernel/debug/tracing/events/kprobes/<EVENT>/format.
+``/sys/kernel/debug/tracing/events/kprobes/<EVENT>/format``.
 ::
 
   cat /sys/kernel/debug/tracing/events/kprobes/myprobe/format
@@ -236,7 +240,7 @@ Use the following command to start tracing in an interval.
     Open something...
     # echo 0 > tracing_on
 
-And you can see the traced information via /sys/kernel/debug/tracing/trace.
+And you can see the traced information via ``/sys/kernel/debug/tracing/trace``.
 ::
 
   cat /sys/kernel/debug/tracing/trace
@@ -252,6 +256,6 @@ And you can see the traced information via /sys/kernel/debug/tracing/trace.
              <...>-1447  [001] 1038282.286976: myretprobe: (sys_open+0x1b/0x1d <- do_sys_open) $retval=3
 
 
-Each line shows when the kernel hits an event, and <- SYMBOL means kernel
-returns from SYMBOL(e.g. "sys_open+0x1b/0x1d <- do_sys_open" means kernel
-returns from do_sys_open to sys_open+0x1b).
+Each line shows when the kernel hits an event, and ``<- SYMBOL`` means kernel
+returns from ``SYMBOL`` (e.g. ``sys_open+0x1b/0x1d <- do_sys_open`` means kernel
+returns from ``do_sys_open`` to ``sys_open+0x1b``).
-- 
2.30.2

