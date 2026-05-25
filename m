Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4913C29D29F;
	Mon, 25 May 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740609; cv=none; b=aiU9cGjg8qeI2LCIOw9GGAMbrKTpoNjhD9TtpNh8JfF2F5KYR21gWBbMOflllHFq5pXwUIEgaJtXBlQGje4CBSmVsYgYAklxKqnrIaZv6J32IgPzjDKAXXwuFVSHN65LEdTPPE+EQTfY26LcXI+wfi/72d3CRBHvdmcn9lwkT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740609; c=relaxed/simple;
	bh=RA2AZKkKw0yEK5QDvME2ti8rM3Q0sIbT3OqJwwHNuzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EgLyR0w33wktPhEYNIdbXlldn3GNj82BXjNtcF5ZglSFk2nrrH9d7sndwm/9EOxSElNXSeCIGYLusSvnfaIrCV8b/loV5E5f2o4VcxQHHwCeCvHgLTB1MIFsD4kbaKxuk2Nsy6z5sJQcJTl5Z69KigDR8Bw2cQdyivDum+xQRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Z81ySdkr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Z81ySdkr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9DBE240B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740607; bh=9AsWKgEfmrIMxl67jBxbUxZhNMqcuPEASNuQqqNWJqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z81ySdkrf0RTwdSwvwBDD1jbD/kU2ycCIoSa4sxJzCcYPGzilYvtL668gEqAErju9
	 +6j+YQlASalQlzJMfCz4NZMkrsPNUR/MgzCaZa/+z5J+BurCvLwuLKfpqncW6OAZmZ
	 jfTddA8h8hwZrh39/jPeWqczMr/cfbDU3NzAi6mdk1QbkRDVqYOepU6VPLwj35Gzjp
	 G4ENFi2ajWjwnKDl73Jx9TRAXhCUEoPCtW1Thr0UMW4jw0ZfLohL8+L23pF4kKgM2U
	 I/w7rTukgOprMvffVdD7zf7EwafEEP4NivpBA2O91tR8EKV0lUx04/rYte5LU+xaN4
	 Txo0HjATDc8/Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9DBE240B0C;
	Mon, 25 May 2026 20:23:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sakurai Shun <ssh1326@icloud.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>, linux-um@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: fix typo in user_mode_linux_howto_v2.rst
In-Reply-To: <20260517022456.5895-1-ssh1326@icloud.com>
References: <20260517022456.5895-1-ssh1326@icloud.com>
Date: Mon, 25 May 2026 14:23:26 -0600
Message-ID: <87v7cbz1a9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sakurai Shun <ssh1326@icloud.com> writes:

> Replace "privilges" with "privileges"
>
> Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
> ---
>  Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index c37e8e594..9224bea5e 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -234,7 +234,7 @@ an ioctl to setup the tun interface and/or use raw sockets where needed.
>  This can be achieved by granting the user a particular capability instead
>  of running UML as root.  In case of vector transport, a user can add the
>  capability ``CAP_NET_ADMIN`` or ``CAP_NET_RAW`` to the uml binary.
> -Thenceforth, UML can be run with normal user privilges, along with
> +Thenceforth, UML can be run with normal user privileges, along with
>  full networking.

Applied, thanks.

jon
