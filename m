Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622654;
	b=ndjJ8YuAPjUQlWUOJ6O/KUROSJLpB8Bv/mUTpMdmQd4h3Ejuwe9FtFz9uylhY5HlEsa2
	 dioTyKGhrJU3LblnVS8uLpjwG47X9dfPdm9ftxE/n4Ggck9HJmcI9u3SYwvO6XZ3B+Qvp
	 1BWZXuK1jWM22/ELfYYSr4DhNgLX8PHeGqX9C+2VRJFhROsyaJCCmKuywCHfTEEVuo4Y9
	 aoSRz8z9o+FKeWhHY3JOHbMlYkm816+InjFkucqQiCNv7vDcCSy+V56lms5tAZbR9DQTe
	 TOlaDxu1n8I8LJRtvMEcyLB1RGFmEwV3G+W9RQi5hJHPrlythcBc6iaHQiiFPfLy2Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622654;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=H2tKagOPgmS9HMlxlN0pYlcWypWUh9NQKV85o/DpOkk=;
	b=hVfdS+d0liNPXhkagD60hiWhVh3tpkvcY9I07MtIt2LR4EsUuF6xmiwaxaa3i6f9zVku
	 8vI5wp4exMiIBD7A5TJuXFAXUJxlfp0gJj+o7K9+Were5alt4Z68biWgMbL6ru5T6OS64
	 bKyd7WyOeCD6CRBG3jEFHhueb2ctlDqWjodmwHvuN3bz4d0zc1ZClqDLPfsrtLqx4Zq4T
	 AAj6gdRA8i9ezes5WXtyAL+1mE4hRbjbTlR3F+HgmA0X36UycX7tw0phE6psarUruegiS
	 6dji+N05MAP2hnfAlNptOHSnctTS/INkwXBs1jFyhANWira6TzA75fLn5brMdgi52kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=O0J15Gqy;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD78E606A323;
	Wed, 25 Nov 2026 16:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD78E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=O0J15Gqy
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 60ED6410D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795622653; bh=H2tKagOPgmS9HMlxlN0pYlcWypWUh9NQKV85o/DpOkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O0J15Gqy9Rr6NOHvH8CQNxOvoEwDF0JkzNvNq5vspbx//SwyHQv5V/fXEmRFlCPZ7
	 Jsrv4yug919SIfMNvhzahxw2aXN4rA+0sJ0cxppJfzI2qBJGuW4HeMGH3var44cYwG
	 16ZqvN75r06qxJplO8mOX2vahq2+ib1vqToqTqUtsXj6Qkin8lkrjL4q9BOX2sxVZ6
	 WeeZhRnCm/x/8IB8u7MAwrkcDmcKagzzO2tZKOvy86LZOL1zu+AM2XzIJTgvdTaOlZ
	 gRMUgngNQVgbIiEz82YFirQQiNZ2gJYEYD83nEAVrIK5y3vM6tE9OK9m8JDkU5Y5Rs
	 rNIYEMUi7u3mg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 60ED6410D3;
	Wed, 25 Nov 2026 16:04:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: doc-guide: add command to output
In-Reply-To: <20261116072319.1094457-2-manuelebnerli@mailbox.org>
References: <20261116072319.1094457-2-manuelebnerli@mailbox.org>
Date: Wed, 25 Nov 2026 09:04:00 -0700
Message-ID: <878q2gyk27.fsf@trenco.lwn.net>
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

> Add the command './scripts/kernel-doc' to the code block to make it
> self-explanatory how to reproduce.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/doc-guide/contributing.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/doc-guide/contributing.rst b/Documentation/doc-guide/contributing.rst
> index 0f0804f82d..46a44b39d6 100644
> --- a/Documentation/doc-guide/contributing.rst
> +++ b/Documentation/doc-guide/contributing.rst
> @@ -55,6 +55,7 @@ fixes; they should go to the maintainer of the subsystem in question.
>  For example, in a documentation build I grabbed a pair of warnings nearly
>  at random::
>  
> +  user@PC$ ./scripts/kernel-doc --none drivers/devfreq/devfreq.c
>    ./drivers/devfreq/devfreq.c:1818: warning: bad line:

*shrug* applied, thanks.

jon
