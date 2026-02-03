Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E989211A14;
	Tue,  3 Feb 2026 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147757; cv=none; b=D6OxOD9ZT38QVEKR5rd4AeZn18OgZ56lVuz2xM8aAdQdAuDt626Baq9BYL8YlOQgv0plxAFWdUnPfYDAZEAfYUbpkCGIymmMkeYBcC42MdD+xmzBrD9FEMVdL4xm1GA9HPjOxBinw1ujw4/PYU0PiwEcUNoWVCWIbNAPsuGenow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147757; c=relaxed/simple;
	bh=omGdPkZjlEENWhUZfrQ0xyL1xjsdvFKFkXPOg4Sog+I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=e/OZF9cdaPiWh+RQ/MQ39Y6D07ewmxA2DYDkDFYUV5YUuSQs0clt9uGgt7+GIfBeLFQmWL+z4jTyGJg9mOJFsxrmIaWpm58aNuXtXWSrDvyd71Xgy8mN5+IwLsgUTtyfSAE/uEDx9P5CE2RcdZTYdqwfMFf8mxOnaNdXRsRCtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP0XF5DB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP0XF5DB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30A6C116D0;
	Tue,  3 Feb 2026 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770147756;
	bh=omGdPkZjlEENWhUZfrQ0xyL1xjsdvFKFkXPOg4Sog+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dP0XF5DB3xm10OJLOIB6Emsz5UQaQFeFWdbXbEpqpkncNAxnSuaIARbmpkheQCcZI
	 nY5TwtVJ8rRCdugL/QWuF9QqiqLNuydbq+F72l9STfRCxU2JvV+Til9c4Vd9oLupyY
	 gn1ls+LiYoi5w8I53FriVxAqbRNZoRP5ZrFXRItWe+D+YRMABJZN9MBT+tq4L7Y4n+
	 vz0i1aGvzpdvURl4Bwc/num7dUSiwWl7mz5WlUNjSvFucseCB0CAQ3AlI/UKWUz/PF
	 jgwZ6ZZU1OXukkWnwKq0iyVzbqfiwrynmuLFA83DYoglbvGa6RekVj0GD954VytE7a
	 9M+Vt0TFAo/AQ==
Date: Tue, 03 Feb 2026 09:42:35 -1000
Message-ID: <809f40c7439988711ebac2682efa4320@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 lirongqing@baidu.com,
 rneu@meta.com,
 kernel-team@meta.com
Subject: Re: [PATCH] workqueue: add CONFIG_BOOTPARAM_WQ_STALL_PANIC option
In-Reply-To: <20260203-workqueue-v1-1-ccf163b83187@debian.org>
References: <20260203-workqueue-v1-1-ccf163b83187@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Applied to wq/for-6.20.

Thanks.
--
tejun
