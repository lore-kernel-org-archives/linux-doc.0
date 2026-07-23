Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00501DFDA1
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810643; cv=none; b=BN4iUhK6u8Uf8xvnEJQ0RhqUzSHmcZ/xjTSGYQWNSER9uiIjCP+Ijcx3Sdb0kDmQdXZOmgoRowLzk82HBmvQHqN8g5kF1eG2mZeWXyaH3K2xe2kSXTT4QsfU5IatHiPAPdKwW8fcCGjhNLB0CzxOH5z0oLSvzt/Cl7IvVHx3/Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810643; c=relaxed/simple;
	bh=680GkJ6nxsXb8HhcVIxGtH3xHBKXynaE1NXCZYh6Khg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zznksg+riQsZeqgJu3Xr7hqIRtHf0RBd2a7GghWzjdEP8sNWMCEPDry6Ip89ngUWWJ1QlDmqc3G3PLvjWg9eEl28lGrBLtaOYvH5fifk9lEjwcNd7jlP/nYIIcZv2yTTv+UzZgT87ZJ8JX++48lMv2X662MGBUt13Vg99D2Kcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=JjF8WK+o; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="JjF8WK+o"
Date: Thu, 23 Jul 2026 20:43:17 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1784810627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChaWGSksGizcYFcIe0/A3gvJeguEd5AG46jmo8I+CP0=;
	b=JjF8WK+o0C5ZAnPQhrxdjIp+Lt1L20Eh+vfYGZ8IAWxwPojIdCSTzHkjD230UpiqxbGt3/
	Tz6lAePBbaxFq8+JSKnTMVTc09t6G7TroQ/RsG9f1rKkDZJoPeCVtofkcqbxdihHmvDq/G
	xHZS65yBXurVd/wV5R2tc0SUebYFOCOa58BYA8ScsmFXQ6HGq6wvcrCL+c5zHhvDcnv1XP
	Li92goq8b/qS1puAC74D25uOCikAj2Oc5B2iDkzpij0G8fQ47eZdIK9TlaZZbwFSORhGXc
	GwOkLKUqCkn5A2gIQCfqhp/MDM7ryvRkUYegNl0bzZE9TMmPKB2ZDiVTdCEa7w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Dongliang Mu <dzm91@hust.edu.cn>, Yanteng Si <si.yanteng@linux.dev>,
	Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/16] docs/zh_TW: process: localize terminology in
 embargoed-hardware-issues.rst
Message-ID: <amIMZUExNnUOJgrV@wyuan.org>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
 <20260721215542.98435-13-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721215542.98435-13-chenyou910331@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 05:55:38AM +0800, Chen-Yu Yeh wrote:
> Localize mainland terms to Taiwanese Mandarin (內核→核心, 硬件→硬體,
> 信息→資訊, ...) and sync with the English original: silicon-vendor
> wording, real PGP/S/MIME key URLs, updated Linux Foundation IT
> paragraph, disclosing-party responsibilities, shared-resources rule,
> the new "Early access" section, and the current process ambassadors
> list. Also fix the broken zh_Contact cross reference.
> 
> update to commit cead34ac1ce1 ("MAINTAINERS: update ndesaulniers")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../process/embargoed-hardware-issues.rst     | 194 ++++++++++--------
>  1 file changed, 114 insertions(+), 80 deletions(-)
> 
>  
> -硬件安全官
> +硬體安全官
>  ^^^^^^^^^^
>  
> -目前的硬件安全官小組:
> +目前的硬體安全官小組:
>  
>    - Linus Torvalds（Linux基金會院士）
>    - Greg Kroah Hartman（Linux基金會院士）

Unrelated to this patch:

I think "Linux 基金會研究員" is better here.

> @@ -52,68 +55,68 @@ https://www.kernel.org/.... 獲得。
>  郵件列表的操作
>  ^^^^^^^^^^^^^^
>  
> -處理流程中使用的加密郵件列表託管在Linux Foundation的IT基礎設施上。通過提供這項
> -服務，Linux基金會的IT基礎設施安全總監在技術上有能力訪問被限制的信息，但根據他
> -的僱傭合同，他必須保密。Linux基金會的IT基礎設施安全總監還負責 kernel.org 基礎
> -設施。
> +處理流程中使用的加密郵件列表託管在Linux基金會的IT基礎設施上。透過提供這項
> +服務，Linux基金會IT營運人員在技術上有能力存取被限制的資訊，但根據其僱傭
> +合約必須保密。Linux基金會的IT人員還負責營運和管理kernel.org的其餘基礎設施。
>  
> -Linux基金會目前的IT基礎設施安全總監是 Konstantin Ryabitsev。
> +Linux基金會目前的IT專案基礎設施總監是 Konstantin Ryabitsev。
>  

[...]

> @@ -123,67 +126,97 @@ Linux內核社區有一個專門的硬件安全小組負責初始聯繫，並監
>  披露
>  """"
>  
> -披露方通過特定的加密郵件列表向初始響應小組提供詳細信息。
> +披露方透過特定的加密郵件列表向初始響應小組提供詳細資訊。
>  
> -根據我們的經驗，這些問題的技術文檔通常是一個足夠的起點，最好通過電子郵件進行
> +根據我們的經驗，這些問題的技術文件通常是一個足夠的起點，最好透過電子郵件進行
>  進一步的技術澄清。
>  
>  緩解開發
>  """"""""
>  
> -初始響應小組設置加密郵件列表，或在適當的情況下重新修改現有郵件列表。
> +初始響應小組設定加密郵件列表，或在適當的情況下重新修改現有郵件列表。
>  
> -使用郵件列表接近於正常的Linux開發過程，並且在過去已經成功地用於爲各種硬件安全
> +使用郵件列表接近於正常的Linux開發過程，並且在過去已經成功地用於為各種硬體安全
>  問題開發緩解措施。
>  
> -郵件列表的操作方式與正常的Linux開發相同。發佈、討論和審查修補程序，如果同意，
> -則應用於非公共git存儲庫，參與開發人員只能通過安全連接訪問該存儲庫。存儲庫包含
> -針對主線內核的主開發分支，並根據需要爲穩定的內核版本提供向後移植分支。
> +郵件列表的操作方式與正常的Linux開發相同。發布、討論和審查修補程式，如果同意，
> +則應用於非公共git儲存庫，參與開發人員只能透過安全連接存取該儲存庫。儲存庫包含
> +針對主線核心的主開發分支，並根據需要為穩定的核心版本提供向後移植分支。
> +
> +最初的響應小組將根據需要從Linux核心開發人員社群中確定更多的專家。任何相關
> +方都可以建議增補專家，每位專家都須符合上述相同的要求。
>  
> -最初的響應小組將根據需要從Linux內核開發人員社區中確定更多的專家。引進專家可以
> -在開發過程中的任何時候發生，需要及時處理。
> +引進專家可以在開發過程中的任何時候發生，需要及時處理。
>  
>  如果專家受僱於披露方提供的披露清單上的實體或其成員，則相關實體將要求其參與。
>  
>  否則，披露方將被告知專家參與的情況。諒解備忘錄涵蓋了專家，要求披露方確認參與。
>  如果披露方有令人信服的理由提出異議，則必須在五個工作日內提出異議，並立即與事件
> -小組解決。如果披露方在五個工作日內未作出回應，則視爲默許。
> +小組解決。如果披露方在五個工作日內未作出回應，則視為默許。
>  
>  在確認或解決異議後，專家由事件小組披露，並進入開發過程。
>  
> +列表參與者不得在私有郵件列表之外交流該問題。列表參與者在處理補丁時不得使用
> +任何共享資源（例如僱主的建置農場、CI系統等）。
> +
> +早期取得
> +""""""""

"提前取得"?

> +
> +在列表上討論和開發的補丁，既不能分發給任何非響應小組成員的個人，也不能分發
> +給任何其他組織。
> +
> +為了讓受影響的晶片供應商能夠與其內部團隊和產業夥伴合作進行測試、驗證和
> +後勤工作，提供了以下例外：
> +
> +	受影響晶片供應商的指定代表可以在任何時候將補丁移交給該晶片供應商
> +	的響應小組。該代表必須將移交一事通知核心響應小組。受影響的晶片
> +	供應商必須為與其響應小組共享的任何補丁，制定並維護自己的、與本
> +	政策一致的文件化安全流程。
> +
> +	晶片供應商的響應小組可以依照該晶片供應商的文件化安全流程，將這些
> +	補丁分發給其產業夥伴及其內部團隊。來自產業夥伴的反饋會回到晶片
> +	供應商，並由晶片供應商轉達給核心響應小組。
> +
> +	移交給晶片供應商的響應小組後，因晶片供應商的內部團隊或產業夥伴的
> +	參與而發生的過早披露，核心響應小組不再承擔任何責任或義務。晶片
> +	供應商透過同意本流程來保證這一責任免除。
> +
>  協調發布
>  """"""""
>  
> -有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施集成到相關的內核樹中
> +有關各方將協商限制結束的日期和時間。此時，準備好的緩解措施整合到相關的核心樹中
>  併發布。
>  
> -雖然我們理解硬件安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
> -測試和準備緩解措施所需的最短時間內。人爲地延長限制時間以滿足會議討論日期或其他
> -非技術原因，會給相關的開發人員和響應小組帶來了更多的工作和負擔，因爲補丁需要
> -保持最新，以便跟蹤正在進行的上游內核開發，這可能會造成衝突的更改。
> +雖然我們理解硬體安全問題需要協調限制時間，但限制時間應限制在所有有關各方制定、
> +測試和準備緩解措施所需的最短時間內。人為地延長限制時間以滿足會議討論日期或其他
> +非技術原因，會給相關的開發人員和響應小組帶來了更多的工作和負擔，因為補丁需要
> +保持最新，以便追蹤正在進行的上游核心開發，這可能會造成衝突的更改。
>  
>  CVE分配
>  """""""
>  
> -硬件安全小組和初始響應小組都不分配CVE，開發過程也不需要CVE。如果CVE是由披露方
> -提供的，則可用於文檔中。
> +硬體安全小組和初始響應小組都不分配CVE，開發過程也不需要CVE。如果CVE是由披露方
> +提供的，則可用於文件記錄目的。
>  
>  流程專使
>  --------
>  
> -爲了協助這一進程，我們在各組織設立了專使，他們可以回答有關報告流程和進一步處理
> +為了協助這一行程，我們在各組織設立了專使，他們可以回答有關報告流程和進一步處理

"行程" -> "流程" ?
