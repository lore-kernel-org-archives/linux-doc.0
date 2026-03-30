Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57F37AA77;
	Mon, 30 Mar 2026 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891237; cv=pass; b=eVdE8Jqfa/Kxr4ljWryQIjevtiBz0kpqQoUgi7bHdtKgg+wiNodxGF6pFVpfOE8Xzr6R/BL4X+RfwEomm0wANhbPBqg+d+yIB85zAYzb8/EYN9R2aEO3ICsXQqR7I7caR5Ssy7OUGDW/GHXCo1c+2v6MmQCoDkyB/TzLVAzjzZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891237; c=relaxed/simple;
	bh=b59w9YbATFoid4Ol+aFo8Ink2bW8Pu24Sw4pAsQO0dQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=JcEkx7Mnwn9tx2gXpmDprYrJ1gEaDg4yGJOjIuNsD54R8H0MmtdX18Ll/Za4Rd8JUKerFwqVrtvRAfbkD7/4/kOOitDXINhDJHTCCDDWFrNJGSGxE9dmn4igA3jDUN95CNojWfL8dedC4+AnlNMsvFwxTfOzM1aFt29qD4F8w5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=FAaeGGlR; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="FAaeGGlR"
ARC-Seal: i=1; a=rsa-sha256; t=1774891227; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T14cPD6JeLHIuZbIRHDFI+GYs8hydfnPY5WIjPfiA4cUwUrS3kr6QJjNQH+vfmnCECOdzxTk2BDqtTb3RBmfUnaVIpElPRzqwjAfTTV86MtQbKE7NFgh03+fBqXGWQkVoS7xWITYCMUv6G2TbQ9y+sUsEbhwNlShht1FRbXZeDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774891227; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gSMFOd8n1p7Qz1ovjKuwa9Q8D+qEoeZOriW9+tzynTQ=; 
	b=mw30pvHniSQtyIfQyFsEbA8uuzKe/Hdy15AducxbcQgJ+t+qD35O/fl4FQEnwErx7fBHWGZWywy+7CQsH7jpF4ZZcztTmxc0aI1mj0BSjOn1nbrWsPY7VSjocfZltPlOY7kH3cGocBWGtAb6vmq8bfn8danKJ6/Wj5jKFujoLcY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774891227;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=gSMFOd8n1p7Qz1ovjKuwa9Q8D+qEoeZOriW9+tzynTQ=;
	b=FAaeGGlR5zmKlPYv4q2gLiAEVpHuXHO6+xRp03MElb2NjWd5hzHWGBK3hQ0vKbQH
	087vTMiUX5+3jRS7cLNoove7E1SJAQU1fs4RD6mdvixRoRWaFJp4vbJOyRjv3nsRkeD
	LB3vs/YGTJqwEc1qwyr8M0b4l1n6yFcZu/FC+yqk=
Received: by mx.zohomail.com with SMTPS id 1774891224329346.59497136410596;
	Mon, 30 Mar 2026 10:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 13:20:21 -0400
Message-Id: <DHGAFEMKLESD.1ZBRRPMHZGG95@ritovision.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 <skhan@linuxfoundation.org>, <mchehab@kernel.org>
Subject: Re: [PATCH] docs: generate a static 404 page
X-Mailer: aerc 0.21.0
References: <20260329152047.5736-1-rito@ritovision.com>
 <20260329180448.24614-1-rito@ritovision.com>
 <87zf3pnwj7.fsf@trenco.lwn.net>
In-Reply-To: <87zf3pnwj7.fsf@trenco.lwn.net>
X-ZohoMailClient: External

> Who are your users, what is your use case?  Who do you think will do all
> of the setup work to create a server with a custom 404 page, but can't
> supply the page itself?

I see I framed this far too generically. My intent was narrower.

I mentioned nginx because I had looked at the live
docs.kernel.org deployment and saw that it uses nginx. The patch
is intended primarily for the canonical live documentation site.

My reasoning is that, on a public site of this size, users will
still sometimes arrive at missing URLs through stale indexed
links, old bookmarks, mistyped paths, truncated URLs, or references
from external sites. In that case, a documentation-native 404
gives them a way back into search, site navigation, and the
documentation root instead of leaving them on a generic orphaned
server error page.

The translated 404 handling also follows a live-site purpose.
When a user lands on a missing page under translated documentation,
it is more useful to keep the recovery path within that same language
section than to send them back to the English root.

Rito
