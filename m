Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F692D061D
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080793; cv=none; b=N3o7F3O1bce/0AvPyiu6+/VzldAHagaiUmQ4vMfygjyYI4g+c9+GgX7Px9qSOam/P1d7GMeIxL7T58gQ8ZHEzgQS3ZScmDt10FZMHxKWokXAjHorBnXszV9A3gwMMfSvGez8+O9HgGBg1NGWQHq+k0AiVuhrfYBWKGvNsCfR/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080793; c=relaxed/simple;
	bh=JcRJBYdg+mMo2FaDW2kt8JpqFPY0us9vM839n1+cKd8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hep7+SXuYvj9+qgIL04Zjg0Ri4HtThTzBIpe+GgGC7rY5cc1WjX1Ac6qgmPIPwvGWbVxP7d7zyPSV8R/qETom3Q3Q6Wfv/BMm4k6mO7pXpmYbUZYri7byREeaNYH/uc7+QaAB/sZ6kWgCprmYxDkXgvNXV3/21ACw7TY0GWxGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TeOMwZeK; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TeOMwZeK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83E5EC1A5B7;
	Thu, 18 Dec 2025 17:59:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2552460715;
	Thu, 18 Dec 2025 17:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFAB8102F0B31;
	Thu, 18 Dec 2025 18:59:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JcRJBYdg+mMo2FaDW2kt8JpqFPY0us9vM839n1+cKd8=;
	b=TeOMwZeK1kU8ygOCUEV63INU3k0t3WOJILyiYt/KIK4NtANP7fqfSxKmnbD1Dmz1iLuKxW
	qHRzmtdZFjqw2fYeEdOPEFRqA6aFDjOWB87egArVMstv1cv5iqqsvdJspV9qZI0H6p949w
	iLxtEKr/1F8Bv2MbZth1AvtthlVs2OH6aP3eMslxbaqrQ+6w9Jy6QF8cOnfd3ndQ4PJyUu
	pR73Yfpy+aOCFQlcea6VlZ0NtG55i76W42CBywmAlhUynoxojP8Te71pt21bGzH7szMzLo
	HH2DhaGOgonlW7+hJiHjz527wUcuBJaG7Qddx4Wle2JGeRyxM27bo55oq5M/vg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:43 +0100
Message-Id: <DF1JDZFKRUY7.1X2VH3FB9B1AD@bootlin.com>
Subject: Re: [PATCH RESEND v2 13/32] drm/drm_color_mgmt: Expose
 drm_get_color_range_name
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
 <20251029-vkms-all-config-v2-13-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-13-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> drm_get_color_range_name can be useful to print debugging information.
> Export it so it could be used from VKMS.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
