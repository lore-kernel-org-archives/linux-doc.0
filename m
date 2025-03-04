Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847B1FECA3
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741078365; cv=none; b=BzXz2ABtp48yWwxKcwD+9yNEIA2ah0nNUVwa7K2zCxuPOv0gjRZaDVQw7NY2ACVfRi/r0dNIS9H3vifO1lc41LS07bzOgFSNffw04SB4oPH1z6yH4piQ2je3IoXGj0/zgffbfhxNxu3RrYSh83RoYfH2td7IXIRSf+FqwEQtkC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741078365; c=relaxed/simple;
	bh=yPOxcnmoSeldEhphD4/SRNNFMo6Y4YaK3vs29h7CBw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qE5Vlng0MrWsbOWQB+UV9wATIiw5Yqfk+ziUfPrRQd1k64bHT2fxjSt4nQvoUuXAV5IC1bfqeIP/R5LZu/uEMfiVeiC2qnldlhBo7wRuw1uBILUHNMXSlFmyDGZupPGzs4WbI+Ce9gWi64zahr+xQfXAl/D1mmKCGRYgoljImTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsjILQG5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsjILQG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C491DC4CEE8;
	Tue,  4 Mar 2025 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741078364;
	bh=yPOxcnmoSeldEhphD4/SRNNFMo6Y4YaK3vs29h7CBw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsjILQG5OVdT0b9YI7MX+N0Kuzkw5SrahtTov2dlaWekKryDGIHALUUaKozy89ojO
	 KLVt4t42NoE6T3jwhTXe6HgJTauhBF82n59zMpoZyHrOX+GQoLbGAor7yNYYZJ/GYA
	 RudvUrwCkC+FzPKPZkQru732+FJWED4K0c2WXnutrSOrCw6fDqmV7U7u3GgTrPSJje
	 qz3qYlqhPoQtoKaQH8Q/RQThyIVj8NCR/qXD1aBGydtYnF2e8offvwy/1sh6OkF2E2
	 OIgM4yTjN7fiBwaN5llvIXjXC+q0L08JVjaMEZLUYQY70BieYmoDslws3zFeZ3xV4u
	 4xYzBOlylPaYw==
From: alexs@kernel.org
To: si.yanteng@linux.dev,
	corbet@lwn.net,
	Yuxian Mao <maoyuxian@cqsoftware.com.cn>
Cc: Alex Shi <alexs@kernel.org>,
	zhaoyuehui@cqsoftware.com.cn,
	zhaoshuo@cqsoftware.com.cn,
	zhangwei@cqsoftware.com.cn,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6] docs/zh_CN: Add snp-tdx-threat-model index Chinese translation
Date: Tue,  4 Mar 2025 16:52:26 +0800
Message-ID: <174107828230.26610.8963297106743593097.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304071401.117780-1-maoyuxian@cqsoftware.com.cn>
References: <20250304071401.117780-1-maoyuxian@cqsoftware.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>


On Tue, 04 Mar 2025 15:13:59 +0800, Yuxian Mao wrote:
> Translate .../security/snp-tdx-threat-model.rst into Chinese.
> 
> Update the translation through commit "cdae7e8a69c3"
> ("docs/MAINTAINERS: Update my email address")
> 
> 

Applied, thanks!

[1/1] docs/zh_CN: Add snp-tdx-threat-model index Chinese translation
      commit: 1d5e3ce014d2d1675800c37975b57fec460f6e5b

Best regards,
-- 
Alex Shi <alexs@kernel.org>
