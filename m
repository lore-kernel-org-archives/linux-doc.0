Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DCA36657B;
	Sun, 22 Mar 2026 19:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206579; cv=pass; b=EOU5UcGi/tNSb5M2KzHaJnpyyyl1kUbGuA7pGRWp+/icHgZiDRLDHawArm5NL0yWN0uxZdsJIXf2DvrxPZZVLXVbAbCj5xbp/3wUY7rwU326jqqz9vXRCraSHbpfxwlP4GkvbIQ8AEWQ0iE7oecLt5zqy/jsBpTTCuPPJSce6GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206579; c=relaxed/simple;
	bh=8CmstHOqCikIVfv2H635OhQsIP78qkiSVriNtxRr5Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKbGXHfue7G00aBTJPu5lnfGejBDHxGqZfduGkpOhM8jzOA+fNmhxqj4tehIoi4bmcGFVEWw1TqumPjVvaJNbMReo/lfuxXpHBwgYTU23gCRHiU73VZG3NSRV8PgNTcQ2ghXM+yV5OAW1K/o8LuwfWKVPwNc4Zzp0wU3Oe7aFYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=H25569o+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="H25569o+"
ARC-Seal: i=1; a=rsa-sha256; t=1774206567; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UOeLS6CxBOgdOwJmmeRee4azv6UOLgRyBNIRFIotWFctueYYrZmxvvd2oYHXZTnnrRju46/T/S7ReRrm5+3OwUlwrBYjuxkMhkhlmRV8Wg4fXMbCE8i9e2faKhDtx/CmLCZpMN4Si6YRl6u/vHtH7SbZjWQWYT3QIMdNbr8FIpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774206567; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q4m97QkYl0JsXXOi/F0yG+0PO7L7lMioqjt+PREPlXk=; 
	b=i0D5U4bEsQu8ly4gKks2C8jA58u8OyDSU4jgZocrNOKR6BeeocjkArMvgYKm+fEt5mOqHq4dEMaaw8rrziz7o2kkJaYkAmG2ncg/5Hj2tr/X7pmNwunytbZxncssucug4z8jwsUAVoUec3Kn6BNmF3bWKB36n/onohaKontW7kU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774206567;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Q4m97QkYl0JsXXOi/F0yG+0PO7L7lMioqjt+PREPlXk=;
	b=H25569o+FbtKqjZY98cC4eoUiXctCw+kQVNyflOfT6NNBXznX7+4IrUgjUefuS3w
	qSxGizaTLKpYDVqUuNjbEWrTYl6O/7R+mxXz3mDQsv7ZHhrbpIQ2puTOw0yWVj9VBxC
	vOrmGCKXvtYCRKI+v/sVtkBbeyuBjhP9D0YvKOcs=
Received: by mx.zohomail.com with SMTPS id 1774206566419157.35078993599097;
	Sun, 22 Mar 2026 12:09:26 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 0/1] docs: examples of pages affected by heading overflow
Date: Sun, 22 Mar 2026 15:09:07 -0400
Message-ID: <20260322190908.60412-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321144855.30429-1-rito@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages on docs.kernel.org this patch improves:
  userspace-api/gpio/gpio-handle-set-line-values-ioctl.html
  userspace-api/gpio/gpio-v2-get-lineinfo-watch-ioctl.html
  userspace-api/gpio/gpio-handle-get-line-values-ioctl.html
  userspace-api/gpio/gpio-get-lineinfo-unwatch-ioctl.html
  userspace-api/gpio/gpio-v2-lineinfo-changed-read.html
  userspace-api/gpio/gpio-get-lineinfo-watch-ioctl.html
  userspace-api/gpio/gpio-v2-line-set-config-ioctl.html
  userspace-api/gpio/gpio-v2-line-get-values-ioctl.html
  userspace-api/sysfs-platform_profile.html

Rito Rhymes (1):
  docs: allow long unbroken headings to wrap and prevent overflow

 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.51.0
