Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0873C48BDF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 11:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFC836145E
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 11:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhFOLxB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 07:53:01 -0400
Received: from [43.250.32.171] ([43.250.32.171]:4883 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229979AbhFOLxA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Jun 2021 07:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=WFel7ENygnqeSKydWw9jYPVitONiMig3zvYxS
        WxQijY=; b=cAci6xFsZ7SU5F15A+VDbzMnOZif4umyJc3i7ixEStXiKaT7nFS25
        p85QN7Tb37d4MP4I/iVv+lrPkKFcKeigaVhROovk6grZCeTZHe/j3wlen21Y9e4p
        LFvEMrgnq3jWELGYYExWSTurLbIV720TBQuCgyq27Z4AoqRd75TQmI=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCHIzcYlMhgUZ0RAA--.36484S2;
        Tue, 15 Jun 2021 19:50:49 +0800 (CST)
Date:   Tue, 15 Jun 2021 19:50:47 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 1/2] docs/core-api: Modify document layout
Message-ID: <20210615115047.GA21347@bobwxc.top>
References: <cover.1623740113.git.siyanteng@loongson.cn>
 <63ccd488a142fedbf3fa7fe38875046e2b21c41a.1623740114.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <63ccd488a142fedbf3fa7fe38875046e2b21c41a.1623740114.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgCHIzcYlMhgUZ0RAA--.36484S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar1DGFykKFyxGFyfGF17KFg_yoWxKrW5pF
        nxAFWSgr1vyryUCay29r48Grn5urs5A3yfArykGr4IyF15CryUCFsxtFyrAFW8GrWkCFyj
        v340vr1ru3yUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUnLSdPUUUUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 03:03:49PM +0800, Yanteng Si wrote:
> Modify the layout of the document and remove unnecessary symbols.
>=20
> Fix a typo.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu X.C.

> ---
>  Documentation/core-api/cpu_hotplug.rst | 38 ++++++++++++++++----------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-=
api/cpu_hotplug.rst
> index a2c96bec5ee8..0c872cbea7d5 100644
> --- a/Documentation/core-api/cpu_hotplug.rst
> +++ b/Documentation/core-api/cpu_hotplug.rst
> @@ -91,9 +91,10 @@ Never use anything other than ``cpumask_t`` to represe=
nt bitmap of CPUs.
> =20
>  Using CPU hotplug
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
>  The kernel option *CONFIG_HOTPLUG_CPU* needs to be enabled. It is curren=
tly
>  available on multiple architectures including ARM, MIPS, PowerPC and X86=
=2E The
> -configuration is done via the sysfs interface: ::
> +configuration is done via the sysfs interface::
> =20
>   $ ls -lh /sys/devices/system/cpu
>   total 0
> @@ -113,14 +114,14 @@ configuration is done via the sysfs interface: ::
> =20
>  The files *offline*, *online*, *possible*, *present* represent the CPU m=
asks.
>  Each CPU folder contains an *online* file which controls the logical on =
(1) and
> -off (0) state. To logically shutdown CPU4: ::
> +off (0) state. To logically shutdown CPU4::
> =20
>   $ echo 0 > /sys/devices/system/cpu/cpu4/online
>    smpboot: CPU 4 is now offline
> =20
>  Once the CPU is shutdown, it will be removed from */proc/interrupts*,
>  */proc/cpuinfo* and should also not be shown visible by the *top* comman=
d. To
> -bring CPU4 back online: ::
> +bring CPU4 back online::
> =20
>   $ echo 1 > /sys/devices/system/cpu/cpu4/online
>   smpboot: Booting Node 0 Processor 4 APIC 0x1
> @@ -142,6 +143,7 @@ The CPU hotplug coordination
> =20
>  The offline case
>  ----------------
> +
>  Once a CPU has been logically shutdown the teardown callbacks of registe=
red
>  hotplug states will be invoked, starting with ``CPUHP_ONLINE`` and termi=
nating
>  at state ``CPUHP_OFFLINE``. This includes:
> @@ -158,9 +160,10 @@ at state ``CPUHP_OFFLINE``. This includes:
> =20
>  Using the hotplug API
>  ---------------------
> +
>  It is possible to receive notifications once a CPU is offline or onlined=
=2E This
>  might be important to certain drivers which need to perform some kind of=
 setup
> -or clean up functions based on the number of available CPUs: ::
> +or clean up functions based on the number of available CPUs::
> =20
>    #include <linux/cpuhotplug.h>
> =20
> @@ -186,9 +189,10 @@ During the removal of a hotplug state the teardown c=
allback will be invoked.
> =20
>  Multiple instances
>  ~~~~~~~~~~~~~~~~~~
> +
>  If a driver has multiple instances and each instance needs to perform the
>  callback independently then it is likely that a ''multi-state'' should b=
e used.
> -First a multi-state state needs to be registered: ::
> +First a multi-state state needs to be registered::
> =20
>    ret =3D cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "X/Y:online,
>                                  Y_online, Y_prepare_down);
> @@ -197,7 +201,7 @@ First a multi-state state needs to be registered: ::
>  The ``cpuhp_setup_state_multi()`` behaves similar to ``cpuhp_setup_state=
()``
>  except it prepares the callbacks for a multi state and does not invoke
>  the callbacks. This is a one time setup.
> -Once a new instance is allocated, you need to register this new instance=
: ::
> +Once a new instance is allocated, you need to register this new instance=
::
> =20
>    ret =3D cpuhp_state_add_instance(Y_hp_online, &d->node);
> =20
> @@ -206,7 +210,8 @@ This function will add this instance to your previous=
ly allocated
>  (*Y_online*) on all online CPUs. The *node* element is a ``struct
>  hlist_node`` member of your per-instance data structure.
> =20
> -On removal of the instance: ::
> +On removal of the instance::
> +
>    cpuhp_state_remove_instance(Y_hp_online, &d->node)
> =20
>  should be invoked which will invoke the teardown callback on all online
> @@ -214,6 +219,7 @@ CPUs.
> =20
>  Manual setup
>  ~~~~~~~~~~~~
> +
>  Usually it is handy to invoke setup and teardown callbacks on registrati=
on or
>  removal of a state because usually the operation needs to performed once=
 a CPU
>  goes online (offline) and during initial setup (shutdown) of the driver.=
 However
> @@ -226,6 +232,7 @@ hotplug operations.
> =20
>  The ordering of the events
>  --------------------------
> +
>  The hotplug states are defined in ``include/linux/cpuhotplug.h``:
> =20
>  * The states *CPUHP_OFFLINE* =E2=80=A6 *CPUHP_AP_OFFLINE* are invoked be=
fore the
> @@ -248,13 +255,14 @@ another hotplug event.
> =20
>  Testing of hotplug states
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
>  One way to verify whether a custom state is working as expected or not i=
s to
>  shutdown a CPU and then put it online again. It is also possible to put =
the CPU
>  to certain state (for instance *CPUHP_AP_ONLINE*) and then go back to
>  *CPUHP_ONLINE*. This would simulate an error one state after *CPUHP_AP_O=
NLINE*
>  which would lead to rollback to the online state.
> =20
> -All registered states are enumerated in ``/sys/devices/system/cpu/hotplu=
g/states``: ::
> +All registered states are enumerated in ``/sys/devices/system/cpu/hotplu=
g/states`` ::
> =20
>   $ tail /sys/devices/system/cpu/hotplug/states
>   138: mm/vmscan:online
> @@ -268,7 +276,7 @@ All registered states are enumerated in ``/sys/device=
s/system/cpu/hotplug/states
>   168: sched:active
>   169: online
> =20
> -To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue=
: ::
> +To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue=
::
> =20
>    $ cat /sys/devices/system/cpu/cpu4/hotplug/state
>    169
> @@ -276,14 +284,14 @@ To rollback CPU4 to ``lib/percpu_cnt:online`` and b=
ack online just issue: ::
>    $ cat /sys/devices/system/cpu/cpu4/hotplug/state
>    140
> =20
> -It is important to note that the teardown callbac of state 140 have been
> -invoked. And now get back online: ::
> +It is important to note that the teardown callback of state 140 have been
> +invoked. And now get back online::
> =20
>    $ echo 169 > /sys/devices/system/cpu/cpu4/hotplug/target
>    $ cat /sys/devices/system/cpu/cpu4/hotplug/state
>    169
> =20
> -With trace events enabled, the individual steps are visible, too: ::
> +With trace events enabled, the individual steps are visible, too::
> =20
>    #  TASK-PID   CPU#    TIMESTAMP  FUNCTION
>    #     | |       |        |         |
> @@ -318,6 +326,7 @@ trace.
> =20
>  Architecture's requirements
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
>  The following functions and configurations are required:
> =20
>  ``CONFIG_HOTPLUG_CPU``
> @@ -339,11 +348,12 @@ The following functions and configurations are requ=
ired:
> =20
>  User Space Notification
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -After CPU successfully onlined or offline udev events are sent. A udev r=
ule like: ::
> +
> +After CPU successfully onlined or offline udev events are sent. A udev r=
ule like::
> =20
>    SUBSYSTEM=3D=3D"cpu", DRIVERS=3D=3D"processor", DEVPATH=3D=3D"/devices=
/system/cpu/*", RUN+=3D"the_hotplug_receiver.sh"
> =20
> -will receive all events. A script like: ::
> +will receive all events. A script like::
> =20
>    #!/bin/sh
> =20
> --=20
> 2.27.0

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDIlBcACgkQtlsoEiKC
sIWPtAv9GldrIa+KFG1B6yATRzfclE1A6OFNgISgnBvJLYeUYwy3WNv0m1n320Rw
jugR/INfiKxL0Jahp4m4qrWsQBbDLkO0Np+iqoHeIc79GZNp6meEJsIZPcatyXwg
UGIZIZ2soZXxqzYkmZIB8tqxrjQFFODhCfTqFjLVRpMYY2qTw5iS1egl6ktaRErq
3D4PTfHcZDlhie2pGBiLysLfyx2ozUHRYIjH+4wBhKIk9ZHFJpTZbUBza1a1/FAd
lTvQ7ud4kBhKlI58Y76/mcpSIlCYYjnGP+uGUXaVRToX5rdOwQz+UiB6q0u/D5uy
Cf2lw0xVBkEbngaToKCWvzJ3AEyQa7szh98FWOyqKVvaX8w47Rrw0gtcvtFblDaV
2hlkJ4gCsKdVCngH2oPm3761IMHIRuZj8W2ts6fMMRoGH+OqZv7WRMld9mX8nfPV
SzqeFu0D3h+0QHSr03j6sMTsiFtR/MuTFuotTJBMcFZDA+HTLp0OrGJTTJpFhfwY
vozR8pf7
=lR94
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--

