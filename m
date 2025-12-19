Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B92DC321
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177268; cv=none; b=LjqsjfkWSzmXYJ+AOQfgLYmYDutAaMsemBy9PyQ23NKxio+LYOMgoOfHuJFNfQrSvD4KuKKcRE7WHnbB/c+uCGt+aT2FAjV0sc0qn1hbeQtiYDlNZKVhIfONK5D2liWBWd72ldnk67BJm+iX1jIf1u7uKVOiLH5bioeZfSjEU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177268; c=relaxed/simple;
	bh=JugnzS+aIX1YVGPVQcemW44wo0uHvujpU/GHef1nU00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WpbOLwL3AdAtbMSouWVR3lseJhL79VozsAXZsSmzJeEahh5UqNHr/nm1zkJiOoV7i1pbNihw+O5kGOMTL7cflPquh2wC1dlSH9jQuSTI18/AAWENWLSHptBQ8JIRpYWj39Zja3FCXNg3KfWYpaUJVlTMbqAJd2jKdDLc1wAvJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YIBOmFFp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YIBOmFFp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21BB21A22FA;
	Fri, 19 Dec 2025 20:47:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E04826071D;
	Fri, 19 Dec 2025 20:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7297110AA9874;
	Fri, 19 Dec 2025 21:47:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766177258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tqIMgIT1zgOc7/k4/J08FVID6FI+V7s5NeZfBKk0l3I=;
	b=YIBOmFFp02TRQXWabZ8ET2m+7prByScZ8aFCrw9S8vFwA9s32N6Q7V8cda1luaSCNvLlXj
	W1hr15b7FzrX6OfEJ3aMiureZlwTSWtCXYNoGi53M2l8JhLJP2shGrxw8zTYVrAduZr22p
	MUHmbLUSNn/2MN7/JCN/N9ji/ZFAifcOcb0B92w7RPU9qZbfTgXNYoqGrQ6fFSiryQSGpd
	72DC+Xc7/4xqOkQnlroCBdn/Y4ck1nFRCMK9TYr2c5qH25H77a21+OaqmCA/kdPTCchkzy
	NvLtTcFB0P+qxUt4HscryA0X+RvtM0/W4FCmFWZA+4/WrlFZI8fVWsPMipOKXg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:47:32 +0100
Message-Id: <DF2HL0S1XLMI.Y94M4FT7KOJM@bootlin.com>
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
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-29-a49a2d4cba26@bootlin.com>
 <DF2F97ZVFINU.VQ5ZD96C4ZNH@bootlin.com>
 <76417a1c-1179-4e47-ab2d-00048116bfae@bootlin.com>
In-Reply-To: <76417a1c-1179-4e47-ab2d-00048116bfae@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Dec 19, 2025 at 8:11 PM CET, Louis Chauvet wrote:
>
>
> On 12/19/25 19:58, Luca Ceresoli wrote:
>> On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
>>> With the introduction of dynamic connectors we will have two way of
>>> initializing a VKMS connector. Rename the current function to clarify
>>> the case.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>
>>> --- a/drivers/gpu/drm/vkms/vkms_connector.h
>>> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
>>> @@ -4,6 +4,7 @@
>>>   #define _VKMS_CONNECTOR_H_
>>>
>>>   #include "vkms_drv.h"
>>> +#include "vkms_config.h"
>>
>> Why? Maybe this is for another patch in the series?
>
> This line is useful, I use struct vkms_config_connector
> But I agree, this should be a separate patch.

Ah, I see, perhaps it is working currently because it is included by some
other .h files. Yes, better making that explicit (include what you use), or
use a forward declaration if you want. In any case, a separate patch
indeed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
