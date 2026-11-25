Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624281;
	b=El1YUlO826zvJ7M/kMrrXMTsrYl0+4c3ezAeFA34xsCzH/jEA8DUIzhimsQ32C0yUOwR
	 S/RcOyTHi2f3HAV2fZyOrmmtKmjUscEHkIeypoEvcfdY/rUtDXnBrkBocUgLcWJOasBQl
	 426g8ml5+eEKUPjC7kUE7vc/l2gR5homqQc4tTUOtho/jUJdmazEK4qOruoWD6RcSQcW0
	 UZmOcooSP+IQQRWyInn+mWqeekBpjoZ39EGhXoZARzQ8Bm6IIZ4mzFj5pJ/+Cs5r1uCPm
	 ZT6TDrG84HF+ytqK/HRP3G8dymze/dIxOaYleatUcWclHkQmArpzKbyeHBSCSpVndhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624281;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HzVOdmpjVHxw6KVaXMsBuZaSQgfC5jlhUTcBLoibvJ4=;
	b=j5hspmptAq4R5wLlZGr0l+nwD8vJPeJ1M2V95tJltXwFNjQRlpNIvV+NDKuIz9lL+eCI
	 c9xo8evuv18DiACVA5uLwgbdzot/j3ijXpGnFSfISfSG4oGp1/EYxJEKs+cxDhrovb5ts
	 K2uKt4AAZ0N05gty25wmYuQAcxD4JAwsIXTbiwcfScGYJAPBdCYzgoDGyHol4YEFF4sed
	 JBESY8Ah+b++V34tIEWz4WbnU+AH3e8FjEz78ZQ4xM/SzQEZfWsieMnK3b+stqvu2+V0f
	 QVaoXpbmTwL24Slzig/N0GDJ1cwKYhGt+QEdeHwNb5IRZxdL3YqiZdL4b93pXd2xW5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QxKyvOc+;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7D606A6A3;
	Wed, 25 Nov 2026 16:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B7D606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=QxKyvOc+
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4A81410D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795624278; bh=HzVOdmpjVHxw6KVaXMsBuZaSQgfC5jlhUTcBLoibvJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QxKyvOc+PtW4Gn0sFIWwHTyJzqEKj5V75mTYjS8y/T9jiW0tRj2F5yVsEm1n6k2DI
	 uizK+xkgug3EYJH0gXO00rEPuJpzYr91h3mZmxT9RgrOCvD6yEiHbXu17uNzi+RbXe
	 72RvdezyBCC7QEPoCYQrnEKz5nXZQG6wBRCtDNo3SNVXJQ7f+s2em5v1TMW9uCVxwN
	 JMKck0acUeuj2LgDhbgTbU/hlHlEH/OeGroHoTrlIYlqP3jeT2TTOrlvnzl1qd103E
	 K8A3pAckLHXsr8q6dNJAeLUgnCpL5GSXXQdXdI5yty2K0c+lF8lQSJRA2zvZuIeNRU
	 b2JB5nkKJOBgA==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B4A81410D0;
	Wed, 25 Nov 2026 16:31:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst (patch
 format)
In-Reply-To: <20261113024405.871312-1-weibu@redadmin.org>
References: <20261106225619.12869-1-weibu@redadmin.org>
 <20261113024405.871312-1-weibu@redadmin.org>
Date: Wed, 25 Nov 2026 09:31:09 -0700
Message-ID: <87mrqwx48i.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the sections describing permission requirements for
> adding tags, the canonical patch format, and subject line
> conventions into Japanese.
>
> Update existing cross-references to point to the newly
> translated section.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v2:
> - Reword the explanation of subject line sorting as suggested
>   by Akira Yokosawa.
> - Translate "global" as "=E5=A4=A7=E5=9F=9F=E7=9A=84" instead of "=E4=B8=
=96=E7=95=8C=E7=9A=84".
>
>  .../ja_JP/process/submitting-patches.rst      | 108 ++++++++++++++++--
>  1 file changed, 100 insertions(+), 8 deletions(-)

Applied, thanks.

jon
