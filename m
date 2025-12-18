Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF1303CB6
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080606; cv=none; b=SBl8ooInIT5acwqoItn9kuOLaAbw+5t69I31HNqDWdr7VpkDdWgOu04urX9ePq72T92psBJXktDGlbPNRfyVMGQI3h3lYhDMbA3rZmjcMMAPjVxzIIpp/GcFZ965LejYZcmqMRN3y+Yus5gwDrchZLD0JV0aiVNtZmgSJ6sWHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080606; c=relaxed/simple;
	bh=yfQhJQ2OwC1L2WKH9NsxDylttJiW40/ZXkTJA/gh1jk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Qvh2GXamN2LqB0YYqbC3VgX9GFcTfxGRRm46AFfyg3I43OVmKEYw0HPjb8UzckAmlvDHOMPu4aFuSeuupgAzmwa+koxsO0WrNclsfFQaWBDr+X710DNStlYXp9HfByCi0mZ6J1KzZ3008IabwEvOw0yvDfJ5mibvljmXM2BAyVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1JvN+M8g; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1JvN+M8g"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 90BDD1A22D3;
	Thu, 18 Dec 2025 17:56:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61E8660715;
	Thu, 18 Dec 2025 17:56:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E55E3102F0B52;
	Thu, 18 Dec 2025 18:56:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080597; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yfQhJQ2OwC1L2WKH9NsxDylttJiW40/ZXkTJA/gh1jk=;
	b=1JvN+M8gaWJpZn9cI4yi9sobKdQucN41lXRlMV4koEI4vARE0tnf5tNlIvyKFOVLOhi91R
	3dzfWJBcIXMhKzhPQcGIH2CganumyI4kaQN8LcsaoZR6H8Fr+BtREnMgU5DbE5FkUEcHbk
	zIIFjcpyLLbX20l2IURXCnRE8NWEcIjLVL1ydIeJZHlTn4sJhvOPt2ecI3HMKe30DJN86k
	9b0OCiu3urNpwTLiwC4C1ljZjl/k+SqgHUxRqhdKZoK8HWQfC0HNjRb40NiIkZiBvrmdeK
	Rd1VKFsRJOiS9ETyBMIbJHKDHv6sXfBXHjITF8atGy7Q/p9l3rjYmGGSaclvnw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:56:34 +0100
Message-Id: <DF1JBKLHMRDZ.17OW9XQXNYDXP@bootlin.com>
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
Subject: Re: [PATCH RESEND v2 02/32] drm/vkms: Explicitly display plane type
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-2-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-2-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> Debug information are mainly read by human, so use full name instead
> of values.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
