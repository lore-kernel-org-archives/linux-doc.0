Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620356;
	b=TcQtXIWYLN6yr6bCEwLD9xou0rTJolGStUfGsRsjvZYtZKewSjRnxW/wjfb/kLBzDzVs
	 sge1yPkz5QgT3TdLT/+lCeaTPK60sU2Vxx6Ec/pa0bNWRWKIUFpEAGm6ecwA11V3oDyRx
	 KPvZ2+4ut9UMkLQV++DIUp29VoE/Q3ZzHJZKBBE3FM29KtdY8bbx6vho/n8SzIudsVYfM
	 BX79odkwbKYOOCdn44Q+K7H0gP6YCXBj/32b0EuSbotbZQrdGiSxqX5AuHXpMnJSBfySL
	 hMNAZ11PMoi1BJcoaqd2wimtRND7x3DBvssWBhrpm8f7DilZvNuiPkak4brkxflWkPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620356;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=JuiFzg0AsuPaU2C/K6V3PlAbkJG/chJ9lFUKLU/ZD68=;
	b=vmH89zjnkq1VxQ32JlRFFcYuOAATPmmQLNPfAPwhP/MtcAkORUomHiswZQ25u/Itj1A5
	 efJxP7qaw4/kJOPB17OZRtZcr1KU8USCrGxMyo6HgPhM31CjsYR9Pqzl0y9tYsvdZQUvX
	 u4aOnjYcGsBcH1anAnkwTIva0YAM/IxHM4iyblSD1A7UHlCSoZSWK7//eYS+qtLJkDP8h
	 DmDFzDdt3kJWMrYFfqEH86mouBYcHF6H6ImBxJgNgp3GbJeVIq+YvqodDlTj8eFJ0n2Kb
	 lZK4qHAzSgIELe98WT20WONUTWnT0bLVoxss9mEPbN4Rr7KNwLcf4U3Y04yYosFcjZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=M6cwfCnT;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A9606A31E;
	Wed, 25 Nov 2026 15:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=M6cwfCnT
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 85285410D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795620356; bh=JuiFzg0AsuPaU2C/K6V3PlAbkJG/chJ9lFUKLU/ZD68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M6cwfCnT5jW8b6mp6MVqK+/AmNUppc+h3m/N3Hr0AYYpSsvXqiU2/nckkjFoYtTDt
	 ESlDeunY6dVR78DASRTg0irgAE0gcDB0pEgfmLb34MDy99EOUPLyNpIe4QS3c3zcH9
	 YJGffe1IDU7/fkZx0UPw33sL+EDb1ATz5ghIEb98gVRP1Fphr+V1LkaOVbDH9Bkiwx
	 Yn8DS/tNPz2nxySW9qo/6lWotZXcN7XIRHi3l1O3k+Q1Ckk9pq6m0nvJ/L50h0GEg5
	 hk19+GA5jPb/0ZW6ouf0yDr5HD6tUrtrsQX1LRDKBNyzVDKn+Z5qQG1E0wMijeUunz
	 z+ilrB1Cf3zVQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 85285410D8;
	Wed, 25 Nov 2026 15:25:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Renzo Davoli
 <renzo@cs.unibo.it>, linux-um@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: UML: user_mode_linux_howto_v2: Fix bracket
In-Reply-To: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
References: <20261120175509.1369714-2-manuelebnerli@mailbox.org>
Date: Wed, 25 Nov 2026 08:25:44 -0700
Message-ID: <8733spyltz.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add missing ')'.
>
> CC: Renzo Davoli <renzo@cs.unibo.it>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
>  Correct position of closing bracket (Randy Dunlap)
>
> [v1]
>  https://lore.kernel.org/all/20260909140051.1365758-2-manuelebnerli@mailbox.org/
> ---
>  Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
