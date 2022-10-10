Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCC9C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 13:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJJNEW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 09:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJJNEW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 09:04:22 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EB16612D
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 06:04:21 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r18so10206582pgr.12
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khea9NZAjPXRJV7TKo4tD/yDvGyL2Zkfe1bcqrQ3rqQ=;
        b=o3lefu1a1LSLKDxoLFG6Q6Qt+1SwXnNQVQ6zcKRysWUqwN0aFTmoOTJBHkL3QZBhFK
         2GAcv50ScjcyjYlwUr05ja7r1+LnT5E1XaKjSo8UDyhry1ERthlHqvSHliHHGSq7i/+Q
         dkI4960/GaHL6omzK1Y5UDo6RLLgSjIKiQwERjOozMcG2wZ94qLtfkpKNfGmJ0t3EyCP
         KTxyQR3CufFn6bALvmpBuhA2G1okDbMMbCT9rmLBATF7lgFp7yMnKzgIUm2eZDK/nzPN
         8Nnlf+XE+ii0GitNyOc01y6zvsgaB49/VPJSjiLDD63N52A6RvhVc6akEAKICVhVZL5D
         uJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khea9NZAjPXRJV7TKo4tD/yDvGyL2Zkfe1bcqrQ3rqQ=;
        b=6ayhtG+QjgvwcZxuOqbTfCY15KX3GUpLxrbhYnfBtSdZvTlM+pJ3wbCIOznx44lEmH
         5ryZfo1B/iWgdc5WPbJpt3WaoOgo/F4xSAIdvLygbrCgDFZUk1TICLS2qdGwXPzLN6bE
         dgSkjsp52NhL7hUHDpzFUwdhNdLwiJtNA/gwab3YOK3UA6st3XN3npbWqGbICWvUFQJM
         hYwzUZEf+xOatwZkkkMnmrtE4NPB2Zg6GVFo+Mw5yi2vJHK0ge5f2wB3zwS4R1mDIQZp
         2CRcjdlbTiV4DHoOAS3l/qCqS+u+UWIGU2JVGwcFghXTkei+Q1WDXSp/rkySYNBogUuN
         XcWA==
X-Gm-Message-State: ACrzQf1UBzpqnVqn8RGmt9NwR+581Nlzl117uZ1IMI6mKlqGajZruVl3
        9r6P8/YJE6Nw13UzFdmw61Q=
X-Google-Smtp-Source: AMsMyM75IUXNIPpO0C847IVOArT9hD7e5+5Xik+gWLq6yVhtFsxZnzYLWOUFvcqw+ag0dUyoo8O6Dw==
X-Received: by 2002:a63:cf4f:0:b0:462:da7a:1ded with SMTP id b15-20020a63cf4f000000b00462da7a1dedmr3241528pgj.605.1665407060392;
        Mon, 10 Oct 2022 06:04:20 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-11.three.co.id. [180.214.232.11])
        by smtp.gmail.com with ESMTPSA id h16-20020aa79f50000000b005544229b992sm6849742pfr.22.2022.10.10.06.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 06:04:18 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 8C99B103AE2; Mon, 10 Oct 2022 20:04:14 +0700 (WIB)
Date:   Mon, 10 Oct 2022 20:04:14 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, mst@redhat.com,
        cohuck@redhat.com, virtualization@lists.linux-foundation.org,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Message-ID: <Y0QYTq7KW9C731s0@debian.me>
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XXGRRmljFT8yw/aw"
Content-Disposition: inline
In-Reply-To: <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--XXGRRmljFT8yw/aw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 08:43:59AM +0200, Ricardo Ca=C3=B1uelo wrote:
> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/d=
river-api/virtio/virtio.rst
> new file mode 100644
> index 000000000000..921758fc3b23
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -0,0 +1,144 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _virtio:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Virtio on Linux
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Virtio is an open standard that defines a protocol for communication
> +between drivers and devices of different types, see Chapter 5 ("Device
> +Types") of the virtio spec `[1]`_. Originally developed as a standard
> +for paravirtualized devices implemented by a hypervisor, it can be used
> +to interface any compliant device (real or emulated) with a driver.
> <snipped>
> +The communication between the driver in the guest OS and the device in
> +the hypervisor is done through shared memory (that's what makes virtio
> +devices so efficient) using specialized data structures called
> +virtqueues, which are actually ring buffers [#f1]_ of buffer descriptors
> +similar to the ones used in a network device:
> +
> +.. kernel-doc:: include/uapi/linux/virtio_ring.h
> +    :identifiers: struct vring_desc
> +
> +All the buffers the descriptors point to are allocated by the guest and
> +used by the host either for reading or for writing but not for both.
> +
> +Refer to Chapter 2.5 ("Virtqueues") of the virtio spec `[1]`_ for the
> +reference definitions of virtqueues and to `[2]`_ for an illustrated
> +overview of how the host device and the guest driver communicate.
> +

What link is for [2]? I think you'll need to spell out the link title.
Also, the external reference pointers should be parenthesized to indicate
that these are references:

---- >8 ----
diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/dri=
ver-api/virtio/virtio.rst
index 4f3abbec4e8b2c..07fd2d7c51e689 100644
--- a/Documentation/driver-api/virtio/virtio.rst
+++ b/Documentation/driver-api/virtio/virtio.rst
@@ -11,7 +11,7 @@ Introduction
=20
 Virtio is an open standard that defines a protocol for communication
 between drivers and devices of different types, see Chapter 5 ("Device
-Types") of the virtio spec `[1]`_. Originally developed as a standard
+Types") of the virtio spec (`[1]`_). Originally developed as a standard
 for paravirtualized devices implemented by a hypervisor, it can be used
 to interface any compliant device (real or emulated) with a driver.
=20
@@ -43,9 +43,10 @@ similar to the ones used in a network device:
 All the buffers the descriptors point to are allocated by the guest and
 used by the host either for reading or for writing but not for both.
=20
-Refer to Chapter 2.5 ("Virtqueues") of the virtio spec `[1]`_ for the
-reference definitions of virtqueues and to `[2]`_ for an illustrated
-overview of how the host device and the guest driver communicate.
+Refer to Chapter 2.5 ("Virtqueues") of the virtio spec (`[1]`_) for the
+reference definitions of virtqueues and "Virtqueues and virtio ring: How
+the data travels" blog post (`[2]`_) for an illustrated overview of how
+the host device and the guest driver communicate.
=20
 The :c:type:`vring_virtqueue` struct models a virtqueue, including the
 ring buffers and management data. Embedded in this struct is the


Personally speaking, ReST citations should do the job better (these
links are external references, right?).

> +It's at this stage that the virtqueues will be allocated and configured
> +by calling the appropriate ``virtio_find`` helper function, such as
> +virtio_find_single_vq() or virtio_find_vqs(), which will end up
> +calling a transport-specific ``find_vqs`` method.
> +

Looks like the wording at the beginning confuses me, so better say:

---- >8 ----
diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/dri=
ver-api/virtio/virtio.rst
index 07fd2d7c51e689..7947b4ca690efd 100644
--- a/Documentation/driver-api/virtio/virtio.rst
+++ b/Documentation/driver-api/virtio/virtio.rst
@@ -123,10 +123,10 @@ When the device is registered to the virtio bus the k=
ernel will look
 for a driver in the bus that can handle the device and call that
 driver's ``probe`` method.
=20
-It's at this stage that the virtqueues will be allocated and configured
-by calling the appropriate ``virtio_find`` helper function, such as
-virtio_find_single_vq() or virtio_find_vqs(), which will end up
-calling a transport-specific ``find_vqs`` method.
+At this point, the virtqueues will be allocated and configured by
+calling the appropriate ``virtio_find`` helper function, such as
+virtio_find_single_vq() or virtio_find_vqs(), which will end up calling
+a transport-specific ``find_vqs`` method.
=20
=20
 References

> +
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +_`[1]` Virtio Spec v1.2:
> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> +
> +Check for later versions of the spec as well.
> +

The version checking should be made comment (not visible on the output):

---- >8 ----
diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/dri=
ver-api/virtio/virtio.rst
index 70b3aa6bcf5518..4f3abbec4e8b2c 100644
--- a/Documentation/driver-api/virtio/virtio.rst
+++ b/Documentation/driver-api/virtio/virtio.rst
@@ -134,7 +134,7 @@ References
 _`[1]` Virtio Spec v1.2:
 https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
=20
-Check for later versions of the spec as well.
+.. Check for later versions of the spec as well.
=20
 _`[2]` Virtqueues and virtio ring: How the data travels
 https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels

> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b=
/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> new file mode 100644
> index 000000000000..e14c58796d25
> --- /dev/null
> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> <snipped>...
> +References
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +_`[1]` Virtio Spec v1.2:
> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> +
> +Check for later versions of the spec as well.

Same reply.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--XXGRRmljFT8yw/aw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY0QYSgAKCRD2uYlJVVFO
o6CgAQCEAfbuE4tbkeMS8XYCe7eD2nOJVbeiwPnAkXcoFQvwVAD/Yf+KYvFE8DTP
3kxueogt3nld+XyddLBIyYrvEzvLdQQ=
=+HBd
-----END PGP SIGNATURE-----

--XXGRRmljFT8yw/aw--
