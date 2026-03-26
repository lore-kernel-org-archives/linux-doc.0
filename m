Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F23A8726
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560335; cv=none; b=jmuvkMHlqzdq9ozZwZiuyeGzH5m3uZ6guhwOpohFSJf6QRGZWgh8mQzXyjyZ61IAW5WzsOniff8NXc7+54n1t0ENDtrWeFQEeOqe42mHG5Kvh5Gj2Tb96TVPXqKuTt61l3wONwPHP+2WaPZDLmosVuZpeLrjcMQ/AYOfuOf3tyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560335; c=relaxed/simple;
	bh=lUQ7U8VJ/rlQHorgZU+GXUXjuVr+UBXICgrCGqgyAoo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZBgMUJtqgqAXQ13f/3r/a9SrFbwpGwo6LlvXm2GvVcP6vAzOC/r5lXWO2OcMrkfqLeXjB0rhP0qSdN6nQfAcoNFIXf1/NT8WlTm2l1ARxkkrZ+/X6xTjDYtWTsGCAv2kWwRaHh0tQ9ijI/+s0+7FyTTkKT4G/Gnlgk9iXhw2ir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Md/wQu5l; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Md/wQu5l"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48531e6012bso17517445e9.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560332; x=1775165132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug/Aikg8oXAqlbbl6AzYUeKxZkIdPz7Q+TVSZpI0rDA=;
        b=Md/wQu5lBGLdZR4ug5+jWwene+rcsKJ5H0kAQuUNr64d5qGj2BYd08QH/4wYRbQZjh
         C5EuOjzrCA7SzeY3Ec3fCq0118NbHSBeeQCB5Ojq700gXOlYJaUb3jud09W3tS+NMa/t
         qp2CgKfGVm76ii3CWTSkNTOvEulWUbXTNuTQSPJ/u0Nwp6EjHhomLqlKTuHjz7NJLlng
         2GkM4xK5twfnNCsWyEP12q7gYRSMJAigPaJ5zoLbKfZeOnRjWOx/RwPflOfplMGX9HRH
         9W729f3dEW0LPIgefyN42KntPMUq/rqJMNOqHmBQcSz0/AB/jSMJvrt9PbwiWA5ocxxs
         2h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560332; x=1775165132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug/Aikg8oXAqlbbl6AzYUeKxZkIdPz7Q+TVSZpI0rDA=;
        b=l9CO9f0815keSfR9pZAjtXTivYKzL5S8wo8CoZoZ1OlLhwsSQ4WbEJRqiqm1xV4rWO
         Kb4JQk7Ew7yf+VzzETQJXy6tGxo8aiRN0dY06BTxsjn+9u8sDS/EDXL5BPJz6Fr+0x1R
         ShwtjouOIWOog2Uoszyn1sZVPNiEHp7QMfYntgmALYaydSeo9X8cBxgCNh1D/slY+lih
         k1EaumDoB3LkgvNyRxPVqbPr8TpLjF91i7S5v4TVvJOKlUmu8UdB30O36h9e6we5eJmt
         EFDS9vi6514eGKATz4EoEcaJagBffXSWKWtCBt8QTUdsztj1Zo1X52LR+bO6LI/God6j
         8Ojg==
X-Forwarded-Encrypted: i=1; AJvYcCXD3zioYkf2+YFPujqPhrbvy0zezsLMVgmYWxhGxcxDaNbfENRuCp8kwKRulAAFuFGZ1rmGngl30tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2K6Hjue/u90lFc9OaiInaNWcS86FtbK+Mbvd06FoxYLftH8eF
	Z7uj2ECOOZsd4301qLWIpRIiJOBoflIBhQKD9AU/M9ii+zGUBzBqJY4CUZsdlIRnAN+QngAZ4EI
	hcYdmfmHA8WbQGoGm8Q==
X-Received: from wmsk8-n2.prod.google.com ([2002:a05:600d:8488:20b0:483:6cc0:9daf])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1e:b0:486:fc95:1a91 with SMTP id 5b1f17b1804b1-48727f2373dmr3081075e9.12.1774560332192;
 Thu, 26 Mar 2026 14:25:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:08 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-7-fa0796fe88d9@google.com>
Subject: [PATCH v5 7/7] documentation: remove references to *_gpl sections
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"

*_gpl sections are no longer present in the kernel binary.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 Documentation/kbuild/modules.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..b3a26a36ee17 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,12 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
-	using a format similar to the string table used for ELF. If
-	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	Exported symbols have information stored in the __ksymtab and
+	__kflagstab sections. Symbol names and namespaces are stored in
+	__ksymtab_strings section, using a format similar to the string
+	table used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs
+	corresponding to exported symbols will be added to the
+	__kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and

-- 
2.53.0.1018.g2bb0e51243-goog

