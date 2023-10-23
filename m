Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D35139E
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ChLVm56R"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1A819E;
	Sun, 22 Oct 2023 19:26:10 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8FAE8490;
	Mon, 23 Oct 2023 02:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FAE8490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698027970; bh=FYLKw2297A0PIUDq5riMXejanWx7UptvS+3NVqjBwt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ChLVm56RlrwN3u+sTucU4WJaMD2qkHMQhSJF06+30g24aP5nGzzNDYU0cdAFXXgiC
	 fjHxGTmPdmlVkhimp4AyTVViXI0QovHrc4zKMTLd1Za2ptzbH1j98UirDkt3DvVx1Q
	 hg2hQ2TemVcXXQLmrmx5m/pzoEY+fny6Ke8g84ineb/RrxTugqTKLTWsyi8/rZICI4
	 EjcoMuURPQpK1hVjspHP53OoJtVreFJWkKqoBBJ5GWPi4Rfws9sC3TSleMmpLLrggA
	 E4m2eBZaA5qO+aEjtkY/ZcqWgrGlWCvs6fKewWL3W4E9pxh4Q5V0eB42SeUBQ4POJD
	 jRY5eKbfxkh9Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Hu Haowen <2023002089@link.tyut.edu.cn>
Cc: Hu Haowen <2023002089@link.tyut.edu.cn>, src.res.211@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_TW: replace my email address
In-Reply-To: <87lebukrs2.fsf@meer.lwn.net>
References: <20231012130008.102174-1-2023002089@link.tyut.edu.cn>
 <87lebukrs2.fsf@meer.lwn.net>
Date: Sun, 22 Oct 2023 20:26:09 -0600
Message-ID: <87cyx6krb2.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Hu Haowen <2023002089@link.tyut.edu.cn> writes:
>
>> The Gmail address will not be used often from now on, and replace it
>> with the email which is more frequently accessed by myself.
>>
>> Signed-off-by: Hu Haowen <2023002089@link.tyut.edu.cn>
>
> Applied.

Actually, no:

Documentation/translations/zh_TW/dev-tools/sparse.rst:10: WARNING: Title underline too short.

Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
---------------------------------------------------------------------

Unapplied.

Please do not send me anything for a while, at least until you have
worked out a process that does not make me find the problems you are
adding with each patch.

jon
