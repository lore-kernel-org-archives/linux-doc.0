Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE56C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 18:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4551822C7E
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 18:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390372AbhAKSWN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 13:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390368AbhAKSWN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jan 2021 13:22:13 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0871C06179F
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 10:21:32 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id w1so953846ejf.11
        for <linux-doc@vger.kernel.org>; Mon, 11 Jan 2021 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CFJgcUraVYnAcRA/EQl4N4cPutZjWeez3ie/8dOk8uQ=;
        b=gPztFvge6sLDP2oMhZwGOuEQ0X/dCjbBTq3szIS/EPuYNDe580jPSK55z7yN65wf/h
         agTKvULIOqKZSJ41XSZXtCnlye6Toa2ZjZ5JbBu0oVC2ml/8DldDzkGsmheT3FMllKRq
         BXaDr8EVkhoJnf0nJvtVeL7je6zjHeLvL36OU7hr55cvrPVLdmD9QU6lKkW9Q1oS3c11
         BKxBVrs1vs125kKlQpW2AWIMXSGq+1V5N/QvuzxpgfYwYKHetWIzzItEgYEhuiuewWxK
         b0JP814MMhT6jv4vxGLQpDX/REnsImQR7Vi9r+j+TnTTBtA1LXl7ImVA/XzEn/iBaPoJ
         OnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFJgcUraVYnAcRA/EQl4N4cPutZjWeez3ie/8dOk8uQ=;
        b=Sp7J+IipK9UEP/eer8m/BX6DurNBu08rGruDMEYbF3TEnKuRiyJpqZQGBGD/riPReU
         XvPwtlzEy2LLf/cj/QZjdD8esRVyfyuFynXwX5ToYOKsGTZTFL3AQPojvHcQ+7wYEfbw
         JVsL/kaKTp7CbUPohLX668nmaTe/g1sUhuFY09g1vjzl6i5GnjzO+M3N3tICWCQO623W
         zP9Xt/WqWeGXeLKEhOrUYD8OtfES4mnp2UY6nopYCoNkEQ2mler6Wm1UDCXBLPzq0gAQ
         mdlGFXFSu8NZHt+W0ILWbOQTIw/xxGYYHCEVlAo4h44c4hGzhLPvAHkhDNcn1Tdd0Ba+
         sgRQ==
X-Gm-Message-State: AOAM532gvfqtqWfmE+M7G7DQPa3//+FegaQexoHGSB81edh5QNyl8S5R
        CqHWjT3iNpNYrrWD71snh3z8CPljem8OPSs20u1XFQ==
X-Google-Smtp-Source: ABdhPJwom3REW4DvPvDU76P3UdiKeANy+VtFakYT/UiUi/Jb4v5N0QsFQet4UQhvnePRkm+//d0FlWxlr142J0dAjGo=
X-Received: by 2002:a17:906:8051:: with SMTP id x17mr497930ejw.430.1610389291321;
 Mon, 11 Jan 2021 10:21:31 -0800 (PST)
MIME-Version: 1.0
References: <20201231142948.3241780-1-paul.kocialkowski@bootlin.com> <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
In-Reply-To: <20201231142948.3241780-10-paul.kocialkowski@bootlin.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Mon, 11 Jan 2021 15:21:19 -0300
Message-ID: <CAAEAJfAJYCE2z662hPderJ-5Qv3WBA8K5ZQaZ1JuZbZN+KfFig@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 09/15] media: sunxi: Add support for the
 A31 MIPI CSI-2 controller
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com, Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Salut Paul,

Just a minor comment about the v4l2 async API.

On Thu, 31 Dec 2020 at 11:30, Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 bridge
> found on Allwinner SoCs such as the A31 and V3/V3s.
>
> It is a standalone block, connected to the CSI controller on one side
> and to the MIPI D-PHY block on the other. It has a dedicated address
> space, interrupt line and clock.
>
> It is represented as a V4L2 subdev to the CSI controller and takes a
> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
> media controller API.
>
> Only 8-bit and 10-bit Bayer formats are currently supported.
> While up to 4 internal channels to the CSI controller exist, only one
> is currently supported by this implementation.
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/Kconfig          |   1 +
>  drivers/media/platform/sunxi/Makefile         |   1 +
>  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
>  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 590 ++++++++++++++++++
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 ++++
>  6 files changed, 725 insertions(+)
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
>
[..]
> +static int sun6i_mipi_csi2_v4l2_setup(struct sun6i_mipi_csi2_dev *cdev)
> +{
> +       struct sun6i_mipi_csi2_video *video = &cdev->video;
> +       struct v4l2_subdev *subdev = &video->subdev;
> +       struct v4l2_async_notifier *notifier = &video->notifier;
> +       struct fwnode_handle *handle;
> +       struct v4l2_fwnode_endpoint *endpoint;
> +       struct v4l2_async_subdev *subdev_async;
> +       int ret;
> +
> +       /* Subdev */
> +
> +       v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> +       subdev->dev = cdev->dev;
> +       subdev->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +       strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> +       v4l2_set_subdevdata(subdev, cdev);
> +
> +       /* Entity */
> +
> +       subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +       subdev->entity.ops = &sun6i_mipi_csi2_entity_ops;
> +
> +       /* Pads */
> +
> +       video->pads[0].flags = MEDIA_PAD_FL_SINK;
> +       video->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +
> +       ret = media_entity_pads_init(&subdev->entity, 2, video->pads);
> +       if (ret)
> +               return ret;
> +
> +       /* Endpoint */
> +
> +       handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, 0,
> +                                                FWNODE_GRAPH_ENDPOINT_NEXT);
> +       if (!handle) {
> +               ret = -ENODEV;
> +               goto error_media_entity;
> +       }
> +
> +       endpoint = &video->endpoint;
> +       endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
> +
> +       ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
> +       fwnode_handle_put(handle);

I think the _put should be...

> +       if (ret)
> +               goto error_media_entity;
> +
> +       /* Notifier */
> +
> +       v4l2_async_notifier_init(notifier);
> +
> +       subdev_async = &video->subdev_async;
> +       ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> +                                                          subdev_async);

... here. See for instance drivers/media/platform/rcar-vin/rcar-csi2.c.

(Unless I've missed something, of course).

Cheers,
Ezequiel
