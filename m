Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE238E5D3
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519787; cv=none; b=faN6/7omifpX8n2mY7rqvejHJiB2O7wng5NrxHpdgHJLXLxnjVGH4I7JGYMSTJRFqJXJoaBzZx588/NhkKT3u8Lh7pTsdy6gQl3VKV6hB6gyJNLhM6uIigdx/Cckl9AwlLGygnlgoQdrQ+ME4RTv0uuNoqubIt6yvrKbKcLZ+Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519787; c=relaxed/simple;
	bh=ZMUh7JYRgBI25LGo61FqYSZJ+cJ+osgt0mSNBCcjoqY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BgdGArEStvoKwlnvp9bfRTwj3+QZx8mjoiVSRu/fGw+QFLw/TO/JVvJvTq/Yb79n/mS5Cv0oh746IsT1g1Uhb0mkZk0Xm0B95MVsKFxI4QOQW7rd7yVU9JmA8PWNLtCQKHExq1IXlsJ9zfd5w0q0X7fsIUaNv7BtyZBIcbpsEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2SgmQK4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2SgmQK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6E6C2BC87;
	Thu, 26 Mar 2026 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774519786;
	bh=ZMUh7JYRgBI25LGo61FqYSZJ+cJ+osgt0mSNBCcjoqY=;
	h=From:Subject:Date:To:Cc:From;
	b=d2SgmQK4+xx3YDCfoC2FTwgrp49Y/2Ost8A7/FzFT0FRSPUjFcgPoTICxInGsw/gi
	 0cHypdUctxK8CoZOGMMSqD0uuzuDI+77mRQisRLkK48lpTaklW4p6K9fmvlFZlfUX1
	 9PxgCRyiVYWgjb26dMdeWjPAewo/1DXKifiov53Ean6xLF8OeU75Bmu9k1xaceC6dT
	 lZogFa8JvmJsFCbzMBGkOhQLB9GyJiM15nOWHhqVc6zx3ZfF/9HljMy48BvOPatIF4
	 73C+5c0wRm4f7AV2FtR23h+bsB88NgMvFs9MkFOV1IXCF5zmBeN/jj4AS3KpDAIHCp
	 QCHyEo9JefEmg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/2] drm: Rename drm_atomic_state
Date: Thu, 26 Mar 2026 11:09:37 +0100
Message-Id: <20260326-drm-drm-atomic-update-v1-0-2f7af5f4ad02@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBQFrxJ/nVCGEl0lWpi+6i+00IpAunvSY
 hazmMmUEBmJhipTxM2J91CkrSuymwkrBLviJBupm05q4aL/Mefu2YrrcOaEkFgUWoVZm55Ke0Q
 s/PzfcXrfD4P4R1pnAAAA
X-Change-ID: 20260326-drm-drm-atomic-update-2ef5e15eb6a8
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22759; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZMUh7JYRgBI25LGo61FqYSZJ+cJ+osgt0mSNBCcjoqY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlHWZ8d/jP5c1DflSixN/n7jOPy111qPb9uO6dMsqXqj
 LUnNY/ydUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJpD1hbJj8OELhi4zWgq6Y
 iXZbZ/nnT7VUfMq2Ya7S3bKojzlT2gMfFc3aoiExrd2Jd/Xa2Wy3Yxkb1rp/WG1qa3crfmLJEbc
 PDYv3fKuJybX2ajq8v/Pmg+tPIsWWXY5a0xRa19HoZaH6hk8KAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We've been discussing for a long time about renaming drm_atomic_state
to a better suited name, since the current one is a source of confusion
and bugs.

To minimize the impact, this should probably go through drm-next
directly.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (2):
      drm: Rename drm_atomic_state
      Documentation: drm: Remove drm_atomic_state rename entry

 Documentation/gpu/drm-kms.rst                      |  14 +-
 Documentation/gpu/komeda-kms.rst                   |   8 +-
 Documentation/gpu/todo.rst                         |  23 ---
 drivers/gpu/drm/adp/adp_drv.c                      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  10 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  62 ++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |  12 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |  22 +--
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |   4 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h    |  20 +--
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |   8 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.c    |  10 +-
 .../gpu/drm/arm/display/komeda/komeda_pipeline.h   |  14 +-
 .../drm/arm/display/komeda/komeda_pipeline_state.c |  28 ++--
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c  |   4 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c                   |  10 +-
 drivers/gpu/drm/arm/malidp_crtc.c                  |   6 +-
 drivers/gpu/drm/arm/malidp_drv.c                   |   4 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   2 +-
 drivers/gpu/drm/arm/malidp_mw.h                    |   2 +-
 drivers/gpu/drm/arm/malidp_planes.c                |   6 +-
 drivers/gpu/drm/armada/armada_crtc.c               |  10 +-
 drivers/gpu/drm/armada/armada_overlay.c            |  10 +-
 drivers/gpu/drm/armada/armada_plane.c              |   6 +-
 drivers/gpu/drm/armada/armada_plane.h              |   2 +-
 drivers/gpu/drm/ast/ast_cursor.c                   |   6 +-
 drivers/gpu/drm/ast/ast_dp.c                       |   4 +-
 drivers/gpu/drm/ast/ast_dp501.c                    |   4 +-
 drivers/gpu/drm/ast/ast_mode.c                     |  18 +--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  10 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    |   6 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |   4 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  14 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |   4 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |   4 +-
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |   6 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c           |   6 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |   4 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |   4 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |   4 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |   6 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |   2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |   4 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |   2 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |   6 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |   4 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |   8 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |   8 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |   4 +-
 drivers/gpu/drm/bridge/panel.c                     |   8 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |   4 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |   8 +-
 drivers/gpu/drm/bridge/sii902x.c                   |   4 +-
 drivers/gpu/drm/bridge/ssd2825.c                   |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |   4 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   6 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |   6 +-
 drivers/gpu/drm/bridge/tc358762.c                  |   6 +-
 drivers/gpu/drm/bridge/tc358767.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358768.c                  |   8 +-
 drivers/gpu/drm/bridge/tc358775.c                  |   6 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |   6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   6 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  22 +--
 drivers/gpu/drm/bridge/ti-tdp158.c                 |   4 +-
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      |  20 +--
 drivers/gpu/drm/display/drm_bridge_connector.c     |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c      |  26 ++--
 drivers/gpu/drm/display/drm_dp_tunnel.c            |  14 +-
 drivers/gpu/drm/display/drm_hdmi_state_helper.c    |   6 +-
 drivers/gpu/drm/drm_atomic.c                       | 128 +++++++--------
 drivers/gpu/drm/drm_atomic_helper.c                | 172 ++++++++++-----------
 drivers/gpu/drm/drm_atomic_state_helper.c          |   2 +-
 drivers/gpu/drm/drm_atomic_uapi.c                  |  28 ++--
 drivers/gpu/drm/drm_blend.c                        |   8 +-
 drivers/gpu/drm/drm_bridge.c                       |  14 +-
 drivers/gpu/drm/drm_client_modeset.c               |   8 +-
 drivers/gpu/drm/drm_color_mgmt.c                   |   6 +-
 drivers/gpu/drm/drm_crtc_helper.c                  |   2 +-
 drivers/gpu/drm/drm_crtc_internal.h                |  10 +-
 drivers/gpu/drm/drm_damage_helper.c                |  10 +-
 drivers/gpu/drm/drm_fb_helper.c                    |   8 +-
 drivers/gpu/drm/drm_framebuffer.c                  |   8 +-
 drivers/gpu/drm/drm_mode_object.c                  |   8 +-
 drivers/gpu/drm/drm_modeset_helper.c               |   2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c          |  12 +-
 drivers/gpu/drm/drm_simple_kms_helper.c            |  10 +-
 drivers/gpu/drm/drm_vblank_helper.c                |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |  10 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |   6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c         |   6 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |   6 +-
 drivers/gpu/drm/gud/gud_connector.c                |  10 +-
 drivers/gpu/drm/gud/gud_internal.h                 |   8 +-
 drivers/gpu/drm/gud/gud_pipe.c                     |   8 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c     |  12 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c     |   4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |  14 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c        |   6 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.c            |   2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h            |   6 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c             |  10 +-
 drivers/gpu/drm/i915/display/intel_atomic.c        |  16 +-
 drivers/gpu/drm/i915/display/intel_atomic.h        |  12 +-
 drivers/gpu/drm/i915/display/intel_audio.c         |   8 +-
 drivers/gpu/drm/i915/display/intel_crt.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c       |  22 +--
 drivers/gpu/drm/i915/display/intel_display.h       |   6 +-
 drivers/gpu/drm/i915/display/intel_display_core.h  |   2 +-
 .../gpu/drm/i915/display/intel_display_driver.c    |   8 +-
 .../gpu/drm/i915/display/intel_display_driver.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_display_reset.c |   8 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +-
 drivers/gpu/drm/i915/display/intel_dp.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c           |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_load_detect.c   |  20 +--
 drivers/gpu/drm/i915/display/intel_load_detect.h   |   6 +-
 drivers/gpu/drm/i915/display/intel_modeset_lock.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_modeset_setup.c |   6 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_plane.c         |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |   8 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_sprite_uapi.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_tc.c            |   6 +-
 drivers/gpu/drm/i915/display/intel_tv.c            |   4 +-
 drivers/gpu/drm/imx/dc/dc-crtc.c                   |  10 +-
 drivers/gpu/drm/imx/dc/dc-plane.c                  |   6 +-
 drivers/gpu/drm/imx/dcss/dcss-crtc.c               |   8 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c              |   6 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm.h                |   2 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c             |  10 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            |   8 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  24 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c              |  10 +-
 drivers/gpu/drm/kmb/kmb_crtc.c                     |  10 +-
 drivers/gpu/drm/kmb/kmb_drv.h                      |   2 +-
 drivers/gpu/drm/kmb/kmb_dsi.c                      |   4 +-
 drivers/gpu/drm/kmb/kmb_dsi.h                      |   2 +-
 drivers/gpu/drm/kmb/kmb_plane.c                    |   6 +-
 drivers/gpu/drm/logicvc/logicvc_crtc.c             |   6 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |   6 +-
 drivers/gpu/drm/loongson/lsdc_crtc.c               |   8 +-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c      |   2 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c      |   6 +-
 drivers/gpu/drm/loongson/lsdc_plane.c              |  22 +--
 drivers/gpu/drm/mediatek/mtk_crtc.c                |  12 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                |   2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   8 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |  10 +-
 drivers/gpu/drm/meson/meson_crtc.c                 |  12 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   4 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |   4 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   4 +-
 drivers/gpu/drm/meson/meson_overlay.c              |   6 +-
 drivers/gpu/drm/meson/meson_plane.c                |   6 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  26 ++--
 drivers/gpu/drm/mgag200/mgag200_g200.c             |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c          |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c           |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c           |   6 +-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c           |  10 +-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c             |  18 +--
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c          |  10 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c         |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.c         |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mixer.h         |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.h          |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   8 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       |   2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   6 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   6 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   4 +-
 drivers/gpu/drm/msm/msm_atomic.c                   |   8 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   6 +-
 drivers/gpu/drm/msm/msm_kms.h                      |   4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |  12 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  16 +-
 drivers/gpu/drm/nouveau/dispnv50/atom.h            |   6 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c             |  16 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.h             |  16 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  68 ++++----
 drivers/gpu/drm/nouveau/dispnv50/head.c            |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_display.h          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |   4 +-
 drivers/gpu/drm/omapdrm/omap_crtc.c                |  10 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  14 +-
 drivers/gpu/drm/omapdrm/omap_drv.h                 |   2 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c             |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.h             |   4 +-
 drivers/gpu/drm/omapdrm/omap_plane.c               |   6 +-
 drivers/gpu/drm/qxl/qxl_display.c                  |  16 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c     |  18 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c      |   4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h    |   2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      |   4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.h    |   6 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c      |   6 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       |   4 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |   8 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  |   6 +-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |   6 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   6 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |   4 +-
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c   |   2 +-
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          |   2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |   6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  22 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  18 +--
 drivers/gpu/drm/sitronix/st7571.c                  |  10 +-
 drivers/gpu/drm/sitronix/st7920.c                  |  12 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  32 ++--
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  12 +-
 drivers/gpu/drm/sti/sti_crtc.c                     |   6 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |   6 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |   6 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   6 +-
 drivers/gpu/drm/stm/drv.c                          |   2 +-
 drivers/gpu/drm/stm/ltdc.c                         |  12 +-
 drivers/gpu/drm/stm/ltdc.h                         |   2 +-
 drivers/gpu/drm/stm/lvds.c                         |   6 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |   4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c                 |  10 +-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c          |   2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |   4 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                |   4 +-
 drivers/gpu/drm/sun4i/sun4i_tv.c                   |   4 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c                |   2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c             |   4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c             |   4 +-
 drivers/gpu/drm/sun4i/sunxi_engine.h               |   4 +-
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h           |   8 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c          |   8 +-
 drivers/gpu/drm/sysfb/ofdrm.c                      |   2 +-
 drivers/gpu/drm/sysfb/vesadrm.c                    |   4 +-
 drivers/gpu/drm/tegra/dc.c                         |  32 ++--
 drivers/gpu/drm/tegra/dc.h                         |   2 +-
 drivers/gpu/drm/tegra/drm.c                        |   6 +-
 drivers/gpu/drm/tegra/hub.c                        |  12 +-
 drivers/gpu/drm/tegra/hub.h                        |   4 +-
 drivers/gpu/drm/tests/Makefile                     |   2 +-
 ...tomic_state_test.c => drm_atomic_update_test.c} |  12 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            |   8 +-
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  88 +++++------
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  18 +--
 drivers/gpu/drm/tidss/tidss_crtc.c                 |  10 +-
 drivers/gpu/drm/tidss/tidss_kms.c                  |   4 +-
 drivers/gpu/drm/tidss/tidss_oldi.c                 |   4 +-
 drivers/gpu/drm/tidss/tidss_plane.c                |   8 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               |   8 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   4 +-
 drivers/gpu/drm/tiny/appletbdrm.c                  |   6 +-
 drivers/gpu/drm/tiny/bochs.c                       |  10 +-
 drivers/gpu/drm/tiny/cirrus-qemu.c                 |   8 +-
 drivers/gpu/drm/tiny/pixpaper.c                    |  10 +-
 drivers/gpu/drm/tiny/sharp-memory.c                |  10 +-
 drivers/gpu/drm/udl/udl_modeset.c                  |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  18 +--
 drivers/gpu/drm/vc4/tests/vc4_mock.h               |   4 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c        |   4 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c     |  50 +++---
 drivers/gpu/drm/vc4/vc4_crtc.c                     |  10 +-
 drivers/gpu/drm/vc4/vc4_drv.h                      |  28 ++--
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                     |  12 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_kms.c                      |  30 ++--
 drivers/gpu/drm/vc4/vc4_plane.c                    |   8 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |  10 +-
 drivers/gpu/drm/vc4/vc4_vec.c                      |   4 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c            |   6 +-
 drivers/gpu/drm/verisilicon/vs_crtc.c              |   4 +-
 drivers/gpu/drm/verisilicon/vs_primary_plane.c     |   8 +-
 drivers/gpu/drm/virtio/virtgpu_display.c           |   8 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |   6 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                   |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c                    |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |   4 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c       |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h       |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                |  18 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c               |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h               |  10 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |   6 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |  16 +-
 include/drm/display/drm_dp_mst_helper.h            |  32 ++--
 include/drm/display/drm_dp_tunnel.h                |  24 +--
 include/drm/display/drm_hdmi_state_helper.h        |   6 +-
 include/drm/drm_atomic.h                           | 158 +++++++++----------
 include/drm/drm_atomic_helper.h                    |  78 +++++-----
 include/drm/drm_atomic_state_helper.h              |   4 +-
 include/drm/drm_blend.h                            |   4 +-
 include/drm/drm_bridge.h                           |  16 +-
 include/drm/drm_colorop.h                          |   4 +-
 include/drm/drm_connector.h                        |   6 +-
 include/drm/drm_crtc.h                             |  10 +-
 include/drm/drm_crtc_helper.h                      |   4 +-
 include/drm/drm_damage_helper.h                    |   2 +-
 include/drm/drm_kunit_helpers.h                    |   2 +-
 include/drm/drm_mode_config.h                      |  38 ++---
 include/drm/drm_modeset_helper_vtables.h           |  44 +++---
 include/drm/drm_plane.h                            |   6 +-
 include/drm/drm_self_refresh_helper.h              |   6 +-
 include/drm/drm_vblank_helper.h                    |   8 +-
 354 files changed, 1724 insertions(+), 1747 deletions(-)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-drm-drm-atomic-update-2ef5e15eb6a8

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

