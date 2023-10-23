Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D23139C
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FvvH0anq"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E06419E
	for <linux-doc@vger.kernel.org>; Sun, 22 Oct 2023 19:24:29 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B376660A;
	Mon, 23 Oct 2023 02:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B376660A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698027868; bh=YNVlJmQXuNZqOe8XF+fwvv4/4ojqZ63h2KRJnAcWDkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FvvH0anqlNxMjtBw/ew9lU+qpfGSYglak+6uThqE5U4hPAzSWjfYcLvZJM2KDv/pV
	 shvupK2dQAFt6pe1G+VgeUTYH8R/jXFhYQzeKselT+ettbfyvMmLVXj3AD5mQBmJHp
	 DAbHOHa6E/Oa7Q0aTGU6A2C+TLLie72VA7Gu0vfY6be12gDTs+m31NnCMtbO/Cd0dl
	 H7mh6TUf1HbUKOt/zwEoHKfUrh/ZxtuPfvblFZywS3HCs72S8FjneNxNGDeyVGeGoO
	 uFnfTmPqIMVhd5Y8q9G1XmCKe6PZTk8YfTn1sZq6Ny7lUOghOghwRRMkBaXyn+5X+M
	 d863Sh5xm33RA==
From: Jonathan Corbet <corbet@lwn.net>
To: Yanteng Si <siyanteng@loongson.cn>, tangyeechou@gmail.com, alexs@kernel.org
Cc: linux-doc@vger.kernel.org, Tang Yizhou <yizhou.tang@shopee.com>
Subject: Re: [PATCH] docs/zh_CN: Add subsystem-apis Chinese translation
In-Reply-To: <a91176b3-67f0-42dc-8e12-e28909a058b3@loongson.cn>
References: <20231011152520.31079-1-tangyeechou@gmail.com>
 <a91176b3-67f0-42dc-8e12-e28909a058b3@loongson.cn>
Date: Sun, 22 Oct 2023 20:24:27 -0600
Message-ID: <87h6mikrdw.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yanteng Si <siyanteng@loongson.cn> writes:

> =E5=9C=A8 2023/10/11 23:25, tangyeechou@gmail.com =E5=86=99=E9=81=93:
>> From: Tang Yizhou <yizhou.tang@shopee.com>
>>
>> Translate subsystem-apis.rst into Chinese.
>>
>> The existence of this document is crucial. Without it, other Chinese
>> documents included in (such as sched-design-CFS.rst) will not be
>> displayed correctly in the left side of the web page.
>>
>> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Applied, thanks.

In the future, please send docs patches to me directly as well as to the
list; otherwise I may easily miss them.

jon
