Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439459;
	b=KzP2uUPd0S6FGaG2MAcnGPLgW3Wb8h5MRLhA/yK0WnSvSEF7RuIw1yEP4DtQemEHYh1e
	 nut12ZXXsq8RcTQqsVmO7f8CUu+/NbIDBYlbe170TX0MpPn1/R9BxmvVhXsMIDVjHXGPY
	 Q+i/6iDaqzh2GAocbBMG3CUM//s0IuGjcm8jKRfFWL1T7vvl0uVIZmsGNmIPys49inCWl
	 PuUgoYHxH8pcVMPvvVTOcItM8oy9kbftu8IBxHCKoCmpek/AufBxEhr31TUcPmsfQZIhL
	 rdsjAuc/ob6kZzi6j0Slqt3dUK5WMCHprSF19UVdbsloFO8K8Fh9z6OlIdB4cpkD9MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439459;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=iYTNCDdhiKPgMC3oUL4xKYF1Z1+fSJpoO0nf2r4oKIE=;
	b=p2TlDJSukcbzU+Afdy5rhglUVtXoqIICrEOpg61J4IxpyWf0PXxo9yZbw9pcKiv3pc8f
	 URHjCsvYXQRtsTtu3kPakrDDFeofGEyYb8W0rgMbwtSDN3WtNBSZBFsFtSY4ky4gMtmz5
	 sx+XwvNsj9uDqmw53Nsp1BgF6JzHOnAGdn2PLd/vSohoZLwlNW2TFBqqenHzKfYT+HKen
	 cfySQkSspLnkzd+YN4t4QleyqhQqsB0scY3RlpiZ/35H+FfaUZWGVJBUu5e6yeF/sEkQu
	 HuKnkyDB6JaanNbhcY7f14An5w1PmoeJPS/hYPTzhDllOehOoZMORf+DPMXm8V9VvWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1KAIw7x3;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188C606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B188C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1KAIw7x3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3E7B0C69146;
	Mon, 23 Nov 2026 13:11:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13063601E1;
	Mon, 23 Nov 2026 13:10:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A658D11E689D2;
	Mon, 23 Nov 2026 14:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795439454; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iYTNCDdhiKPgMC3oUL4xKYF1Z1+fSJpoO0nf2r4oKIE=;
	b=1KAIw7x3WCOP+VMklmFO7H9LvbiZTkrdRWb9qNp49RSl+AScir3UsUK9/WvuRGVSZrFx/g
	j15CsuSslue+kOdwUh7fzTRc5MpyYOFhdFsVlH2G7n38KNbp2BQOyjSF86x9ccgXBvUxX5
	j4K+cMYTuP6Sy9aZ7Ipi+LbeJHcHDG4/k25O4VT3FKdsI3LKIaK0NxMJyUJ6sIE1MMOLZA
	f5MiKCllX4OBXQhfCcMhNkYvXBcJfnoqiwpfTJwIeQf6FAlrmpqsxwEIdJxzRUP7ZQFBde
	k1Mo1Wn/oYJBDHEk71QJ1zQdeyLSAY8uoKYMcBT/PkUUs7XrTTd1AIKyiZOMIw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
References: <20261106-drm-panel_bridge-remove-drmm_of_get_bridge-v1-0-c0ea3382b798@bootlin.com>
Subject: Re: [PATCH 0/3] drm: remove drmm_of_get_bridge()
Message-Id: <179543943896.276287.6561955057050063323.b4-ty@b4>
Date: Mon, 23 Nov 2026 14:10:38 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 06 Nov 2026 17:17:03 +0100, Luca Ceresoli wrote:
> drmm_of_get_bridge() is deprecated. By now it is just a complicated wrapper
> to of_drm_get_bridge_by_endpoint(), and it does not implement bridge
> refcounting. Replace the only user and remove it.
> 
> == Grand plan
> 
> This is part of the work to support hotplug of DRM bridges.
> 
> [...]

Applied, thanks!

[1/3] drm: adp: stop using deprecated drmm_of_get_bridge()
      commit: 8c3eaa2149c1852a5701831bce07fac6cba98bf4
[2/3] drm/panel: remove drmm_of_get_bridge()
      commit: 01f2c4238fa101fd58696d0f0671d1edfaa247a3
[3/3] drm/todo: remove drmm_of_get_bridge()
      commit: 0bd6e1ffd6a85914092b110b08f5a19271f3dbd4

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


