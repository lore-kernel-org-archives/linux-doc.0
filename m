Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC71288CA3;
	Thu, 26 Mar 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774484906; cv=pass; b=UCTcR0Ax9hAdfnENkgoR68thkJlejmbl7pmiY5CPUA8Vvhc2o3KhG8lYx725lrq/FbZ6rn57GzcxSVi4hJBX1U7QI+JZ24kc+AjChQ8AAkY2yIaopk8XKxQ/FR4wfHlfwcIGFR4sRT3cXYyaN/YCn096AVU2oyoVlp5RJW9P7m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774484906; c=relaxed/simple;
	bh=0bjIqJRljeVpcaCTJD+B7n43NY/mU9TL8tZzQEYfe1U=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=KMyyMuVeGdxvXTLf7Kt3+jfjKRYiAJ7FD1vcRTvkZU/9mJSxC/wRNQSjk8s6vwLiOBZmQtXYWXMIVXQidfbC4paB3ROuoN9J+ll5o8oov+MUVaDfbuhw+F8NIsquG+tMlG3XQCxJFjpIpfbnc4KDilxH42h9yMEWlDWBxF06c+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=jgPLNKfe; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="jgPLNKfe"
ARC-Seal: i=1; a=rsa-sha256; t=1774484898; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Awvesuv2WJitf8spLRTcqvzUC3iXJU6l+9jeTuSKOxiEEytA78Ai7VtILYo/AyM4HW36tC0nCmZUKyVe7fQNVpvOqBSM4VUgQzJo0gyDgu8JabtuNKepGfkWfiXLGp7AH/go5UD41G3jQBYsvArH3OJgmRtunwuVFTNMrLMYAZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774484898; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0bjIqJRljeVpcaCTJD+B7n43NY/mU9TL8tZzQEYfe1U=; 
	b=NUa3zhd6t21dYLowhVfCo7BQhxM0+pyW2/b+HmDCYM81UfHZN6ZI2jZgwcREqH0ZSCEkkoiDskOR2D4dfkTmTQVmKjurrr0u0qC+yNwynby5F1mt3SqjWO5tPgVvw3w1XqW+7kW9s9SyhUJJ5Wuc7c5dDfgf9pDV9M+gNdRL2gg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774484898;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Subject:Subject:Cc:Cc:References:In-Reply-To:Reply-To;
	bh=0bjIqJRljeVpcaCTJD+B7n43NY/mU9TL8tZzQEYfe1U=;
	b=jgPLNKfez+cagSvu7f69UgZ1S9swOk3jNJyGOg9Ctp/SpJMWnvG87hBaM8GqGQvo
	P5ruV2yyiFLtnaS5K6HBAYnooSZnLI4S2KrAAnKkvgr6NOe8f0Q87R4y8Ujw9X/7xu8
	JfRitJhtRw/4VW1zEJDjcvWG7h9/lnndetnN29cQ=
Received: by mx.zohomail.com with SMTPS id 1774484896413930.6068526596816;
	Wed, 25 Mar 2026 17:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 20:28:13 -0400
Message-Id: <DHCAEAFI1J0N.KA5JCQIP7BWS@ritovision.com>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Rito Rhymes" <rito@ritovision.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] docs: rework footer with semantic markup and
 responsive layout
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260322182251.49484-1-rito@ritovision.com>
 <877bqzg146.fsf@trenco.lwn.net> <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
 <87bjgbecgw.fsf@trenco.lwn.net>
In-Reply-To: <87bjgbecgw.fsf@trenco.lwn.net>
X-ZohoMailClient: External

> We are not going to fix Sphinx accessibility piecemeal in this
> way. If that is really the objective, I think the right thing
> is to work with the Sphinx project directly and come up with a
> proper plan for all of their major elements. Tweaking the
> footer - the contents of which will be read by the screen
> reader and understood just fine - doesn't really address that
> problem.

I see where you're coming from.
In that case, I can reroll this as a CSS-only override for the mobile
rendering issue and drop the markup change.

I agree that the semantic footer question is better handled upstream in
Sphinx rather than piecemeal here.

If that direction works for you, I'll send a reroll accordingly.

Rito
