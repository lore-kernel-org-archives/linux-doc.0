Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB123A4537;
	Sat,  4 Apr 2026 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775290436; cv=pass; b=S+Qt3uf8iOZa+KnMtdrFZl3al/peTb+pe0jK6fswJdpRvkI6x2bfoM241vVoWqpO4mdVtlTYdGIEOldjdaYWG28RvoD5EJFTsocWgh+WWrWsIZWsR3TUJQKhp+nKPnRYV17I8GNi1AQEjFBTOM8buy9ZqKWtv7cvTcpz3jVxXWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775290436; c=relaxed/simple;
	bh=udKkH6QPVpJknoZVYE+0kn8vKKiQfrelqiZOgNk/iAI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=dXEAk/63trCJifj/7TCHei3XNx28/RfgJFzKvQK5Y8zG5eFETp3FfT2Bm009nTYUAXdDALnyu5bDyEodJ/xHaLkDmGN4w/hplawqr3zinsfjJRfLDF7+639bFJSulr22waRvMPUiS0ICYJj6cND6F3gUoAqeyAoSp9ieGkef5ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Pt3j20lO; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Pt3j20lO"
ARC-Seal: i=1; a=rsa-sha256; t=1775290424; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e6FZs0VTTcXYsu4bQSmFoUEA8GMGjF1c5tB8auVBEIzC7MV/hjjhriJQnYsD8Er8SMnUQD6iPPXQabC7+fxPo9MKfYPuLA6Pv00et5PbXB3hwkorHhujobT0FWNUA4PjyrnGCgvwKzTvUQV/SuQnOKL48B2MJW3pdrrsmQE+sBo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775290424; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=udKkH6QPVpJknoZVYE+0kn8vKKiQfrelqiZOgNk/iAI=; 
	b=N0NoAnrtzshVeJPxJtAgqfS+P/cZLaDA6a5JM84WxeHzWT+qCHjGqMoRJmiEBHNyfIdcVLRXbgT9Et79O9LHNd4DB0v1ieRxvSc0FzzcK4vRsxbjYRZVQWb12jINEDLmSENS/DvV/k0bkaCJkVn/IRZvzzAn6b+yMX7dBtp1j7A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775290424;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:From:From:To:To:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=udKkH6QPVpJknoZVYE+0kn8vKKiQfrelqiZOgNk/iAI=;
	b=Pt3j20lOpGL90I5yUUug4aVYFlH1PGW0N+J6MR6DOrFSNbKW03/NzT1tK89elBjl
	1NWlZfdYjB+Lj8OEP3KGbW9LTPO6bc5QA4anVItpMJyIoJHCURo7AFNpQywk3hUngBN
	SeggfT9OlEiqlboujNbyGlaiaIENijfgq6Ml4J8w=
Received: by mx.zohomail.com with SMTPS id 1775290420678671.4533489626544;
	Sat, 4 Apr 2026 01:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 04:13:38 -0400
Message-Id: <DHK7XJCWPZI0.1S05J3RRRA3NR@ritovision.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-kernel@vger.kernel.org>, <rdunlap@infradead.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3] docs: wrap generated tables to contain small-screen
 overflow
X-Mailer: aerc 0.21.0
References: <20260321133811.17854-1-rito@ritovision.com>
 <20260323153723.34735-1-rito@ritovision.com>
 <87mrzvg2qx.fsf@trenco.lwn.net> <DHCD6BWJTLTB.VJWKPRWC2GHZ@ritovision.com>
In-Reply-To: <DHCD6BWJTLTB.VJWKPRWC2GHZ@ritovision.com>
X-ZohoMailClient: External

Jon,

Following up on this point:

> So this CSS perhaps makes sense, but.. But why do you need to inject
> another <div>, creating a whole new extension to do so, rather than
> just applying the CSS directly to the <table> elements? I just gave
> that a try, and it would appear to work just fine.

In my previous reply I outlined the regressions I saw when applying the
CSS directly to the `<table>` elements, and why that led me to the
wrapper-based approach instead.

Given the regressions and rationale I already outlined, is the
wrapper-based approach acceptable?

Thanks,
Rito
