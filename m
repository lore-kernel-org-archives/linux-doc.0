Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4E287510;
	Fri, 19 Dec 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164078; cv=none; b=hkwpZE3hIE5kq8lk7tFrSfUgcoRuwVVx2XUPAFjwOObdXVW403lYc2KElfckoQFDZzcGPSvMi8/a/VvoCxm5HddAy1HyUGJNSA5dW1z1IkrpqpMPwmjafqE4cJMJ/EtcJulL9pc9xc5vgV/tov7WUHkQqByo9yewlHxcpEvA/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164078; c=relaxed/simple;
	bh=fTFeyIyx2DoFe2Sp2nEZGrBhKLIOxc5qBG7lSd/cP8E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KRzs2+jIvn3peKfqx+MqReOMd7tfpZuoy54CBl0VjtmD9Auk3pO4ANKol9BwU06IBm7/EpSYwWMVTqtnRqCxVPzFetiidG6qHTb9QI3XBbz1M1Xbj0k7lyyqizVLrxi/dCcXjqsH8+dnm0RfLhw5rcOU85JRLVZt3Kc8S5d+jiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TF3eNgWK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TF3eNgWK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CF994E41CB8;
	Fri, 19 Dec 2025 17:07:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 017CF6071D;
	Fri, 19 Dec 2025 17:07:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E9C410AA95D0;
	Fri, 19 Dec 2025 18:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766164066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uKKVs606BmAI0e5jJwpB73M7KxvhAfUCritQM3uAUjc=;
	b=TF3eNgWKbyjQTTmS/HfKkAgTZivbXimYPxYbFZa5tPUQWG/8hf16Po4H8o5vDZyBsGZcU0
	6XNm2VbEb8YtIcErC8GSG9UWgf38otaFK2YQyPfMGo8iIN/6RpdlXukvMcfnS9bryh8oE9
	sUi/TK9XHL9vggI69Vtm/D5Yq3XR5WvT21fhjh411FNc2VmrGxk37rzZRTvCpBEA1WSRft
	+ElnCLsbfPkEVB0qdkivxjxg9IAGRQGsFfZykrwcVMQoCiNPTwPI5ohm19QLpdlIYI1vZg
	VtJ38F14t7l8hM5zS/zkXIp8U2fW3c7Qcq+/yD9I3xgcSzogCufV/krnfTn8vQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 18:07:41 +0100
Message-Id: <DF2CWONRF4X6.2N7MHWSI1WU6T@bootlin.com>
Subject: Re: [PATCH RESEND v2 17/32] drm/vkms: Introduce configfs for plane
 format
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-17-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-17-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> To allow the userspace to test many hardware configuration, introduce a
> new interface to configure the available formats per planes. VKMS support=
s
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

> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst

> @@ -109,6 +109,11 @@ Planes have 8 configurable attributes:
>    must be set too.
>  - default_color_range: Default color range presented to the userspace, s=
ame
>    values as supported_color_range
> +- supported_formats: List of supported formats for this plane. To add a =
new item in the
> +  list, write it using a plus its fourcc code: +XR24
                                ^ and

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
> + * struct vkms_configfs_parse_format_case - Store test case for format p=
arsing
> + * @data: Contains the string to parse
> + * @data_len: data len
> + * @expected_len: expected len of the matched format
> + * @expected_offset: expected offset in the string for the parsed format
> + */
> +struct vkms_configfs_parse_format_case {
> +	const char *data;

This is a string, why not calling it 'string', or 'str'?

> +struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_c=
ases[] =3D {
> +	{
> +		.data =3D "+RG24",
> +		.data_len =3D 6,
> +		.expected_len =3D 5,
> +		.expected_offset =3D 0,
> +	}, {
> +		.data =3D "-RG24",
> +		.data_len =3D 6,
> +		.expected_len =3D 5,
> +		.expected_offset =3D 0
> +	}, {
> +		.data =3D "  -RG24",
> +		.data_len =3D 8,
> +		.expected_len =3D 5,
> +		.expected_offset =3D 2
> +	}, {
> +		.data =3D "+*",
> +		.data_len =3D 3,
> +		.expected_len =3D 2,
> +		.expected_offset =3D 0
> +	}, {
> +		.data =3D "-RG24+RG24",
> +		.data_len =3D 11,
> +		.expected_len =3D 5,
> +		.expected_offset =3D 0
> +	}, {
> +		.data =3D "-R1+RG24",
> +		.data_len =3D 9,
> +		.expected_len =3D 3,
> +		.expected_offset =3D 0
> +	}, {
> +		.data =3D "\n-R1",
> +		.data_len =3D 5,
> +		.expected_len =3D 3,
> +		.expected_offset =3D 1
> +	}, {
> +		.data =3D "-R1111",
> +		.data_len =3D 3,

The string is longer than 3 chars, is this intended?

> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c

> +static ssize_t plane_supported_formats_store(struct config_item *item,
> +					     const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);
> +	int ret =3D 0;
> +	const char *end_page =3D page + count;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		while (1) {
> +			char *tmp;
> +			char fmt[4] =3D {' ', ' ', ' ', ' '};
> +			int len =3D vkms_configfs_parse_next_format(page, end_page, &tmp);
> +
> +			// No fourcc code found
> +			if (len <=3D 1)
> +				break;
> +
> +			page =3D tmp + len;
> +			memcpy(tmp, &fmt[1], min(len - 1, 4));
Should this be instead:        fmt   tmp
?

Also I think it would be good to reject strings longer than 4 chars (len >
5), because they cannot br fourccs.

Otherwise looks good.

BTW, I feel your pain in implementing the parsing!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
