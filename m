Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1B430CE3;
	Mon,  3 Aug 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780399; cv=none; b=XaKD4HeV8SW2eriAuMVOPxiCLs4JbZwTaBw9Nx8MNYfAz3hZ1vt5MAgRhjKQKYHwWDmvc6bh/0R5j7BJ6w305SjVcJzuk/u0yfo+7GDTuFtfFMJ4A5c1JAf54EO6J3b2AJdPgd6Om+/gYqVkWzk/+OVdfkYC6J6bFv0XDXdD+iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780399; c=relaxed/simple;
	bh=j1AvjghBV22JBOYtoNCx8AbYSVdN0Eu2qpwM4DxxgHA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YRzZ0ZXaXGSumYXKI2QaLnCl4fvVYPtl8tw/yHYAxtwKWgmhxmLwMvXEorPkbzScatsGbVVC7Oq+cM4AEexMXUlcsGLkT0nTZUrrh1X5xpNIgdEWaOjNkaZ9smuCh5yjKOixSDQDCJS5wt2e6tjmpLbiYvtGDJPLQGmQZWW0SK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qWfzsVwP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qWfzsVwP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5443E408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785780397; bh=09cj0Ad/jofMlAgd7EsfpNYU9c2PYlk/o2CchPWpfXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qWfzsVwPzunVJgSiykqD5AWbvX9v/TkCy3hmyVS/MFvoj4qkk2p3cc7bwlQkDv6ov
	 oxliZXax0FKD+5hvcEn6Pp04MiT08aV/yO9TEFSQ9evqH5QP8vENZV1ycLQKs+Qpqg
	 0uPuaMRYDutBGnCjI/TApFHLw6AA/TspxVjcg0GgdsVHVFiV3+vOUaAxDGBRPdkYSR
	 cec3GcOX8pdmFGM4Fh/8Iov9XZVWBwgutoW4SpbLlaqO+y1DH266LWkozbwx0dG7Z4
	 OdSbfcjcYeF3cfPpxWfZyikTkfJh17b/RcY9nlhLXUbEAujT8P5TaMPDHV/oBApGwf
	 mgnneKDqVe4zQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5443E408B2;
	Mon,  3 Aug 2026 18:06:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lukasz Tymoszczuk <lukastymo@gmail.com>, Corey Minyard <corey@minyard.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukasz Tymoszczuk <lukastymo@gmail.com>
Subject: Re: [PATCH] docs: ipmi: fix word order in create-user description
In-Reply-To: <20260801111804.3593320-1-lukastymo@gmail.com>
References: <20260801111804.3593320-1-lukastymo@gmail.com>
Date: Mon, 03 Aug 2026 12:06:36 -0600
Message-ID: <87se4vyt77.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Lukasz Tymoszczuk <lukastymo@gmail.com> writes:

> Correct "allows to you" to "allows you to".
>
> Signed-off-by: Lukasz Tymoszczuk <lukastymo@gmail.com>
> ---
>  Documentation/driver-api/ipmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
> index d08cee98e34a..062c38d93fbb 100644
> --- a/Documentation/driver-api/ipmi.rst
> +++ b/Documentation/driver-api/ipmi.rst
> @@ -280,7 +280,7 @@ Creating the User
>  To use the message handler, you must first create a user using
>  ipmi_create_user.  The interface number specifies which SMI you want
>  to connect to, and you must supply callback functions to be called
> -when data comes in.  This also allows to you pass in a piece of data,
> +when data comes in.  This also allows you to pass in a piece of data,
>  the handler_data, that will be passed back to you on all calls.

Applied, thanks.

jon
