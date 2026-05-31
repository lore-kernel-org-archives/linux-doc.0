Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF031079B
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 04:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780203563; cv=none; b=mvu2DZZqje084t2NH/wtZwcCE3ejcmL/c9U19CsVUc4dxUWd73wfkKYxFhv906zt1Dg1ougxYRg3GpBIKX2xuMgM7j/8PQwsQcB6ZJhKFzGRTVBJtgLiBSYlKJAKMspF9b8E77BH3LFAm+ttIdx1IM+8p4CA76Ln+MYhwSiPfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780203563; c=relaxed/simple;
	bh=KrlhF2lVuELuXETvEk4OrK00W6f1MM/ao5FulxmOCF0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtsR46jR/oUzj3yyAWJY89LY3dMNIYjFb2wiorbeltunbI8YhIu0z0310VL3IQPnG8pp9G/+xg4bGNI5QEJQAiHG2EQPwlmuxgFJaU5sKJjX7HfvRTvjlnHg2Mjd8AgMQj//zmHLngAEIr6sTnHexNGAhtt5T8/SlQHiBplMpIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aTUT/r5S; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aTUT/r5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780203553; x=1780462753;
	bh=JgXmbmRQhvxiYbQ8/af9ooPxSRB/f+wfhM3H1iUU/NE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aTUT/r5SwxI54YFXsS4RmiLlPPODXhaCCwX84lSmBO6AftwQIaVbdU5BhdAyxt9ct
	 z56/W7u4dOrm4uVQRM7Ianl4Rrv/IrBO6jCQjel7Z+TY6EXpeC5Z6uDHgrAFdp0aJy
	 DrzS12YedB0VTGoQfeh+0ktHUAQSdHmAXP0VIJwkRQR0PRh8M7r52nhAlSZh53T/xQ
	 uABlt+fty7BplDNq75DTeCzd3oUWAzPUy+qm+HB2Z8nPrloNFEQhetEIgk3mYv+whk
	 6nWFFLMsuuhXpmgJI9j0R/8cvkj/ooY3Gtk5gjxXaIPyHQnO464oaY0CY6dHfenmzs
	 f8Z+vdD2+TfLg==
Date: Sun, 31 May 2026 04:59:09 +0000
To: dri-devel@lists.freedesktop.org
From: =?utf-8?Q?Gustavo_Kenji_Mendon=C3=A7a_Kaneko?= <kaneko.dev@pm.me>
Cc: airlied@gmail.com, simona@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com, corbet@lwn.net, amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Gustavo_Kenji_Mendon=C3=A7a_Kaneko?= <kaneko.dev@pm.me>
Subject: [PATCH 2/2] drm/amd/display: rename timeout_occured to timeout_occurred
Message-ID: <20260531045852.41849-2-kaneko.dev@pm.me>
In-Reply-To: <20260531045852.41849-1-kaneko.dev@pm.me>
References: <20260531045852.41849-1-kaneko.dev@pm.me>
Feedback-ID: 165279626:user:proton
X-Pm-Message-ID: 8cb3de63cbc7a301755003877c36a5a6a68ade29
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix spelling mistake in struct dmub_timeout_info field name.
Rename 'timeout_occured' to 'timeout_occurred' and update
all references in dc_dmub_srv.c accordingly.

Signed-off-by: Gustavo Kenji Mendon=C3=A7a Kaneko <kaneko.dev@pm.me>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 4 ++--
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm=
/amd/display/dc/dc_dmub_srv.c
index 79c8b4cab053..4b47172a71c0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -285,8 +285,8 @@ bool dc_dmub_srv_wait_for_idle(struct dc_dmub_srv *dc_d=
mub_srv,
=20
 =09=09if (status !=3D DMUB_STATUS_OK) {
 =09=09=09DC_LOG_DEBUG("No reply for DMUB command: status=3D%d\n", status);
-=09=09=09if (!dmub->debug.timeout_info.timeout_occured) {
-=09=09=09=09dmub->debug.timeout_info.timeout_occured =3D true;
+=09=09=09if (!dmub->debug.timeout_info.timeout_occurred) {
+=09=09=09=09dmub->debug.timeout_info.timeout_occurred =3D true;
 =09=09=09=09if (cmd_list)
 =09=09=09=09=09dmub->debug.timeout_info.timeout_cmd =3D *cmd_list;
 =09=09=09=09dmub->debug.timeout_info.timestamp =3D dm_get_timestamp(dc_dmu=
b_srv->ctx);
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/=
amd/display/dmub/dmub_srv.h
index c18ff8f00bb8..33fcda687a86 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -355,11 +355,11 @@ struct dmub_srv_hw_params {
=20
 /**
  * struct dmub_srv_debug - Debug info for dmub_srv
- * @timeout_occured: Indicates a timeout occured on any message from drive=
r to dmub
+ * @timeout_occurred: Indicates a timeout occurred on any message from dri=
ver to dmub
  * @timeout_cmd: first cmd sent from driver that timed out - subsequent ti=
meouts are not stored
  */
 struct dmub_timeout_info {
-=09bool timeout_occured;
+=09bool timeout_occurred;
 =09union dmub_rb_cmd timeout_cmd;
 =09unsigned long long timestamp;
 };
--=20
2.54.0


