Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29DA397E89;
	Wed, 10 Jun 2026 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087566; cv=none; b=oKoQMqs0F37urxhlgKcSOwHKhep5/jEsTOPQplQiLJNZgTIA7x5uN5eblBtrADcz8g0I4eE5lsVI4YjQjFLwwnpUH7TPqQk9W5RZQKkbBWRpOgXcJ0HaVeb3sPC/cyX9GeZU+gCteusDFWYGy9s3RK4DlfW9BgSJVSqpSylHTlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087566; c=relaxed/simple;
	bh=4QR48FPX6NW6pWd+A0RB2168FFt8Kbmy8OacTeDGsas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hA62XZnTBiHsEfSIVc2qDvTG+LbHxbFTAfWCPekPQgsDktRWLVuzqw5/LG5lkqnxzEDXK/ke6S9ld7g+zT3pgWNFsAFFCiy5SS2ab0+I/WuROrrph99CjMRf5G7cWVg0xHlwFuzZerV5euewebYD9kIm00U3Lbl4oI0Aj1WluSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csvThB7Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csvThB7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781087564; x=1812623564;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=4QR48FPX6NW6pWd+A0RB2168FFt8Kbmy8OacTeDGsas=;
  b=csvThB7Y8q0udoW7y2PMRPaqLQsLEnAy+EHkVJ8aPjFLMGWx1S+3SPlH
   +b+TEHnazMhAoLk3CHoc/j/caX0roQcrvH/WblhbhYOFFPd1+szKhsd20
   wmxxSh4EQXrSQOhXV3RUnb39xxe7MevDm+bjt4e7HdbQgHE3mG8TBG7Ko
   vBeNf/tPYr19cc+GeT3Uyg+Ot7UScLxLG0LcLvJbdHK8M1PKFzsA2ywcb
   lRGK16F+ucBUn73BnQ6I94AckaSz6QEGTXWmdYKBaVnDzfH11vjj21wJJ
   QJjKnJJpmKwrG5CkhodXIl9MLlSsLvlZ3dnyiMBTi069+wxTbzNVb9g9j
   A==;
X-CSE-ConnectionGUID: Ir+neWM8R1eqHzXbx+1qfw==
X-CSE-MsgGUID: xs7/tyNETsSbjqSRTJgfqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85721120"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="85721120"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:32:44 -0700
X-CSE-ConnectionGUID: 7vHeeByYR6mbP2vHMrx5EQ==
X-CSE-MsgGUID: HeuP8FBRTDSW4l3PyZ1Pfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250415777"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.3])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:32:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan
 <andy.yan@rock-chips.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Daniel Stone
 <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, Nicolas
 Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v17 21/28] drm/tests: bridge: Add KUnit tests for bridge
 chain format selection
In-Reply-To: <20260609-color-format-v17-21-35739b5782cc@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
 <20260609-color-format-v17-21-35739b5782cc@collabora.com>
Date: Wed, 10 Jun 2026 13:32:29 +0300
Message-ID: <04ff70850213ae0f75486b1a27a7edb6fb4e71c3@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Jun 2026, Nicolas Frattaroli <nicolas.frattaroli@collabora.com> =
wrote:
> diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/te=
sts/drm_bridge_test.c
> index 64b665580a88..92f142ca6695 100644
> --- a/drivers/gpu/drm/tests/drm_bridge_test.c
> +++ b/drivers/gpu/drm/tests/drm_bridge_test.c
> @@ -2,15 +2,23 @@
>  /*
>   * Kunit test for drm_bridge functions
>   */
> +#include <linux/cleanup.h>
> +#include <linux/media-bus-format.h>
> +
>  #include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
>  #include <drm/drm_bridge_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_kunit_helpers.h>
> +#include <drm/drm_managed.h>
>=20=20
>  #include <kunit/device.h>
>  #include <kunit/test.h>
>=20=20
> +#include "drm_kunit_edid.h"

So here's the problem with adding *any* arrays into headers: every
compilation unit that includes them duplicates all the arrays. It's only
really okay for single use.

And, in this case, most of the included arrays are unused, leading to
build failures:

  CC [M]  drivers/gpu/drm/tests/drm_bridge_test.o
In file included from ../drivers/gpu/drm/tests/drm_bridge_test.c:21:
../drivers/gpu/drm/tests/drm_kunit_edid.h:958:28: error: =E2=80=98test_edid=
_hdmi_4k_rgb_yuv420_dc_max_340mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  958 | static const unsigned char test_edid_hdmi_4k_rgb_yuv420_dc_max_340m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:726:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_yuv_dc_max_340mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  726 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:612:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_yuv_dc_max_200mhz=E2=80=99 defined but not used [-Werror=3D=
unused-const-variable=3D]
  612 | static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200m=
hz[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:498:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_340mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  498 | static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:390:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_200mhz_hdr=E2=80=99 defined but not used [-Werror=3Dunu=
sed-const-variable=3D]
  390 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz_hdr[=
] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:271:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_200mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  271 | static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:163:28: error: =E2=80=98test_edid=
_hdmi_1080p_rgb_max_100mhz=E2=80=99 defined but not used [-Werror=3Dunused-=
const-variable=3D]
  163 | static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] =
=3D {
      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/tests/drm_kunit_edid.h:57:28: error: =E2=80=98test_edid_=
dvi_1080p=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
   57 | static const unsigned char test_edid_dvi_1080p[] =3D {
      |                            ^~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

This breaks the build for me, I don't know how it didn't for any of you.

Reverting these two fixes it:

ce1d0139adac ("drm/tests: bridge: Add test for HDMI output bus formats help=
er")
082fbc179c01 ("drm/tests: bridge: Add KUnit tests for bridge chain format s=
election")

I think the proper fix would be to move the arrays into a .c file, and
only have declarations in the headers. But that needs to happen real
soon or the commits need to be reverted.


BR,
Jani.


--=20
Jani Nikula, Intel
