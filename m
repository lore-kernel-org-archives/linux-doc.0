Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D332ED20
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024554; cv=none; b=OcaCnV4zjXJSx57lSKyHamYLAz/7O7Dok4MR3+jGWm0zvbF6fBdm6Iu0CFuvsTqv3QKLm5BmdFAlaMQJ/GWbtdmtqODmCk8mO2dGjPE43Z65ySf86tbHSeHOBcq2bjCOI/edUInPrLh4eRc7dNlMIoD3CN2wnT7FPfxQrKNkg2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024554; c=relaxed/simple;
	bh=ML2DRdQ+p6tbvpx0MMFOVmUQZpx5cG5JuAyDT+nM9I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3p/3hYACOm2oKaHrv9tUsR4celuGG2KAKZ+SrpCmt9giwfhApHH3JPTLivtKKb/KG53x74HVZ9N6duRzXMM9xDMKI/L+SzouLR24hePtVVVsF3VE0D4oF5uqctVKboBfE1MCM9jb5Kd0NDJWa032qWXMZV7NnJz9CTfVgmQDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9/293tB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9/293tB"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b983fbd45so70010901fa.3
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 08:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024551; x=1767629351; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=viNL3mFHBnToRPhoCkRAwUSKqcs0NQzo4JsKb7OlQtg=;
        b=i9/293tBH4syjQzEMAViySzQvemyKDg9i42dhOh5q4X61U1aTGhkecRWpxF8qhCmLy
         TLKtl8UadB0voCI7Q+5eD4hi9mfrWZc2/QcqfB1DhtVrnV/ThAdbgth0Tb4sytDuiYYX
         R6h2PG871KLO1VAfIKTUAC2vV1prGfvMdSZuZY019YsofLEy0wnQL/JGqhz6SLjnMKpH
         MnNaAYRLI7K6sExzbvkusHL8BpTyKSyrcuIl5gA20blkCkioOwz6aRib+SVzINNFYvTf
         qgx1KN8fRHORSILhJj2AbSlmPxyQabB9bmrT61b3fVpGDyTRhmVLfmR+HUoee6gOWK1U
         wIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024551; x=1767629351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viNL3mFHBnToRPhoCkRAwUSKqcs0NQzo4JsKb7OlQtg=;
        b=GNQqdgCcyD19ESNAb9s7MauOaVGoT1EWxoFBZQdhKGBOgpOeh6dYh0Cfd+c786aYLY
         +DrRuK5SsCplqmgfkBP4/fPEpgovo2xW2n4MvRjqdYm9OpL91iq65EWaNJ1++LpeJ7fW
         zKzjpCir98OWGjK3ZMrAfFCGiznc2RBqy/n9tBDyhvdXkNWV8cO/MfLPf6x9KlesbSLA
         WGEfz2CjeZkjAfeknDCBzd0i05LSUegxknK/rfM3tnNO/0qqs4MvbIqICHwlIYVmbWE/
         DadpsvNGJ+DZlkfIx3ptoZKb0ZDkEzeuxzvGSMZ/MOvC2ifdcTKWOGAerloaVYvow/Vd
         gVCg==
X-Forwarded-Encrypted: i=1; AJvYcCWhPgxonJIo2WczWH7ByCqwXAQzV1zaRNzsy44Bt3GP2m2V8bwb8bsWGPjcr3R3EZOlIwPeLuEYZ/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22UfVIqo0bYC9i1IxFraiTMH+FSg9y5LNIAUbvylcxgzfhAVk
	vPpGdDJhrDbzRND6Eu5rriYR3sssguY0a4NWS4MaGQ6t66eVQXsQCrEw
X-Gm-Gg: AY/fxX52hC+NYA5dqv5vmCl4CMSLz0uadvgINivA0LaKyvR/MZMH8CbrXAXRJy0pQkb
	R8CHKIVBdy839nTejDbsMGwZZmHl4HT0wo4f0QDcZiE6f/9R8ZFRaOxHZe/EzpWb8K1U1u6VQnG
	/t/Zhu4lTekig8+M9a3H1jgBuyLWNXKjF/mrA1zOox2j5Gnga2/ODIsUhP0OjnI7QYuLd/MGCcK
	1MLDrTMo/nwXjYmwFKrW+vMAImABAIe/Y/GbGaTMmaqytUvVIkRQOt0Vhd1uJvNFTjBQP7Nk9sh
	Cnbu7BCxhH85DeytVsNRWgB8ysr+0J3xqRhF9DkTvlHnDMEJN8ZTPkotuLQ4XlshGfRo0/aiQGf
	H1CssCNq4+oH5bJ6O+oukmJ7awvOEPz2JqGvSYrddmQaBmuhGNiMDkw08XgbhqIoNIW1zbwUxAv
	ncXyyRAU0n0g==
X-Google-Smtp-Source: AGHT+IEq24qoXUndheWJd7OMN/IrFeM+ep1ZOCBIoWsrm2y8qXSBgYQ79tZu/kTLfxg6AJukkWKC/g==
X-Received: by 2002:a05:651c:549:b0:37b:9b58:dcfb with SMTP id 38308e7fff4ca-38121568e47mr109382561fa.7.1767024550384;
        Mon, 29 Dec 2025 08:09:10 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122539ae3sm79732271fa.21.2025.12.29.08.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:09:09 -0800 (PST)
Date: Mon, 29 Dec 2025 17:09:07 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aVKno9Oh1d1h06m2@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>

On Mon, Dec 22, 2025 at 11:11:20AM +0100, Louis Chauvet wrote:
> To allow the userspace to test many hardware configuration, introduce a
> new interface to configure the available formats per planes. VKMS supports
> multiple formats, so the userspace can choose any combination.
> 
> The supported formats are configured by writing the fourcc code in
> supported_formats:
>  # enable AR24 format
>   echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable AR24 format
>   echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # enable all format supported by VKMS
>   echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
>  # disable all formats
>   echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms         |   9 ++
>  Documentation/gpu/vkms.rst                      |   7 +-
>  drivers/gpu/drm/vkms/tests/Makefile             |   3 +-
>  drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 ++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.c            | 118 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h            |   6 ++
>  6 files changed, 243 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 2ace79ce848a..48f92538c602 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -153,6 +153,15 @@ Description:
>          Default color range presented to userspace, same
>          values as supported_color_ranges.
>  
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        List of supported formats for this plane. To add a new
> +        item, write its fourcc code prefixed with '+'. To remove,
> +        use '-' prefix. Use '+*' to add all formats, '-*' to
> +        remove all.
> +
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ab0eb2f97fc2..15d62ad963c9 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 8 configurable attributes:
> +Planes have 9 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -109,6 +109,11 @@ Planes have 8 configurable attributes:
>    must be set too.
>  - default_color_range: Default color range presented to the userspace, same
>    values as supported_color_ranges
> +- supported_formats: List of supported formats for this plane. To add a new item in the
> +  list, write it using a plus and fourcc code: +XR24
> +  To remove a format, use a minus and its fourcc: -XR24
> +  To add all formats use +*
> +  To remove all formats, use -*
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
> index d4d9ba8d4c54..92cfa7262ba4 100644
> --- a/drivers/gpu/drm/vkms/tests/Makefile
> +++ b/drivers/gpu/drm/vkms/tests/Makefile
> @@ -3,6 +3,7 @@
>  vkms-kunit-tests-y := \
>  	vkms_config_test.o \
>  	vkms_format_test.o \
> -	vkms_color_test.o
> +	vkms_color_test.o \
> +	vkms_configfs_test.o \
>  
>  obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
> new file mode 100644
> index 000000000000..8d02c2c459d9
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include "linux/printk.h"
> +#include <kunit/test.h>
> +
> +#include "../vkms_configfs.h"
> +
> +MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> +
> +/**
> + * struct vkms_configfs_parse_format_case - Store test case for format parsing
> + * @str: Contains the string to parse
> + * @str_len: str len
> + * @expected_len: expected len of the matched format
> + * @expected_offset: expected offset in the string for the parsed format
> + */
> +struct vkms_configfs_parse_format_case {
> +	const char *str;
> +	int str_len;
> +	int expected_len;
> +	int expected_offset;
> +};
> +
> +struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_cases[] = {
> +	{
> +		.str = "+RG24",
> +		.str_len = 6,
> +		.expected_len = 5,
> +		.expected_offset = 0,
> +	}, {
> +		.str = "-RG24",
> +		.str_len = 6,
> +		.expected_len = 5,
> +		.expected_offset = 0
> +	}, {
> +		.str = "  -RG24",
> +		.str_len = 8,
> +		.expected_len = 5,
> +		.expected_offset = 2
> +	}, {
> +		.str = "+*",
> +		.str_len = 3,
> +		.expected_len = 2,
> +		.expected_offset = 0
> +	}, {
> +		.str = "-RG24+RG24",
> +		.str_len = 11,
> +		.expected_len = 5,
> +		.expected_offset = 0
> +	}, {
> +		.str = "-R1+RG24",
> +		.str_len = 9,
> +		.expected_len = 3,
> +		.expected_offset = 0
> +	}, {
> +		.str = "\n-R1",
> +		.str_len = 5,
> +		.expected_len = 3,
> +		.expected_offset = 1
> +	}, {
> +		.str = "-R1111",
> +		.str_len = 3,
> +		.expected_len = 3,
> +		.expected_offset = 0
> +	}
> +};
> +
> +static void vkms_configfs_test_parse_format(struct kunit *test)
> +{
> +	const struct vkms_configfs_parse_format_case *param = test->param_value;
> +	char *out;
> +	int len = vkms_configfs_parse_next_format(param->str, param->str + param->str_len, &out);
> +
> +	KUNIT_EXPECT_EQ(test, len, param->expected_len);
> +	KUNIT_EXPECT_PTR_EQ(test, out, param->str + param->expected_offset);
> +}
> +
> +static void vkms_configfs_test_parse_format_get_desc(struct vkms_configfs_parse_format_case *t,
> +						     char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", t->str);
> +}
> +
> +KUNIT_ARRAY_PARAM(vkms_configfs_test_parse_format, vkms_configfs_parse_format_test_cases,
> +		  vkms_configfs_test_parse_format_get_desc
> +);
> +
> +static struct kunit_case vkms_configfs_test_cases[] = {
> +	KUNIT_CASE_PARAM(vkms_configfs_test_parse_format,
> +			 vkms_configfs_test_parse_format_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite vkms_configfs_test_suite = {
> +	.name = "vkms-configfs",
> +	.test_cases = vkms_configfs_test_cases,
> +};
> +
> +kunit_test_suite(vkms_configfs_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Kunit test for vkms configfs utility");
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 7be6d10b2b68..a451d1122acf 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -3,6 +3,8 @@
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> +#include <linux/string.h>
> +#include <kunit/visibility.h>
>  
>  #include "vkms_drv.h"
>  #include "vkms_config.h"
> @@ -628,6 +630,120 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	page[0] = '\0';
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		u32 *formats = vkms_config_plane_get_supported_formats(plane->config);
> +
> +		for (int i = 0;
> +		     i < vkms_config_plane_get_supported_formats_count(plane->config);
> +		     i++) {
> +			char tmp[6] = { 0 };
> +			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
> +					       (int)sizeof(*formats),
> +					       (char *)&formats[i]);
> +			if (ret < 0)
> +				return ret;
> +			/*
> +			 * Limitation of ConfigFS attributes, an attribute can't be bigger
> +			 * than PAGE_SIZE. This will crop the result if this plane support
> +			 * more than ≈1000 formats.
> +			 */
> +			if (ret + strlen(page) > PAGE_SIZE - 1)
> +				return -ENOMEM;
> +			strncat(page, tmp, ARRAY_SIZE(tmp));
> +		}
> +	}
> +
> +	return strlen(page);
> +}
> +
> +/**
> + * parse_next_format() - Parse the next format in page, skipping all non fourcc-related characters
> + * @page: page to search into
> + * @page_end: last character of the page
> + * @out: Output pointer, will point inside page
> + *
> + * Returns: size of the matched format, @out will point to the + or -
> + */
> +VISIBLE_IF_KUNIT
> +int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
> +{
> +	int count = page - page_end;

Shouldn't this be "page_end - page"? An example logging the variables shows
that "count" takes negative numbers:

$ echo "-XB48" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/supported_formats

[22854.585268] page = 000000001ec38388
[22854.585277] page_end = 000000000b71ccb5
[22854.585279] count = -6
[22854.585281] page = 00000000625917b4
[22854.585282] page_end = 000000000b71ccb5
[22854.585283] count = -1

Jose

> +	char *tmp_plus = strnchr(page, count, '+');
> +	char *tmp_minus = strnchr(page, count, '-');
> +
> +	if (!tmp_plus && !tmp_minus)
> +		return 0;
> +	if (!tmp_plus)
> +		*out = tmp_minus;
> +	else if (!tmp_minus)
> +		*out = tmp_plus;
> +	else
> +		*out = min(tmp_plus, tmp_minus);
> +
> +	char *end = *out + 1;
> +
> +	while (end < page_end) {
> +		if (!isalnum(*end) && *end != '*')
> +			break;
> +		end++;
> +	}
> +
> +	return end - *out;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(vkms_configfs_parse_next_format);
> +
> +static ssize_t plane_supported_formats_store(struct config_item *item,
> +					     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret = 0;
> +	const char *end_page = page + count;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		while (1) {
> +			char *tmp;
> +			char fmt[4] = {' ', ' ', ' ', ' '};
> +			int len = vkms_configfs_parse_next_format(page, end_page, &tmp);
> +
> +			// No fourcc code found
> +			if (len <= 1 || len > 5)
> +				break;
> +
> +			page = tmp + len;
> +			memcpy(fmt, &tmp[1], min(len - 1, 4));
> +			if (tmp[0] == '+') {
> +				if (fmt[0] == '*') {
> +					ret = vkms_config_plane_add_all_formats(plane->config);
> +					if (ret)
> +						return ret;
> +				} else {
> +					ret = vkms_config_plane_add_format(plane->config,
> +									   *(int *)fmt);
> +					if (ret)
> +						return ret;
> +				}
> +			} else if (tmp[0] == '-') {
> +				if (fmt[0] == '*')
> +					vkms_config_plane_remove_all_formats(plane->config);
> +				else
> +					vkms_config_plane_remove_format(plane->config, *(int *)fmt);
> +			}
> +		}
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, name);
>  CONFIGFS_ATTR(plane_, supported_rotations);
> @@ -636,6 +752,7 @@ CONFIGFS_ATTR(plane_, supported_color_ranges);
>  CONFIGFS_ATTR(plane_, default_color_range);
>  CONFIGFS_ATTR(plane_, supported_color_encodings);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
> +CONFIGFS_ATTR(plane_, supported_formats);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> @@ -646,6 +763,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_default_color_range,
>  	&plane_attr_supported_color_encodings,
>  	&plane_attr_default_color_encoding,
> +	&plane_attr_supported_formats,
>  	NULL,
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
> index e9020b0043db..2774655bfcc5 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.h
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.h
> @@ -2,7 +2,13 @@
>  #ifndef _VKMS_CONFIGFS_H_
>  #define _VKMS_CONFIGFS_H_
>  
> +#include <linux/types.h>
> +
>  int vkms_configfs_register(void);
>  void vkms_configfs_unregister(void);
>  
> +#if IS_ENABLED(CONFIG_KUNIT)
> +int vkms_configfs_parse_next_format(const char *page, const char *end_page, char **out);
> +#endif
> +
>  #endif /* _VKMS_CONFIGFS_H_ */
> 
> -- 
> 2.51.2
> 
