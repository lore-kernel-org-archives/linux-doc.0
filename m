Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193571;
	b=CuzPZ1HS3/PuSjYXlM+Fq0LEiPY6mly6VNj5p2zo7s2XMp0rByBLO1kpfrZo+1B/yPf7
	 JTFXBxL1D35E5IGp+pYolOAavefjhaGpiaRB36wcEPJxKuLu1hN1W32cjmzV59Ezz5xC8
	 ld7jeOwTh3zQ0ieU8lcee8tnGPMfgf90doZevi2cmla2aBh8Jrh5uQY4DzqaPm/dg2Cde
	 F/4MDR3N616/OSgh18C7U8qkhIdXvQObRr4NFylwLPoxK7zokBoEkeNXiMpCGvOEoqYgR
	 wQ3OIiraI148S5Oh1gA3qod5P7yxai5jcA5V42zPGpoxGdibcwvP+gxXkky+3LDQMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193571;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o9zafs2e9G51V21FfLQ+Dlq9NfXDTdkSswrg/M4DUy0=;
	b=nU1uPug2Aew9d2PPRrlatAiZN4at+n4NXXkI7sanD9+bmUItdl3XuPHsoNOSU/uAGnZl
	 kQ2UGiwmOzYtFQKF2rna1iiSDZH8fAgtLOJSjBZi2mADupl2VYIxwbieJdqAt8SrjjrLm
	 oI/mGGqwFld04nSVfgSRzOb+//Z4z8RYmA/9U5t2ubqb5PpnW93JRCg3hvoVXY8Ue+w1H
	 5yc8ywEvOzLHEIL7hLFTQRCiEARy1ZlcCsauHBXJT1VFLTrXrmjNGMVbmMrK2mUiOTMU9
	 Ig34C3PkLqvtLgdquAPkg+3SbNpnP8El499xY4Sls8cCTvkHPowY9bexBq1WxXDOF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ShHgbWYX;
	arc=none smtp.remote-ip=95.215.58.189
Received: from mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58282606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58282606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=ShHgbWYX
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+dnZV2wn7xOwxVNqzFzRAdBqR7l4CXZ9Yzsru1gMpnU=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794193568; v=1; x=1794798368;
 b=ShHgbWYXa7grYKg0K/1tc42N+DgD8hwLhQ+319eeX6sOgF4OeBIMZDENs6YebW3gHXkviHnw
 MhAXXAtXG0utybwR7pYCtiQycvAO9bdZMsbnhyilMFsYzwkNGsACf7jBZDEGT6X7JTKcT6fYuoT
 XRshYnnMVpjQPfqNsyo2tWkBrE+RsAiDw7sVSAb4y/w2ViRQwE0SGge9h3TPXA93ohsYvLmTMb1
 spvlGDWXI7GAHyzgArPMQ5I4DPht3pJn/K21WTIFzictJoVccmEebwAibTrzXnbnjx4UGC9uzHD
 2sTZx5+l++XZ386DOFxT4WWfsujD0Nt44LJ2OV/cei6cQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24f5bc051f22241e;
	Mon, 09 Nov 2026 03:06:08 +0000
X-Mizu-Trace-ID: 24f5bc051f22241e
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:06:00 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs/zh_CN: translate coding-assistants.rst
Message-ID: <avE4mPgZOx1th2FE@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb985e0f6f0c3e320cadcd007cfd0dbfd4102e46.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Translate the AI coding assistant guidance into Chinese. Link to the
> existing Chinese license-rules.rst guide while keeping untranslated
> document references on their English paths.
> 
> Update the translation through commit 1e035297ffda
> ("docs: remove Assisted-by references")

Looks very good.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../zh_CN/process/coding-assistants.rst       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst
