Received: from sender4-of-o52.zoho.com (sender4-of-o52.zoho.com [136.143.188.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6A304BB3
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 04:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769401440; cv=pass; b=n+jOjPq1UIM797GugueUBDmTfsOzBNZcVmRIYJsnPFq3k2IIdB7UXpdJIUyF99zKRLvioiQXa1icap+y+CaU7w5r71zKnOT7C6q3fqklV23J+Bn/ay6i6ujeufqrvAvBSGF832YN1FxCJpLhuc2qAjphkGrSRtHbwbITx7nkXxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769401440; c=relaxed/simple;
	bh=eXrb/4dlOsUzXI5mm1ZBd+ki8U7HV5k3hAFX5PdYHds=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=dxr0IKNjOOhGo1iT5AIVsCJZWeIh4w8z3AkSw8z6mVV1vRvX8JfVzBRXIfrnKlVQo6nXD4c+lYyJoTwNu559tGGlX6fqoy74jDcG8bDhEqT/kAG0GqXQqA+q30a2PIBnPKg8XXw156D7/Hr11VCE7bYXom5kbOBT9H9E3Qg/nfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=localizethedocs.org; spf=pass smtp.mailfrom=localizethedocs.org; dkim=pass (1024-bit key) header.d=localizethedocs.org header.i=hwhsu1231@localizethedocs.org header.b=j2vwPIN+; arc=pass smtp.client-ip=136.143.188.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=localizethedocs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=localizethedocs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=localizethedocs.org header.i=hwhsu1231@localizethedocs.org header.b="j2vwPIN+"
ARC-Seal: i=1; a=rsa-sha256; t=1769401437; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XwvrjElLUpux83hW2j9sG1PdjDFVst8piNB3QuoDHLyLQXxhy5D7lgLa3KJkYo71vqKdfoY+qb6gKR0+vo/RGQvZQcnYQDZxRNlMfLWB1Vin2VYdAD7jqGyYuC4m/cm3r2ozvouM/t6KNqbLl1yS7ru0WpB67kUDZ35CWTOOKoc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769401437; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=eXrb/4dlOsUzXI5mm1ZBd+ki8U7HV5k3hAFX5PdYHds=; 
	b=Rpkj9WE/HjQer1pM4cOf89Z+T911jYiN83lPPfIPZJES9nw9/mPzM7CgC7sLfEKHR+irLE649iw/Yf5hFYAD3G6k8yvZrHKsH66gABtGzo5eYI5RzvfhvMOj285f9ANv2HswX49RKsL8JeICLqoxYVXEkFkK7IvN1LtTz+O6/pg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=localizethedocs.org;
	spf=pass  smtp.mailfrom=hwhsu1231@localizethedocs.org;
	dmarc=pass header.from=<hwhsu1231@localizethedocs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769401437;
	s=zmail; d=localizethedocs.org; i=hwhsu1231@localizethedocs.org;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=eXrb/4dlOsUzXI5mm1ZBd+ki8U7HV5k3hAFX5PdYHds=;
	b=j2vwPIN+bYTBDqe7HcG8Y4A39668RVM5DTm5l2TOaxHQOYbmDUMfH/LM7TWiIlL9
	xgEVkgU12GE1oMAoFedlsavBVy/uq+KVWlF51C2Js2ntRNyr5lla97Y7YnOZeejaRjG
	KmuH1dFkD+P7CpfkQXEg+b6nPfyH7gRRbIOr/R5U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1769401436911588.5161727700752; Sun, 25 Jan 2026 20:23:56 -0800 (PST)
Date: Mon, 26 Jan 2026 12:23:56 +0800
From: Haowei Hsu <hwhsu1231@localizethedocs.org>
To: "Linux Kernel Documentation" <linux-doc@vger.kernel.org>
Message-ID: <19bf88b4ae1.1e3c4829279812.3907796406023498095@localizethedocs.org>
In-Reply-To: 
Subject: Localization of Linux Kernel Documentation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello, Linux Kernel Documentation Team,

I am the author of the Localize The Docs organization on GitHub. I would li=
ke to introduce one of our localization projects closely related to the Lin=
ux Kernel Documentation, =F0=9F=8E=89 linux-docs-l10n =F0=9F=8E=89:

=F0=9F=9A=80 Preview: https://projects.localizethedocs.org/linux-docs-l10n
=F0=9F=8C=90 Crowdin: https://localizethedocs.crowdin.com/linux-docs-l10n
=F0=9F=90=99 GitHub: https://github.com/localizethedocs/linux-docs-l10n

The goal of this project is to translate the Linux Kernel Documentation [1]=
 into multiple languages. Translations are contributed via the Crowdin plat=
form, automatically synchronized with the GitHub repository, and can be pre=
viewed on GitHub Pages.

While the official Linux Kernel repository does maintain its own translated=
 documentation [2], the current approach involves maintaining translation c=
opies directly within the document tree. This makes it challenging to keep =
translated documents in sync with the original English content, resulting i=
n significant maintenance overhead.

To address this issue, the linux-docs-l10n project leverages the "Internati=
onalization with Gettext [3]" feature of Sphinx, integrated with the infras=
tructure provided by the Localize The Docs organization, to achieve automat=
ed updates for .pot files. Furthermore, these generated .pot files are uplo=
aded to the Crowdin [4] platform, making it easier for translators to parti=
cipate.

I believe this project can play a crucial role in maintaining translations =
of the Linux Kernel Documentation. We welcome volunteers interested in cont=
ributing translations to participate. If your target language is not yet av=
ailable, please apply by submitting an issue [5] to request a new language:

[1] https://docs.kernel.org/
[2] https://docs.kernel.org/translations/index.html
[3] https://www.sphinx-doc.org/en/master/usage/advanced/intl.html
[4] https://crowdin.com/
[5] https://github.com/localizethedocs/linux-docs-l10n/issues/new?template=
=3Dlanguage_request.yml

---
Haowei Hsu

