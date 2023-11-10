Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B61DDB2
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="ktdtSKOA"
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C4629537
	for <linux-doc@vger.kernel.org>; Fri, 10 Nov 2023 02:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1699612775; x=1699871975;
	bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ktdtSKOA9fil4F06AF8zSWq3uMPFOkrgZZS6atSxG4D6py1timaFJz9vuwidShDJf
	 V2RIS55K9uRYUGW+4sHxFX3FGI3PF0YEihYKn+pDU+b8CIaK2JujJxhx0/jILFCkXp
	 QNshvnRllSNMTK6TxC0l4H+Nv2RvnI5qaEFMkBHwoLEdK3A7yuxpSOM0l3iSt19iVJ
	 KYqxD1MIJAE/KasNMSmL3VXPEAW7nQv5zp58jNLVF0/eXgkWKYIDTbo3BLXWfTU/0b
	 5uXlUc4LuM+nOgHRNCJN7w/KrC6Gaare/kFQOEczKwMhvJEXHiZXC+PdT04ytZNcAL
	 uPLKuIMxg400Q==
Date: Fri, 10 Nov 2023 10:39:17 +0000
To: Javier Martinez Canillas <javierm@redhat.com>
From: Simon Ser <contact@emersion.fr>
Cc: linux-kernel@vger.kernel.org, Sima Vetter <daniel.vetter@ffwll.ch>, Pekka Paalanen <pekka.paalanen@collabora.com>, Maxime Ripard <mripard@kernel.org>, Bilal Elmoussaoui <belmouss@redhat.com>, Erico Nunes <nunes.erico@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/todo: Add entry about implementing buffer age for damage tracking
Message-ID: <Qk7PzUNb_mQOUoclJb_UZkCxPr6GpbX-DftrnR9OKDwSfdDHuwhUnOXbqKU-M_v6q1YgEphShJYnc9o-LW7pN6bMOiNbpcVBsrDvUofFs_M=@emersion.fr>
In-Reply-To: <20231109172449.1599262-7-javierm@redhat.com>
References: <20231109172449.1599262-1-javierm@redhat.com> <20231109172449.1599262-7-javierm@redhat.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Simon Ser <contact@emersion.fr>
