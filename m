Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136DCCA0FEA
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 14:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245733AbjIAOW5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Sep 2023 10:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjIAOW5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Sep 2023 10:22:57 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEC410DF
        for <linux-doc@vger.kernel.org>; Fri,  1 Sep 2023 07:22:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BC1BE2A0;
        Fri,  1 Sep 2023 14:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BC1BE2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1693578171; bh=50uKDr74KWxWO+Bp2MpAhNHn2+WE0oWFjCST40ayZLc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Jmh2Piso8jiSS7SVks/Y1TEH0Ym7nnb27G90wInld52tQGFdSockSXChbCZGCbzTK
         NGnQjDHOE31TYi8B4FKZwhBvovFCtXZH+BnOvKxKQdDWNXrAgSqEgNqswZRDYk4ZDA
         fcPAW5x/9P0SUCw/mDWxXSTgXnjoYZ3ZIA4J3K9o5dj//sFQXBpva6fjHDzDJAw1t0
         RoMgNb5OmyAVoyrETolI8YqOIBE8nH64niLfFOK99x7zu54jqxoMSEAvQRkSfq91Jn
         Zn8+MGbXW9EppSK90CupA8nbwd+80YJnJis4iL7D8zRhCwigbkjOorv5ul4swLYYOc
         vloCVeaBaZ8eQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?utf-8?Q?Ren=C3=A9?= Nyffenegger <mail@renenyffenegger.ch>,
        linux-doc@vger.kernel.org
Cc:     =?utf-8?Q?Ren=C3=A9?= Nyffenegger <mail@renenyffenegger.ch>
Subject: Re: [PATCH] Documentation: Reference kernel-doc for container_of
In-Reply-To: <20230901070728.28400-1-mail@renenyffenegger.ch>
References: <20230901070728.28400-1-mail@renenyffenegger.ch>
Date:   Fri, 01 Sep 2023 08:22:51 -0600
Message-ID: <87ledqm0qs.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ren=C3=A9 Nyffenegger <mail@renenyffenegger.ch> writes:

> The file include/linux/container_of.h contained kernel-doc but was not
> referenced in any .rst file. In addition, the file
> Documentation/core-api/kobject.rst wrongly located the definition
> of the macro `container_of` in linux/kernel.h while in reality
> it is defined in linux/container_of.h
>
> This patch adds a new .rst file that includes the kernel-doc of
> container_of.h and rectifies the wrong reference of the header
> file.
>
> Signed-off-by: Ren=C3=A9 Nyffenegger <mail@renenyffenegger.ch>

Thank you for working to improve the kernel documentation!

There are, though, a few problems with this patch that will need to be
addressed before it can be accepted.  To start, please cc the maintainer
(i.e. me) on documentation changes.

>  Documentation/core-api/container_of.rst | 64 +++++++++++++++++++++++++
>  Documentation/core-api/index.rst        |  1 +
>  Documentation/core-api/kobject.rst      | 58 +++++++++++-----------
>  3 files changed, 93 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/core-api/container_of.rst
>
> diff --git a/Documentation/core-api/container_of.rst b/Documentation/core=
-api/container_of.rst
> new file mode 100644
> index 000000000000..f063d3f9e536
> --- /dev/null
> +++ b/Documentation/core-api/container_of.rst
> @@ -0,0 +1,64 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Given a pointer to a member of a struct, returning a pointer to the cont=
aining struct
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Sticking to the 80-character limit is important for documentation, as it
greatly affects its readability.

> +.. _container_of:

This label is never referenced, so please do not add it.

> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The two macros ``container_of`` and ``container_of_const``, defined in `=
`<include/linux/container_of.h>``, return a pointer to the ``struct`` (i. e=
. the *container*) from a pointer to a member of this ``struct``.

Please just refer to macros as, for example, container_of(), with
parentheses and without literal markup.  The build code will then do the
right thing.

> +These macros might be used when :ref:`embedding kobjects<embedding_kobje=
cts>`, but see also :ref:`usage<container_of_usage>`.

Referencing a label that is immediately below is kind of pointless.  I'd
delete the label and say "see below".

Also, kobjects are far from the most common use of container_of(), not
sure why the are called out here.

> +
> +.. kernel-doc:: include/linux/container_of.h
> +
> +Usage
> +=3D=3D=3D=3D=3D
> +
> +.. _container_of_usage:
> +
> +The following simple code demonstrates the usage of ``container_of``
> +
> +.. code-block:: c
> +
> + struct inner_struct
> + {
> + 	int abc;
> + 	int def;
> + }
> +=20
> + struct container_struct
> + {
> + 	struct inner_struct inner;
> + 	char               *member_xyz;
> + 	int                 member_val;
> + };
> +=20
> + static void f(struct inner_struct *inr)
> + {
> + 	struct container_struct *cont;
> +=20
> + 	cont =3D container_of(inr, struct container_struct, inner);
> +=20
> +        /* Use cont and its members */
> + }
> +=20
> + static void g(char** member)
> + {
> + 	struct container_struct *cont;
> +=20
> + 	cont =3D container_of(member, struct container_struct, member_xyz);
> +        /* Use cont and its members */
> + }

Not sure why two examples are needed, they are showing the same thing?

> + void somewhere()
> + {
> + 	struct container_struct cont;
> +=20
> + 	/* Initialize cont */
> +=20
> + 	f(& cont.inner      );
> + 	g(& cont.member_xyz );
> + }

Sample code should follow the kernel coding style.

> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/in=
dex.rst
> index 7a3a08d81f11..595af47d0d5f 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -37,6 +37,7 @@ Library functionality that is used throughout the kerne=
l.
>     kref
>     assoc_array
>     xarray
> +   container_of
>     maple_tree
>     idr
>     circular-buffers
> diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/=
kobject.rst
> index 7310247310a0..058570694418 100644
> --- a/Documentation/core-api/kobject.rst
> +++ b/Documentation/core-api/kobject.rst
> @@ -49,6 +49,8 @@ approach will be taken, so we'll go back to kobjects.
>  Embedding kobjects
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> +.. _embedding_kobjects:
> +
>  It is rare for kernel code to create a standalone kobject, with one major
>  exception explained below.  Instead, kobjects are used to control access=
 to
>  a larger, domain-specific object.  To this end, kobjects will be found
> @@ -66,50 +68,46 @@ their own, but are invariably found embedded in the l=
arger objects of
>  interest.)
>=20=20
>  So, for example, the UIO code in ``drivers/uio/uio.c`` has a structure t=
hat
> -defines the memory region associated with a uio device::
> +defines the memory region associated with a uio device:
>=20=20
> -    struct uio_map {
> -            struct kobject kobj;
> -            struct uio_mem *mem;
> -    };
> +.. code-block:: c
>=20=20
> -If you have a struct uio_map structure, finding its embedded kobject is
> -just a matter of using the kobj member.  Code that works with kobjects w=
ill
> -often have the opposite problem, however: given a struct kobject pointer,
> + struct uio_map {
> + 	struct kobject kobj;
> + 	struct uio_mem *mem;
> + };

At this point you are making changes to documentation unrelated to
container_of().  I'm not entirely sure why you are doing that.  If you
must, though, these changes need to be in their own patch with their own
justification.

> +If you have a ``struct uio_map`` structure, finding its embedded kobject=
 is
> +just a matter of using the ``kobj`` member.  Code that works with kobjec=
ts will
> +often have the opposite problem, however: given a ``struct kobject *``,
>  what is the pointer to the containing structure?  You must avoid tricks
>  (such as assuming that the kobject is at the beginning of the structure)
> -and, instead, use the container_of() macro, found in ``<linux/kernel.h>`=
`::
> -
> -    container_of(ptr, type, member)
> +and, instead, use the container_of() macro:
>=20=20
> -where:
> +.. code-block:: c
>=20=20
> -  * ``ptr`` is the pointer to the embedded kobject,
> -  * ``type`` is the type of the containing structure, and
> -  * ``member`` is the name of the structure field to which ``pointer`` p=
oints.
> -
> -The return value from container_of() is a pointer to the corresponding
> -container type. So, for example, a pointer ``kp`` to a struct kobject
> -embedded **within** a struct uio_map could be converted to a pointer to =
the
> -**containing** uio_map structure with::
> -
> -    struct uio_map *u_map =3D container_of(kp, struct uio_map, kobj);
> + struct kobject *kp =3D  ; /* Pointer to a kobj member of a uio_map */
> + struct uio_map *u_map =3D container_of(kp, struct uio_map, kobj);
>=20=20
>  For convenience, programmers often define a simple macro for **back-cast=
ing**
>  kobject pointers to the containing type.  Exactly this happens in the
> -earlier ``drivers/uio/uio.c``, as you can see here::
> +earlier ``drivers/uio/uio.c``, as you can see here:
>=20=20
> -    struct uio_map {
> -            struct kobject kobj;
> -            struct uio_mem *mem;
> -    };
> +.. code-block:: c
>=20=20
> -    #define to_map(map) container_of(map, struct uio_map, kobj)
> + struct uio_map {
> + 	struct kobject kobj;
> + 	struct uio_mem *mem;
> + };
> +=20
> + #define to_map(map) container_of(map, struct uio_map, kobj)

Gratuitous formatting changes aren't really useful.

Thanks,

jon
