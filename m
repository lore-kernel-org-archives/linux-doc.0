Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC63C6FA83
	for <linux-doc@archiver.kernel.org>; Mon, 12 Sep 2022 08:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiILIhV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Sep 2022 04:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiILIhD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Sep 2022 04:37:03 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1211418356
        for <linux-doc@vger.kernel.org>; Mon, 12 Sep 2022 01:36:17 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r18so18396501eja.11
        for <linux-doc@vger.kernel.org>; Mon, 12 Sep 2022 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=XfI9ZjiPulagmZgXl7VNhAleTy9LQqRTAtkOnTlnsyw=;
        b=LZs5Dw3q5giJ8OLUJJop39QvVEqMFnuM9eEwnxKYIm7TnCuQvW0EuVAkEjpn1JGORY
         1JpoSH1jn8DZOwZ6WsB50Csd1J+ma1b/GlrNkQIUmidkfJ1BU9nkcMg0z5ZGnmkoF5zv
         rjADBzBYah6Q+R1SarFogTlnZRRVjXvJTE4DXc7y3lSeBcAUzG69/4sr/E2QTYcGcP1+
         12p1ryKW4zZ6N3IwsFoGFj9szmTRuRugInhCoyzdaUC2G8Tcu4qzYxnP5dno9XYB1PMY
         8bQL/7XjNKB+NiLYoLaj8M+fe74mSINVUnKrH060PbyebyUvP3CJwyn0CvqNeSF9UgBd
         S9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XfI9ZjiPulagmZgXl7VNhAleTy9LQqRTAtkOnTlnsyw=;
        b=pdNfsizhGHRohDRL3XuiVKbqz+3Jd2/a4b0493qP9jNb0+RvLR+Y5FCrTuY7h1ADzM
         XAfg24JW9468aemlOrqAgzxegrMOTmNrBw9wMwAH3EoS+8d8T+bfRmA+ts+FnHqEqWWB
         sFyuE1zXHLIdXNv6tM4j1i2cR05DIx7OvHouGM+odxl8wwawzVvC4tT3MpAYcWZltDF8
         qKlq0xhzk+Jt+iNpcmiCkqaZgM0gt2JwLMNb80RV94ztw23Nl4VQRig5DvqW1B/RtqjE
         ObGyqD4oS3kmIIGGi3lITAXd9CIO7aVFiiBqfS3s+45DpU5Hq5n/nvgEEwHcsboNqN/E
         0/CQ==
X-Gm-Message-State: ACgBeo0nebBuO9hBLngVj7hwyMsLU0zS2MwENC4IOi94fvULdIqOEM3W
        PZr4QPLlIi/DCVJl6r/9ZCOmGHbdsdd8ZRN/sJgkiqWjtBA=
X-Google-Smtp-Source: AA6agR5GpfPWXU9Q+oyP2sxUFD9woakckq0R/eoMT9iRQH/u/cn/+PfyXwdua3qe4swkCDkVOBkluZwK3akWBzD99AY=
X-Received: by 2002:a17:907:25c1:b0:77b:9966:ccf1 with SMTP id
 ae1-20020a17090725c100b0077b9966ccf1mr6289995ejc.763.1662971775605; Mon, 12
 Sep 2022 01:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220822213732.2731429-1-yoann.congal@smile.fr>
In-Reply-To: <20220822213732.2731429-1-yoann.congal@smile.fr>
From:   Yoann CONGAL <yoann.congal@smile.fr>
Date:   Mon, 12 Sep 2022 10:35:49 +0200
Message-ID: <CAMSfU+5Hg35RwXd1G+akXfbQ59Hbc5vdzQ5rDvuqBynfVdiH+g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kprobetrace: Improve readability
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi!

A gentle ping for this patch (I'm afraid it has fallen through the cracks)
I've checked, it still applies cleanly on v6.0-rc5.

Thanks!

Le lun. 22 ao=C3=BBt 2022 =C3=A0 23:37, Yoann Congal <yoann.congal@smile.fr=
> a =C3=A9crit :
>
> Improve readability of kprobetrace documentation by adding markup
> (mainly code snippets), fixing some typos and splitting some paragraphs.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  Documentation/trace/kprobetrace.rst | 128 ++++++++++++++--------------
>  1 file changed, 66 insertions(+), 62 deletions(-)
>
> diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kp=
robetrace.rst
> index 4274cc6a2f94..d13bf15d6e00 100644
> --- a/Documentation/trace/kprobetrace.rst
> +++ b/Documentation/trace/kprobetrace.rst
> @@ -6,22 +6,22 @@ Kprobe-based Event Tracing
>
>  Overview
>  --------
> -These events are similar to tracepoint based events. Instead of Tracepoi=
nt,
> +These events are similar to tracepoint-based events. Instead of tracepoi=
nts,
>  this is based on kprobes (kprobe and kretprobe). So it can probe whereve=
r
>  kprobes can probe (this means, all functions except those with
> -__kprobes/nokprobe_inline annotation and those marked NOKPROBE_SYMBOL).
> -Unlike the Tracepoint based event, this can be added and removed
> +``__kprobes``/``nokprobe_inline`` annotation and those marked ``NOKPROBE=
_SYMBOL``).
> +Unlike the tracepoint-based event, this can be added and removed
>  dynamically, on the fly.
>
> -To enable this feature, build your kernel with CONFIG_KPROBE_EVENTS=3Dy.
> +To enable this feature, build your kernel with ``CONFIG_KPROBE_EVENTS=3D=
y``.
>
> -Similar to the events tracer, this doesn't need to be activated via
> -current_tracer. Instead of that, add probe points via
> -/sys/kernel/debug/tracing/kprobe_events, and enable it via
> -/sys/kernel/debug/tracing/events/kprobes/<EVENT>/enable.
> +Similar to the event tracer, this doesn't need to be activated via
> +``current_tracer``. Instead of that, add probe points via
> +``/sys/kernel/debug/tracing/kprobe_events``, and enable it via
> +``/sys/kernel/debug/tracing/events/kprobes/<EVENT>/enable``.
>
> -You can also use /sys/kernel/debug/tracing/dynamic_events instead of
> -kprobe_events. That interface will provide unified access to other
> +You can also use ``/sys/kernel/debug/tracing/dynamic_events`` instead of
> +``kprobe_events``. That interface will provide unified access to other
>  dynamic events too.
>
>  Synopsis of kprobe_events
> @@ -68,85 +68,89 @@ Synopsis of kprobe_events
>
>  Types
>  -----
> -Several types are supported for fetch-args. Kprobe tracer will access me=
mory
> -by given type. Prefix 's' and 'u' means those types are signed and unsig=
ned
> -respectively. 'x' prefix implies it is unsigned. Traced arguments are sh=
own
> -in decimal ('s' and 'u') or hexadecimal ('x'). Without type casting, 'x3=
2'
> -or 'x64' is used depends on the architecture (e.g. x86-32 uses x32, and
> -x86-64 uses x64).
> -These value types can be an array. To record array data, you can add '[N=
]'
> +Several types are supported for ``fetchargs``. Kprobe tracer will access=
 memory
> +by given type. Prefix ``s`` and ``u`` means those types are signed and u=
nsigned
> +respectively. ``x`` prefix implies it is unsigned. Traced arguments are =
shown
> +in decimal (``s`` and ``u``) or hexadecimal (``x``). Without type castin=
g, ``x32``
> +or ``x64`` is used depends on the architecture (e.g. x86-32 uses ``x32``=
, and
> +x86-64 uses ``x64``).
> +
> +These value types can be an array. To record array data, you can add ``[=
N]``
>  (where N is a fixed number, less than 64) to the base type.
> -E.g. 'x16[4]' means an array of x16 (2bytes hex) with 4 elements.
> -Note that the array can be applied to memory type fetchargs, you can not
> -apply it to registers/stack-entries etc. (for example, '$stack1:x8[8]' i=
s
> -wrong, but '+8($stack):x8[8]' is OK.)
> -String type is a special type, which fetches a "null-terminated" string =
from
> +E.g. ``x16[4]`` means an array of ``x16`` (2-bytes hex) with 4 elements.
> +Note that the array can be applied to memory type ``fetchargs``, you can=
 not
> +apply it to registers/stack-entries etc. (for example, ``$stack1:x8[8]``=
 is
> +wrong, but ``+8($stack):x8[8]`` is OK.)
> +
> +``string`` type is a special type, which fetches a "null-terminated" str=
ing from
>  kernel space. This means it will fail and store NULL if the string conta=
iner
> -has been paged out. "ustring" type is an alternative of string for user-=
space.
> -See :ref:`user_mem_access` for more info..
> +has been paged out. ``ustring`` type is an alternative of string for use=
r-space.
> +See :ref:`user_mem_access` for more info.
> +
>  The string array type is a bit different from other types. For other bas=
e
> -types, <base-type>[1] is equal to <base-type> (e.g. +0(%di):x32[1] is sa=
me
> -as +0(%di):x32.) But string[1] is not equal to string. The string type i=
tself
> +types, ``<base-type>[1]`` is equal to ``<base-type>`` (e.g. ``+0(%di):x3=
2[1]`` is same
> +as ``+0(%di):x32``.) But ``string[1]`` is not equal to ``string``. The `=
`string`` type itself
>  represents "char array", but string array type represents "char * array"=
.
> -So, for example, +0(%di):string[1] is equal to +0(+0(%di)):string.
> +So, for example, ``+0(%di):string[1]`` is equal to ``+0(+0(%di)):string`=
`.
>  Bitfield is another special type, which takes 3 parameters, bit-width, b=
it-
>  offset, and container-size (usually 32). The syntax is::
>
>   b<bit-width>@<bit-offset>/<container-size>
>
> -Symbol type('symbol') is an alias of u32 or u64 type (depends on BITS_PE=
R_LONG)
> -which shows given pointer in "symbol+offset" style.
> -For $comm, the default type is "string"; any other type is invalid.
> +Symbol type('symbol') is an alias of ``u32`` or ``u64`` type (depends on=
 ``BITS_PER_LONG``)
> +which shows given pointer in ``symbol+offset`` style.
> +
> +For ``$comm``, the default type is ``string``; any other type is invalid=
.
>
>  .. _user_mem_access:
>
>  User Memory Access
>  ------------------
>  Kprobe events supports user-space memory access. For that purpose, you c=
an use
> -either user-space dereference syntax or 'ustring' type.
> +either user-space dereference syntax or ``ustring`` type.
>
>  The user-space dereference syntax allows you to access a field of a data
> -structure in user-space. This is done by adding the "u" prefix to the
> -dereference syntax. For example, +u4(%si) means it will read memory from=
 the
> -address in the register %si offset by 4, and the memory is expected to b=
e in
> -user-space. You can use this for strings too, e.g. +u0(%si):string will =
read
> -a string from the address in the register %si that is expected to be in =
user-
> -space. 'ustring' is a shortcut way of performing the same task. That is,
> -+0(%si):ustring is equivalent to +u0(%si):string.
> +structure in user-space. This is done by adding the ``u`` prefix to the
> +dereference syntax. For example, ``+u4(%si)`` means it will read memory =
from the
> +address in the register ``%si`` offset by 4, and the memory is expected =
to be in
> +user-space. You can use this for strings too, e.g. ``+u0(%si):string`` w=
ill read
> +a string from the address in the register ``%si`` that is expected to be=
 in user-
> +space. ``ustring`` is a shortcut way of performing the same task. That i=
s,
> +``+0(%si):ustring`` is equivalent to ``+u0(%si):string``.
>
>  Note that kprobe-event provides the user-memory access syntax but it doe=
sn't
>  use it transparently. This means if you use normal dereference or string=
 type
> -for user memory, it might fail, and may always fail on some archs. The u=
ser
> +for user memory, it might fail, and may always fail on some architecture=
s. The user
>  has to carefully check if the target data is in kernel or user space.
>
>  Per-Probe Event Filtering
>  -------------------------
>  Per-probe event filtering feature allows you to set different filter on =
each
>  probe and gives you what arguments will be shown in trace buffer. If an =
event
> -name is specified right after 'p:' or 'r:' in kprobe_events, it adds an =
event
> -under tracing/events/kprobes/<EVENT>, at the directory you can see 'id',
> -'enable', 'format', 'filter' and 'trigger'.
> +name is specified right after ``p:`` or ``r:`` in ``kprobe_events``, it =
adds an event
> +under ``tracing/events/kprobes/<EVENT>``, at the directory you can see `=
`id``,
> +``enable``, ``format``, ``filter`` and ``trigger``.
>
> -enable:
> +``enable``:
>    You can enable/disable the probe by writing 1 or 0 on it.
>
> -format:
> +``format``:
>    This shows the format of this probe event.
>
> -filter:
> +``filter``:
>    You can write filtering rules of this event.
>
> -id:
> +``id``:
>    This shows the id of this probe event.
>
> -trigger:
> +``trigger``:
>    This allows to install trigger commands which are executed when the ev=
ent is
> -  hit (for details, see Documentation/trace/events.rst, section 6).
> +  hit (for details, see ``Documentation/trace/events.rst``, section 6).
>
>  Event Profiling
>  ---------------
>  You can check the total number of probe hits and probe miss-hits via
> -/sys/kernel/debug/tracing/kprobe_profile.
> +``/sys/kernel/debug/tracing/kprobe_profile``.
>  The first column is event name, the second is the number of probe hits,
>  the third is the number of probe miss-hits.
>
> @@ -156,11 +160,11 @@ You can add and enable new kprobe events when booti=
ng up the kernel by
>  "kprobe_event=3D" parameter. The parameter accepts a semicolon-delimited
>  kprobe events, which format is similar to the kprobe_events.
>  The difference is that the probe definition parameters are comma-delimit=
ed
> -instead of space. For example, adding myprobe event on do_sys_open like =
below
> +instead of space. For example, adding myprobe event on do_sys_open like =
below::
>
>    p:myprobe do_sys_open dfd=3D%ax filename=3D%dx flags=3D%cx mode=3D+4($=
stack)
>
> -should be below for kernel boot parameter (just replace spaces with comm=
a)
> +should be below for kernel boot parameter (just replace spaces with comm=
a)::
>
>    p:myprobe,do_sys_open,dfd=3D%ax,filename=3D%dx,flags=3D%cx,mode=3D+4($=
stack)
>
> @@ -172,20 +176,20 @@ as below::
>
>    echo 'p:myprobe do_sys_open dfd=3D%ax filename=3D%dx flags=3D%cx mode=
=3D+4($stack)' > /sys/kernel/debug/tracing/kprobe_events
>
> -This sets a kprobe on the top of do_sys_open() function with recording
> -1st to 4th arguments as "myprobe" event. Note, which register/stack entr=
y is
> +This sets a kprobe on the top of ``do_sys_open()`` function with recordi=
ng
> +1st to 4th arguments as ``myprobe`` event. Note, which register/stack en=
try is
>  assigned to each function argument depends on arch-specific ABI. If you =
unsure
> -the ABI, please try to use probe subcommand of perf-tools (you can find =
it
> -under tools/perf/).
> +the ABI, please try to use ``probe`` subcommand of ``perf-tools`` (you c=
an find it
> +under ``tools/perf/``).
>  As this example shows, users can choose more familiar names for each arg=
uments.
>  ::
>
>    echo 'r:myretprobe do_sys_open $retval' >> /sys/kernel/debug/tracing/k=
probe_events
>
> -This sets a kretprobe on the return point of do_sys_open() function with
> -recording return value as "myretprobe" event.
> +This sets a kretprobe on the return point of ``do_sys_open()`` function =
with
> +recording return value as ``myretprobe`` event.
>  You can see the format of these events via
> -/sys/kernel/debug/tracing/events/kprobes/<EVENT>/format.
> +``/sys/kernel/debug/tracing/events/kprobes/<EVENT>/format``.
>  ::
>
>    cat /sys/kernel/debug/tracing/events/kprobes/myprobe/format
> @@ -236,7 +240,7 @@ Use the following command to start tracing in an inte=
rval.
>      Open something...
>      # echo 0 > tracing_on
>
> -And you can see the traced information via /sys/kernel/debug/tracing/tra=
ce.
> +And you can see the traced information via ``/sys/kernel/debug/tracing/t=
race``.
>  ::
>
>    cat /sys/kernel/debug/tracing/trace
> @@ -252,6 +256,6 @@ And you can see the traced information via /sys/kerne=
l/debug/tracing/trace.
>               <...>-1447  [001] 1038282.286976: myretprobe: (sys_open+0x1=
b/0x1d <- do_sys_open) $retval=3D3
>
>
> -Each line shows when the kernel hits an event, and <- SYMBOL means kerne=
l
> -returns from SYMBOL(e.g. "sys_open+0x1b/0x1d <- do_sys_open" means kerne=
l
> -returns from do_sys_open to sys_open+0x1b).
> +Each line shows when the kernel hits an event, and ``<- SYMBOL`` means k=
ernel
> +returns from ``SYMBOL`` (e.g. ``sys_open+0x1b/0x1d <- do_sys_open`` mean=
s kernel
> +returns from ``do_sys_open`` to ``sys_open+0x1b``).
> --
> 2.30.2
>

--=20
Yoann Congal
Smile ECS - Expert technique
