Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A925A2C6;
	Sat,  4 Apr 2026 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289915; cv=pass; b=uQwCUC/RG7nF8RSCNykD09RROt3+wUvVEWGWueuT/dYJULvehNwAggk/6OkGUfIIdbgLUIb2qWoTKRZE9iE+wgh0E35Y75LHNhoqWtuMcJP7LJYYJM6Ch8a6c9iU1yMUiHHw75qE1jy1nIsnAEdKkh9CkFZz5Cgo/09iWxG8yhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289915; c=relaxed/simple;
	bh=Ua+bqb4GedIGmXgIvzGJeWR3td58WLpXaf+9Z7GkwnY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=X7f6gj62+YnunJv0auhoGl1z+J7M0ueQeG4NcqHiJ/Y9FkhtfnIym8+4qaftQv4ZBbihX0fTnum3Avrn8qHjBdZekTxsVJX8oeuFIsqd9SeOSXQdksx+bxiFQ7cGCdVqQ5UDIJZbmqKPb9htVjY5Ai6l1OF6ZmWszv2JkGSdSD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Nbo/wqNo; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Nbo/wqNo"
ARC-Seal: i=1; a=rsa-sha256; t=1775289909; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZYGf8hb2/ulsihExdQ0JKdzmQqi/xGvDR6Ww//nNDbTpwQ0cOK84fubdl/eJdu3EWuyURF3QPunCSeryYdsryvpN61supamVN21WZW37e4nYDvFiLcNEt1dzMX5yI8lLhHLM7Pl1Jr2zw97u9e5kxDdkcfxVQ6fGq+oOJbvNkZw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775289909; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ua+bqb4GedIGmXgIvzGJeWR3td58WLpXaf+9Z7GkwnY=; 
	b=PetLavIuPZXfAgyMz0tIMPXNtslza+tvwQGCEUHyEsIGCn5g2Nzj39/SMXpgh8tuVIc73kINnFZsRpGREqa57OpLUGAH6MsfYDg3TrVgAyFKvh4Ej0ExSJMY/tOkaaNFKPCFP/Gfg8F7uK4at5fxXQ+umYnrTKtapy/vMbnA5KQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775289909;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=Ua+bqb4GedIGmXgIvzGJeWR3td58WLpXaf+9Z7GkwnY=;
	b=Nbo/wqNopS0n4fuVywPpy5ul5tGpthf7ZWzq3YHZgrjuBEYGVIffQJuUiZuNnCPA
	ocjMEV/GJrYFG1eWHpWWwskv7x0XmbMuFuyBTwH0UiMLrhpM2dTLF0Z/kzHEtqhC6x0
	DRG0TOIeDQpccMUG2khJiRGLUYsKBd78KltotpcU=
Received: by mx.zohomail.com with SMTPS id 177528990745169.31557488460885;
	Sat, 4 Apr 2026 01:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 04:05:05 -0400
Message-Id: <DHK7QZOXO958.3I956CZ2E1Y1T@ritovision.com>
Subject: Re: [PATCH] docs: set canonical base URL for HTML output
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321124907.8524-1-rito@ritovision.com>
 <87zf3zd2cs.fsf@trenco.lwn.net> <DHACYJK8P7RN.MUHEBN0UC0LK@ritovision.com>
 <87y0ji9zbz.fsf@trenco.lwn.net> <DHAED9XZZLVM.2GT0BOHIXJ7MA@ritovision.com>
In-Reply-To: <DHAED9XZZLVM.2GT0BOHIXJ7MA@ritovision.com>
X-ZohoMailClient: External

Jon,

Following up on this point:

> This sounds like perhaps an argument for lore.kernel.org to set this
> variable for its build; I think a reasonable case could be made for
> that. I think that the case for everybody else's build is rather
> weaker.

Do you accept my follow-up reply's rationale for hardcoding the
canonical URL into the docs sources, or would you prefer that I
instead pursue the approach of having lore.kernel.org set this
via a build-time variable?

If it is the latter, is the Tools mailing list the right place to
take that?

Thanks,
Rito
