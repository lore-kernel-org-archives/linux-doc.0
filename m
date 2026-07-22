Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871343849A
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710120; cv=none; b=sfLj0mvtEuM6rdvsFF1t1rUyNg9i0wiR+ge19q5yot1HEjna0PQoKTnRlNoPQvEhftUvJFCz5nj60knm82FiGUIfjQXnG+k09NHlcrtyIiW58h2m2XxNirU3qWFUWjLoonYoAOhCED0hTtt6KYuk44W7Y0wDaHWzWSB/QcDbhGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710120; c=relaxed/simple;
	bh=bWt7dnOJDShNOxj3ZEQgheOpS95Y1If9pWQk3LmklBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckCaKIXcpapA50jxWvVcXQzN/5iBahEEBiUGdXl/qL3f9Od27l8G7FLyLaSfHTPueQK2s7TdWu3we7ZPWyWRbLanOSHM18xIG8PYDgqkxznu/GYkvFiQJAMzvE7HwwgzXfHN0kgq5cvRLaJDa4XArCb2PUl9V2IPIUk/NB1/Cl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=TxgLR16l; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="TxgLR16l"
Date: Wed, 22 Jul 2026 16:48:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784710104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CtpAiqSORgC1PVp8aqaTTDXM1iTIxgl2ktAak8yUfo=;
	b=TxgLR16lKXGF0pdddIsxaIZ7ZbXrnW8H7/s2NvPdPlYTc60IgARSWSYA/jzZ2cWUq/s4jC
	6l6VewNglWWTxMyxEM/17aW6G7vhgT6yMtvjW9/wzBQ2AKHdtPJ8wIvlYXQAUKRDUXvp92
	YfTn3RdRK6ygN9hwNYuN+VY09YT2zwN3xSFxaRDqLF7fpMzmYS75jB1xGaeFMDexPOH4sf
	YoNJ6p6rKj4L4Vl8+LIxxzNrnyg5jYivNLc4MmaOu81lDQAzQ4kbDIzNjLBBLhW+nI0YqL
	9SuRoFMyh3skYiwjSg1ARlr6a5JpHe/1fUYKBgO2whGzbgcbARePlHbJHSfRQw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] docs/zh_TW: process: localize terminology in
 7.AdvancedTopics.rst
Message-ID: <amCDyEKqNzkjgu-H@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-2-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:27AM +0800, Chen-Yu Yeh wrote:
>  審閱補丁
>  --------
>  
> -一些讀者顯然會反對將本節與“高級主題”放在一起，因爲即使是剛開始的內核開發人員
> -也應該審閱補丁。當然，沒有比查看其他人發佈的代碼更好的方法來學習如何在內核環境
> -中編程了。此外，審閱者永遠供不應求；通過審閱代碼，您可以對整個流程做出重大貢獻。
> +一些讀者顯然會反對將本節與“進階主題”放在一起，因為即使是剛開始的核心開發人員
> +也應該審閱補丁。當然，沒有比查看其他人發布的程式碼更好的方法來學習如何在核心環境
> +中撰寫程式了。此外，審閱者永遠供不應求；透過審閱程式碼，您可以對整個流程做出重大貢獻。
>  
> -審查代碼可能是一副令人生畏的圖景，特別是對一個新的內核開發人員來說，他們
> -可能會對公開詢問代碼感到緊張，而這些代碼是由那些有更多經驗的人發佈的。不過，
> -即使是最有經驗的開發人員編寫的代碼也可以得到改進。也許對（所有）審閱者最好
> +審查程式碼可能是一副令人生畏的圖景，特別是對一個新的核心開發人員來說，他們
> +可能會對公開詢問程式碼感到緊張，而這些程式碼是由那些有更多經驗的人發布的。不過，
> +即使是最有經驗的開發人員編寫的程式碼也可以得到改進。也許對（所有）審閱者最好
>  的建議是：把審閱評論當成問題而不是批評。詢問“在這條路徑中如何釋放鎖？”
> -總是比說“這裏的鎖是錯誤的”更好。
> +總是比說“這裡的鎖是錯誤的”更好。
>  
> -不同的開發人員將從不同的角度審查代碼。部分人會主要關注代碼風格以及代碼行是
> -否有尾隨空格。其他人會主要關注補丁作爲一個整體實現的變更是否對內核有好處。
> -同時也有人會檢查是否存在鎖問題、堆棧使用過度、可能的安全問題、在其他地方
> -發現的代碼重複、足夠的文檔、對性能的不利影響、用戶空間ABI更改等。所有類型
> -的檢查，只要它們能引導更好的代碼進入內核，都是受歡迎和值得的。
> +不同的開發人員將從不同的角度審查程式碼。部分人會主要關注程式碼風格以及程式碼行是
> +否有尾隨空格。其他人會主要關注補丁作為一個整體實作的變更是否對核心有好處。
> +同時也有人會檢查是否存在鎖問題、堆疊使用過度、可能的安全問題、在其他地方
> +發現的程式碼重複、足夠的文件、對效能的不利影響、使用者空間ABI更改等。所有類型
> +的檢查，只要它們能引導更好的程式碼進入核心，都是受歡迎和值得的。

Should we wrap lines earlier throughout the series? After the certain
terminology was changed, many lines became longer but were not reflowed.

Just a thought. I'am also fine with current changes.

Thanks.

See:

  https://docs.kernel.org/translations/zh_CN/how-to.html#id9
  https://docs.kernel.org/translations/zh_CN/how-to.html#id10
