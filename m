Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2223B7A8;
	Sun, 22 Mar 2026 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204344; cv=pass; b=XQPm2h8JylY4PoA3jMMh7q81ixs2cwuN0xXpff3TLeD+OfowEG3y+BeQfJ641lZV+LPstkbsO1ZNoWIz9ASlyDRhxY5YIhtC2Hkkv3I2b0Az2neyXz8L/pV8k5O1GQUtR6GEfmb/TtufegaZgWo1HsONX2TUWHOkm+1T6CBaLYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204344; c=relaxed/simple;
	bh=7C7GFJJjkYtiWQFiUuK/Siw6KSenPOWY8mTOYMVJERI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDKEDQugLokKVBbH03m3aXRlL5MD9gELOsIBOfhZv7G+01+bwkD6+erlsZbQa+TBG3adNW4SBsvZpKp0/YEhf8HSThqHoOaXmwUvufeolNRKtEsmVKAzT2s0MBoXy2C2XjkB/fhJccuOaI93GnnJWH+R08CwcyaKD8196Tdf5TM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=GaU2DOOQ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="GaU2DOOQ"
ARC-Seal: i=1; a=rsa-sha256; t=1774204340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BdNcFkfmAquGrZOorQLgiI7AYoktsfoae6SSGTAXl/WITNkuGOGQNDCMwIg14yXKqe50d9tglwdbumWN6cbYRbEn5BjXgRwSzp4v94jQIdSzmcdab/q3RIcYE9yXFnbH/vxedzouWDxwLqx1NkZQEbv/FRH776pAQkJMfkS9JaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774204340; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tAFzpW7ocYPC0WMxoXJDGfOHtbVDEuv7XoX8QxZ7vA8=; 
	b=ao9WiwGj8wXYTVqrqvGmwzT67K3HSpmoFeMvAqvsWDEtxYRM0d/9rW9JBMa+nl6DrSb+5hEGKr4V9UJA/frAbYbzzrPysTmirsgNpAQJpS1asugUaYNBaAXz/uG+mEwIKfBYPAe7Lzp+cZBohcmnqxp+Y+YT9WRlVAQBf6dWpys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774204340;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tAFzpW7ocYPC0WMxoXJDGfOHtbVDEuv7XoX8QxZ7vA8=;
	b=GaU2DOOQIzJiEQoxphGUsFvF0/LENpqnOqa723uQEVcfx77j7xh0o/w2m65jzJ9o
	2tbXzBiJh5e1zonuq8rfv49ELEUDWmu4lcOwgy/E9qd3bGpGvNbWPq2wLOfMUFlR62U
	nT8eS7xMNuqKwIfBY2ToQ1sQ+gpozPl5n+w2LDPs=
Received: by mx.zohomail.com with SMTPS id 1774204337074597.4536447497824;
	Sun, 22 Mar 2026 11:32:17 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 0/1] docs: examples of pages affected by inline literal overflow
Date: Sun, 22 Mar 2026 14:32:12 -0400
Message-ID: <20260322183213.52235-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321141118.23828-1-rito@ritovision.com>
References: <20260321141118.23828-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages on docs.kernel.org this patch improves:
  userspace-api/futex2.html
  userspace-api/seccomp_filter.html
  hid/intel-ish-hid.html
  hid/hid-bpf.html
  userspace-api/media/v4l/ext-ctrls-codec.html
  core-api/dma-api-howto.html
  security/IMA-templates.html
  virt/kvm/arm/hypercalls.html
  hwmon/hp-wmi-sensors.html
  bpf/map_devmap.html

Rito Rhymes (1):
  docs: allow inline literals in paragraphs to wrap to prevent overflow

 Documentation/sphinx-static/custom.css | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.51.0
