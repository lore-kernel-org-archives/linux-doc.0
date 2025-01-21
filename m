Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84F81A8409;
	Tue, 21 Jan 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456497; cv=none; b=r8Nkz1/AB8lFnRCBI3VgLC6GrbCmw63N39jwXVI89Ctz04V+3ja7Z8BbnL4L3F7Iy2LC8ObZA8ijmGJEaCGJmzb5EXS+3Ye7tTUEwAuYt2Z9YhuvIRl04XLCH/8OPQ4JB5lQVCJ2e3fD6SuNmi58g27/4JQ+T4Y9bngTfwLWd9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456497; c=relaxed/simple;
	bh=iQG3Mb9N1fTfVQpi9qUaE8sCglfo0bgdGkxThiPbjEA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=abcXU9ms2xz4CkAMzRDG2X7rNZuQ2EJ7cXktZe523v5bCBupb897dfbFO1nSbs/0q90EqTOm01ia4j1gHhUMt2ta5fQUf64hhe/i9kv6XsRpgtBKjDpFVuqaATwutFRBCmLXBBFvveGME2nGZZ2XvAntLnQ3QFY5qjQzUdNHDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GRxrL3bh; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GRxrL3bh"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E9C4240004;
	Tue, 21 Jan 2025 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737456492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Ys+vACeQlVio6Iui4zwZCd4nyHptpoz9p1SfxBkB9E=;
	b=GRxrL3bhubmNstByBLu8myIkWyrv7Z1zC7bGW/5Jx3b6Br2mRG/2LCxF5g0a2N0jRdkAiV
	SDL8was2f6u6U3xrHiiPg3VPcqNmJ3EqFewTMc7+LcpQ3YxB1Q/vprq29jm4zlO9jF0hJk
	j7xqMpyYPWjyDQp2+whxPakhB+jfjXsAq9OOs2gloF4Z6clBdU+cNTfV/AuofHbJhGHT6G
	3ylEt4KWpgGExgsCnoV7I2zX824E3hyPC5OPdMWIMd4PZSIRreS5E7MFd3BuV1L57mzBz9
	JmDiMZEP0UTNQkn8hmI3GAmRVtZQNcKr0WjhrjnPKmnX86vwfsqst3qLjqmY8Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v16 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Date: Tue, 21 Jan 2025 11:48:01 +0100
Message-Id: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGF7j2cC/23TS46cMBAG4Ku0WIekqmzK9qxyjygLP9NI3TABG
 s1oNHePebRgAjts6uM3Lvuj6GNXx754uXwUXRzrvm6bPED+din81TZ/YlmHPFEQkAQCLN8fY4l
 CqGAgmEpxkSud7WPpOtv4a65tHrdbnnztYqrf5m//+p3H17of2u59jhpxmv360RFLKIW3QnEix
 YJ+urYdbnXz3bf3KWWurpCXap2rfdKBk2YpIH6pnvJG2mWQWBRlZS27SJqUc+qoxF6tWSKrlJg
 pgTEyuKOSmxIgFyWzUjnKeh2NMuKoqp3CdYVVVpERvAsgUkVHxZuSYBbFWYWIvlKkU1BwVGpT1
 TNLTTuuIZqUoq/gJMtsSgMtymQF2ipgZhORjwphz9YlYlYlWuUVS2ROJ3uPu2NhBKxuOhfSoSV
 2Pnlzlre1GgHU6qZeA3q0wXL+P33itmYjol7d1G3rIQSJZKqzDqDcOVq3BeXcOQ5aBNIB/InbG
 o4knsd+7nheo3MCSMf//u9zuUpd/PvIt3NY7tNy4/L7ez28XEJ3L+917388H8omvg2Zfv4DXzV
 JceADAAA=
X-Change-ID: 20240201-yuv-1337d90d9576
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iQG3Mb9N1fTfVQpi9qUaE8sCglfo0bgdGkxThiPbjEA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tn/oNpGWTNfjm4IyLW6lplWoXIMVLA+AN1g
 iSIw2Sp1TeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497ZwAKCRAgrS7GWxAs
 4tjuD/4qUeUwgGerZPSXTDIVfa3w5hQnNg8aBoKP+Dwru6snyUBRfSMlkJPl9TvW4Z37tRGR9/V
 U7lIXP0FuvYPou7PjNZN35PvdW8i3jUpUHzRXHZtzeK9w9PV5CA+Yn/CQAj6m+vzW+SP7jI9DHs
 t3GCfMQYCB83OvwJIP94ihrgFZBFZ+V/vVAGxpffNZw4B5NieC1/h5AL6ryLJUqmvzGwGjfsZZj
 nkwF/sky7vAkUOcK84TnaEeCROCcBEmpsK5Z6GdcbeOTaK833Y2Nv33ELleM8+eRQeWwi8yVXcF
 ncCpdWv2H2jkRow/LUktyA1tBJGoGpmNu0NGr+oUw31GAavbT+hKyMXhVVPkYhJwYw0P0FhahP/
 nsZQbhZl/QMQ606ZLmHL6aENFlHJRqRnYvgVi5DWwrs9rXViNzlOFxl9BZO1xeNXfnv7tomgj/6
 Lj/iWaEc2Wp1rhcPrEqWx3WWaSMQbXchJ/fcERCkosfiG2FZFN/GUMnPsK9hmgrrRRWLULww1JM
 2Y+GBaMMcgnIh6P8ifRw8gU/1Xb3YkFt8E37UfRppb4PE9HzrQuICMSvo2syu41nha9N6yhoJgd
 D7uhSIyMiIpOr3RkGMZkiNCe+xxPzQApIFUGo1dI9P3SIfr5zJs2v24NQBzFOju2PlVpOyztLlK
 CmbH3JUHwZ1ZIeQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com

This patchset is extracted from [1]. The goal is to introduce the YUV
support, thanks to Arthur's work.

- PATCH 1: Add the support of YUV formats
- PATCH 2: Add some drm properties to expose more YUV features
- PATCH 3: Cleanup the todo
- PATCH 4..6: Add some kunit tests
- PATCH 7: Add the support of DRM_FORMAT_R1/2/4/8

[1]: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v16:
- Rebased on drm-misc-next
- Updated comment and changed fail thresholds. 
- Link to v15: https://lore.kernel.org/r/20241231-yuv-v15-0-eda6bb3028e6@bootlin.com

Changes in v15:
- Export drm_get_color_encoding_name only for kunit tests
- Link to v14: https://lore.kernel.org/r/20241122-yuv-v14-0-e66d83d28d0c@bootlin.com

Changes in v14:
- Rebased on drm-misc-next
- Link to v13: https://lore.kernel.org/r/20241118-yuv-v13-0-ac0dd4129552@bootlin.com

Changes since previous series:
 - Fix build test as modules issue: https://lore.kernel.org/all/202410110407.EHvadSaF-lkp@intel.com/
 - Export required symbols in DRM core to use them in kunit
 - Update the kunit comments according to Maxime's feedback
 - Link to original series: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

---
Arthur Grillo (5):
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions
      drm/vkms: Add how to run the Kunit tests

Louis Chauvet (2):
      drm: Export symbols to use in tests
      drm/vkms: Add support for DRM_FORMAT_R*

 Documentation/gpu/vkms.rst                    |  14 +-
 drivers/gpu/drm/drm_color_mgmt.c              |   3 +
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 271 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  18 +
 drivers/gpu/drm/vkms/vkms_formats.c           | 467 +++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c             |  29 +-
 11 files changed, 830 insertions(+), 4 deletions(-)
---
base-commit: 49a167c393b0ceb592b9d2e65cc4f46bcc707108
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

