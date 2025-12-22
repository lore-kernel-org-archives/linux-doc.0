Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0B33890B
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430745; cv=none; b=h0TJ2tzeLzBjcElOhXNH1MN+RnNqpjO6bJ6sP6MuNyx6nBzNdly45LJZJ/zUEs2CAd/LU59IJmdJZcQgZF2GTbFIvS4u7yD4igDplLF0Hu4PklXnI7PeM3GH9oqaJZvEfGI5+35Lsy2LPF/bRfsbow7Us+ohbJGy79FIx1N5QLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430745; c=relaxed/simple;
	bh=LAkV5LM0Jt0bY/pjONhNnvWxDPStOVr9zmUxKk7pEbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhNNlHXItgSfENHMoHLQC0h6/ZIV1KCEmsvvAB95299g18UuuQRoltqagcbXcaF60Z31H8sJvV2ce/L6kNUlBxUKR9PZzNyHFCEfSK5vignq8Ipa0MDwiHdXEsUs57GgSUE8uJFUcpdRzyBoDheWhejh2faGBM3ArA7g3DmFCo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NiES06SQ; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NiES06SQ"
Message-ID: <2252a8ae-847b-4ea7-8389-3f56a0f9e6bf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766430730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAkV5LM0Jt0bY/pjONhNnvWxDPStOVr9zmUxKk7pEbg=;
	b=NiES06SQFN7Dn8PbcAOSnGA9Q6wGO5xZLyhkKSeE14kFacgRcFK1Nphq2piYkQX3cDBdqh
	tyXgzWhoGQJEIp7Xxd097B74hwkjgNE1tNRMtA9S16HRBvNm7nud5+/uUN4bKyeZJ9U0NN
	Bk5iA3Nj2mY65EyLSTwQFhCilnDIKrk=
Date: Mon, 22 Dec 2025 11:12:00 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation/bpf: Update PROG_TYPE for BPF_PROG_RUN
Content-Language: en-GB
To: SungRock Jung <tjdfkr2421@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Alexei Starovoitov <ast@kernel.org>
Cc: bpf@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251221070041.26592-1-tjdfkr2421@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20251221070041.26592-1-tjdfkr2421@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 12/20/25 11:00 PM, SungRock Jung wrote:
> LWT_SEG6LOCAL no longer supports test_run starting from v6.11
> so remove it from the list of program types supported by BPF_PROG_RUN.
>
> Add TRACING and NETFILTER to reflect the
> current set of program types that implement test_run support.
>
> Signed-off-by: SungRock Jung <tjdfkr2421@gmail.com>

Thanks. I cross-checked the kernel and the patch LGTM.

Acked-by: Yonghong Song <yonghong.song@linux.dev>

