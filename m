Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27121A6820
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776222526; cv=none; b=qPUafKmFmYoqZ2107DhS4CakkRsuOYDf4KYeJYBHZMEE2OV4Lo+pKTjUjmwEkW11h86LnNZ8TG8A+VYGTurcJa0KMUjNM///aK7O22/7nuk1SyE0x8olKH5gc1HEj2AxhhKfstZ9COINbpDDj1NHPr45ovCRhBYh6EXhP5TIdI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776222526; c=relaxed/simple;
	bh=ylHoBcSvmiQ2xNaQTIkrMnHQ0ImDq+6Wm2sgUIEuXS0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TiyLYwS5bWquH1RFMZ2PXc6WGoFlUI8cHiLT54IahSDG5TJPug1Zvt9zzKVYICBZnokFgmxoHA4HcXmsUZx+xySNBT6UbS5NyubJYAe2yBmkYiVIxQvLsJyJR3L3Cl9MQnZO7GPL5EdnAAcNRNTydDMe0zq9AStX7SWUebY+0YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrtVWLKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrtVWLKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C243C19425;
	Wed, 15 Apr 2026 03:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776222526;
	bh=ylHoBcSvmiQ2xNaQTIkrMnHQ0ImDq+6Wm2sgUIEuXS0=;
	h=Date:From:To:Subject:From;
	b=nrtVWLKps4xzZtsyeR6SIW2XD7ovhsTX4jRKef5h42hJIDCGTJc0IP0Kgh0FHFqjd
	 kxLZ15fswVRjHPqjyiMxS08kS1z196AaZMhfoWquYOp+n0/bh/TBxbiJsN+slI6Ujt
	 /ZdXLoWQxSgSI/hn6dGZ3dNFXutbGWHju/HQkwk0mRTiTJhA3J+wq5F+Iw17u9ZRzw
	 OxUv1WB1dxyTdSI497WcqBvHrw33+b4s0xwl2P37uvNUPPC/B5o/KpBgGcrnBEH/Hp
	 GCgwsEhxYF6O6XwVaocFf4MwFySX6Qna24UT07g/DuUDFQ3tWE4rieb128/o1Y58Nf
	 ubDxODWOjWDkA==
Date: Tue, 14 Apr 2026 23:08:45 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Volunteering to do more reviews
Message-ID: <20260414-valiant-sticky-piculet-3b7b3f@lemur>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Jon and others:

I need more direct hands-on experience doing reviews and using my own tooling,
so I'd like to offer to do more reviewing of patches sent to linux-doc, if
that sort of thing is welcome and I won't be stepping on anyone's toes.

Best wishes,
-- 
KR
