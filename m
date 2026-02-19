Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ADA31AA96;
	Thu, 19 Feb 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509421; cv=none; b=jNp+7da2pSNV5SO/7wBiIgvirHsbPofGSmY1VYA0EaZd9dRKFmgcEquYvMYCL55KujclyP6XYzU3+2DLxeSyeygVhLp9WlloME/DvyYwLpgfHqcMKYLU36ggDciXIihBeqnkeneYcKwWHNTfS/Vgo6Tu/inAtzS26EyE61t3cRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509421; c=relaxed/simple;
	bh=5Fv7ABevp5iRm5jbBgXryIEbTrr4oC/Z7NencERuE9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2FHGLNyfnyLxXsxrCajnVCqLE86C1z11q99QPoiV25aTtBR26GtO2eVuxK1RrXFdulhj/UqEi+Qc3ZlCfUecc6LbsD0COzmedsVdA22RFTObbOMjgmD46BwLjGdubSHLH9JhXU03L+yucN5xIE/ilkqZ4n6szdZ8M6QUDIm+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engestrom.ch; spf=pass smtp.mailfrom=engestrom.ch; dkim=pass (2048-bit key) header.d=engestrom.ch header.i=@engestrom.ch header.b=c84fA4zA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BC81rGd1; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engestrom.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engestrom.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=engestrom.ch header.i=@engestrom.ch header.b="c84fA4zA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BC81rGd1"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C48B27A01BF;
	Thu, 19 Feb 2026 08:56:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 19 Feb 2026 08:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1771509417; x=1771595817; bh=4SWKQ6mmsW6erDFNl7KWu
	f6pQ4EoQD0fsR2WoH3GzqA=; b=c84fA4zAgehHdSuJa5lkzK+oEtEJ1gJRSAsSg
	cLXtEHsYKQYh2k5sa4LKfUM1Eyxz8UbhgE7gWbn06HnJWyerNfwBQureyoZc1y4k
	MYwCuM/KTMY5Sq2MiqO9R1kR9vw7D+1GNHmnfUdPIrESZR0emf2haKCyPU6E8Nn6
	yZleDYdjR6yn70BpuGop1BimyDWQzLUIPFxGsnzldMhr0fhJzJ3qhtwuAQc+EZWm
	ZtiCS032sZduY/lR+pCnASxUtvVlDF8wxAjMdJQwlqLetkdTTF6oHcWIprOK12qf
	uBXCek4WgyIZcUsu40FCtHSXyIfuJbiTzgqfuJ0qEQ/5LxyPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771509417; x=1771595817; bh=4SWKQ6mmsW6erDFNl7KWuf6pQ4EoQD0fsR2
	WoH3GzqA=; b=BC81rGd1J4hc3aEw4Jc2U4iQOHsb1uHnXximg6UTBHXX13ih/ip
	IEZTGGdZsElsmx+aiDjAcLoCIVEeNDWTP0an01EhrL+rEfSL3+medQDQ8lJl41Q+
	Gw1ctkuaQKJ4cmjnBzIkhvi16Uo+JOq3rraujY3SRRQDfTqUddmbOX/udTemKF3W
	yTltDqjbZpi705o5nLCGaUdwbeJZZxZ7SYYaugreN2HR2if1K74gAkKL98VE4Xdg
	Pzm+fS4N72UsDvPd52mdvu5/dfoScQ1PvW3MQg0wYA5BbQeNI/G9Zfzopt0mdGcg
	4bU0I7/6ZnG/S9PFx+8s8qDLUY5kfhhRr5w==
X-ME-Sender: <xms:qRaXaVK2y9CdAtuwbKIw_dTlMANn6Q4JpwbXtExTRR2S4Q-fUxbEqQ>
    <xme:qRaXaXjLjG60rzp6zI3LtYnIqNVSdrbiHKZOFDTZx6nhu0ti77ukMR_-zDRaLDtmf
    VcwVTvrv7okps8HRvC4vpAMsZ4DIVUUa3EeFd2R-zo1MmElHl00q2c>
X-ME-Received: <xmr:qRaXaZ-TULCNkJZu3WWuIKLt7u0qUZaR0xVEt3_RPqt3vwub5xmBibHy_5fL1uSRYuYU-x6sntXLtMHnFqOTG3dMPJY_t8OHf2ZA_Yfg2EE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdehjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepgfhrihgtucfgnhhg
    vghsthhrohhmuceovghrihgtsegvnhhgvghsthhrohhmrdgthheqnecuggftrfgrthhtvg
    hrnhepkeefvdefvefhffdtiefgffffhfehkeefjefhvefhgedufeffhfetleffvedvheeh
    necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepvghrihgtsegvnhhgvghsthhrohhm
    rdgthhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehhvghlvghnrdhfohhrnhgriihivghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    vhhighhnvghshhdrrhgrmhgrnhestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhope
    hmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhr
    tghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiih
    hmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtth
    hopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopegurhhiqdguvghvvghlsehl
    ihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:qRaXaUNU8dRDEybJGNIrbUj959mUXPsnUNxRq42BKCrjXKe2tdd9Sw>
    <xmx:qRaXaVAdI92k28X7ECqm7GA9KW5obdIiHMgr-uzk3kNKUL1toFdsdw>
    <xmx:qRaXaQOnsydxoU1ewzmdGQ23d_kkK-xY47GBZeDPiN66co7eKHZ-ig>
    <xmx:qRaXaUexPFqWnnbhJ4KMUaczVMR20eN8m-VgehaYKxlAhWECGycGgQ>
    <xmx:qRaXaS8v-E7N3hcVlY79-5lO_lOGr3ZJkBSOkX_oTw2sJM56fCsncXlG>
Feedback-ID: ieaa94438:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 08:56:55 -0500 (EST)
From: Eric Engestrom <eric@engestrom.ch>
To: Helen Koike <helen.fornazier@gmail.com>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH] drm/doc: recommend forking drm/kernel rather than uploading a distinct copy
Date: Thu, 19 Feb 2026 14:56:45 +0100
Message-ID: <20260219135645.261192-1-eric@engestrom.ch>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/gpu/automated_testing.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git ./Documentation/gpu/automated_testing.rst ./Documentation/gpu/automated_testing.rst
index 62aa3ede02a5df3f590b..8a7328aef10ef39ee329 100644
--- ./Documentation/gpu/automated_testing.rst
+++ ./Documentation/gpu/automated_testing.rst
@@ -99,7 +99,8 @@ How to enable automated testing on your tree
 ============================================
 
 1. Create a Linux tree in https://gitlab.freedesktop.org/ if you don't have one
-yet
+yet, by forking https://gitlab.freedesktop.org/drm/kernel (this allows GitLab
+to internally track that these are the same git objects).
 
 2. In your kernel repo's configuration (eg.
 https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change the
-- 
Cheers,
  Eric

