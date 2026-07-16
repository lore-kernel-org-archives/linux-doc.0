Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A3282F12
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240469; cv=none; b=PWK7tvTuTsf4Zv5GCi5unze4UfPTGLFEuacheD+ijCypXIzJRnPDBuwPlhFyXzPs82GivJRNRMQEBT4PLAJsZzQ5xXVu4FsWeabAat9ooZEgkxYAdbiRxXUqbMyGkePemx6Yu8a5O/l/giUVsRhu3ndqfEj+S8USWry+eRMMvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240469; c=relaxed/simple;
	bh=4mCYvPgq7fizS5X/82U51EccnXiMo5NsLkJY9PIo1TY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bozLXPXacSMQVEEU6uUKo/N1xuHl/QU2/fR+DZskXMChLyzzMaM9ug199wDAQZciqk+/N5Koq9IFaNHDOaKiq61mxa9pKGofrQp4OhdoALJsZlsPR8jmXVDgvY19/pLndBIREww+Vd+cDJtkh0pdC3RAuva8eMJMirfTspX6H8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SZQnNuIR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SZQnNuIR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7CF9D408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784240467; bh=/b2fUAsdS9TCk+TQKYhI/w7H665SlYQAq8KeUWsLLzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SZQnNuIRLZzlnks4yYuHJVRi85tiM2qzKZD1bjhzF1CMjA0C7/HjIb49S3vHNmr6b
	 D/3r9x4IiTSGZ615lzAnHIN24PK2VnglQkJ3mp0HF4XNP8iSkwjFyeTZRSaACj5g8C
	 2t4hUiFU5ZVn6hdgAWrRGETM0GjJw7NPuptWifLPhSAgnFBafCeVCG3YxOLH+jlAYK
	 kDs8dfA5GxDJe4U76FgYwi+k8TRFgP77v68nTt0WqIgKGzpJfOSPhKHHmrNw9F/Ud6
	 bC3sb2q5IHKebEKZOwH0fj3s1D14INYEPKywFjnA13S+wEHh24lP9cepiCGEWSs3ME
	 0A4lsfmD/7c3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7CF9D408B2;
	Thu, 16 Jul 2026 22:21:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Igor Giamoniano <igorgphotoarte@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate the kernel driver
 statement
In-Reply-To: <20260708130558.12604-1-igorgphotoarte@gmail.com>
References: <20260708130558.12604-1-igorgphotoarte@gmail.com>
Date: Thu, 16 Jul 2026 16:21:06 -0600
Message-ID: <877bmu7ezx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Igor Giamoniano <igorgphotoarte@gmail.com> writes:

> Translate Documentation/process/kernel-driver-statement.rst into Brazilian
> Portuguese, keeping the reStructuredText formatting and the list of
> signatories unchanged.
>
> Signed-off-by: Igor Giamoniano <igorgphotoarte@gmail.com>
> ---
>  .../pt_BR/process/kernel-driver-statement.rst | 205 ++++++++++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/kernel-driver-statement.rst

Applied, thanks.

jon
