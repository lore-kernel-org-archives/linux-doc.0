Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB36329C57;
	Wed, 25 Mar 2026 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774475216; cv=pass; b=WcZlzuE1vBqdJdklxJ8HAN/M8OD7Gx9l6ZDc4jrDwhAJk+ZNKaT/dKDjbeqnnbuKPaOXDK9PLxiJr9xeyx/9yAnqle8Bzq0sMToTce4aHC0sjlCTRGM89vSdLRvk7r5m5XYhYaTVKD4EftxqLle00ErCnf+iA/gN69Vs45bektc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774475216; c=relaxed/simple;
	bh=ywz5+C2OKnQapOSCsR3v4vfq4qMta+gUDoRvWCrnfyY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=G0vPrU1xIAUl7ot2eCPGM2ZytNZU+wFaWfEL0EX/uae26a39CkApeVKpz1v2f80GzgY35P520xUZQ9zKKEAGBk1kNNwpbZ5t0KpPZorRgEFRWFFzn6EkfUwro65gVdt47cw97vmnlIhnOMAjs9I6jLD/V0zdKHdKTErdLWrb1Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=iL20IU0o; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="iL20IU0o"
ARC-Seal: i=1; a=rsa-sha256; t=1774475206; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CmSkkTeNnmB/flhbDjdfcac3e275m+TYQwSM7X556Eqv6C+l9fuo9Ek0TsEUy2+yJFIrgSNpDZXn8Q41rITCT2SB0V6gyzT951ylyiaA2TzRxIgVlnl1a/PikpQJU9DwytC5xqpAJtwYGJ/ooBkgQyARhxR41ZTDFcTCdPlbjd0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774475206; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ywz5+C2OKnQapOSCsR3v4vfq4qMta+gUDoRvWCrnfyY=; 
	b=CxzJyurKK7kYjJeKePFYHkQyuWkLOvOX4kMih+g+m+Ohz8nN2YxvQqgUkaUZfdxYM9ACC3pk+LuWQo2CUj7tshyuuh1T3ug2uYBJkXuACQerjb3G/Dhrx3Eo/MlBrNGAKlouK+pQ9SuKCgZGrxSYfd44XCS+pzJ8QAoefC4zM1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774475206;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Subject:Subject:Cc:Cc:From:From:References:In-Reply-To:Reply-To;
	bh=ywz5+C2OKnQapOSCsR3v4vfq4qMta+gUDoRvWCrnfyY=;
	b=iL20IU0oNWuN2A0eE3t8szjOp8rrX5/HKsBndf7D7VUNxA3abnFTs1kUklLImDgo
	TVfr1CXBoX7mSXEoo/ywLkUt0tLfGCvE4mBBSP0QuRLI7i1inFP0MI+LH6L5yrPmaIJ
	KUFRFRKEGkf5lxSlLrIui3RTJz26vYBXWGJNhDfs=
Received: by mx.zohomail.com with SMTPS id 1774475203960542.272431314822;
	Wed, 25 Mar 2026 14:46:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 17:46:41 -0400
Message-Id: <DHC6YLUN5PC9.2ZFFTKEOMHZGI@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3] docs: allow long unbroken headings to wrap and
 prevent overflow
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260323153024.32317-1-rito@ritovision.com>
 <87h5q3g288.fsf@trenco.lwn.net> <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
In-Reply-To: <DHC6NJM3JZJC.3EIT3YD7O8CDW@ritovision.com>
X-ZohoMailClient: External

Also, did you test both pages in the patchlog example?

For me on desktop Chrome, this one overflows a lot with just the
outer window width at its minimum:
https://docs.kernel.org/6.15/userspace-api/gpio/gpio-v2-line-get-values-ioc=
tl.html

And for the other one, it's more clear on a mobile device / DevTools
resizing. This part wraps down `/sys/firmware/acpi/platform_profile`
but then that part itself as an unbroken string doesn't wrap any further
and exceeds mobile screen viewport width causing page-wide overflow:
https://docs.kernel.org/6.15/userspace-api/sysfs-platform_profile.html

I can host some screenshots if that would be helpful. Let me know.

Rito
