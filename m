Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3E30DD07;
	Tue, 23 Dec 2025 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488379; cv=none; b=chCI7Th4euJWVKLbQxi1G6s+nesPQJ5NVAd0cS0205x4y2P+aKODlwz1HO84O1kmOBB0S/zmi1Fl5cDm+WdFezcAHMagxXzYyYgPihusq8TUdUAMqDzdhFjwWGabDS7TbtAzkqmOf62m75lp+PVVBYZMdChilNSM4DPw8z105FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488379; c=relaxed/simple;
	bh=T+XNArfJss581Zu3LiGOA62RN4D2wp3X6FajoYoLatM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Amas13jOi75/h0AIWSyar4J6t8eRsomeht4Nb8e7wz5t6Xvi6TC6trelEs/oneqpliX77Mb9kitoCjIORLhv+hPuO6QPdf2eNukvPCFxOzknUAEBKxBSPivs8HS4BNYNS80ZQd/b9mGtrl7Nqx4Ba7C4VZKyWcEQBuweWX1mAcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TVI8HP6P; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TVI8HP6P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C57AE1A23A1;
	Tue, 23 Dec 2025 11:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C36D60716;
	Tue, 23 Dec 2025 11:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BE0D10AB0A00;
	Tue, 23 Dec 2025 12:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766488373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eEBKzrFw/sS0Q4c5MZiHmEW38AzU5aIB10a59LFKef4=;
	b=TVI8HP6PtSQpxVNoFXI3WY9Gn9xEr9jPNqFtoH2uSLFZSR3AfpuXJvESJAwZYx0rTR0PHM
	RUFDJLrHt8PZZLbqTXFbmB19LeWk6FkeWyw9QM4Lk0OINyuN1johp+KqJqxvnzqLw78eVU
	rzj1uOwGlQgiDb24Ts+zaJrhRfB0r0cbmwzzx/c4FIzanxEf8eEvo5peqLRThc2xvZfn3k
	aVZVpAQrWdxk0qp8ZUyLEy5XTeSktQSt9cVhKZPUl8NxiqsgprNuwPBBJl63jA9LcAJio+
	0n+IP9iW7iAiZZnQhP9McJPHMjxnjrCvb5Y4kX9tkzMn+KnIP3ztwPIYcLwgUw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:12:48 +0100
Message-Id: <DF5JV5BU695Q.DO0WHX92G84H@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/33] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
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
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-1-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-1-ba42dc3fb9ff@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 22, 2025 at 11:11 AM CET, Louis Chauvet wrote:
> VKMS recently introduced a ConfigFS API to configure new devices.
> Add proper ABI documentation.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -0,0 +1,118 @@
> +What:		/sys/kernel/config/vkms/
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        This group contains sub-groups corresponding to created
> +		VKMS devices.

Some lines use spaces for indentation, some use tabs. The two above lines
are an example, but this happens elsewhere in this patch.

With that fixed to be consistent:
 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
