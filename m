Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76800C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 04:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiJUECL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJUECL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 00:02:11 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965231C7D64
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:02:09 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y1so1464956pfr.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 21:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1RpcIZo66JMtewPhjTBMsb5uhNiT3sGHHU564md5F9U=;
        b=iGeYQwtgCrVsBH5053B8wrlKozKfbx++/XyczKFcCboda7l5fSQuFEBoiWZd7X6nwx
         GRdGIjvhoY7jVgHKiEaraet5U5pCK3ZxNrwEIld3mNa8s0nO+ETRUexTgJ/9NO8PZMnN
         e9eSDRy5E/uK3Q3Uh0EqZ7uNh5APrXdfeP/xAbgJdxQ4PqnNogI07TeUG0pn/iRyepnf
         92E5dwe5k55w71+kKeWPUD4DHwDRLHB/1QKvuSxua3bnFMHs4xTz6TUIFEDsG+j8RiAY
         wnKBZ8nzSdTomRUNHCapZqR81k1cDWh+Bh7nME5IDGE83fFqltdU1Bw6PNc2PiKf2+Ar
         t5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RpcIZo66JMtewPhjTBMsb5uhNiT3sGHHU564md5F9U=;
        b=5J0RtS1CCrIxPCA5zFGOg3g05q7n3kq8FL63ZzLryC7m8Sot7Omivor+UbAWmfPCBT
         MjCfxIHUMqMi0Vhgwqu4OS1pp2++OHuPr0BVxCALmMTRggIIvlAI0Z6fv7OLVPzakgr0
         pn6hzxTRHPYmsepKo962bv7tHqVZxethFqjossL14+g5hEky7DO65/i5/sZ1cvrjr/Pv
         RpCz8luu1OMGKTGKqydLAVMVF0Pwn2R/5Z+p5+ABDxbDcxuC9ekWUqxd1g3OcfOvaHF2
         uTxK22isAD0g/kxZTBzq2U2XpbRHtECu6D7gD6oYaqKAGK6oeovKVUSUAJfdaV1u8z+y
         oHZQ==
X-Gm-Message-State: ACrzQf1IAoeFMF4WEazN+iiPAHNPAXMdOt2BSDNfP1gBmXt9xjOT8iOg
        arKvsjy+Oap4cdcq2uDGSF4=
X-Google-Smtp-Source: AMsMyM61LeaaEl78jhPAxT3RI0G+K6iMAgxIz6dw1EEg90qQOr18ygLimrLNS0+2tCYRw/tquK/DNA==
X-Received: by 2002:a63:1b5d:0:b0:461:7362:e8b5 with SMTP id b29-20020a631b5d000000b004617362e8b5mr14402119pgm.83.1666324929036;
        Thu, 20 Oct 2022 21:02:09 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-47.three.co.id. [116.206.12.47])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090a3d4300b0020ddea12227sm653907pjf.55.2022.10.20.21.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 21:02:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 9261C103AB4; Fri, 21 Oct 2022 11:02:05 +0700 (WIB)
Date:   Fri, 21 Oct 2022 11:02:05 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Message-ID: <Y1IZvWFE5kRSLYCc@debian.me>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e6A21joJI11IlZjq"
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--e6A21joJI11IlZjq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
> +IOCTL
> +-----
> +Intel(R) GNA driver controls the device through IOCTL interfaces.
> +Following IOCTL commands - handled by DRM framework - are supported:
> +
> +GNA_GET_PARAMETER gets driver and device capabilities.
> +
> +GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA op=
erations.
> +
> +GNA_GEM_FREE frees memory region back to system.
> +
> +GNA_COMPUTE submits a request to the device queue.
> +            Memory regions acquired by GNA_GEM_NEW are part of request.
> +
> +GNA_WAIT blocks and waits on the submitted request.
> +

Use bullet lists for ioctl list above (with minor wording improv on
the whole section):

---- >8 ----

diff --git a/Documentation/gpu/gna.rst b/Documentation/gpu/gna.rst
index 7f3b7ce7e8f722..9a896664a3c29f 100644
--- a/Documentation/gpu/gna.rst
+++ b/Documentation/gpu/gna.rst
@@ -32,21 +32,22 @@ Multiple processes can independently file many requests=
 to the driver. These req
 processed in a FIFO manner. The hardware can process one request at a time=
 by using a FIFO
 queue.
=20
-IOCTL
+ioctl
 -----
-Intel(R) GNA driver controls the device through IOCTL interfaces.
-Following IOCTL commands - handled by DRM framework - are supported:
+Intel(R) GNA driver controls the device through ioctl interfaces.
+The following commands (handled by DRM framework) are supported:
=20
-GNA_GET_PARAMETER gets driver and device capabilities.
+  * GNA_GET_PARAMETER gets driver and device capabilities.
=20
-GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA oper=
ations.
+  * GNA_GEM_NEW allocates new 4KB page of aligned memory region ready for =
DMA
+    operations.
=20
-GNA_GEM_FREE frees memory region back to system.
+  * GNA_GEM_FREE frees memory region back to system.
=20
-GNA_COMPUTE submits a request to the device queue.
-            Memory regions acquired by GNA_GEM_NEW are part of request.
+  * GNA_COMPUTE submits a request to the device queue. Memory regions allo=
cated
+    by GNA_GEM_NEW become part of the request payload.
=20
-GNA_WAIT blocks and waits on the submitted request.
+  * GNA_WAIT blocks and waits on the submitted request.
=20
 GNA MMU
 -------

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--e6A21joJI11IlZjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY1IZvQAKCRD2uYlJVVFO
o3SoAP45nF2ujb/ow1o/K//SEOHtVdUg5ZvP0rUgUsOQM0+ieQD+P/aRDnjlcuh0
1qJ1v7sm8amaCXdaL+Bqhug38QR9LQ0=
=BFyj
-----END PGP SIGNATURE-----

--e6A21joJI11IlZjq--
