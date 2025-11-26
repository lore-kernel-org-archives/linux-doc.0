Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A6533B6ED
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 18:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183233; cv=none; b=fuAj3UbRlrWYGVDyDZ7vzqCFHjw62wMVll9MkkoJOkxEyJWVPYDG69slXVzxu3U9gaVejsxYmV143FXJTXYjZM67LcMA1rsMF9Gwpr8TjvC9oYC5MUw/jhy1lMDtyGTDINLBwY5FxBmqQI6d2Aqv6EIWPHKbvTQ1oDlizxPpnc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183233; c=relaxed/simple;
	bh=8JfeMU4f+ejyGrG/mg0eNG85ZPpBalABlkGgmFmYvMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ST5ADBO9xzLZ8uKt73QvhTyilBEf8gCB+W9m9RMzHQatNYu5wIJ8BD5+uAcxL6Oqw28E/0eTBlbW76wxssn9+Bsp+HBYido3SNr/iNRih1L6Cg3/O9TWGLmjY5sMZlp/KIBsorGbeIDssvu7zdGvVxVF3LnSkCIMDZOIcTEUDxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y8XrtyMx; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y8XrtyMx"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7ba55660769so30222b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764183229; x=1764788029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mq2XBIpsGc4011DX1gJd43x1R00OiU+60gqNwlElNlI=;
        b=y8XrtyMxPFpHpJgh769rkV+CEfhaNodiblwC+2tTiVlaMqm/IMjF6Gy3XGq8lgIcGR
         jAaKKOXGYCCxNAi80qCfZmUrZ9+mnfYS29gd65vUg+GfxtE+WfIaF2K4AIKG16WzEOWN
         e0iub/sWknE1OS5RsE7QNnw6jUV8ZrG/NPR3SGh56M2MRdlo/4fbFOFHHM48zdfMlyyp
         3ygFff2ikFYH+jQ2JwMdw9/BbFeogoWcRWL+Bno7doXtpyPFpjgNjuhx+W37WRFPXSgz
         aM0KAYNreoPQ0H57QrdbsPVYR1aVUJezu4VMmgFn6/W4UMeiGwus0HVr3A0RpPrstXMA
         eEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183229; x=1764788029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mq2XBIpsGc4011DX1gJd43x1R00OiU+60gqNwlElNlI=;
        b=oprsfdGJ8sA6bgsf4+USAZuwCt76LtPhKkJJ8b8ITvfBo2IyS1UBF6klD2glU3U/Jr
         UuLCNQGLFmJcjYN2JoqTcEk2QqQWjV0V8d2r5IJNKxXGghllwbtzw+9+c53NQhfnkHi8
         3QVe+uEQ1vMIMJIkwsF6lyoG0ZYAbATBevlHh8d79+0WyvqJeGi7ZoWCiOLR7XSC4xXF
         AOeAN5f+qFR3kIHpTreENgyNgbJ5EASWkRlnGP0NI1ZQL4PVCRt4pmX5vbbNOLSFSbmK
         s8EgBP2JLRv5GfCULEKDe5rns4/jJZ736BXW0xo2zG/X1aaqaeN5nSckvmLt3hHmFBbf
         dE7w==
X-Forwarded-Encrypted: i=1; AJvYcCXm5VX0CtKTO7kfEB1oet2pHyG1DPNUgUta2al7i141tvwKCJoC0qcDo5yO86qIHzlGbxnAcrfbfQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ4QU/iYgw6dzO26dc/dcQ84449MUF5H0xLKoB3BjvrOoXfi2q
	1mPSpYoXt79cFr97oJKb2oBtvoVLnmtjTUZNdSX2nvDYNZKz8xLs05Dq6O8WQbkwS5U=
X-Gm-Gg: ASbGncsTGFOm7pcoMQlXNZziZAMwnFPiuVOf5uXsiTvIVy05/tdcw9uhh5HfC8UxB85
	hlbois1q+9p8SF1BwOxbdoet/+IPlmn6EhwqTlPR0jL7kxWO4UL9B3xvs+xxpS+gsJAfBSYS0QE
	MPXh9igVC5CgD7zxZXq4HPq0/0p691vESzQ2qiK3ODlowPgk86aSe8PKSDNiTz5LBkRwi1TlkF+
	QKJLDuTl7pNzXTz1pcxaPYrIRFq9dyyYkitdHtGeBCK5NGcJqhextWhApSal2d9YDy9bNZQQI7O
	a02njk+QCDBZ+jkmpol9TcX6Ght2FnKB14oPffidK4Xj2bu7zjS/mZlmbSL70OzxzFp5YPJ5YYV
	d50FgKF6yWA06pmlzOt3ofG8W19zce8EdYSeGCyC39hgsnaFjHByGL4HMVHF60QDDRAR1YObMWi
	TPaLaD6+DHc1terg==
X-Google-Smtp-Source: AGHT+IH6yf/l+DZHbySczlM5JQ+ydQaTEtDsP6GNL6XJXjhvoQuOXgdT0L/+TxBw8IVakjgXnzUsdw==
X-Received: by 2002:a05:6a00:1aca:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7c58c2b0d3amr24554854b3a.6.1764183229163;
        Wed, 26 Nov 2025 10:53:49 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:2740:a6c4:e7f4:165e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f024ace6sm22571815b3a.34.2025.11.26.10.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:53:48 -0800 (PST)
Date: Wed, 26 Nov 2025 11:53:45 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Message-ID: <aSdMufLCeqvVyKsp@p14s>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-3-shenwei.wang@nxp.com>

On Tue, Nov 04, 2025 at 02:33:12PM -0600, Shenwei Wang wrote:
> Register the RPMsg channel driver and populate remote devices defined
> under the "rpmsg" subnode upon receiving their notification messages.
> 
> The following illustrates the expected DTS layout structure:
> 
> 	cm33: remoteproc-cm33 {
> 		compatible = "fsl,imx8ulp-cm33";
> 
> 		rpmsg {
> 			rpmsg-io-channel {
> 				gpio@0 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <0>;
> 				};
> 
> 				gpio@1 {
> 					compatible = "fsl,imx-rpmsg-gpio";
> 					reg = <1>;
> 				};
> 
> 				...
> 			};
> 
> 			rpmsg-i2c-channel {
> 				i2c@0 {
> 					compatible = "fsl,imx-rpmsg-i2c";
> 					reg = <0>;
> 				};
> 			};
> 
> 			...
> 		};
> 	};
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c  | 146 ++++++++++++++++++++++++++++++++
>  include/linux/rpmsg/imx_rpmsg.h |  48 +++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 include/linux/rpmsg/imx_rpmsg.h
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9..e21a7980c490 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/rpmsg/imx_rpmsg.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -15,6 +16,8 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> @@ -22,6 +25,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +struct imx_rpmsg_driver {
> +	struct rpmsg_driver rpdrv;
> +	void *driver_data;
> +};
> +
> +static char *channel_device_map[][2] = {
> +	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
> +	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
> +};
> +
> +static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
> +				 int len, void *priv, u32 src)
> +{
> +	struct imx_rpmsg_driver_data *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (drvdata && drvdata->rx_callback)
> +		return drvdata->rx_callback(rpdev, data, len, priv, src);
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
> +{
> +	of_platform_depopulate(&rpdev->dev);
> +}
> +
> +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
> +{

Where does the rpmsg_device come from?  Usually there is a call to
rpmsg_register_device() and I don't see it anywhere in this patchset.  I also
don't see a link to the remote processor.  I can't continue with this set for as
long as I don't have this information.

> +	struct imx_rpmsg_driver_data *drvdata;
> +	struct imx_rpmsg_driver *imx_rpdrv;
> +	struct device *dev = &rpdev->dev;
> +	struct of_dev_auxdata *auxdata;
> +	struct rpmsg_driver *rpdrv;
> +	int i;
> +
> +	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
> +	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
> +
> +	if (!imx_rpdrv->driver_data)
> +		return -EINVAL;
> +
> +	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	i = drvdata->map_idx;
> +	if (i >= ARRAY_SIZE(channel_device_map))
> +		return -ENODEV;
> +
> +	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
> +	if (!auxdata)
> +		return -ENOMEM;
> +
> +	drvdata->rpdev = rpdev;
> +	auxdata[0].compatible = channel_device_map[i][1];
> +	auxdata[0].platform_data = drvdata;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
> +	of_node_put(drvdata->channel_node);
> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_is_in_map(const char *name)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
> +		if (strcmp(name, channel_device_map[i][0]) == 0)
> +			return i;
> +	}
> +
> +	return -1;
> +}
> +
> +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> +					  struct device *dev, int idx)
> +{
> +	struct imx_rpmsg_driver_data *driver_data;
> +	struct imx_rpmsg_driver *rp_driver;
> +	struct rpmsg_device_id *rpdev_id;
> +
> +	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
> +	if (!rpdev_id)
> +		return -ENOMEM;
> +
> +	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
> +
> +	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> +	if (!rp_driver)
> +		return -ENOMEM;
> +
> +	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	driver_data->rproc_name = dev->of_node->name;
> +	driver_data->channel_node = channel;
> +	driver_data->map_idx = idx;
> +
> +	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
> +	rp_driver->rpdrv.id_table = rpdev_id;
> +	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
> +	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
> +	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
> +	rp_driver->driver_data = driver_data;
> +
> +	register_rpmsg_driver(&rp_driver->rpdrv);
> +
> +	return 0;
> +}
> +
> +static int imx_of_rpmsg_node_init(struct platform_device *pdev)
> +{
> +	struct device_node *np __free(device_node);
> +	struct device *dev = &pdev->dev;
> +	int idx, ret;
> +
> +	np = of_get_child_by_name(dev->of_node, "rpmsg");
> +	if (!np)
> +		return 0;
> +
> +	for_each_child_of_node_scoped(np, child) {
> +		idx = imx_of_rpmsg_is_in_map(child->name);
> +		if (idx < 0)
> +			ret = of_platform_default_populate(child, NULL, dev);
> +		else
> +			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		goto err_put_clk;
>  	}
>  
> +	ret = imx_of_rpmsg_node_init(pdev);
> +	if (ret < 0)
> +		dev_info(dev, "populating 'rpmsg' node failed\n");
> +
>  	return 0;
>  
>  err_put_clk:
> diff --git a/include/linux/rpmsg/imx_rpmsg.h b/include/linux/rpmsg/imx_rpmsg.h
> new file mode 100644
> index 000000000000..04a5ad2d4a1d
> --- /dev/null
> +++ b/include/linux/rpmsg/imx_rpmsg.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2025 NXP */
> +
> +/*
> + * @file linux/imx_rpmsg.h
> + *
> + * @brief Global header file for iMX RPMSG
> + *
> + * @ingroup RPMSG
> + */
> +#ifndef __LINUX_IMX_RPMSG_H__
> +#define __LINUX_IMX_RPMSG_H__
> +
> +/* Category define */
> +#define IMX_RMPSG_LIFECYCLE	1
> +#define IMX_RPMSG_PMIC		2
> +#define IMX_RPMSG_AUDIO		3
> +#define IMX_RPMSG_KEY		4
> +#define IMX_RPMSG_GPIO		5
> +#define IMX_RPMSG_RTC		6
> +#define IMX_RPMSG_SENSOR	7
> +
> +/* rpmsg version */
> +#define IMX_RMPSG_MAJOR		1
> +#define IMX_RMPSG_MINOR		0
> +
> +#define MAX_DEV_PER_CHANNEL	10
> +
> +struct imx_rpmsg_head {
> +	u8 cate;	/* Category */
> +	u8 major;	/* Major version */
> +	u8 minor;	/* Minor version */
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 reserved[5];
> +} __packed;
> +
> +struct imx_rpmsg_driver_data {
> +	int map_idx;
> +	const char *rproc_name;
> +	struct rpmsg_device *rpdev;
> +	struct device_node *channel_node;
> +	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
> +			   int len, void *priv, u32 src);
> +	void *channel_devices[MAX_DEV_PER_CHANNEL];
> +};
> +
> +#endif /* __LINUX_IMX_RPMSG_H__ */
> -- 
> 2.43.0
> 
