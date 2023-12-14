Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="e89WRZiq"
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDDC115
	for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 06:40:08 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dbcc9d4b1aeso2087885276.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Dec 2023 06:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1702564808; x=1703169608; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVbbR720mxFQWZWSF5/+frzTWN+zosuo0CwTK2ojkMc=;
        b=e89WRZiqS/mxnnSFPbD1PbJq+rKp5JIFJEtgfw2p3Mgne+dA8Pxk8up9WpX/ESAczr
         kjOnObY0FYsI/ws7inCt+/wBO+07+hzG4gY+XgbYup/ctlY9Fz2JfnkiygvNkE4VuSss
         dTCQQ/zYpZ3vpj1ijBYyRuVbEjBXeusZkMBaB/NJHKRGGqDCqo8XCPX1thkRS/owESzx
         hqMcVN0BqBKIr9WfezWyYrr9zFN/7maPA+mtYQZtFfO+9mQPTouwPjUazoQw8JmgCcmj
         AQX31tu7XGhgf2JKQcKGsOqS823yOPwULq/Yb/Ba5PX4/YsykgTIFJhcFatr2Ubm4Zr2
         LpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702564808; x=1703169608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVbbR720mxFQWZWSF5/+frzTWN+zosuo0CwTK2ojkMc=;
        b=nR4+mdOOIH8co9QDtd1AMnk0AgVLRYU8W+nmbJyQTIViO0rniIgMuE40br98+wTTws
         4baC8cj+r9+0Adb9uxDPCAjbuqEtpZSRcMWDSwYLZbhceZnuQoMX7jDZGECgQwIQIIuM
         /KGS8bSY3Iqj51qlUGtDUEI/WnE5fa1tkTGFFjBxXbm8m7Swef1RuXUiBi06kFW7b2qU
         8ERKjHLLykzG1/2+3CE7Bk9pq9hikjHrOTGfA0PA6gQ1VCOOPOIqw1vIx6boSMSWWLNa
         V8iPwF34qgI9WuGDrLGdrfwCvPFc06d9pSymXcgylfQc4djm76kEdMV0yfwjFv5oTKhP
         urtg==
X-Gm-Message-State: AOJu0Yy5mitM+Db9IuIfht+yZxC9eJZaCgSYYLdru/kyYhiaj8hT1JSq
	AzlfHeHPH8B8xFdwV6RJDptZDPue86DrlA7VKZywlA==
X-Google-Smtp-Source: AGHT+IE2fGQgctDfqw+SdyQcQrVtSDwfkDhdhufA57h07Dfv7cH935CDl5idwK5f/LKOwnfwTJf5aUvfXaezh/MpzdQ=
X-Received: by 2002:a05:6902:cc2:b0:da3:b466:1f73 with SMTP id
 cq2-20020a0569020cc200b00da3b4661f73mr7064045ybb.24.1702564807819; Thu, 14
 Dec 2023 06:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org> <20231207-kms-hdmi-connector-state-v5-6-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-6-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Dec 2023 14:39:51 +0000
Message-ID: <CAPY8ntCzdxJ5zyk4eeWV8D+WBdfri61ttoNxVtJUZSAKHoMpGQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/44] drm/connector: Introduce an HDMI connector
 initialization function
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Maxime

As requested, I'm just going through patches 6-16.
I will say that I've been less thorough in checking the kunit test
code in this series than the core code changes, and I'm trusting that
all the unit tests pass.

I get a build failure on the complete series for arm64 with the
standard defconfig
depmod: ERROR: Cycle detected: drm_display_helper -> drm_kms_helper ->
drm_display_helper
depmod: ERROR: Cycle detected: drm
depmod: ERROR: Found 2 modules in dependency cycles!

I haven't followed it through as to the reason, but obviously that
will need to be addressed.

  Dave

On Thu, 7 Dec 2023 at 15:49, Maxime Ripard <mripard@kernel.org> wrote:
>
> A lot of the various HDMI drivers duplicate some logic that depends on
> the HDMI spec itself and not really a particular hardware
> implementation.
>
> Output BPC or format selection, infoframe generation are good examples
> of such areas.
>
> This creates a lot of boilerplate, with a lot of variations, which makes
> it hard for userspace to rely on, and makes it difficult to get it right
> for drivers.
>
> In the next patches, we'll add a lot of infrastructure around the
> drm_connector and drm_connector_state structures, which will allow to
> abstract away the duplicated logic. This infrastructure comes with a few
> requirements though, and thus we need a new initialization function.
>
> Hopefully, this will make drivers simpler to handle, and their behaviour
> more consistent.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_connector.c            |  39 +++++++++
>  drivers/gpu/drm/tests/drm_connector_test.c | 123 +++++++++++++++++++++++++++++
>  include/drm/drm_connector.h                |   5 ++
>  3 files changed, 167 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae..d9961cce8245 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -452,6 +452,45 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>
> +/**
> + * drmm_connector_hdmi_init - Init a preallocated HDMI connector
> + * @dev: DRM device
> + * @connector: A pointer to the HDMI connector to init
> + * @funcs: callbacks for this connector
> + * @connector_type: user visible type of the connector
> + * @ddc: optional pointer to the associated ddc adapter
> + *
> + * Initialises a preallocated HDMI connector. Connectors can be
> + * subclassed as part of driver connector objects.
> + *
> + * Cleanup is automatically handled with a call to
> + * drm_connector_cleanup() in a DRM-managed action.
> + *
> + * The connector structure should be allocated with drmm_kzalloc().
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drmm_connector_hdmi_init(struct drm_device *dev,
> +                            struct drm_connector *connector,
> +                            const struct drm_connector_funcs *funcs,
> +                            int connector_type,
> +                            struct i2c_adapter *ddc)
> +{
> +       int ret;
> +
> +       if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +             connector_type == DRM_MODE_CONNECTOR_HDMIB))
> +               return -EINVAL;
> +
> +       ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drmm_connector_hdmi_init);
> +
>  /**
>   * drm_connector_attach_edid_property - attach edid property.
>   * @connector: the connector
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index a268847be8d1..8f070cacab3b 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -172,6 +172,128 @@ static struct kunit_suite drmm_connector_init_test_suite = {
>         .test_cases = drmm_connector_init_tests,
>  };
>
> +/*
> + * Test that the registration of a bog standard connector works as
> + * expected and doesn't report any error.
> + */
> +static void drm_test_connector_hdmi_init_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of a connector without a DDC adapter
> + * doesn't report any error.
> + */
> +static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      DRM_MODE_CONNECTOR_HDMIA,
> +                                      NULL);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +/*
> + * Test that the registration of an HDMI connector with an HDMI
> + * connector type succeeds.
> + */
> +static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       unsigned int connector_type = *(unsigned int *)test->param_value;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      connector_type,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
> +static const unsigned int drm_connector_hdmi_init_type_valid_tests[] = {
> +       DRM_MODE_CONNECTOR_HDMIA,
> +       DRM_MODE_CONNECTOR_HDMIB,
> +};
> +
> +static void drm_connector_hdmi_init_type_desc(const unsigned int *type, char *desc)
> +{
> +       sprintf(desc, "%s", drm_get_connector_type_name(*type));
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_valid,
> +                 drm_connector_hdmi_init_type_valid_tests,
> +                 drm_connector_hdmi_init_type_desc);
> +
> +/*
> + * Test that the registration of an HDMI connector with an !HDMI
> + * connector type fails.
> + */
> +static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
> +{
> +       struct drm_connector_init_priv *priv = test->priv;
> +       unsigned int connector_type = *(unsigned int *)test->param_value;
> +       int ret;
> +
> +       ret = drmm_connector_hdmi_init(&priv->drm, &priv->connector,
> +                                      &dummy_funcs,
> +                                      connector_type,
> +                                      &priv->ddc);
> +       KUNIT_EXPECT_LT(test, ret, 0);
> +}
> +
> +static const unsigned int drm_connector_hdmi_init_type_invalid_tests[] = {
> +       DRM_MODE_CONNECTOR_Unknown,
> +       DRM_MODE_CONNECTOR_VGA,
> +       DRM_MODE_CONNECTOR_DVII,
> +       DRM_MODE_CONNECTOR_DVID,
> +       DRM_MODE_CONNECTOR_DVIA,
> +       DRM_MODE_CONNECTOR_Composite,
> +       DRM_MODE_CONNECTOR_SVIDEO,
> +       DRM_MODE_CONNECTOR_LVDS,
> +       DRM_MODE_CONNECTOR_Component,
> +       DRM_MODE_CONNECTOR_9PinDIN,
> +       DRM_MODE_CONNECTOR_DisplayPort,
> +       DRM_MODE_CONNECTOR_TV,
> +       DRM_MODE_CONNECTOR_eDP,
> +       DRM_MODE_CONNECTOR_VIRTUAL,
> +       DRM_MODE_CONNECTOR_DSI,
> +       DRM_MODE_CONNECTOR_DPI,
> +       DRM_MODE_CONNECTOR_WRITEBACK,
> +       DRM_MODE_CONNECTOR_SPI,
> +       DRM_MODE_CONNECTOR_USB,
> +};
> +
> +KUNIT_ARRAY_PARAM(drm_connector_hdmi_init_type_invalid,
> +                 drm_connector_hdmi_init_type_invalid_tests,
> +                 drm_connector_hdmi_init_type_desc);
> +
> +static struct kunit_case drmm_connector_hdmi_init_tests[] = {
> +       KUNIT_CASE(drm_test_connector_hdmi_init_valid),
> +       KUNIT_CASE(drm_test_connector_hdmi_init_null_ddc),
> +       KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_valid,
> +                        drm_connector_hdmi_init_type_valid_gen_params),
> +       KUNIT_CASE_PARAM(drm_test_connector_hdmi_init_type_invalid,
> +                        drm_connector_hdmi_init_type_invalid_gen_params),
> +       { }
> +};
> +
> +static struct kunit_suite drmm_connector_hdmi_init_test_suite = {
> +       .name = "drmm_connector_hdmi_init",
> +       .init = drm_test_connector_init,
> +       .test_cases = drmm_connector_hdmi_init_tests,
> +};
> +
>  struct drm_get_tv_mode_from_name_test {
>         const char *name;
>         enum drm_connector_tv_mode expected_mode;
> @@ -236,6 +358,7 @@ static struct kunit_suite drm_get_tv_mode_from_name_test_suite = {
>  };
>
>  kunit_test_suites(
> +       &drmm_connector_hdmi_init_test_suite,
>         &drmm_connector_init_test_suite,
>         &drm_get_tv_mode_from_name_test_suite
>  );
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..4491c4c2fb6e 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1904,6 +1904,11 @@ int drmm_connector_init(struct drm_device *dev,
>                         const struct drm_connector_funcs *funcs,
>                         int connector_type,
>                         struct i2c_adapter *ddc);
> +int drmm_connector_hdmi_init(struct drm_device *dev,
> +                            struct drm_connector *connector,
> +                            const struct drm_connector_funcs *funcs,
> +                            int connector_type,
> +                            struct i2c_adapter *ddc);
>  void drm_connector_attach_edid_property(struct drm_connector *connector);
>  int drm_connector_register(struct drm_connector *connector);
>  void drm_connector_unregister(struct drm_connector *connector);
>
> --
> 2.43.0
>
