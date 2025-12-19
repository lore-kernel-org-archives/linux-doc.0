Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07A2E6CD5
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766177271; cv=none; b=lasX3RDeVHq2LvRPOMOVWMa9fSWkt/NLLz705QuRl6ipSKvYT9KzD0fgjXnni4kXy977Y/Fn/1PjQJx0/kH3d5ckZeVXcQb8dLvVbOoLmDppf1BAU+RC+X3fYrHAwZGGvfNh762RmsWhtJP2ug3AQ10owpfmYtHKC8khh8XhayE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766177271; c=relaxed/simple;
	bh=3+O0Swois3iFK+bJGBK/qM9RE2tccXIWeARN0bmsUHo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bDL/eM9HMysSlzk+YKBZbPpk3rNzp1K2tXnsWK4Ow8ZPi6c0zuQyD6vpvtq5uJBoSFQZPDuFntsVC+ISALH4F55XveUDdzcd2ise22nvUbBusZEtPvGcbiqW9D7OfASEKr1LDRgFPVGhdrRJEsjRyU0FUiOvsFQmaLCwUoUwXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=diToIrwL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="diToIrwL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 942611A22FB;
	Fri, 19 Dec 2025 20:47:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69AE66071D;
	Fri, 19 Dec 2025 20:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0BA0010AA98BD;
	Fri, 19 Dec 2025 21:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766177263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3+O0Swois3iFK+bJGBK/qM9RE2tccXIWeARN0bmsUHo=;
	b=diToIrwLUmv3hlHio4d19hqgF31VkzvfjloTXwBuHDTedQht9qLjRfF2JcG5Cjs7OmHwot
	5e8gVPuEkP9ivjYa4ctxg5bOcITjmvEMDIuLlVIYPy0Hw07q8JVplKc7RQmqa9548a6GZ1
	/aHY0FUptFigfazWCnKXqDLIH+NAdlPV6Ug2NUrPQPdNkfEVslShYcIBZaAKtRkXsUo+OU
	gYQ9MQxiA83dxAu67v5BkOQlad4bUddiaQW9xPcPQsRQ1SaIWGcgczbZmo9dQN63E/YnCH
	75en5n5puc9b7Fgt8BegA1irNN5Hkx38oByLBJFhd/CseDfGqBCnjXV71Aos6w==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 21:47:40 +0100
Message-Id: <DF2HL4E85QJX.1OB06FV08A3NG@bootlin.com>
Subject: Re: [PATCH RESEND v2 30/32] drm/vkms: Extract common code for
 connector initialization
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
 <20251029-vkms-all-config-v2-30-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-30-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
> With the introduction of dynamic connector, some code will be shared
> between dynamic and static connectors. Extract this part to avoid code
> duplication
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
