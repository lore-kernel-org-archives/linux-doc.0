Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24862D23A4
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762254162; cv=none; b=AvyRSjEShUklqbZmqQEozbBofQxrnDQeLZnueogqSatvE2keGyDqW5G358GJ+5nUyO4mns5mYMmWhN19gdeDEr/J9VGyKu0AIZ1U8CuK3OkFYg4FMy6fsPFPf897bkMs6LTG4ZxSUSRPFBh+2ck02Y3dj4vtMraaHLtSqq3UpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762254162; c=relaxed/simple;
	bh=T7PqefNfjMYS07MvKDHImPv5OukVJV33UR3vABr4xjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hp+sfOlaD92uWKYdAEQ/byIp3hZ5ArsCFGL60N4rW7Is0Jb6+cNSXoe7KmIuUcijjuwR84gRq2KTt05IhlyaZD5eltfdQ6IEPlpnOSkR4moOh+SnoN5EYE8ix2dm1muYzP4YOnkBMJ+z/oT8afbxwEff01seGo35UOoe49PiiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YGrnmVW6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YGrnmVW6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 026C7C0E60C;
	Tue,  4 Nov 2025 11:02:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CACE5606EF;
	Tue,  4 Nov 2025 11:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22356102F1CE8;
	Tue,  4 Nov 2025 12:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762254157; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2TP6j6kVWFU+uNt/xtNDwC6uqXMzP7Iu2p5iTCWD3KM=;
	b=YGrnmVW6amOtuJg6/NMM2Mqm0I76RF0PzJ3IfIKpU4E35XPiGOL2oiw0jjTNjIoEEEfB7R
	Iy0kllRDfBHPkpJ3WAKcZAij5V4kTAlMT36HkI+o4oKTQ5v7ozqa6stcFG2GUlpyqNQ1+o
	pBpWJ2hSvq/fzo2GE7Km7HRsghIUICZUi4w0pyHlyVA9iBqTYYiq7t5Ms08kwCbyk1issT
	GF6Zo5+61njc+SlhHObWLJ861+kEubv/KAzIREKgHPipxqmOkSEqpqEEwYDUGNt4Bevyim
	yk6CQPc2zYBgLRYixkYOyjvjUxyxBk5WrUb63bk0u0GbESKVQDMwGR9NhPjuRw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251024110014.4614-1-jose.exposito89@gmail.com>
References: <20251024110014.4614-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH 1/2] drm/vkms: Fix run-tests.sh script name
Message-Id: <176225415494.422810.7112986302756262297.b4-ty@bootlin.com>
Date: Tue, 04 Nov 2025 12:02:34 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 24 Oct 2025 13:00:04 +0200, José Expósito wrote:
> The script is "run-tests.sh", no "run-test.sh".
> 
> 

Applied, thanks!

[1/2] drm/vkms: Fix run-tests.sh script name
      commit: edcdd00099f1b755095dd770c9cd5d3374e49ebc
[2/2] drm/vkms: Update testing with IGT IGT_DEVICE
      commit: b63300ac4095f892a8472a82f465fdc7c63a8c57

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

