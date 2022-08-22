Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 477ADC28D13
	for <linux-doc@archiver.kernel.org>; Mon, 22 Aug 2022 21:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238179AbiHVVht (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Aug 2022 17:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238183AbiHVVhq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 17:37:46 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DDC558DD
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 14:37:44 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id n4so14748102wrp.10
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=9ziUlOSzja4on6ENSVsZ7KZ5gsg1rXUknDDdLHbcpi4=;
        b=Bgpalr8/AEyT4dsLaxcxsVK4lHbw4v551+GBt6qlmpK7MvcXQhU6WnObddHB/HtJ2D
         Jv75ky5C5wMsVfJdk5a9lUMmGh15pzhxNbO7EMj9xfNeQPREOnbyYLDjPbNzZz7W0cRX
         NtHZ/OYZuAZkAi4NV+vT108Sfp8ifReVWpXoSIE025mfoM2vBTiHMm/WznbImJE/3FJp
         qIC6reCMwUvwBY9DQnd9sGFKRE6b1Iet56ffAzdxF9JdN4nnbcHr1rYSOAlJVV47lVJ8
         /a8I+PmASeU490/Xwb5xPnZRANSWTzZ6lIPu2RTWtsA93RHJXToyPoSpa3OZp4mMEAIg
         21ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=9ziUlOSzja4on6ENSVsZ7KZ5gsg1rXUknDDdLHbcpi4=;
        b=Cx5xaePrXv8ktgPPmMnYkTX1nfLA/kTBIt1zDDp4OK34kZcqgYm8/efp7Jt9AxPXD/
         M8oJ8Fl5b0xY5MbFaaiI5hgplRU0a+XN2PNor2pggGDa9OZpEWFD+M1Q44E+4FsOrc5E
         TJvX4Ooam/H72/psjI9BLbfvi5smNmjCjU22qGzrBnF/MoDV3nGqTb1BIGGAh12WCVYG
         +02cdG1N0oGLVhGuyYI3CB2hvl0yPTl5sPzjOxae+Bh8WK46Gpv+A+5yWCTO+gjrmYu6
         +EhkvGAcxVEvVqh+FNzSeN3gWNi2C76csG35YLioIq83WJ+FCzngMqqCfDfe+SnXQhGv
         VNrw==
X-Gm-Message-State: ACgBeo2HkpL5mcVcIu2+oKsfeGsbB0waFQm7Z6KvcALDZtXMM5w9Psk6
        Fr8F0mqSd2OwjQZ8DWXt+hwoLQiWkXaz6Q==
X-Google-Smtp-Source: AA6agR6GhbHK3OZJPnWO6krqkSKC5iSROZA8prjZMyZsRPET0lVfCQcJSPHmNdnfxoMLYc0ikch8Mw==
X-Received: by 2002:a5d:64c2:0:b0:225:61ab:ddc0 with SMTP id f2-20020a5d64c2000000b0022561abddc0mr2160599wri.4.1661204261907;
        Mon, 22 Aug 2022 14:37:41 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.lyon.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b003a54fffa809sm16560700wms.17.2022.08.22.14.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:37:41 -0700 (PDT)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     linux-doc@vger.kernel.org
Cc:     Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] Documentation: kprobetrace: Improve readability
Date:   Mon, 22 Aug 2022 23:37:32 +0200
Message-Id: <20220822213732.2731429-1-yoann.congal@smile.fr>
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

