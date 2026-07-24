Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20B380FD1;
	Fri, 24 Jul 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900094; cv=none; b=j7Y1bh8cPM35CL56nmBrPSiCpe1HAvH72pyHP8bALizQOqdzxNPceq1y7SYPJuAPX5WEaY2AftDdrckYEkI8+sAqiPWez5Lm8EmiHErGxDoORSQmYSuOXS3P10jkRXxcqEqhrDjvRwc5I2OvEmjCaMMJP7PkxPu6Z1tjjKvGdkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900094; c=relaxed/simple;
	bh=K78zStdjoZfgnsM8z8WrXqrK2+zel3PjcH84dp4yvF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VmOuv7E4PiAkIqexCemfAM+VSBgR+YN2yaKc26etXym+e2OG8JgFLHfGD85UPg+VJ4odEdk3Jc6ZSU4039dTGfCITlUdcEYn3+aeejhyaQRAVHX9+DUJbM/L3xx/DZJ4c8pN9paRsFtGqPcZ1tV/fqRKuGQMymPA/kNgPMvHRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=f23Xxmls; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="f23Xxmls"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7FA15408B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784900085; bh=BJgmr6QmlHdfXWm/7lnY9H6vOdYVuN3tI+PERyXoeIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f23XxmlsWKQrL3BU0U3T5dH1T1AZEZXSb8X9Iu2/54NqJVo3jDbcvgLRol72lLa9m
	 suNzQG5kbo9zmiKuOVQQMPz9Q9nV4cAEmuvds41AFhDhd+W1mDfpeBfScee8mPEV4O
	 ZF45K/+mzaXXGV5DOocXdx9ys9ySgWyP7cJdvBy5L5ImV20RlphevdqdtB9ymzr12x
	 rSBqhhokW4nSy1odzGQe+Tllpo2wgC/nVO1mK0tDf2rqwXLCgOYIMg0Kb8iwqb+6I6
	 qMwZd5NmRB6Ev8F0eCRJ2AyrTbGFSHHIZZ704iArrRtvf/5anO5tyee9BV+CDZuB5J
	 YTkf1UNbdZ/eQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7FA15408B5;
	Fri, 24 Jul 2026 13:34:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Schier
 <nicolas@fjasle.eu>
Subject: Re: [PATCH 0/2] Documentation: Add my name to the Kernel Statements
In-Reply-To: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
References: <20260724-sign-kernel-statements-v1-0-52131fb5affb@fjasle.eu>
Date: Fri, 24 Jul 2026 07:34:44 -0600
Message-ID: <87cxwc8qa3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Schier <nicolas@fjasle.eu> writes:

> Recently, I stumbled over the Kernel Driver Statement and the
> Linux Kernel License Enforcement Statement and wondered why I
> never before had seen them.  They express strong convictions,
> which I do share and support, in clear words.  I gladly sign
> both statements.
>
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
> Nicolas Schier (2):
>       Documentation: Add my name to the Kernel Driver Statement
>       Documentation: Add my name to the Kernel Enforcement Statement
>
>  Documentation/process/kernel-driver-statement.rst      | 1 +
>  Documentation/process/kernel-enforcement-statement.rst | 1 +
>  2 files changed, 2 insertions(+)

These files have been static for the better part of a decade, and have
made their point.  I'd really rather not start adding names to them
again now...

Thanks,

jon
