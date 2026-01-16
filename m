Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFEE340D93
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768587218; cv=none; b=JEU1Hlybd9HatY1Bhro/36VvFC9e0ZWg5boS6RRNTOYFRXSmqStD1VuOx1hDbhFLzCVBc0iRzq4Vb0ciz6ajFEggdHhJUnK/RvycfuLc2DcA7a7E/cs6bBqmjloN6xOV4w+pR3DyiceO8wphf7db/Csr26MUT9AnjAKk8Gh/EiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768587218; c=relaxed/simple;
	bh=r/lUdeAs3qPUc1xL0hxpjWhp28rX4ghFOdYkwvf81yk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nU7cKI7WDeyrxvqSBkfNRErz/3s3/LgLSe7Lv4FJzETlP4/qTPTkJ2WrjL5LKkj6fB4BaULc5i86zIi5965c/j83gwdkPL2hY7WsZAvErY3GfDh2PYERJNLfUTwkfF3k4RlRtqZ3mVJcAX8LVHV5t1qYYzTULeOhbrZSGgHkpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gTZKAzYS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gTZKAzYS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1852B40425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768587216; bh=aQGo1BApjUEOAolaD+gx/WGoApJxq+M5332TvlsHovQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gTZKAzYS4lWjgDzCqf6OP+iNiQrE7PtaOYCwXwYMYUWoCn+4C9my1RIXzzT74q19w
	 RJCgCmN5LMd7Mh0dgchuTfDCnQK4Py4Wy26ruv9Rtq6L+9V1iVFTEWnb1qmBGOet36
	 6ve4K5jmsIC4S3vdxHmnU49EBFgd8Fj0cmrJpdULbzJY+0rJ6WpLvIIr/F1V099m1a
	 LmxljUHnR+jK9G/OpVW8IdKPjka+HJAP9gBPCuv9q6y6bn0uBQbi8gBJbIwKceDqXZ
	 DgE9n38zq0YDHxbG19lAg7+CJ44TQZNQwH2XKFaOl2Tv0HUBev6kJ9kyD6GkKB9Wip
	 wDLi7stiM/oRA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1852B40425;
	Fri, 16 Jan 2026 18:13:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Nauman Sabir <officialnaumansabir@gmail.com>, linux-doc@vger.kernel.org
Cc: tj@kernel.org, Nauman Sabir <officialnaumansabir@gmail.com>
Subject: Re: [PATCH v4] Documentation: Fix typos and grammatical errors
In-Reply-To: <20260115230110.7734-1-officialnaumansabir@gmail.com>
References: <20260115230110.7734-1-officialnaumansabir@gmail.com>
Date: Fri, 16 Jan 2026 11:13:35 -0700
Message-ID: <87ms2do27k.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Nauman Sabir <officialnaumansabir@gmail.com> writes:

> Fix various typos and grammatical errors across documentation files:
>
> - Fix missing preposition 'in' in process/changes.rst
> - Correct 'result by' to 'result from' in admin-guide/README.rst
> - Fix 'before hand' to 'beforehand' in cgroup-v1/hugetlb.rst
> - Correct 'allows to limit' to 'allows limiting' in hugetlb.rst,
>   cgroup-v2.rst, and kconfig-language.rst
> - Fix 'needs precisely know' to 'needs to precisely know'
> - Correct 'overcommited' to 'overcommitted' in hugetlb.rst
> - Fix subject-verb agreement: 'never causes' to 'never cause'
> - Fix 'there is enough' to 'there are enough' in hugetlb.rst
> - Fix 'metadatas' to 'metadata' in filesystems/erofs.rst
> - Fix 'hardwares' to 'hardware' in scsi/ChangeLog.sym53c8xx
>
> Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
> ---
> Resending as a standalone patch. Apologies for the confusion caused by
> the previous submission, which was incorrectly sent as part of a 3-patch
> series. Each patch targets a different subsystem and should be reviewed
> and applied independently. Please ignore the previous submission:
> <20260112160820.19075-1-officialnaumansabir@gmail.com>

This patch did not apply cleanly to docs-next - I had to use
--whitespace=fix.  I'm guessing that your mailer messed up the trailing
whitespace in ChangeLog.sym53c8xx.

Now, honestly, that file should not really exist at all IMO...  but it
would also be good to avoid this kind of problem with future patches.
I'd suggest emailing this patch to yourself until you get to a point
where you can apply it to a clean tree.

Thanks,

jon
