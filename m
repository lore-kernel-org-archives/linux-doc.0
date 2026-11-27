Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775120;
	b=5KZIrfMs8QHvzzNMwTSCF0Sxz3MgE94dlSPDCjcwcQS0VHApByqkVJevT47Of+4HUOwl
	 e2/2yjnlzrqa8U1uqzOzn+yrW/0H49v0a9QjV3bhfnViiaJP0Vtnz3qUCVC1zl8dsF0f1
	 lNjBrl0HpsFhtpQMxzqWexCrP+D72SLQIDS2/E/1u13sKN/u9eyevDWj37b9tTs430D+F
	 ryDuRCA6cH8SDuN5J/qBxMl5ADuca65E548MYY23s4UvBsuGzj9emkTpVyvXZ67lbwytC
	 xAFy4U1SG0m7ryNBiXiDKLzU0IZZprnWus9f6r76T2pK5M9nuthcduVA6+s+bZQgAaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
	b=293tRcGbFK2ZkX86RH1lctaC4wgmrV2P+xRmLr7M0JG8jiK6uqyJDMXgXEPWUpyK3s7K
	 MGGcWRO1dJdIZWZftrpntwxR27o1IDPmQf/6Ubvg2PeVg0LwyHSP4X3xhN9COaSwFefj7
	 g4WNxiziykwBojB4hKBSdugEF13OegoRWzhOSTva6rZHdRS8Qytr8dSAak3Fig2+KfFII
	 9+oJPlHLmAUdPCHiE66bLum9kjBbGNNeir9JPk9R/qtFS10cWHsWPC8FEYPAzouVtK5Ll
	 YIhSM4KAPowstMZ9CcY/7ykdB+ucxS/WqjXLpfTQVqUHaLAjsI8XeNOpc62nqQ97dIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x09ARc4d;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C0606A31C
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x09ARc4d
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a358881793so4168822f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795775118; x=1796379918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
        b=x09ARc4dEpbJm2mw7dehBgq9g96PhoPVNTPqm4UD33OmEymvTsufK1J1uPavmbfPtA
         rUq6fAuPFFbqdQ501QYMXs1zbEIDRiDc7tri26DGtc7DjCz8Janyr3Sx7YkdowuhuUUD
         sKPc/vENG2m10Xnm+AV3xnnhmFIxKdNGJfLAkAfrXiLDWxurH13O8/k86ItsQ0UDml9Q
         gtSvv0GygLETgFftQy5kgeITPPKnYnUvh4dvigy7DwaSTW/e0Q5q7t6XNJMIKP1xqNDf
         4WCy61wHyRLMulgLTzEpQZN5fBXV+2SnDtOBvTbgzRKOJb9U0TiEE5UltZluYRibOluc
         ptJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775118; x=1796379918;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mc1ssleJtu8B4w1hoFLbQA3D7PDsqJA2CqNZTg9L5j8=;
        b=kEzDrpct6nUumY/N7EOlpfxS2I5jcqAHmYy31maQP266fqnx7vbtLpPaP0uO54N5/z
         OKYvoZsxAMJxNRClkBe13aWZXCnwDV858lkCob25dpuh9GHAzuE/F6ISoY8BRvyWFb9M
         vaMyCCdD3mxagcoF//jJ9sM0+odlNWDYWSGoi1vda9P9Nl7BuInrFXhKlwUt5DwoE/8g
         fkSfghteopj2Pnumj90NH76tQxH9loObJ0ETwXD9DGHauTaUwMyMLJYmy6v+APZFuZrX
         fOKTCVjKWZ7yTalQRAIDZSUwBd22zwcLhhWqoq+hBdq6NPxp82noC/i75FyTV8qJpaDy
         l8iA==
X-Forwarded-Encrypted: i=1; AL+hErEDSwNhNL99Ufi/mNMSnhZ6tBn5XA7Nndmhy/8i3gaizsxT1DVSV0ODY43DIcuxCPRA6lPsUC2n8xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s9PhaRpZZh/8BUlljXyXrvcF85JhEq84O7Uq2M36JTQzqkUO2
	0hgVHkexAk+/HYickWTWbN/nFkqBQaJe1BhnnnTrP2CWZsnOhQCIrhVC
X-Gm-Gg: AZFdTZcJP8KF6eT2sOHvk4xLpqXWOiInyAe8mX3vDbJsSAgQV9UDBmJ5USE8rcoLkl4
	/NKMqXfBpGe+zWZff4H8nJh3jGonEdIM4TNJ3Npz3dm+RIXEUqXJL3B/zvJsH/hr6zA3pzJHsQs
	cK5FR4CRPyPIMfO8GaL5OFE6GNm5Vulkh2DkQKw4RBFKPXmcxEUa0umlDvPwJlkEU+gzqhgJKSF
	l6TbzKZStctuFNefWG1BlyHDNH4JGEFGB6ECO4bY7JlEi2FM43vaH/1JRMsvQ6SFml4q9PlILTZ
	6qLx8hC5s+/cYM1kM+V6b+E90DqmRCHnUtXL7aAJ3caO99Dp0uwcnos/qzoWzHWSsG++hxgftNu
	33Rh6Gwt9hZLkHWJUoGDY7okSACFaqPzcmja5lpFBaIzJ9tayKzpeOMabx//mYjbVoYsFr9Rki9
	sv5BPGBrJFqqRzwredtye9tphZMOv+2KdM24JTMWv/sdjDtW8Al6Gy4ZQy98VS5hbY7jd0COsK5
	8ICWH8QW0+JCI5SS6XDb0zgjQiWtLAECBhgFTZ0rQBckZWfSwcWlWYzPzJJERo++p7Ny7HQUYzJ
	1Ccr7c62GoY3TdQvGDPYcwqYwuHyOs0=
X-Received: by 2002:a5d:6f13:0:b0:4a7:a7d2:eb45 with SMTP id ffacd0b85a97d-4abb6d04777mr42212072f8f.44.1795775118151;
        Fri, 27 Nov 2026 02:25:18 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm46450608f8f.41.2026.11.27.02.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:25:17 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 12/43] drm/vkms: Add KUnit test for device lifecycle
Date: Fri, 27 Nov 2026 11:24:57 +0100
Message-ID: <awlZ_hnb32taepmt@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-12-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-12-21194cda2468@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 12:28:55PM +0100, Louis Chauvet wrote:
> The configuration objects are now reference-counted and their lifetime is
> driven by explicit get/put calls. Add tests aiming to spot UAF and leaks
> using KASAN.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/.kunitconfig          |  10 +
>  drivers/gpu/drm/vkms/tests/Makefile              |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c | 280 +++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.c                  |   3 +
>  4 files changed, 295 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
> index 6a2d87068edc..c9752bde8487 100644
> --- a/drivers/gpu/drm/vkms/tests/.kunitconfig
> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
> @@ -2,3 +2,13 @@ CONFIG_KUNIT=y
>  CONFIG_DRM=y
>  CONFIG_DRM_VKMS=y
>  CONFIG_DRM_VKMS_KUNIT_TEST=y
> +CONFIG_KASAN=y
> +CONFIG_KASAN_INLINE=y
> +CONFIG_KASAN_VMALLOC=y
> +CONFIG_KUNIT_ALL_TESTS=n
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_OBJECTS_FREE=y
> +CONFIG_DEBUG_OBJECTS_TIMERS=y
> +CONFIG_PAGE_POISONING=y
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index d4d9ba8d4c54..a7810a12c9c8 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -3,6 +3,7 @@
>  vkms-kunit-tests-y := \
>  	vkms_config_test.o \
>  	vkms_format_test.o \
> -	vkms_color_test.o
> +	vkms_color_test.o \
> +	vkms_lifecycle_test.o \
>  
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
> new file mode 100644
> index 000000000000..7f7b31368710
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_lifecycle_test.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <kunit/test.h>
> +#include <linux/string.h>
> +
> +#include "../vkms_config.h"
> +#include "../vkms_drv.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +#define LIFECYCLE_ITERATIONS 50
> +#define STRESS_ITERATIONS    500
> +
> +/*
> + * vkms_init() may already have registered a device named DEFAULT_DEVICE_NAME,
> + * so give each test configuration its own name: vkms_create() fails with
> + * -EEXIST otherwise.
> + */
> +static void vkms_lifecycle_test_set_unique_name(struct kunit *test,
> +						struct vkms_config *config,
> +						const char *name)
> +{
> +	const char *new_name = kstrdup_const(name, GFP_KERNEL);
> +
> +	KUNIT_ASSERT_NOT_NULL(test, new_name);
> +	kfree_const(config->dev_name);
> +	config->dev_name = new_name;
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_default(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_with_overlay(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_with_pipeline(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, true);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_minimal(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(false, false, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_create_destroy_writeback(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < LIFECYCLE_ITERATIONS; i++) {
> +		config = vkms_config_default_create(false, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_stress_many_cycles(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < STRESS_ITERATIONS; i++) {
> +		config = vkms_config_default_create(true, true, true, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_interleaved_create_destroy(struct kunit *test)
> +{
> +	struct vkms_config *configs[5];
> +	char name[64];
> +	int ret, i, j;
> +
> +	for (j = 0; j < 20; j++) {
> +		for (i = 0; i < 5; i++) {
> +			configs[i] = vkms_config_default_create(i & 1, i & 2, i & 4, false);
> +			KUNIT_ASSERT_NOT_ERR_OR_NULL(test, configs[i]);
> +
> +			snprintf(name, sizeof(name), "%s-%d", test->name, i);
> +			vkms_lifecycle_test_set_unique_name(test, configs[i], name);
> +
> +			ret = vkms_create(configs[i]);
> +			KUNIT_ASSERT_EQ(test, ret, 0);
> +		}
> +
> +		for (i = 4; i >= 0; i--) {
> +			vkms_destroy(configs[i]);
> +			vkms_config_destroy(configs[i]);
> +		}
> +	}
> +}
> +
> +static void vkms_lifecycle_test_destroy_uncreated_device(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +
> +	KUNIT_ASSERT_NULL(test, config->dev);
> +
> +	vkms_config_destroy(config);
> +}
> +
> +static void vkms_lifecycle_test_double_destroy(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +	ret = vkms_create(config);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	vkms_destroy(config);
> +	KUNIT_ASSERT_NULL(test, config->dev);
> +
> +	vkms_config_destroy(config);
> +}
> +
> +static void vkms_lifecycle_test_create_after_destroy(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +	int ret, i;
> +
> +	for (i = 0; i < 20; i++) {
> +		config = vkms_config_default_create(true, true, false, false);
> +		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +		vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +
> +		ret = vkms_create(config);
> +		KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +		vkms_destroy(config);
> +		vkms_config_destroy(config);
> +	}
> +}
> +
> +static void vkms_lifecycle_test_connector_ref_outlives_config(struct kunit *test)
> +{
> +	struct vkms_config_connector *connector_cfg;
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(false, false, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	KUNIT_ASSERT_FALSE(test, list_empty(&config->connectors));
> +
> +	connector_cfg = list_first_entry(&config->connectors,
> +					 struct vkms_config_connector, link);
> +
> +	/* Simulate the rmdir while DRM hold the device */
> +	vkms_config_connector_get(connector_cfg);
> +	vkms_config_destroy_connector(connector_cfg);
> +	vkms_config_destroy(config);
> +
> +	/* The connector must survive, detached from the configuration. */
> +	KUNIT_EXPECT_EQ(test, kref_read(&connector_cfg->refcnt), 1);
> +	KUNIT_EXPECT_TRUE(test, connector_cfg->unlinked);
> +
> +	/* Last reference: connector and configuration are freed here. */
> +	vkms_config_connector_put(connector_cfg);
> +}
> +
> +static void vkms_lifecycle_test_connector_static_drmm_release(struct kunit *test)
> +{
> +	struct vkms_config *config;
> +
> +	config = vkms_config_default_create(true, true, false, false);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
> +	vkms_lifecycle_test_set_unique_name(test, config, test->name);
> +
> +	KUNIT_ASSERT_EQ(test, vkms_create(config), 0);
> +
> +	/* vkms_destroy() runs the drmm action, which frees and detaches the connector. */
> +	vkms_destroy(config);
> +	vkms_config_destroy(config);
> +}
> +
> +static struct kunit_case vkms_lifecycle_test_cases[] = {
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_default),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_overlay),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_with_pipeline),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_minimal),
> +	KUNIT_CASE(vkms_lifecycle_test_create_destroy_writeback),
> +	KUNIT_CASE(vkms_lifecycle_test_stress_many_cycles),
> +	KUNIT_CASE(vkms_lifecycle_test_interleaved_create_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_destroy_uncreated_device),
> +	KUNIT_CASE(vkms_lifecycle_test_double_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_create_after_destroy),
> +	KUNIT_CASE(vkms_lifecycle_test_connector_ref_outlives_config),
> +	KUNIT_CASE(vkms_lifecycle_test_connector_static_drmm_release),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_lifecycle_test_suite = {
> +	.name = "vkms-lifecycle",
> +	.test_cases = vkms_lifecycle_test_cases,
> +};
> +
> +kunit_test_suite(vkms_lifecycle_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit test for VKMS device lifecycle, aiming to catch UAF and memory issues");
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 24572bc779b4..f73f136e5588 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -18,6 +18,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_colorop.h>
> +#include <kunit/visibility.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_file.h>
> @@ -252,6 +253,7 @@ static int __init vkms_init(void)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_create);
>  
>  void vkms_destroy(struct vkms_config *config)
>  {
> @@ -271,6 +273,7 @@ void vkms_destroy(struct vkms_config *config)
>  
>  	config->dev = NULL;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_destroy);
>  
>  static void __exit vkms_exit(void)
>  {
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
