Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662844A701;
	Fri, 15 May 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853410; cv=none; b=H6Ai/j1Jt/go2up3bcYvIqcz2QZnS5SgW0u3wBZaSb+H5MUDX76oNeswtcNKwFHHJCAaDIsErt3/XG4utm5C9Rkm5JPPrIcnsTpJ9GLdyy29nNUfo7JYi4athfWc9b8aAJqwfQPtvkBxlD0m3vrW3x2PBu+UXd3g1RJgWCWBXNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853410; c=relaxed/simple;
	bh=yPL09EUVdhNMglzCNhqFjmlhS6R6u3y1ZDaHT4NK6ms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WMe2Hvi2s2YiQPd/n34BOVYn5WLaTw7ZvnVWsO3ktiXerkBZH2Cs8ZKxqANiNs7b89S8tlS9aBd+gH4Yz0mSlTsdu49d/lAmRn6cMlero+8dIqsAhylgelbJLBJobk3lLHbHakS04mJh/UDwEj+5zT6e8SrGvq5wESGiGwlZw1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bMU6ngph; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bMU6ngph"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EA980410BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778853409; bh=+f8TCT67vyuvsz+YiQGqtt7wzEU9fUk3tYBacKzPZEw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bMU6ngph5PHb+MTJsuyAnK0e5GxOplGW3eVjGSWEEORqbiP4uk007yOtfuPA1rENr
	 r7BkvVZhRhEC9jOdwkLOeVGv0s5QOeC7m1nOuc/8FLO0OfNX6AK4CDdTNmU5CujT2b
	 XiUUtwLmAsvSuCgZReT4Gx4fGVvHGIl49syjnKyButJWbw3biADR4Qrdq+8/uzJdFS
	 acaUpKuAepyDqiZ5IEd/umc0F08do5gYaQaf3UVXlWrVauOlG/KZ5i+sHakjLLK2+7
	 wBKig+YK9PhiHq5AGPzy/MmlJVcFdX45ymSkyxqBd7qJuBaG78kjaIpTIVOtpYamE9
	 Xoh/QwhsgmnZw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EA980410BF;
	Fri, 15 May 2026 13:56:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>, linux@leemhuis.info
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Shi-Hong <eric039eric@gmail.com>
Subject: Re: [PATCH v4] docs: reporting-issues: replace "these advices" with
 "all of this advice"
In-Reply-To: <20260514082808.655-1-eric039eric@gmail.com>
References: <20260514082808.655-1-eric039eric@gmail.com>
Date: Fri, 15 May 2026 07:56:48 -0600
Message-ID: <874ik8srmn.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chen-Shi-Hong <eric039eric@gmail.com> writes:

> "Advice" is an uncountable noun, so "these advices" is grammatically
> incorrect.
>
> Replace it with "all of this advice" instead, which keeps the sentence
> grammatical while also making it clear that it refers to the full set of
> recommendations in the paragraph.
>
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
> ---
> v4:
> - move version changelog below the "---"
> - send as a separate thread
>
> v3:
> - resend against the original base as requested
> - replace "these advices" directly with "all of this advice"
>
> v2:
> - use "all of this advice" based on review feedback
>  Documentation/admin-guide/reporting-issues.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
