Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123033A9F5
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170696; cv=none; b=oMzxiXcYAwI5UBW/jScFrY0QLXf7S5DC/7n7yRPS0EOG4vGDpWCTqXT9sMxx4Hg425E1s3xQRzWQZRJ/PINKzaOI/QjYhIEA3fLqVt2v9NW7uhtVdflyrC2Q3ajVfEu0IRPxlBG2FR6Xb6owZA+X7F+N6yMhroWuYUbvLywYIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170696; c=relaxed/simple;
	bh=sK3ZQVBtfyfthR2+Zzv3Fd006UTr+MjMynfqgBxOhTY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=EdjK3ucjfUAsULlmqe+qTbPsyPAH5eQHvMVSh5m48+qC7038dpdZq4Ag38eTcWv0lq/KaVNpcD2R8duzJBZM8P8VT1anrGb1ul2xmH0FRtBH53A088Hpwa1/xqZTpbuEN4P13beOGG57mibbTnT1w6tQpmoFPEIG0hpPyQokXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BLz8b+2s; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BLz8b+2s"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FAEA4E41CBB;
	Fri, 19 Dec 2025 18:58:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D2B6071D;
	Fri, 19 Dec 2025 18:58:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 385AF102F0CDA;
	Fri, 19 Dec 2025 19:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766170688; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P6Ely85QikV8+f6kHBvSW1AzwDVbZ+GD/+CPNKJiuVg=;
	b=BLz8b+2sQLoPjbaeDKpbZO1Q3qCwM4+Bhcfo49wmboayol7SZ3PE7VxbchMO5RhmDJQYBP
	f+0ETVbiB/4WaPRXTHq30+DzvYqgfpnbdIJSDsRg6+rm2HyN7r/OdDBx0/A3kLDiNxTc8P
	I9GTyiyymDLkYcL/wqGntP2zVFj5llydhfRIg3/76VN/DXhHutwORpQr7Sx0GH81GIVbaY
	pBdpKHWbCO0vghEvlftgP3UrNNM1UcM2RcMjhbS/YZHWdFwzzSapVKpxxsmb2dNc/YEZZK
	JuljWnvur2v5DSYlCs09JghdPlRDbsEeCh9+I228hGZycQ8b5cTDMjbKb+LZxg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 19:58:05 +0100
Message-Id: <DF2F97ZVFINU.VQ5ZD96C4ZNH@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH RESEND v2 29/32] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
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
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> With the introduction of dynamic connectors we will have two way of
> initializing a VKMS connector. Rename the current function to clarify
> the case.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -4,6 +4,7 @@
>  #define _VKMS_CONNECTOR_H_
>
>  #include "vkms_drv.h"
> +#include "vkms_config.h"

Why? Maybe this is for another patch in the series?

With that line removed:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
