Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30D371049
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 12:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501678; cv=none; b=AOZm9pUVkg7XzMLXRbqwGZacXPw3QISKuDa+je0h7AVe+jLQwVK14ekG6htm2Z//tbwS1x8aUC/HrFUGX+DFvs9ApilKpVBWynWUMyHfFbKB5t1Qn8Yx/HFLWrWKS/64YFKCIbyQGlRauGlyIoXEVwHisx341HuC+s2ZUD13a3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501678; c=relaxed/simple;
	bh=pb7ALZUZXOQlcKiG6O7I7STmbleVFJX3QQzMnVbbQI8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qut6X0Gacj7u4799UFmMUW27ebngXcrMdDNzQ8zXIfQ6cT0yHE0XsJ8e3cpVLZI7rhoyqmlyUHWlycGLIS+otKTN2ljAU0RHjU1sQ/QBvOz0s2gZP7Nj18NDVNG5wJSU+DoCJKnwQR17Cm2ldAZklIoeYsC1Wa9tiT6a4A6cCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Io79iC5+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Io79iC5+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6C0F5410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778501676; bh=04eLlvx/pZh/pgfhzlxjTsKybP+rISrltG/8U1AFLoI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Io79iC5+6DYLG4ji1PeaYkSLp3UayBLYIPW+N9+bquywMCfki2JFHiG8eXDoorJDh
	 dEGcUkNrP74zz2mqmGWrPpUQjplN/xWftgHso71cF7m/6JIcbjSQdzbFJsLr+Dxqj7
	 dqnJ3C89cqsFxC1xUQbqnv8aX12wJi9xWbXwIyDmiBzrkPRbORgc0pcDNBoJCXbyM4
	 eioui6Ye17h6u9AJiIA+wUz9jrBK4XgtqScYk6O8EmSEX/hPVANF0BF+tB/sY2xXTp
	 isYim1HfifeBm9HIXZ2WOFRWb1irDApKap3dW2TWcyVakVDWJYgFRwpXpfWZhcuodX
	 L4ljznhdkoAmQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6C0F5410B5;
	Mon, 11 May 2026 12:14:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 0/3] Documentation/gpu: tables of contents cleanups and
 fixes
In-Reply-To: <ad1be55a146a3680ad920588a7cfdbc154b8a4fc@intel.com>
References: <cover.1778238671.git.jani.nikula@intel.com>
 <ad1be55a146a3680ad920588a7cfdbc154b8a4fc@intel.com>
Date: Mon, 11 May 2026 06:14:35 -0600
Message-ID: <875x4uw3bo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@intel.com> writes:

> On Fri, 08 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> Make the GPU documentation slightly easier to navigate.
>
> Maxime, Thomas, Maarten, Jon -
>
> Any preferences which tree to merge this through? I'm thinking either
> drm-misc-next or docs-next.

Usually I stand back from DRM docs, expecting them to go through the DRM
tree.  I can certainly pick up this set if that's best, but I wasn't
expecting to.

Thanks,

jon
