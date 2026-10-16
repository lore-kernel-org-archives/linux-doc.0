Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE33AB47A
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151078; cv=none; b=eHWbebbkQTjDEsnEWJSQEtuIf1nnGgG6UKmTP+r7u/b2GS18erWHdAiV8HlW0AYR0AFffgFZp7eay928TkovA9tZ1HxusVP+A8ZL57S+sK9iv2IQG/Q2407Cup3hxHcuHvw6YLhwf5/fRA7tr9fhydN8/LlQvnSE+DQFLi9hjaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151078; c=relaxed/simple;
	bh=FViMjI5X4R4+An5gbut2kAXLO8XNnnS5Kr2ghGnb4t0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I1r3ZYZHP1Q5ygmr5M0rdgsvmEiZosh1Gj9qZknuF+j9mJhhEzfWx35Dze8cA2SOJ3+aF5Eg1qcUIhmulaxUr5mZIuY2xNAwla8LqbqHLgK9YHv4MKTt6DGqObQe0sQ8Yf1fpbXW+Q6gvkc0CRgtLzlkp+2sXXJJ9IhGImZrg+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=gO8Os1I6; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="gO8Os1I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail3; t=1792151067; x=1792410267;
	bh=FViMjI5X4R4+An5gbut2kAXLO8XNnnS5Kr2ghGnb4t0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gO8Os1I6CmmqFMDy9qbX1jNXuL56AK7JUvoUmWcH+Z1i5ny8dOHAqGnYxRfBjyIl6
	 oRWw8muO6Io8HFcFQE+J0U8H5Kh/2s/s3VjDwgRYgpiQtImZdpRVtF28Xz+603ZiDa
	 bdHt96nGFA5n197jiYAhwCnFPhGnHW7HLIky1x5JbKOou5VYlMjyeOccMnJVvxibsC
	 hMYZskiIYJWsi6FwjPZqS+vNYXxZvfjaQ1DBtZ3uVwp2IH5MVvN7Vb4uzNyHhdtXwP
	 IIVuKrhcDdRRJObnuD/YD5czR2wPsgFcb2L+DVFAoDpIxqkw+X1E8jkrfhaDMEdq9b
	 tcGoeAK3hpzLw==
Date: Fri, 16 Oct 2026 11:44:22 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/5] hwmon: AMPINEL telemetry support and shared fixes
Message-ID: <179215104901.3671753.17855362953462142874@vasily.cc>
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Feedback-ID: 162318860:user:proton
X-Pm-Message-ID: 1c384780280e70cce90a1131bf316fb111bef493
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

A quick follow-up on this series from September 27. Is there anything
else I should address in v5 before it can be considered for inclusion?

V5 includes the power-cache snapshot fix and has been installed and
validated locally with stock hid-generic. AMPINEL support is limited to
read-only telemetry, as described in the cover letter.

Thanks,
Vas

