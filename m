Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC80B2D8DA8
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773302; cv=none; b=f3LIqZAJNqZ8ppQ4amhBcd16/hCSlrK62IsNT+2bMJMjaVlTu/PgFO2CKPgQdCXCPGFBMKLHc33KngUIed5WmNKpRdWdWIlGzDszXDbg2VO/8xviq1qzoRpNU34UwNCYJmuE5rP1t/KH7tZ2LN6fnYlIJOJD6lm9tELNTmkF7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773302; c=relaxed/simple;
	bh=amzjc+GKBYIlaCthRMfM41LdOEIO28SOUMoEE2th93M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMMEMhrliwsK9uS+SiaD19rDf0csFHPcpPmxkLCoAmu2ZKyyKvXNAKxZquIdJvvXZnW3GG7q4/0CMLc9f5tN9CaUIO8/VyS96LrHuu0TU3Ev4jmY6dt94xRsJwyJ37ZHvZ6o+FE1C7U/vjoWMsO/hWg3vXzNu8GWBifiXULLQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Qx+Z1TXe; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Qx+Z1TXe"
Date: Tue, 4 Aug 2026 00:08:00 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785773297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQTGYknN8ynWTOaEcrMIRo2xxdZHU/TWT2TBNSsU0XM=;
	b=Qx+Z1TXeNRC3xb1xeKu7UWm3gTvLLSdmUkQOPg+g03nGw0OFQsxvZC51lN3j/kEZpybLEb
	yGSbEkXDO2fy3lqOF+X5n8vwS1sDD4kPHUTe6TXYTSXjN+Ul3P2tEDHDZvs5wfcTLRG4sT
	y62gThJ+N+aKh1kK62l5dYEOyDq0NZR4smGi3f6KL5gSRg/luBCl+k0Z9T0AS4Jnz/alHb
	sx+fSp6ilXJG4g8U1fG7nvT16raMUWUSG0DTsEbFkpjqBf0DJdHe8R8Mrppf3wfCLmb9zs
	GNiwmuF/RMh/JDvu7W+1H9fktfqgj3McRkkRYUTtF8xujkaqqGTEw0f2LPUfQg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/16] docs/zh_TW: process: localize terminology in
 license-rules.rst
Message-ID: <anC84BJefzxou6oT@wyuan.org>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
 <20260728091038.171033-5-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728091038.171033-5-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:10:26PM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 文件→檔案,
> 標識符→識別碼, 加載→載入, ...) and sync with the English original:
> mention SPDX-FileCopyrightText lines and the clarified "Proprietary"
> MODULE_LICENSE wording from commit d8c949c577b5 ("docs/licensing:
> Clarify wording about "GPL" and "Proprietary"").
> 
> update to commit ebf1bafd0907 ("LICENSES: Explicitly allow
> SPDX-FileCopyrightText")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../zh_TW/process/license-rules.rst           | 203 +++++++++---------
>  1 file changed, 105 insertions(+), 98 deletions(-)
