Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1639275B1A;
	Mon, 30 Mar 2026 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886640; cv=none; b=taDjw8DXZwpBQYiOzIQsbPsXoESSD1uBfC9imylPPfK5n72q4z1yqUfd89dmXnM3ziIcAdb4U/4na/B7+1AVsCn5qgGQ3UswNmG/UeRutHI8HdTfbZY9WmfwOw7YOD0WxgQ09nUVs5vTUG5PIzSP4zxk8ACZ6qPOfFuCkekwJdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886640; c=relaxed/simple;
	bh=BKltSALo45M8zuV5obOV1Ojx/H8jG1KoXLQ0eqe6RIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Bt83jRZzXyoBIJMVIPYdSjexOmBKmeVOFg4ZON/m7+yoypLacVkcSr+QqeYuaVoUxbl26AITcdnPUhDMfajTGJRox53gladXf0QNxreGuKJooSJHsm3FaYOSH4mc4S8SJKTnWbyXen0zP+CWa3Y1FwPGzjFzx2h28NO3E6TUt3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tdoYdive; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tdoYdive"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 17E5E411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774886639; bh=cvwQnpSCGBFdDGNhb4khyevWUZPc9fL6cD8iqgLmwAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tdoYdivebIrzY3lQBC5MH98gdOCD3D5vMnuQjRKvqG9ol2Tcm7TN8s5dCc9Eis7oe
	 lFWBxjsRgLzMp+RdrjLnE+O5VpGYcdkDjEFsslzkIchamIVZE3SvUyZRrjWJrNFEfT
	 MPj5fMtT5W26jpXdwr0SRDHxuCaHRf7o6XGINPhtPa8T5sePxlkMvWy8sAdFia5n9K
	 QZPRhmY2DqXJPKyWnXlUTZbv5C0zscU2H9CAfmTbRau4JWq25Oqi+8WFCLTOSymXIU
	 zWBJjtA4R0oG2ZwjmCz1mWO3cisL7Rg0RARhnfzzNMG2Zs+kLO2z2JPnpedgPk8vAO
	 TlO2lPf3KxeSw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 17E5E411C2;
	Mon, 30 Mar 2026 16:03:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] doc tools: better handle KBUILD_VERBOSE
In-Reply-To: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
References: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
Date: Mon, 30 Mar 2026 10:03:58 -0600
Message-ID: <87qzp1nw29.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> As reported by Jacob, there are troubles when KBUILD_VERBOSE is
> set at the environment.
>
> Fix it on both kernel-doc and sphinx-build-wrapper.
>
> Reported-by: Jacob Keller <jacob.e.keller@intel.com>
> Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/docs/sphinx-build-wrapper     | 7 ++++++-
>  tools/lib/python/kdoc/kdoc_files.py | 7 ++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)

Applied, thanks.

jon
