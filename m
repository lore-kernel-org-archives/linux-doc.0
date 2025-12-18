Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDDF303A15;
	Thu, 18 Dec 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080629; cv=none; b=Dz25e9MNIWm806NU961P78kqd9DaDLBJVTgc7vghHnxWbqpxN2f+TDFdeslNc+NfTpuYCWxXHWrMVbh2jMAnINkLGki5UKPhnLn5z4sZGx4RPDjJGsznT6YPp+5Ey+2PWmDlJv245/LAbtOHfjDmKHUDkJcCitRDh8dD8xbu/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080629; c=relaxed/simple;
	bh=hfjPTiTj6ZdkdYZGnVitsFcTdohCcb99bmn8EmWvop0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=s/wMjqUa2czUkXsytYWKD9Ty5667V/96I7hsYAd0/w+AwylX6xsnEH61y6SNfKyFuEcky6sMn2MdPLCfn+iZ/Xa/k4xQFi71CslEBXqy0o6OP8WwD6uTmI9XOeywlobQm7XKObsXC3MiL/dlxiH78VHpJdSeyLIAEamsIiIGpos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iGr7Y3CC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iGr7Y3CC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DEAF1A22D5;
	Thu, 18 Dec 2025 17:57:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E891060715;
	Thu, 18 Dec 2025 17:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A06F102F0B52;
	Thu, 18 Dec 2025 18:57:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hfjPTiTj6ZdkdYZGnVitsFcTdohCcb99bmn8EmWvop0=;
	b=iGr7Y3CCTTFBm/bhBysKQve3LHUeC7y/VgDirxYytfGX4AXbl6i8cTDxhCKsF4wjwZ2TFS
	JB1fSRt+HU3g37xej4RKT+P1nqpveMTFOVcmDGh3P6BWvkRtocUd6+cLWS4NJpS63GerVL
	OG1PRISe5uDFSXpEP5qil4QBERSgXoIyVtxVdNr/Fwkw9CGzkfYrQEkekGgbmpdVpf1DTI
	sb8WVSRvROtnL+EbSrKN5eXyZXTvxcrJ1WOeWJg6/A8wfqHyBt5RDo9rGS+4U7YP51t4WH
	ORfKwhr5n6R4Cmrh7IkkfbYxmYUusDkce0/e2+bLtx+ft/TwxOgbQv21QJN2Ag==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:57:00 +0100
Message-Id: <DF1JBWO8RNUD.MJHWQYKGNU2P@bootlin.com>
Subject: Re: [PATCH RESEND v2 03/32] drm/vkms: Use enabled/disabled instead
 of 1/0 for debug
Cc: "Haneen Mohammed" <hamohammed.sa@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Melissa Wen" <melissa.srw@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, "Louis
 Chauvet" <louis.chauvet@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-3-a49a2d4cba26@bootlin.com>
 <aRXmghF0m0ypbQMs@fedora>
In-Reply-To: <aRXmghF0m0ypbQMs@fedora>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 13, 2025 at 3:09 PM CET, Jos=C3=A9 Exp=C3=B3sito wrote:
> On Wed, Oct 29, 2025 at 03:36:40PM +0100, Louis Chauvet wrote:
>> Debug information are mainly read by human, so display human
>> readable values.
>
> Today I learned. I wasn't aware of those helpers, nice!

Me too! :-)

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
