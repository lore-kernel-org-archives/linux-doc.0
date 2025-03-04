Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80D718952C
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 02:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741055387; cv=none; b=gVpMLyhf0PYfSOzazAvCTLjv/3ArOWYuQqxWmix8w1vchJg6NGR67nqEDPPLbz1dFNPAkLlRsPZEPfcbKDPGD/HSlSbt0fwo3aLL5/9DohazvE2AV5+YjIj+qrdZZjWo2GKV5LjWK569bhfcANB9HoPlAFppqnWSCp5dqf5ZMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741055387; c=relaxed/simple;
	bh=r2yN+8zgPj8ce2ESsjTJxI+hdnbHUmMH2/mHlC7Nazg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZjOgnKKYnC3ORlAjWWkHg3msHpwGDum1tY5lDsO64yqLZO2TpYlrfOKjGlelgksg/gn9oBQtEMgKDxIQMPoWY+0Oy4UdBObnFnbbulPWwkknnkz3jbjbAc4omz9SE9opJOrwYNsjVysmWWxFZRGq7eayDiibJWcpksBfEyiIlPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B5UX2cd2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B5UX2cd2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=r2yN+8zgPj8ce2ESsjTJxI+hdnbHUmMH2/mHlC7Nazg=; b=B5UX2cd2UOQ674nEM8v45sLKIR
	PyZHSwcvR4ZBJ/EkS/OC7AuKLBSNpHzVJ4yK2eaCfJEN+tFSlupkhcgFuTwe+k5HMUaHYkjIkLWkI
	pVMEECMM1OWqz1Ld37NHSY30qAIvAziNy511PjIH/SlwvUVTr+x+04/EFaLd15EW8jwnEY7OywR13
	DA9d1ZqHhGgBR31mBS2cslCSvW8sFCbdzazGN7pASXxrA/iYFWI01qn7rvbb1esENi+YEZ9G/ngfU
	6AJtlAaMnccZ3CsIJDAbuZi5WbKZwNAyhxYEsU3bXulgGKXpRdn5poPZuqhCXQkdOuGd9NWRB8gti
	iDWfupAQ==;
Received: from [129.95.238.77] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tpI2P-000000003y3-0xKI;
	Tue, 04 Mar 2025 02:29:41 +0000
Date: Mon, 03 Mar 2025 18:29:37 -0800
From: Randy Dunlap <rdunlap@infradead.org>
To: Joshua Rose <joshuarose@gmx.com>, linux@leemhuis.info
CC: linux-doc@vger.kernel.org
Subject: Re: Grammar issue(s) in documentation
User-Agent: K-9 Mail for Android
In-Reply-To: <Z8Y-FHZ5tYBEMy4j@spinny>
References: <Z8Y-FHZ5tYBEMy4j@spinny>
Message-ID: <167C1584-20F2-4CB9-A5F7-F88409883199@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 3, 2025 3:41:08 PM PST, Joshua Rose <joshuarose@gmx=2Ecom> wrote:
>Hi all,
>

>
>
>As an additional note, I'm looking for any recommendations on a good
>resource on the maintenance of the Documentation/ directory=2E
>

Hi,
Please elaborate on this=2E I don't understand=2E

Thanks=2E



~Randy
